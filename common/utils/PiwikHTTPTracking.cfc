/*

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" {

	public void function track(
		required string url,
		required string siteId,
		required string trackingUrl,
	) {

		local.url = "http://#arguments.url#/piwik.php?";
		local.url &= "idsite=" & arguments.siteId;
		local.url &= "&rec=1";
		local.url &= "&url=" & trackingUrl;

		local.http = new http();
		local.http.setMethod("get");
		local.http.setURL(local.url);
		local.http.send();
	}
}