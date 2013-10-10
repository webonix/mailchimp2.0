// http://apidocs.mailchimp.com/api/2.0/#helper-methods
component output="false" displayname="Mail Chimp API - Helper" extends="mailchimp" {

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
		
		VARIABLES['endpointURL'] = 'https://#VARIABLES['dc']#.api.mailchimp.com/#VARIABLES['version']#/helper';
		
		return THIS;
	}	
	
	struct function ping 
		(
		) 
	{
		var local    = {};
		var stReturn = {};
		var stParams = {};
		
		try {
			stParams['apikey'] = VARIABLES['apikey'];
			stReturn = callAPI("#VARIABLES['endpointURL']#/ping.json", stParams);
		}
		catch (any error) {
			stReturn['error'] = error;
		}
	
		return stReturn;
	} // ping ()
	
	struct function verifiedDomains 
		(
		) 
	{
		var local    = {};
		var stReturn = {};
		var stParams = {};
		
		try {
			stParams['apikey'] = VARIABLES['apikey'];
			stReturn = callAPI("#VARIABLES['endpointURL']#/verified-domains.json", stParams);
		}
		catch (any error) {
			stReturn['error'] = error;
		}
	
		return stReturn;
	} // verifiedDomains ()
		
}	