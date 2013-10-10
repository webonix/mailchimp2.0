// http://apidocs.mailchimp.com/api/2.0/#users-methods

component output="false" displayname="Mail Chimp API - Users" extends="mailchimp"  {

	VARIABLES = {};
	VARIABLES['apikey']      = '';
	VARIABLES['version']     = '';
	VARIABLES['dc']          = '';
	VARIABLES['endpointURL'] = '';

	any function init
		(
			required string apikey,
			required string dc,
			required string version
		)
	{
		VARIABLES['apikey']  = ARGUMENTS.apikey;
		VARIABLES['dc']      = ARGUMENTS.dc;
		VARIABLES['version'] = ARGUMENTS.version;
		
		VARIABLES['endpointURL'] = 'https://#VARIABLES['dc']#.api.mailchimp.com/#VARIABLES['version']#/users';
		
		return THIS;
	}	
	
	struct function logins 
		(
		) 
	{
		var local    = {};
		var stReturn = {};
		var stParams = {};
		
		try {
			
			stParams['apikey'] = VARIABLES['apikey'];
			stReturn = callAPI("#VARIABLES['endpointURL']#/logins.json", stParams);

		}
		catch (any error) {
			stReturn['error'] = error;
		}
	
		return stReturn;
	} // logins ()
	
	struct function profile 
		(
		) 
	{
		var local    = {};
		var stReturn = {};
		var stParams = {};
		
		try {
			stParams['apikey'] = VARIABLES['apikey'];
			stReturn = callAPI("#VARIABLES['endpointURL']#/profile.json", stParams);
		}
		catch (any error) {
			stReturn['error'] = error;
		}
	
		return stReturn;
	} // profile ()
	
	struct function invites 
		(
		) 
	{
		var local    = {};
		var stReturn = {};
		var stParams = {};
		
		try {
			stParams['apikey'] = VARIABLES['apikey'];
			stReturn = callAPI("#VARIABLES['endpointURL']#/invites.json", stParams);
		}
		catch (any error) {
			stReturn['error'] = error;
		}
	
		return stReturn;
	} // invites ()	
		
}	