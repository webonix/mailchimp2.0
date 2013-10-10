<h1>Mail Chimp: users - Profile</h1>
[ <a href="index.cfm">Home</a>]<br />
<hr>

<cfset mc = New com.mailchimp.mailchimp('ee191a6e7a66acf7248623d891430045-us7')>
<cfset mcUsers = APPLICATION['mailchimp'].users()>

<cfdump var="#mcUsers.profile()#" label="Profile">

<hr>
[ <a href="index.cfm">Home</a>]<br />