<h1>Mail Chimp: Templates - List</h1>
[ <a href="index.cfm">Home</a>]<br />
<hr>


<cfset mctemplates = APPLICATION['mailchimp'].templates()>


<cfparam name="URL.folderID" default="">
<cfif URL.folderID != "">
	<h2>Folder ID: <cfoutput>#URL.folderID#</cfoutput></h2>
<cfdump var="#mctemplates.listFolder(URL.folderID)#" label="List">
</cfif>

<h2>Defaults</h2>
<cfdump var="#mctemplates.list()#" label="List">




<hr>
[ <a href="index.cfm">Home</a>]<br />