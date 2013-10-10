<h1>Mail Chimp: Lists - List</h1>
[ <a href="index.cfm">Home</a>]<br />
<hr>


<cfset mcLists = APPLICATION['mailchimp'].lists()>


<cfdump var="#mcLists.list()#" label="List">


<hr>
[ <a href="index.cfm">Home</a>]<br />