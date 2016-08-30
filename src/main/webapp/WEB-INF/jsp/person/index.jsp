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
	<script type="text/javascript" src="static/lib/jQuery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="static/lib/bootstrap-3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/lib/jQuery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="http://the5fireblog.b0.upaiyun.com/staticfile/underscore.js"></script>
	<script type="text/javascript" src="http://the5fireblog.b0.upaiyun.com/staticfile/backbone.js"></script>
	<link rel="stylesheet" type="text/css" href="static/lib/bootstrap-3.3.0/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="static/lib/bootstrap-3.3.0/css/font-awesome.min.css"/>
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
    <div class="container">
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
    			<tbody id="dataList"></tbody>
    		</table>
    	</div>
    </div>
  </body>
</html>
