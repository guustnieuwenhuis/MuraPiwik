/*

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="mura.plugin.pluginGenericEventHandler" {

	// framework variables
	include 'fw1config.cfm';

	// ========================== Mura CMS Specific Methods ==============================
	// Add any other Mura CMS Specific methods you need here.

	public void function onApplicationLoad(required struct $) {
		// trigger MuraFW1 setupApplication()
		getApplication().setupApplication();
		// register this file as a Mura eventHandler
		variables.pluginConfig.addEventHandler(this);
	}
	
	public void function onSiteRequestStart(required struct $) {
		arguments.$.setCustomMuraScopeKey(variables.framework.package, getApplication());
	}

	public any function onRenderStart(required struct $) {
		arguments.$.loadShadowboxJS();
	}

	public any function onRenderEnd(required struct $) {

		local.JSTracker = new MuraPiwik.common.utils.PiwikJSTracking();
		local.ImageTracker = new MuraPiwik.common.utils.PiwikImageTracking();
		local.HTTPTracker = new MuraPiwik.common.utils.PiwikHTTPTracking();
		
		switch(arguments.$.siteConfig().getPiwikTrackingMethod()) {
			case "js":
				local.tracking = local.JSTracker.getTracking(
					variables.pluginConfig.getSetting('piwikUrl'),
					$.siteConfig().getPiwikSiteId()
				);
				break;
			case "jsimage":
				local.tracking = local.JSTracker.getTracking(
					variables.pluginConfig.getSetting('piwikUrl'),
					$.siteConfig().getPiwikSiteId()
				);
				local.tracking &= "<noscript><p>" & local.ImageTracker.getTracking(
					variables.pluginConfig.getSetting('piwikUrl'),
					$.siteConfig().getPiwikSiteId()
				) & "</p></noscript>";
				break;
			case "image":
				local.tracking = local.ImageTracker.getTracking(
					variables.pluginConfig.getSetting('piwikUrl'),
					$.siteConfig().getPiwikSiteId()
				);
				break;
			case "http":
				local.tracking = local.HTTPTracker.track(
					variables.pluginConfig.getSetting('piwikUrl'),
					$.siteConfig().getPiwikSiteId(),
					$.content().getUrl()
				);
				break;
		}

		if(arguments.$.siteConfig().getPiwikTrackingMethod() != "http") {
			newContent = replaceNoCase( $.event( "__MuraResponse__" ), "</body>", local.tracking & "</body>" );
			$.event( "__MuraResponse__", newContent );
		}
	}

	// ========================== Helper Methods ==============================

	private any function getApplication() {
		if( !StructKeyExists(request, '#variables.framework.applicationKey#Application') ) {
			request['#variables.framework.applicationKey#Application'] = new '#variables.framework.package#.Application'();
		};
		return request['#variables.framework.applicationKey#Application'];
	}

}

