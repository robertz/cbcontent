component {

	property name="settings" inject="coldbox:modulesettings:cbcontent";

	function loadContent( required struct criteria ){
		request[ "content" ] = {};
		if ( !criteria.keyExists( "page" ) ) return;

		var content = {};
		var pages   = listToArray( criteria.page );
		for ( var p in pages ) {
			// Default to loading the English content
			var sql = "
				SELECT
					CI.name,
					TI.value
				FROM Page P
				JOIN PageContentItem PCI ON PCI.pageId = P.id
				JOIN TranslatedItem TI ON TI.ContentItemId = PCI.contentItemId
				JOIN LangTypes LT ON LT.code = '#settings.defaultLocale#'
				JOIN ContentItem CI on CI.id = PCI.contentItemId
				WHERE P.page = :page AND TI.LangTypeId = LT.id;
			";
			var dbParams = {
				"langCode" : { value : criteria.langCode, cfsqltype : "cf_sql_varchar" },
				"page"     : { value : p, cfsqltype : "cf_sql_varchar" }
			};
			var c = queryExecute(
				sql,
				dbParams,
				{ datasource : settings.datasource }
			);
			for ( var r in c ) {
				content[ r.name ] = r.value;
			}
			content.append( content );
			// If the locale is not English, load additional content values
			if ( criteria.langCode != settings.defaultLocale ) {
				sql = "
					SELECT
						CI.name,
						TI.value
					FROM Page P
					JOIN PageContentItem PCI ON P.id = PCI.pageId
					JOIN TranslatedItem TI ON TI.ContentItemId = PCI.contentItemId
					JOIN LangTypes LT ON LT.code = :langCode
					JOIN ContentItem CI on CI.id = PCI.contentItemId
					WHERE P.page = :page AND TI.LangTypeId = LT.id;
				";
				c = queryExecute(
					sql,
					dbParams,
					{ datasource : settings.datasource }
				);
				for ( var r in c ) {
					content[ r.name ] = r.value;
				}
			}
		}
		request[ "content" ] = content;
	}

}
