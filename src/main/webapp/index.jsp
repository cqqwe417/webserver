<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
	<script src="scripts/boot.js?v=${version}" type="text/javascript"></script>
	<script src="<%=path%>/loginInfo.action?d=<%=new Date().getTime()%>" type="text/javascript"></script>
	<title></title>
	<style type="text/css">
	   body{
	       margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	   }    
	   .header
	   {
	       background:url(images/header.gif) repeat-x 0 -1px;
	   }
	</style>
 </head>
 
 <body>
  	<div id="layout1" class="mini-layout" style="width:100%;height:100%;">
    <div class="header" region="north" height="100" showSplit="false" showHeader="false">
<!--         <h1 style="margin:0;padding:15px;cursor:default;font-family:微软雅黑,黑体,宋体;">DBM系统 </h1>
 -->                <h1 style="padding:15px; text-align:center; cursor:default;font-family:微软雅黑,黑体,宋体;">经纪人后台管理系统 </h1>
       <div style="position:absolute;top:18px;right:10px;">
       		<span>欢迎您：<span id="username"></span></span>
       		<a id="logoff" class="mini-button mini-button-iconTop" href="<%=path%>/logout.action"  plain="true" >注销</a>
       		<!-- <a id="modifyPwd" class="mini-button mini-button-edit"  onclick="modifyPwd();"  plain="true" >修改密码</a> -->
        </div> 
        
    </div>
    <div title="south" region="south" showSplit="false" showHeader="false" height="30" >
        <div style="line-height:28px;text-align:center;cursor:default">Copyright © 好居信息科技有限责任公司版权所有 </div>
    </div>
    <div title="center" region="center" style="border:0;" bodyStyle="overflow:hidden;">
        <!--Splitter-->
        <div class="mini-splitter" style="width:100%;height:100%;" borderStyle="border:0;">
            <div size="180" maxSize="250" minSize="100" showCollapseButton="true" style="border:0;">
                <!--OutlookTree-->
                <div id="leftTree" class="mini-outlooktree"
                    textField="text" idField="id" parentField="pid" >
                </div>
                
            </div>
            <div showCollapseButton="false" style="border:0;">
                <!--Tabs-->
                <div id="mainTabs" class="mini-tabs" activeIndex="2" style="width:100%;height:100%;"      
                     plain="false" 
                >
                    <div title="首页" url="" >        
                    </div>
                </div>
            </div>        
        </div>
    </div>
</div>
</body>
	<script type="text/javascript" src="scripts/index.js?v=${version}"></script>
</html>
