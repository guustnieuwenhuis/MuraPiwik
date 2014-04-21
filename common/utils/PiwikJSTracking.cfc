/*

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" {

	public string function getTracking(
		required string url,
		required string siteId
	) {

		savecontent variable="local.tracking" {
			WriteOutput("
				<!-- Piwik -->
				<script type='text/javascript'>
					var _paq = _paq || [];
					_paq.push(['trackPageView']);
					_paq.push(['enableLinkTracking']);
					(function() {
						var u=(('https:' == document.location.protocol) ? 'https' : 'http') + '://#arguments.url#/';
						_paq.push(['setTrackerUrl', u+'piwik.php']);
						_paq.push(['setSiteId', #arguments.siteId#]);
						var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript';
						g.defer=true; g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
					})();
				</script>
				<!-- End Piwik Code -->
			");
		}

		return local.tracking;
	} 
}