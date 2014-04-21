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

		createPiwikSettingsTable();
	}

	public void function update() {
		// triggered by the pluginManager when the plugin is UPDATED.
		application.appInitialized = false;

		createPiwikSettingsTable();
	}
	
	public void function delete() {
		// triggered by the pluginManager when the plugin is DELETED.
		application.appInitialized = false;

		deletePiwikSettingsTable();
	}
	
	public void function toBundle(any pluginConfig="", any bundle="") {
		// triggered by the pluginManager when the plugin is BUNDLED.
		application.appInitialized = false;

		arguments.bundle.setValue('tpiwiksettings', bundlePiwikSettingsData());
	}
	
	public void function fromBundle() {
		// triggered by the pluginManager when the plugin is DEPLOYED.
		application.appInitialized = false;

		createPiwikSettingsTable();
		restorePiwikSettingsData(arguments.bundle.getValue('tpiwiksettings'));
	}


	private void function createPiwikSettingsTable() {

		local.dbUtility = $.getBean("dbUtility");

		local.table = local.dbUtility.setTable('tpiwiksettings');

		local.table.addColumn(column='siteid', datatype='varchar', length='25', nullable='false', default='');
		local.table.addColumn(column='url', datatype='varchar', length='50', nullable='false', default='');

		local.table.addPrimaryKey(column='siteid');
	}

	private void function deletePiwikSettingsTable() {
		
		local.dbUtility = $.getBean("dbUtility");

		local.dbUtility.dropTable('tpiwiksettings');
	}

	private Query function bundlePiwikSettingsData() {

		local.queryService = new Query();
		local.queryService.setSQL("
			SELECT 	*
			FROM 	tpiwiksettings
		");
		local.queryService.setDatasource($.globalConfig().getDatasource());
		local.resultObj = local.queryService.execute();

		return local.resultObj.getResult();
	}

	private void function restorePiwikSettingsData(required Query data) {

		local.queryService = new Query();
		local.queryService.setSQL("
			TRUNCATE TABLE tpiwiksettings
		");
		local.queryService.setDatasource($.globalConfig().getDatasource());
		local.resultObj = local.queryService.execute();

		if(arguments.data.recordcount) {
			local.queryService = new Query();
			local.sql = "
				INSERT INTO tpiwiksettings (siteid, url)
				VALUES
			";
			for(local.i = 1; local.i <= arguments.data.recordcount; local.i++) {
				if(arguments.data.currentrow != 1) {
					local.sql &= ",";
				}
				local.sql &= "('#arguments.data.siteId#', '#arguments.data.url#')";
			}
			local.queryService.setSQL(local.sql);
			local.queryService.setDatasource($.globalConfig().getDatasource());
			local.resultObj = local.queryService.execute();
		}
	}

}