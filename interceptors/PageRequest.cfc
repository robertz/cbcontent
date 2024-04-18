component{

	property name="contentService" inject="ContentService@cb-content";

	function configure(){}

	function preViewRender(event, interceptData){
		var rc = event.getCollection();
		var prc = event.getCollection(private = true);

		contentService.loadContent(prc);
	}
}