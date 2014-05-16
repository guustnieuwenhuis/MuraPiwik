/*

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="mura.plugin.plugincfc" {

	property name="config" type="any" default="";

	public any function init(any config="") {

		variables.$ = application.serviceFactory.getBean("muraScope");

		setConfig(arguments.config);
	}
	
	public void function install() {
		// triggered by the pluginManager when the plugin is INSTALLED.
		application.appInitialized = false;

	}

	public void function update() {
		// triggered by the pluginManager when the plugin is UPDATED.
		application.appInitialized = false;

	}
	
	public void function delete() {
		// triggered by the pluginManager when the plugin is DELETED.
		application.appInitialized = false;

	}
	
	public void function toBundle(any pluginConfig="", any bundle="") {
		// triggered by the pluginManager when the plugin is BUNDLED.
		application.appInitialized = false;

	}
	
	public void function fromBundle() {
		// triggered by the pluginManager when the plugin is DEPLOYED.
		application.appInitialized = false;

	}

}