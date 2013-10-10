// http://apidocs.mailchimp.com/api/2.0/templates/list.php
component output="false" displayname="Mail Chimp API - Templates" extends="mailchimp" {

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
		
		VARIABLES['endpointURL'] = 'https://#VARIABLES['dc']#.api.mailchimp.com/#VARIABLES['version']#/templates';
		
		return THIS;
	}	
	
	struct function listFolder
		(
			required string folder_id
		)
	{
		var stReturn = {};
		var stTypes  = {};
		var stFilter = {};
		
		stTypes['user'] =  TRUE;
		stFilter['folder_id'] =  ARGUMENTS['folder_id'];
		
		stReturn = list(stTypes, stFilter)
		stReturn['results'] = stReturn['results']['user'];
		
		return stReturn;
	}
	
	struct function list 
		(
			struct templateTypes = {},
			struct filters = {}
		) 
	{
		var local    = {};
		var stReturn = {};
		var stParams = {};
		
		try {
			// templateTypes
			for( local.key in ARGUMENTS.templateTypes ) {
				
				if (listContainsNoCase("user,gallery,base", local.key) == 0)
					throw(message="Unknown list type '#local.key#'", detail="Supported List Types: user,gallery,base");
				
				if ( ! isBoolean(ARGUMENTS.templateTypes[local.key]) )
					throw(message="'#ARGUMENTS.templateTypes[local.key]#' is not a booloan", detail="set '#local.key#' to TRUE or FALSE");
			}

			// filters
			for( local.key in ARGUMENTS.filters ) {
				if (listContainsNoCase("category,folder_id,include_inactive,inactive_only", local.key) == 0)
					throw(message="Unknown filter '#local.key#'", detail="Supported Filters: category,folder_id,include_inactive,inactive_only");
			}
			
			stParams['apikey']    = VARIABLES['apikey'];
			stParams['types']     = ARGUMENTS['templateTypes'];
			stParams['filters']   = ARGUMENTS['filters'];
			
			stReturn = callAPI("#VARIABLES['endpointURL']#/list.json", stParams);
		}
		catch (any error) {
			stReturn['error'] = {};
			
			stReturn['error']['Detail']  = error['Detail'];
			stReturn['error']['Message'] = error['Message'];
			
			stReturn['error']['error'] = error;
		}
	
		return stReturn;
	} // list ()
	

		
}	