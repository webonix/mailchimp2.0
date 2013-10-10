<h1>Mail Chimp: Helper - Ping test</h1>
[ <a href="index.cfm">Home</a>]<br />
<hr>

<cfset mc = New com.mailchimp.mailchimp('ee191a6e7a66acf7248623d891430045-us7')>
<cfset mcHelper = mc.helper()>

<cfdump var="#mcHelper.ping()#" label="Ping">

<hr>
[ <a href="index.cfm">Home</a>]<br />