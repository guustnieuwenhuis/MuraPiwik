<cfsilent>
<!---

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

--->
</cfsilent>
<cfoutput>
	<h2>Dashboard</h2>
	<cfif !len(rc.token_auth)>
		<div class="alert alert-warning">Please configure your piwik authentication code in your profile. When this code is available, the dashboard to load even when you're not logged into Piwik.</div>
	</cfif>
	<iframe src="http://#rc.piwikUrl#/index.php?module=Widgetize&action=iframe&moduleToWidgetize=Dashboard&actionToWidgetize=index&idSite=1&period=week&date=yesterday&token_auth=#rc.token_auth#" frameborder="0" marginheight="0" marginwidth="0" width="100%" height="800"></iframe>
</cfoutput>