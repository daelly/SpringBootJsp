<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Backbone示例教程</title>
<script src="http://the5fireblog.b0.upaiyun.com/staticfile/jquery-1.10.2.js"></script>
<script src="http://the5fireblog.b0.upaiyun.com/staticfile/underscore.js"></script>
<script src="http://the5fireblog.b0.upaiyun.com/staticfile/backbone.js"></script>
<script>
	(function ($) {
	   var Person = Backbone.Model.extend({
	   		urlRoot: '/backbone/save',
	   		initialize: function(){
	   			this.bind("change:name",function(){
	   				var name = this.get('name');
	   				alert('你改变了name属性，新的name为：'+name);
	   			});
	   			this.bind("invalid",function(model,error){
	   				alert(error);
	   			});
	   		},
	   		defaults: {
	   			name: '张三',
	   			age: 26,
	   			sex:false
	   		},
	   		aboutMe: function(){
	   			var sexName = this.get('sex')?'女':'男';
	   			return "我叫"+this.get('name')+",性别"+sexName+",今年"+this.get('age')+"岁！";
	   		},
	   		validate: function(attrs){
	   			if(attrs.name==''){
	   				return "name不能为空！";
	   			}
	   		}
	   });
	   var person = new Person();
	   person.save();
	  /*  person.fetch({
	   	url: '/backbone/fetch',
	   	success: function(model,response){
	   		alert("success");
	   		alert(model.get('name'));
	   	},
	   	error: function(arg1,arg2){
	   		console.log(arg1);
	   		console.log(arg2);
	   	}
	   }); */
	})(jQuery);
</script>
</head>
<body>

</body>
</html>