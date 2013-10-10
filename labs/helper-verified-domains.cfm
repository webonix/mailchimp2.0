<h1>Mail Chimp: Helper - Verified Domains</h1>
[ <a href="index.cfm">Home</a>]<br />
<hr>


<cfset mcHelper = APPLICATION['mailchimp'].helper()>

<cfdump var="#mcHelper.verifiedDomains()#" label="verifiedDomains">

<hr>
[ <a href="index.cfm">Home</a>]<br />