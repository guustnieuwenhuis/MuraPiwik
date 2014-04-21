<cfsilent>
<!---

This file is part of MuraPiwik

Copyright 2014 Guust Nieuwenhuis.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

--->
</cfsilent>
<cfoutput>

	<h1>MuraPiwik v0.1</h1>
	<p>Mura CMS plugin for Piwik integration.</p>

	<h2>Features</h2>
	<ul>
		<li>Automatically Insert Tracking Code</li>
		<ul>
			<li>JavaScript Tracking</li>
			<li>JavaScript Tracking with image fallback</li>
			<li>Image Tracking</li>
			<li>HTTP Tracking</li>
		</ul>
		<li>Admin Settings
		<ul>
			<li>Per site configuration</li>
		</ul>
		<li>Piwik Dashboard</li>
		<ul>
			<li>View your Piwik Dashboard within Mura CMS</li>
		</ul>
	</ul>

	<h2>Installation</h2>
	<p>Install the plugin by uploading a zip or by providing the url.</p>

	<h2>Configuration</h2>
	<p>When installing the plugin, provide the url for your Piwik instance.</p>
	<p>Once the plugin is installed, further configuration is available within the site settings. On the "Extended Attributes"-tab you'll be able to set the Piwik siteId to be used and the method of Tracking.</p>
	<p>Every Mura User can set his/her Piwik authentication code. Configuring this will allow the dashboad to be loaded even when the user is not loggedin to Piwik.</p>

	<h2>Roadmap</h2>
	<h3>Version 0.2</h3>
	<ul>
		<li>All tracking options</li>
	</ul>
	<h3>Version 0.3</h3>
	<ul>
		<li>Piwik widgets in the Mura Dashboard</li>
	</ul>
</cfoutput>