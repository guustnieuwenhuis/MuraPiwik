<!---

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

--->
<cfinclude template="../includes/fw1config.cfm" />
<cfoutput><plugin>
	<name>#variables.framework.package#</name>
	<package>#variables.framework.package#</package>
	<directoryFormat>packageOnly</directoryFormat>
	<provider>Guust Nieuwenhuis</provider>
	<providerURL>http://www.lagaffe.be</providerURL>
	<loadPriority>5</loadPriority>
	<version>#variables.framework.packageVersion#</version>
	<category>Utility</category>
	<ormcfclocation />
	<customtagpaths />
	<mappings />
	<settings>
		<setting>
			<name>piwikUrl</name>
			<label>Piwik URL</label>
			<hint>The URL of Piwik</hint>
			<type>text</type>
			<required>true</required>
			<validation></validation>
			<regex></regex>
			<message>You did not enter a Piwik URL</message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
	</settings>
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="includes.eventHandler" persist="false" />
	</eventHandlers>
	<displayobjects location="global">
	</displayobjects>
	<extensions>
		<extension type="User" subtype="Default">
			<attributeset name="Piwik Settings">
				<attribute name="piwikAuthToken" 
					label="Auth Token" 
					hint="Your Piwik authentication token" 
					type="text" 
					defaultValue="" 
					required="false" 
					validation="" 
					regex="" 
					message="" 
					optionList="" 
					optionLabelList="" />
			</attributeset>
		</extension>
		<extension type="Site" subtype="Default">
			<attributeset name="Piwik Settings">
				<attribute name="piwikSiteId" 
					label="Site ID" 
					hint="The Piwik Site ID" 
					type="text" 
					defaultValue="" 
					required="false" 
					validation="" 
					regex="" 
					message="" 
					optionList="" 
					optionLabelList="" />
				<attribute name="piwikTrackingMethod" 
					label="Tracking Method" 
					hint="The tracking method to use" 
					type="SelectBox" 
					defaultValue="jsimage" 
					required="false" 
					validation="" 
					regex="" 
					message="" 
					optionList="js^jsimage^image^http" 
					optionLabelList="JavaScript^JavaScript + Image fallback^Image^HTTP" />
			</attributeset>
		</extension>
	</extensions>
</plugin></cfoutput>