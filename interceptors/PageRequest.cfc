component{

	property name="contentService" inject="ContentService@cbcontent";

	function configure(){}

	function preViewRender(event, interceptData){
		var rc = event.getCollection();
		var prc = event.getCollection(private = true);

		contentService.loadContent(prc);
	}
}