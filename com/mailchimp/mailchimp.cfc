component output="false"  {

	VARIABLES = {};
	VARIABLES['apikey']      = '';
	VARIABLES['version']     = '';
	// only going to use JSON VARIABLES['format']      = '';
	VARIABLES['dc']          = '';
	VARIABLES['endpointURL'] = '';

	any function init
		(
			required string apikey,
			         string version = '2.0'
		)
	{
		VARIABLES['apikey']  = ARGUMENTS.apikey;
		VARIABLES['version'] = ARGUMENTS.version;
		
		VARIABLES['dc'] = ListLast(ARGUMENTS.apikey, '-');
		VARIABLES['endpointURL'] = 'https://#VARIABLES['dc']#.api.mailchimp.com/#VARIABLES['version']#';
		
		return THIS;
	}	
	
	// MailChip API Sections
	
	any function helper
		(
		)
	{
		return New helper(VARIABLES['apikey'], VARIABLES['dc'], VARIABLES['version']);
	}
	
	any function users
		(
		)
	{
		return New users(VARIABLES['apikey'], VARIABLES['dc'], VARIABLES['version']);
	}
	
	any function folders
		(
		)
	{
		return New folders(VARIABLES['apikey'], VARIABLES['dc'], VARIABLES['version']);
	}
	
	any function templates
		(
		)
	{
		return New templates(VARIABLES['apikey'], VARIABLES['dc'], VARIABLES['version']);
	}
	
	any function lists
		(
		)
	{
		return New lists(VARIABLES['apikey'], VARIABLES['dc'], VARIABLES['version']);
	}
	
	
	// common functions
	
	private any function callAPI
		(
			required string url,
			required struct params
		)
	{
		var local    = {};
		var stReturn = {};
	
		http result="local.results"
		     url="#ARGUMENTS.url#"

		     throwOnError ="false"

		     method="POST"
		{
			httpparam type="header" name="Content-Type"  value="application/json; charset=utf-8";
			httpparam type="header" name="Accept"        value="application/json";
			
			httpparam type="body"   name="Data"          value=serializeJSON(ARGUMENTS.params);

		};
		
		if ( local.results['responseheader']['status_code'] == 200) {
			stReturn['ok'] = true;
			stReturn['results'] = deserializeJSON(local.results['filecontent']);
		} else {
			stReturn['ok'] = false;
			stReturn['error'] = deserializeJSON(local.results['filecontent']);
		}
	
		return stReturn;
	}

}	