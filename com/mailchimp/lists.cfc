// http://apidocs.mailchimp.com/api/2.0/#lists-methods
component output="false" displayname="Mail Chimp API - Lists" extends="mailchimp" {

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
		
		VARIABLES['endpointURL'] = 'https://#VARIABLES['dc']#.api.mailchimp.com/#VARIABLES['version']#/lists';
		
		return THIS;
	}	
	
	struct function list 
		(
			struct filters    = {},
			number start     = 0,
			number limit     = 100,
			string sort_field = 'created',
			string sort_dir   = 'DESC'
		) 
	{
		var local    = {};
		var stReturn = {};
		var stParams = {};
		
		try {
			// filters
			for( local.key in ARGUMENTS.filters ) {
				if (listContainsNoCase("list_id,list_name,from_name,from_email,from_subject,created_before,created_after,exact", local.key) == 0)
					throw(message="Unknown filter '#local.key#'", detail="Supported Filters: list_id,list_name,from_name,from_email,from_subject,created_before,created_after,exact");
			}
			
			stParams['apikey']     = VARIABLES['apikey'];
			stParams['filters']    = ARGUMENTS['filters'];
			
			stParams['start']      = ARGUMENTS['start'];
			stParams['limit']      = ARGUMENTS['limit'];
			stParams['sort_field'] = ARGUMENTS['sort_field'];
			stParams['sort_dir']   = ARGUMENTS['sort_dir'];
			
			stReturn = callAPI("#VARIABLES['endpointURL']#/list.json", stParams);
		}
		catch (any error) {
			stReturn['error'] = {};
			
			stReturn['error']['Detail']  = error['Detail'];
			stReturn['error']['Message'] = error['Message'];
			stReturn['error']['code']    = error['code'];
		}
	
		return stReturn;
	} // list ()
	

		
}	