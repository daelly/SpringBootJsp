<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="lib/jQuery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="lib/bootstrap-3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://the5fireblog.b0.upaiyun.com/staticfile/underscore.js"></script>
	<script type="text/javascript" src="http://the5fireblog.b0.upaiyun.com/staticfile/backbone.js"></script>
	<link rel="stylesheet" type="text/css" href="lib/bootstrap-3.3.0/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="lib/bootstrap-3.3.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="custom/css/index.css"/>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container container-body">
    	<form id="app">
    		<div class="table-title">
    			<span class="title-text">
    				Backbone表格相应
    			</span>
    			<button class="btn btn-sm btn-success" type="button" id="add">添加</button>
    			<div class="search-field">
    				<button class="btn btn-sm btn-default" type="button" id="search">搜索</button>
    			</div>
    		</div>
	    	<div class="table-responsive">
	    		<table class="table table-striped">
	    			<thead>
	    				<tr>
	    					<th>序号</th>
	    					<th>姓名</th>
	    					<th>年龄</th>
	    					<th>性别</th>
	    					<th>操作</th>
	    				</tr>
	    			</thead>
	    			<tbody id="dataList">
	    				
	    			</tbody>
	    		</table>
	    	</div>
    	</form>
    </div>
    <script type="text/template" id="person-template">
	    <td>{{id}}</td>
	    <td>{{name}}</td>
	    <td>{{age}}</td>
	    <td>{{sex}}</td>
		<td>
			<a class="btn btn-default btn-xs edit" href="javascript:void(0)" title="编辑"><span class="glyphicon glyphicon-edit"></span></a>
			<a class="btn btn-default btn-xs delete" href="javascript:void(0)" title="删除"><span class="glyphicon glyphicon-trash"></span></a>
			<a class="btn btn-default btn-xs detail" href="javascript:void(0)" title="详情"><span class="glyphicon glyphicon-list-alt"></span></a>
		</td>
	</script>
	<div class="modal fade" id="sub_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
	    
	</div> 
	<script type="text/template" id="edit-person-template">
		<div class="modal-dialog"> 
	        <div class="modal-content"> 
	            <div class="modal-header"> 
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> 
	                <h4 class="modal-title" id="myModalLabel">{{name}}信息编辑</h4> 
	            </div> 
	            <div class="modal-body">
	            	<form role="form">
						{{ if(data.id){ }}
						<input type="hidden" name="id" value="{{id}}" />
						{{ } }}
						<div class="form-group"> 
					        <label for="name">姓名</label> 
					        <input type="text" class="form-control" name="name" placeholder="请输入姓名" value="{{name}}"> 
					    </div> 
						<div class="form-group"> 
					        <label for="name">年龄</label> 
					        <input type="number" class="form-control" name="age" placeholder="请输入年龄" value="{{age}}"> 
					    </div> 
						<div class="form-group"> 
					        <label for="name">性别</label> 
					        <input type="text" class="form-control" name="sex" placeholder="请输入性别" value="{{sex}}"> 
					    </div> 
	            	</form>
	            </div> 
	            <div class="modal-footer"> 
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> 
	                <button type="button" class="btn btn-primary" id="save">提交更改</button> 
	            </div> 
	        </div><!-- /.modal-content --> 
	    </div><!-- /.modal-dialog --> 
	</script>
	<script type="text/javascript" src="custom/js/index.js"></script>
  </body>
</html>
