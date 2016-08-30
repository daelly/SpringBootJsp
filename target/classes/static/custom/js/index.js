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

var Persons = Backbone.Collection.extend({
	url: '/person/list',
    // 设置Collection的模型为Todo
    model: Person   
});

var PersonView = Backbone.View.extend({

    //下面这个标签的作用是，把template模板中获取到的html代码放到这标签中。
    tagName:  "tr",

    // 获取一个任务条目的模板,缓存到这个属性上。
    template: _.template($('#item-template').html()),

    // 为每一个任务条目绑定事件
    events: {
        "click a.edit"   : "edit",
        "click a.delete" : "remove",
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
        return this;
    },

    // 修改任务条目的样式
    edit: function() {
        $(this.el).addClass("editing");
        this.input.focus();
    },

    // 删除项目
    remove: function() {
        var value = this.input.val();
        if (!value) {
            //无值内容直接从页面清除
            this.clear();
        } else {
            this.model.save({title: value});
            this.$el.removeClass("editing");
        }
    },

    // 移除对应条目，以及对应的数据对象
    detail: function() {
        this.model.destroy();
    }
});

var PersonEditView = Backbone.View.extend({

    // 指定摸态框
	el: $("#sub_modal"),

    // 获取一个任务条目的模板,缓存到这个属性上。
    template: _.template($('#item-template').html()),

    // 为每一个任务条目绑定事件
    events: {
        "click button.save" : "save",
        "click button.cancel" : "cancel"
    },

    // 渲染todo中的数据到 item-template 中，然后返回对自己的引用this
    render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    },

    // 保存修改，关闭摸态框
    save: function() {
    	var obj = $el.find("form").serializeObject();
        this.model.set(obj);
        $el.modal("hide");
    },

    // 取消编辑
    cancel: function() {
    	$el.modal("hide");
    }
});