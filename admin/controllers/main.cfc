/*

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="controller" {

	// *********************************  PAGES  *******************************************

	public any function default(required rc) {
		rc.piwikUrl = rc.pc.getSetting('piwikUrl');
		rc.token_auth = $.currentUser().getPiwikAuthToken();
	}

}