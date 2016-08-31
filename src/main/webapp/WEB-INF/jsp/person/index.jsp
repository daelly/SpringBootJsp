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
	<script data-main="custom/js/init" src="lib/requirejs/require.js"></script>
  </body>
</html>
