// http://apidocs.mailchimp.com/api/2.0/#folders-methods
component output="false" displayname="Mail Chimp API - Folders" extends="mailchimp" {

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
		
		VARIABLES['endpointURL'] = 'https://#VARIABLES['dc']#.api.mailchimp.com/#VARIABLES['version']#/folders';
		
		return THIS;
	}	
	
	struct function list 
		(
			required string folderType
		) 
	{
		var local    = {};
		var stReturn = {};
		var stParams = {};
		
		try {
			if (listContainsNoCase("campaign,autoresponder,template", ARGUMENTS.folderType) == 0)
				throw(message="Unknown folder type '#ARGUMENTS.folderType#'", detail="Supported Folder Types: campaign,autoresponder,template");
			
			stParams['apikey'] = VARIABLES['apikey'];
			stParams['type']   = ARGUMENTS['folderType'];
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