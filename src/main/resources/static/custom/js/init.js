require.config({
	baseUrl: '/lib/requirejs',
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
	        exports: '$.fn.modal'
	    }
	},
	paths: {
		app: '/custom/js',
		templates: '/custom/templates',
		'bootstrap': '../bootstrap-3.3.0/js/bootstrap.min',
		'underscore': '../backbone/underscore-min',
		'backbone': '../backbone/backbone-min',
		'jquery': '../jQuery/jquery-1.12.4.min'
	}
});

require(['app/index'],function(app){
	new app();
});