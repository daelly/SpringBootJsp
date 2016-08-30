require.config({
	shim: {
		'backbone': {
			deps: ['underscore','jquery'],
			exports: 'Backbone'
		},
		'underscore': {
			exports: '_'
		},
		'bootstrap': {
	        deps: ['jquery'],
	        exports: '$.fn.popover'
	    }
	}
});
require([''],function(app){
	
});