/*

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="mura.plugin.pluginGenericEventHandler" {

	// framework variables
	include 'fw1config.cfm';

	public any function init() {
		return this;
	}

	// ========================== Display Methods ==============================

/*
	public any function dspMuraFW1App1($) {
		return getApplication().doAction('public:main.default');
	}
*/

	// ========================== Helper Methods ==============================

	private any function getApplication() {
		if( !StructKeyExists(request, '#variables.framework.applicationKey#Application') ) {
			request['#variables.framework.applicationKey#Application'] = new '#variables.framework.package#.Application'();
		};
		return request['#variables.framework.applicationKey#Application'];
	}

}