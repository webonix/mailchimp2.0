<h1>Mail Chimp: users - Login</h1>
[ <a href="index.cfm">Home</a>]<br />
<hr>

<cfset mc = New com.mailchimp.mailchimp('ee191a6e7a66acf7248623d891430045-us7')>
<cfset mcUsers = APPLICATION['mailchimp'].users()>

<cfdump var="#mcUsers.logins()#" label="Logins">

<hr>
[ <a href="index.cfm">Home</a>]<br />