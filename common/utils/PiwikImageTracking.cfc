/*

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" {

	public string function getTracking(
		required string url,
		required string siteId,
		string noScript=false
	) {

		savecontent variable="local.tracking" {
			if(arguments.noScript) {
				WriteOutput("<noscript><p>");
			}
			WriteOutput("
				<!-- Piwik Image Tracker-->
				<img src='http://#arguments.url#/piwik.php?idSite=#arguments.siteId#&rec=1' style='border:0' alt='' />
				<!-- End Piwik -->
			");
			if(arguments.noScript) {
				WriteOutput("</p></noscript>");
			}
		}

		return local.tracking;
	} 
}