<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>经纪人后台管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${ctx}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="${ctx}/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/css/themes/default.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/css/custom.css" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" type="text/css" href="${ctx}/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx}/easyui/demo.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/common.css">
<!-- END THEME STYLES -->
<style type="text/css">
    body {
        font-family: "Microsoft YaHei";
    }
    .panel-header, .panel-body {border-width: 0px;}.datagrid,.combo-p{border:solid 1px #D4D4D4;}.datagrid *{-webkit-box-sizing: content-box;-moz-box-sizing: content-box;box-sizing: content-box;}
</style>
<!--[if lt IE 9]>
<script src="${staticUrl}/assets/plugins/respond.min.js"></script>
<script src="${staticUrl}/assets/plugins/excanvas.min.js"></script>
<![endif]-->
<script type="text/javascript" src="${ctx}/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/common.js"></script>
<script type="text/javascript" src="${ctx}/scripts/springscurity.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.json-2.4.js"></script>

<script src="${ctx}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script src="${ctx}/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
<script src="${ctx}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<!--script src="/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script-->
<!-- END CORE PLUGINS -->
<script src="${ctx}/assets/scripts/core/app.js?ver=66"></script>
<script>
    var ctxpath='${ctx}';
	jQuery(document).ready(function () {
		App.init();
	});
	var globleConstant = new Object();
	globleConstant.pageSize=25;
	
	function dateFormatter(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	}
	function dateParser(s){
		if (!s) return new Date();
		var ss = (s.split('-'));
		var y = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		var d = parseInt(ss[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
			return new Date(y,m-1,d);
		} else {
			return new Date();
		}
	}
</script>
<script type="text/javascript" src="${ctx}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<!-- END HEAD -->
