<cfscript>

	function renderContent(required string name){
		return request.content.keyExists(name) ? request.content[name] : "*** NOT FOUND ***";
	}

</cfscript>