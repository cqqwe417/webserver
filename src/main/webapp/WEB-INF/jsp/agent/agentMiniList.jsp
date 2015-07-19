<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>经纪人列表</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <script src="${ctx}/scripts/boot.js?v=${version}" type="text/javascript"></script>
    <style type="text/css">
        html,body
        {
            width:100%;
            height:100%;
            border:0;
            margin:0;
            padding:0;
            overflow:visible;
        }
    </style>
</head>

<!-- BEGIN BODY -->
<body class="page-header-fixed page-sidebar-fixed page-footer-fixed">
				<!-- 查询条件start -->
				<div id="search" class="search_form">
					<div id="searchFrm">
						<form action="" >
							<table spellcheck="false">
                                <tr>
                                    <td style="width: 10px;"></td>
                                    <th>工号:</th>
                                    <td>
                                        <input type='text' name='agentNum' id='agentNum' />
                                    </td>
                                    <td style="width: 10px;"></td>
                                    <th>姓名:</th>
                                    <td>
                                        <input type='text' name='realName' id='realName' />
                                    </td>
                                    <td style="width: 10px;"></td>
                                    <th>电话:</th>
                                    <td>
                                        <input type='text' name='mobile' id='mobile' />
                                    </td>
                                    <td style="width: 10px;"></td>
                                    <th>现状:</th>
                                    <td>
                                        <select style="width: 133px;" id="status" name='status'>
                                            <option value="" selected="selected">全部</option>
                                            <option value="1">在职</option>
                                            <option value="4">离职</option>
                                        </select>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="width: 10px;"></td>
                                    <th>城市:</th>
                                    <td>
                                        <input id="cityId" class="mini-combobox" style="width:135px;" textField="name" valueField="id" 
                                            url="${ctx}/dicAreaNew/getCity.action" value="" showNullItem="true"  allowInput="true"
                                            onvalidation="onComboValidation" onvaluechanged="onCityChanged" />
                                    </td>
                                    <td style="width: 10px;"></td>
                                    <th>公司:</th>
                                    <td>  
                                        <input id="companyId" class="mini-combobox" style="width:135px;" textField="companyName" valueField="id" 
                                            url="${ctx}/company/getCompanyListByCityId.action" value="" showNullItem="true"  allowInput="true"
                                            onvalidation="onComboValidation" onvaluechanged="onComChanged" />
                                    <td style="width: 10px;"></td>
                                    <th>门店:</th>
                                    <td>
                                        <input id="storeId" class="mini-combobox" style="width:135px;" textField="storeName" valueField="id" 
                                            url="${ctx}/store/getStoreListByCompanyId.action" value="" showNullItem="true"  allowInput="true"
                                            onvalidation="onComboValidation"  />
                                    </td>
                                    <td style="width: 10px;"></td>
                                    <th>皇冠:</th>
                                    <td>
                                        <select id="isCrownAgent" name="isCrownAgent" style="width: 135px;" >
                                            <option value="" selected="selected">全部</option>
                                            <option value="1">是</option>
                                            <option value="2">否</option>
                                        </select>
                                    </td>
                                    <td style="width: 50px;"></td>
                                    <td width="50px">
                                        <input type="button" class="btn btn-info btn-sm" value="查询" onclick="doSearch();" />
                                    </td>
                                    <td>
                                        <input type="button" class="btn btn-info btn-sm" value="重置" onclick="restFrom();" />
                                    </td>
                                </tr>
							</table>
						</form>
					</div>
				</div>
				<!-- 查询条件end -->

                <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                    <table style="width:100%;">
                        <tr>
                            <td style="width:100%;">
                                <a class="mini-button" iconCls="icon-add" onclick="add()">新增</a>
                                <a class="mini-button" iconCls="icon-edit" onclick="edit()">修改</a>
                                <a class="mini-button" iconCls="icon-edit" onclick="changePassword()">修改密码</a>
                                <a class="mini-button" iconCls="icon-edit" onclick="disab()">资源转移</a>
                            </td>
                        </tr>
                    </table>
                </div>
				<!-- 结果展示table start -->
				<div class="mini-fit" style="background:red;height:100px;">
                    <div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" 
                        url="${ctx}/agent/agentListData.action"  idField="id" allowResize="false"
                        sizeList="[20,30,50,100]" pageSize="20">
                        <div property="columns">
                            <div type="indexcolumn"></div>
                            <div field="agentNum" width="120" headerAlign="center" allowSort="false">工号</div>                            
                            <div field="realName" width="100"  align="center" headerAlign="center">名字</div>
                            <div field="mobile" width="100" align="center" headerAlign="center">电话</div>
                            <div field="cityName" width="100" headerAlign="center" allowSort="false">城市</div>   
                            <div field="companyName" width="120"  align="center" headerAlign="center"  allowSort="false">所属公司简称</div>  
                            <div field="storeName" width="100"  align="center" headerAlign="center">所属门店</div>
                            <div field="createTime" width="100" renderer="onTimeRenderer"  align="center" headerAlign="center">创建时间</div>
                            <div field="highPercentage" width="100" align="center" headerAlign="center">好评率</div>
                            <div field="status" width="100"  renderer="onStatusRenderer" align="center" headerAlign="center">现状</div>
                            <div field="isCrownAgent" width="100" renderer="onCrownRenderer"  align="center" headerAlign="center">皇冠</div>
                            <div name="action" width="100" align="center" headerAlign="center">#</div>
                        </div>
                    </div>   
                </div>
				<!-- 结果展示table end -->
				<!-- 这里开始写业务页面end -->
			</div>
		</div>
	</div>
	<!-- BEGIN FOOTER -->
    
    <script type="text/javascript">
        mini.parse();
        var grid = mini.get("datagrid1");
        
        grid.on("drawcell", function (e) {
    	   var record = e.record, column = e.column, field = e.field, value = e.value;
            if (column.name == "action") {
                e.cellStyle = "text-align:center";
                e.cellHtml = '<a href="javascript:openDetail(' + e.rowIndex + ',\'' + record.id  + '\')">评价明细</a>&nbsp; '
            }
            if (field == "highPercentage") {
                 var highPercent = record.highPercentage;
                 var highPercentageTotal = record.highPercentageTotal;
                 var value = 0;
                 if(highPercentageTotal > 0)
                 {
                	 value = highPercent / highPercentageTotal * 100;
                 }
                 else
                 {
                	 value = 100;
                 }
                 value = value.toFixed(2);
                 e.cellHtml = value + "%";
            }
        });
        
        grid.load();
        
        function openDetail(index,agentId)
        {
        	var row = grid.getRow(index);
            var title = row.realName + "-评价明细";
        	parent.lf.huigouserver.index.addTabs({
                name:"agentDetail" + agentId,
                title:title,
                showCloseButton:true,
                url:lc.rootPath("agent/evaluateListIndex.action?agentId="+agentId)
            });
        }
        
        //////////////////////////////////////////////////
        function onTimeRenderer(e) {
            var value = e.value;
            value = new Date(value); 
            if (value) return mini.formatDate(value, 'yyyy-MM-dd HH:mm');
            return "";
        }
        
       
    
        //////////////////////////////////////////////////////////////////////////
        var Statuss = [{ id: 1, text: '在职' }, { id: 2, text: '审核失败'},{ id: 3, text: '删除'},{ id: 3, text: '离职'}];
        function onStatusRenderer(e) {
            for (var i = 0, l = Statuss.length; i < l; i++) {
                var g = Statuss[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }
        
        ///////////////////////////////////////////////////////////////////////////
        var Crowns = [{ id: 1, text: '是' }, { id: 2, text: '否'}];
        function onCrownRenderer(e) {
            for (var i = 0, l = Crowns.length; i < l; i++) {
                var g = Crowns[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }
        
        //////////////////////////////////////////////
        function onComboValidation(e) {
            var items = this.findItems(e.value);
            if (!items || items.length == 0) {
                this.setValue('');
            }
        }
        
        
        function restFrom()
        {
        	$("#agentNum").val("");
        	$("#realName").val("");
        	$("#mobile").val("");
        	$("#isCrownAgent").val("");
        	$("#status").val("");
        	mini.get("cityId").select(0);
        	mini.get("companyId").select(0);
        	mini.get("storeId").select(0);
        	
        }
        
        function onCityChanged(e) {
            var cityCbo = mini.get("cityId")
            var comCbo = mini.get("companyId");
            var id = cityCbo.getValue();
            comCbo.select(0);
            var url = "${ctx}/company/getCompanyListByCityId.action";
            if(id != null && id != "")
            {
                url += "?cityId=" + id;
            }
            comCbo.setUrl(url);
            comCbo.select(0);
            
            var storeCbo = mini.get("storeId");
            storeCbo.setUrl("${ctx}/store/getStoreListByCompanyId.action");
        }
        
        function onComChanged(e) {
            var comCbo = mini.get("companyId");
            var storeCbo = mini.get("storeId");
            var id = comCbo.getValue();
            storeCbo.select(0);
            var url = "${ctx}/store/getStoreListByCompanyId.action";
            if(id != null && id != "")
            {
                url += "?companyId=" + id;
            }
            storeCbo.setUrl(url);
            storeCbo.select(0);
        }
        
        function doSearch() {
            var pars = "{";
            var agentNum = $("#agentNum").val();
            if (agentNum != null && agentNum != '') {
                pars += "'agentNum' : '" + agentNum + "',";
            }
            
            var realName = $("#realName").val();
            if (realName != null && realName != '') {
                pars += "'realName' : '" + realName + "',";
            }

            var mobile = $("#mobile").val();
            if (mobile != null && mobile != '') {
                pars += "'mobile' : '" + mobile + "',";
            }

            var status = $("#status").val();
            if (status != null && status != '') {
                pars += "'status' : '" + status + "',";
            }
            
            var cityId = mini.get("cityId").getValue();
            if (cityId != null && cityId != '') {
                pars += "'cityId' : '" + cityId + "',";
            }
            
            var companyId = mini.get("companyId").getValue();
            if (companyId != null && companyId != '') {
                pars += "'companyId' : '" + companyId + "',";
            }
            
            var storeId = mini.get("storeId").getValue();
            if (storeId != null && storeId != '') {
                pars += "'storeId' : '" + storeId + "',";
            }
            
            var isCrownAgent = $("#isCrownAgent").val();
            if(isCrownAgent!=null && isCrownAgent!=''){
                pars += "'isCrownAgent' : '" + isCrownAgent + "',";
            }
            
            if (pars.length > 1) {
                pars = pars.substr(0, pars.length - 1);
            }
            pars += "}";
            pars = eval("(" + pars + ")");
            
            grid.load(pars)
        }
        
        function add() {
            mini.open({
                url: "${ctx}/agent/gotoAddAgent.action",
                title: "新增经纪人", width: 800, height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    grid.reload();
                }
            });
        }
        
        function edit() {
        	var row = grid.getSelected();
        	var isResourceTransfer = true;
            if (row) {
            	$.ajax({
                    url:'${ctx}/agent/isResourceTransfer.action',
                    type:"POST",
                    dataType:"json",
                    data: "userId="+row.id,
                    async:false,//同步
                    success : function(data){
                        for(var i=0;i<data.length;i++){
                            if(data[i]==1){
                                isResourceTransfer = false;
                                break;
                            }
                        }
                    }
                });
                mini.open({
                    url: "${ctx}/agent/gotoEditAgent.action",
                    title: "修改经纪人", width: 800, height: 400,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", id: row.id,isResourceTransfer: isResourceTransfer};
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        grid.reload();
                    }
                });
            }
            else
            {
            	mini.alert("请选中一条记录!");
            }
        }
        
        function changePassword() {
        	var row = grid.getSelected();
            if (row) {
                mini.open({
                    url: "${ctx}/agent/gotoUpdatePassword.action",
                    title: "修改密码", width: 800, height: 400,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", id: row.id};
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        grid.reload();
                    }
                });
            }
        }
        
        function disab() {
        	var row = grid.getSelected();
            if (row) {
                mini.open({
                    url: "${ctx}/agent/gotoResourceTrans.action",
                    title: "资源转移", width: 800, height: 400,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", id: row.id};
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        grid.reload();
                    }
                });
            }
            else
            {
                mini.alert("请选中一条记录!");
            }
        }
    </script>
	
</body>
<!-- END BODY -->
</html>
