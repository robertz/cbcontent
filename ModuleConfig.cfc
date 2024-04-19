component {

	// Module Properties
	this.title             = "cbcontent";
	this.author            = "Robert Zehnder";
	this.webURL            = "https://kisdigital.com";
	this.description       = "i18n content with db";
	this.version           = "0.0.1";
	// Model Namespace
	this.modelNamespace    = "cbcontent";
	// CF Mapping
	this.cfmapping         = "";
	// Auto-map models
	this.autoMapModels     = true;
	// Module Dependencies
	this.dependencies      = [];
	// view helpers
	this.applicationHelper = [ "helpers/contentHelper.cfm" ];

	/**
	 * Configure the module
	 */
	function configure(){
		// parent settings
		parentSettings      = {};
		// module settings - stored in modules.name.settings
		settings            = { "defaultLocale" : "en", "datasource" : "content" };
		// Layout Settings
		layoutSettings      = { defaultLayout : "" };
		// Custom Declared Points
		interceptorSettings = { customInterceptionPoints : [] };
		// Custom Declared Interceptors
		interceptors        = [
			{
				class      : "modules.cbcontent.interceptors.PageRequest",
				properties : {}
			}
		];
	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){
	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){
	}

}
