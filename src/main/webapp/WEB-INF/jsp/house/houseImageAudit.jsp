<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>实景图片审核列表</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
    <script src="${ctx}/scripts/miniui/miniui.js" type="text/javascript"></script>
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
<body >
    <div style="padding-bottom:5px;">
    	<span>小区名：</span><input name="estateId" id="estateId" class="mini-autocomplete" loadingText="无数据" textField="text" valueField="id" />
        <span>座栋号：</span>
        <input name="buildingId" id="buildingId" class="mini-combobox"  textField="text" valueField="id" data="[{id:0,text:'全部'}]" value="0"/>
                  
        <span>房间号：</span><input id="roomId" type="text" />
        
        <br />
       <span>审核状态：</span> <input id="auditStatusId" name=""auditStatusId"" class="mini-combobox" textField="text" valueField="id" data="[{id:0,text:'未审核'},{id:1,text:'通过'},{id:2,text:'未通过'}]"/>
          
        
		<!--  <span>上传人：</span><input type="text" id="realId"  /> -->
		 <span>上传人：</span>
		
             <input name="store" id="store" class="mini-combobox"  textField="text" valueField="id" />
           <!--   <span>经纪人：</span> -->
             <input name="agent" id="agent" class="mini-combobox"  textField="text" valueField="id" data="[{id:0,text:'全部'}]" value="0"/>
		        
  <input type="button" value="查找" onclick="search()"/>
        <input type="button" value="重置" onclick="reset()"/>
    </div>
     <!--撑满页面-->
        <div class="mini-fit" style="background:red;height:100px;">
    <div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" 
        url="${ctx}/houseImage/getImageAuditList.action"  idField="id" allowResize="false"
        sizeList="[20,30,50,100]" pageSize="20">
        <div property="columns">
            <!-- <div type="indexcolumn" style="display: none"></div> -->
            <div field="estatename" width="120" headerAlign="center" align="center" allowSort="true">小区名</div>                            
            <div field="buildingName" width="100"  align="center" headerAlign="center">座栋号</div>
            <div field="room" width="100" align="center" headerAlign="center">房间号</div>
            <div field="deptreal" width="120" renderer="onEvaluateBad" align="center" headerAlign="center"  allowSort="false">上传人/部门</div>  
            <div field="createTime" width="100" headerAlign="center" align="center" allowSort="false" renderer="onTimeRenderer" >上传时间</div>
            <div field="auditStatus" width="100" headerAlign="center" align="center" allowSort="false">审核状态</div>
            <div field="loginName" width="100" headerAlign="center" align="center" allowSort="false">审核人</div>
            
            <div field="auditTime" width="100" headerAlign="center" renderer="onTimeRenderer" align="center" allowSort="false">审核时间</div>
            <div field="context" width="100" headerAlign="center"  align="center" allowSort="false">操作</div>
               
        </div>
    </div>   
    </div>
    
    <script type="text/javascript">
        mini.parse();
        mini.get("auditStatusId").select(0);
        var grid = mini.get("datagrid1");
        grid.load();
        
        grid.on("drawcell", function (e) {
        	  var record = e.record,
	              column = e.column,
	              field = e.field,
	              value = e.value;
        	
        	if (field  == "deptreal") {
        		var realName = record.realName;
        		if(realName != null && realName != "" && record.deptName != null && record.deptName != ""){
	        		e.cellHtml = realName + "/" + record.deptName;
        		}else if(realName != null && realName != ""){
        			e.cellHtml = realName + "/";
        		}else if(record.deptName != null && record.deptName != ""){
        			e.cellHtml = "/" + record.deptName;
        		}else{
        			e.cellHtml = "";
        		}
        		
            }
        	if(field == "auditStatus"){
        		if(value == 0){
        			e.cellHtml = "未审核";
        		}else if(value == 1){
        			e.cellHtml = "审核通过";
        		}else{
        			e.cellHtml = "审核不通过";
        		}
        	}
        	if(field == "context"){
        		// e.cellHtml = '<a href="javascript:openDetail(' + e.rowIndex + ',\'' + record.agentId  + '\',\''+record.houseId + '\')">操作</a> '
        		if(record.auditStatus != 1){
        			//e.cellHtml = "未审核";
        		 	e.cellHtml = '<a href="javascript:openDetail(' + e.rowIndex + ',\'' + record.agentId  + '\',\''+record.houseId + '\',\'' +record.mobile + '\',\'' +record.token +'\',\''+ record.sellPoint +'\')">操作</a> '
        		}else{
        			
        		}
        	}
        });
        
        function search() {
        	
            var estateId = mini.get("estateId").getFormValue();//小区名
            var buildingId = mini.get("buildingId").getValue();//座栋号
            var roomId = document.getElementById("roomId").value;//房间号
            var auditStatusId = mini.get("auditStatusId").getFormValue();//审核状态
            //var realId = mini.get("realId").getFormValue();//上传人
            var store = mini.get("store").getFormValue();//部门
            var agent = mini.get("agent").getFormValue();//经纪人
            grid.load({ estatename: estateId, buildingName: buildingId, room: roomId, auditStatus: auditStatusId,deptName:store,realName:agent});
        }
        
        
    /*     function onDeptChanged(e) {
        	var storeCbo = mini.get("storeId")
        	var agentCbo = mini.get("agentId")
            var id = storeCbo.getValue();
        	agentCbo.setValue("");
            var url = "${ctx}/lfAppFeedBack/getAgentList.action";
            if(id != null && id != "")
            {
            	url += "?storeId=" + id;
            }
            agentCbo.setUrl(url);
            agentCbo.select(0);
        } */

        
        function reset()
        {
            document.getElementById("estateId").value = "";
            document.getElementById("buildingId").value = "";
            document.getElementById("roomId").value = "";
            mini.get("auditStatusId").select(0);
            mini.get("agentId").select(0);
        }
        
        $("#key").bind("keydown", function (e) {
            if (e.keyCode == 13) {
                search();
            }
        });
        
        //////////////////////////////////////////////
        function onComboValidation(e) {
            var items = this.findItems(e.value);
            if (!items || items.length == 0) {
               	this.setValue('');
            }
        }

        function onTimeRenderer(e) {
        	
            var value = e.value;
            if (value){
	            value = new Date(value); 
            	return mini.formatDate(value, 'yyyy-MM-dd HH:mm');
            } 
            return "";
        }
        
        
        //审核详情
         function openDetail(index,agentId,houseId,mobile,token,sellPoint)
        {

        	var row = grid.getRow(index);
            var title = row.realName + "-图片审核详情";
        	parent.lf.huigouserver.index.addTabs({
                name:"agentDetail" + agentId,
                title:title,
                showCloseButton:true,
                url:lc.rootPath("houseImage/gotohouseimageauditdetails.action?agentId="+agentId+"&houseId="+houseId+"&mobile="+mobile+"&token="+token+"&sellPoint="+encodeURI(encodeURI(sellPoint)))
            });
        }
        //小区名联动
        var estateId = mini.get("estateId");
 		this.selectedEstate = false;
 		estateId.setUrl("${ctx}/subEstate/tips.action?cityId=43");
 		estateId.on("valuechanged",lc.proxyFn(function(e){
 			this.selectedEstate = e.selected?true:false;
 			this.loadBuildingList(e.value);
 		},this));
        
 		//经纪人联动
 		var store = mini.get("store");
		/* store.load(lc.rootPath(lc.strFormat("${ctx}/store/simple/list.action?cityId={0}",mini.get("cityId").value))); */
		store.load(lc.rootPath(lc.strFormat("${ctx}/store/simple/list.action?cityId=43")));
		store.setData([{id:0,text:'请选择部门'}].concat(store.getData()));
		store.select(0);
		mini.get("store").on("valuechanged",lc.proxyFn(function(e){
			this.loadAgent(e.value);
		},this));
 		
		function loadAgent(storeId){
			var agentList = mini.get("agent");
			if(storeId != 0){
				agentList.load(lc.rootPath(lc.strFormat("${ctx}/agent/simple/list.action?storeId={0}",storeId)));
				agentList.setData([{id:0,text:'未选择经纪人'}].concat(agentList.getData()));
			}else{
				agentList.setData([{
					id : 0,
					text : '全部'
				}]);
			}
			agentList.select(0);
		}
		
		
        function loadBuildingList(subEstateId){
     		var buildingId = mini.get("buildingId");
     		if(this.selectedEstate && subEstateId != ''){
     			buildingId.load(lc.strFormat("${ctx}/subEstate/building/list.action?subEstateId={0}",subEstateId));
     			buildingId.setData([{id:0,text:'全部'}].concat(buildingId.getData()));
     		}else{
     			buildingId.setData([{
     				id : 0,
     				text : '全部'
     			}]);
     		}
     		buildingId.select(0);
     	}
        
    </script> 
    <div class="description">
       <%-- <jsp:include page="../common/footer.jsp"></jsp:include> --%>
    </div>
</body>
</html>