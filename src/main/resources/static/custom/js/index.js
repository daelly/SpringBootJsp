define([
        "jquery","underscore","backbone",
        "text!templates/person-template.html","text!templates/edit-person-template.html",
        "bootstrap"
], function(
		$,_,Backbone,
		personTpl,personEditTpl){
	
	jQuery.prototype.serializeObject=function(){  
		var a,o,h,i,e;  
		a=this.serializeArray();  
		o={};  
		h=o.hasOwnProperty;  
		for(i=0;i<a.length;i++){  
			e=a[i];  
			if(!h.call(o,e.name)){  
				o[e.name]=e.value;  
			}  
		}  
		return o;  
	};  
	
	var Person = Backbone.Model.extend({
		urlRoot: '/person/save',
		initialize: function(){
			this.bind("change:name",function(){
				var name = this.get('name');
				console.log("姓名发生了改变，新的名字："+name);
			});
			this.bind("invalid",function(model,error){
				alert(error);
			});
		},
		defaults: {
			name: '',
			age: 20,
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
	
	var Persons = Backbone.Collection.extend({
		
		// 设置从服务器拉取数据的url
		url: '/person/list',
		
		// 设置Collection的模型为 Person
		model: Person,
		
		renderAll: function(){
			return this.map(function(person){
				return new PersonView({model:person}).render();
			});
		}
	});
	
	var persons = new Persons();
		
	var PersonView = Backbone.View.extend({
		
		//下面这个标签的作用是，把template模板中获取到的html代码放到这标签中。
		tagName:  "tr",
		
		// 获取一个任务条目的模板,缓存到这个属性上。
		template: _.template(personTpl),
		
		// 为每一个任务条目绑定事件
		events: {
			"click a.edit"   : "edit",
			"click a.delete" : "dropoff",
			"click a.detail" : "detail"
		},
		
		//在初始化时设置对model的change事件的监听
		//设置对model的destroy的监听，保证页面数据和model数据一致
		initialize: function() {
			this.listenTo(this.model, 'change', this.render);
			//这个remove是view的中的方法，用来清除页面中的dom
			this.listenTo(this.model, 'destroy', this.remove);
		},
		
		// 渲染todo中的数据到 item-template 中，然后返回对自己的引用this
		render: function() {
			this.$el.html(this.template(this.model.toJSON()));
			return this.$el;
		},
		
		// 修改任务条目的样式
		edit: function() {
			new PersonEditView({model:this.model}).render();
		},
		
		// 删除项目
		dropoff: function() {
			if(window.confirm("是否确认要删除该数据？")){
				this.model.destroy();
			}
		},
		
		// 移除对应条目，以及对应的数据对象
		detail: function() {
			alert(this.model.aboutMe());
		}
	});
	
	var PersonEditView = Backbone.View.extend({
		
		// 指定摸态框
		tagName: "div",
		
		className: "modal fade",
		
		attributes: {
			"role": "dialog",
			"aria-hidden": "true"
		},
		
		// 获取一个任务条目的模板,缓存到这个属性上。
		template: _.template(personEditTpl,{variable: 'data'}),
		
		// 为每一个任务条目绑定事件
		events: {
			"click button#save" : "save",
			"click button.cancel" : "cancel",
			"click button.close" : "cancel"
		},
		
		// 渲染todo中的数据到 item-template 中，然后返回对自己的引用this
		render: function() {
			this.$el.html(this.template(this.model.toJSON()));
			this.$el.appendTo("body");
			this.$el.modal("show");
			return this;
		},
		
		// 保存修改，关闭摸态框
		save: function() {
			var obj = this.$el.find("form").serializeObject();
			this.model.set(obj);
			var that = this;
			this.model.save(null,{
				success: function(m,resp,options){
					var found = persons.get(m);
					if(!found)
						persons.add(m);
				},
				error: function(){
					alert('保存失败！');
				}
			});
			that.$el.modal("hide");
			that.$el.siblings(".modal-backdrop").remove();
			that.remove();
		},
		
		// 取消编辑
		cancel: function() {
			this.$el.modal("hide");
			this.$el.siblings(".modal-backdrop").remove();
			this.remove();
		}
	});
	
	var AppView = Backbone.View.extend({
		
		//绑定页面上主要的DOM节点
		el: $("#app"),
		
		// 绑定dom节点上的事件
		events: {
			"click #add": "add",
			"click #search": "search"
		},
		
		// 初始化，从服务器拉取数据
		initialize: function() {
			var that = this;
			this.collection = persons;
			this.collection.fetch({
				url: '/person/list',
				data: this.$el.serializeObject(),
				success: function(datas,resp){
					that.render();
				},
				error: function(){
					alert("error");
				}
			});
			this.listenTo(this.collection, 'add', this.render);
		},
		
		// 渲染当前collection的元素
		render: function() {
			var tbody = this.$el.find("#dataList");
			tbody.empty();
			var that = this;
			_.each(that.collection.renderAll(),function(tr){
				console.log(tr);
				tbody.append(tr);
			});
		},
		
		add: function() {
			var p = new Person();
			new PersonEditView({model:p}).render();
		},
		
		search: function() {
			var that = this;
			this.collection.fetch({
				url: '/person/list',
				data: $el.serializeObject(),
				success: function(datas,resp){
					console.log(datas);
					that.render();
				},
				error: function(){
					alert("error");
				}
			});
		}
	});	
	return AppView;
});