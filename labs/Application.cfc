component output="false"  {
	THIS.name = 'mailchimpLab';


	public void function onApplicationStart() output="false"{

		//mailchimp API
		APPLICATION['mailchimp'] = getMailChimpAPI();
	}

	public boolean function onRequestStart() output="false" {
		
		if (StructKeyExists(URL, 'reset')) {
			//mailchimp API
			APPLICATION['mailchimp'] = getMailChimpAPI();
		}
		
		return true
	}
	
	
	private any function getMailChimpAPI() {
		var mc = New com.mailchimp.mailchimp('ee191a6e7a66acf7248623d891430045-us7');
		
		return mc;
	} // getMailChimpAPI()
}