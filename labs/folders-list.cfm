<h1>Mail Chimp: Folders - List</h1>
[ <a href="index.cfm">Home</a>]<br />
<hr>


<cfset mcFolders = APPLICATION['mailchimp'].folders()>

<h2>Template</h2>
<cfdump var="#mcFolders.list('template')#" label="List">

<h2>Campaign</h2>
<cfdump var="#mcFolders.list('campaign')#" label="List">

<h2>Auto Responder</h2>
<cfdump var="#mcFolders.list('autoresponder')#" label="List">

<h2>Crash</h2>
<cfdump var="#mcFolders.list('ajm')#" label="List">

<hr>
[ <a href="index.cfm">Home</a>]<br />