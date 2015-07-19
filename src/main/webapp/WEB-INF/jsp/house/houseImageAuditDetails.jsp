<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>图片审核详情</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
    <script src="${ctx}/scripts/boot.js?v=${version}" type="text/javascript"></script>
    <script src="${ctx}/scripts/miniui/swfupload.js" type="text/javascript"></script>
    
</head>
<body style="height: 100%">
	<input type="text" style="display: none" id="agentId" value="${agentId}"/>
	<input type="text" style="display: none" id="houseId" value="${houseId}"/>

      <fieldset id="fd1" style="width:98%">
        <legend><span>客厅</span></legend>
        <div class="fieldset-body">
            <fieldset id="fd1_1" style="width:98%">
                <div class="fieldset-body">
                    <ul id="kt">
                    	
                    </ul>
                    
                </div>
            </fieldset>
         </div>    
    </fieldset>
    
      <fieldset id="fd2" style="width:98%">
        <legend><span>卧室</span></legend>
        <div class="fieldset-body">
            <fieldset id="fd2_1" style="width:98%">
                <div class="fieldset-body">
                    <ul id="ws">
                    	
                    </ul>
                    
                </div>
            </fieldset>
            </div> 
    </fieldset>
    
      <fieldset id="fd3" style="width:98%">
        <legend><span>厨房</span></legend>
        <div class="fieldset-body">
            <fieldset id="fd3_1" style="width:98%">
                <div class="fieldset-body">
                    <ul id="cf">
                    	
                    </ul>
                    
                </div>
            </fieldset>
            </div> 
    </fieldset>
    
      <fieldset id="fd4" style="width:98%">
        <legend><span>卫生间</span></legend>
        <div class="fieldset-body">
            <fieldset id="fd4_1" style="width:98%">
                <div class="fieldset-body">
                    <ul id="wsj">
                    	
                    </ul>
                    
                </div>
            </fieldset>
             </div>
    </fieldset>
    
      <fieldset id="fd5" style="width:98%">
        <legend><span> 阳台</span></legend>
        <div class="fieldset-body">
            <fieldset id="fd5_1" style="width:98%">
                <div class="fieldset-body">
                    <ul id="yt">
                    	
                    </ul>
                    
                </div>
            </fieldset>
           </div>  
    </fieldset>
    
      <fieldset id="fd6" style="width:98%">
        <legend><span>房型图</span></legend>
        <div class="fieldset-body">
            <fieldset id="fd6_1" style="width:98%">
                <div class="fieldset-body">
                    <ul id="fxt">
                    	<img src=""></img>
                    </ul>
                    
                </div>
            </fieldset>
          </div>
      </fieldset>
      <fieldset id="fd7" style="width:98%">
        <legend><span>外观图</span></legend>
        <div class="fieldset-body">
            <fieldset id="fd7_1" style="width:98%">
                <div class="fieldset-body">
                    <ul id="wgt">
                    	
                    </ul>
                    
                </div>
            </fieldset>
    </fieldset>
    
    房屋买点:
    <br/>
    <HR SIZE=5 />
    <div id="md">
	
    </div>
    
    
     <div align="right">
	     <a class="mini-button" onclick="closed" style="width: 60px;margin-right: 20px;">取消</a>
	      <a class="mini-button" onclick="passData" style="width: 60px;margin-right: 20px;">通过</a>
	     <a class="mini-button" onclick="rejectedData" style="width: 60px;margin-right: 20px;">驳回</a>
     </div>
    <script type="text/javascript">
        mini.parse();
        $(document).ready(function(){
        	 $.ajax({
                 url : "${ctx}/houseImage/loadHouseImage.action?houseId=${houseId}&agentId=${agentId}&mobile=${mobile}&token=${token}",
                 cache : false,
                 dataType : 'text',
                 success : function(data) {
                	 
                	 var d1 = eval('(' + data + ')'); 
                	 if("${sellPoint}" == null){
                		 
                	 }else{
                		 
	                	 $("#md").append("<h3>${sellPoint}</h3>");
                	 }
					for(var i=0;i<d1.length;i++){
						if(d1[i].type == 1){//首图
							$("#fxt").append("<li><img width=\"20%\" hight=\"20%\" src="+d1[i].imgKey+"></img></li>");
							
						}else if(d1[i].type == 2){
							$("#kt").append("<li><img width=\"20%\" hight=\"20%\" src="+d1[i].imgKey+"></img></li>");
							
						
						}else if(d1[i].type == 3){
							$("#ws").append("<li><img width=\"20%\" hight=\"20%\" src="+d1[i].imgKey+"></img></li>");
							
						}else if(d1[i].type == 4){
							$("#cf").append("<li><img width=\"20%\" hight=\"20%\" src="+d1[i].imgKey+"></img></li>");
							
						}else if(d1[i].type == 5){
							$("#wsj").append("<li><img width=\"20%\" hight=\"20%\" src="+d1[i].imgKey+"></img></li>");
							
						
						}else if(d1[i].type == 6){
							$("#yt").append("<li><img width=\"20%\" hight=\"20%\" src="+d1[i].imgKey+"></img></li>");
							
						
						}else if(d1[i].type == 7){
							$("#fxt").append("<li><img width=\"20%\" hight=\"20%\" src="+d1[i].imgKey+"></img></li>");
							
						}else{
							$("#wgt").append("<li><img width=\"20%\" hight=\"20%\" src="+d1[i].imgKey+"></img></li>");
						}
					}
                 }
             });
        });
        
        function closed(){
        	parent.lf.huigouserver.index.refreshHouseImageListTabs();

        	window.CloseOwnerWindow();
        }
        function passData(){
        	lc.mask("正在处理中,请稍后...");
        	$.ajax({
                url : "${ctx}/houseImage/updateAudit.action?houseId=${houseId}&agentId=${agentId}&mobile=${mobile}&token=${token}&flag=0",
                cache : false,
                dataType : 'text',
                success : function(data) {
            		 if(data == 1){
            			lc.unmask();
            			 mini.alert("图片审核通过!","成功",function(){closed();});
            		 }else{
            			 lc.unmask();
            			 mini.alert("审核通过失败,请稍后重试!","错误",function(){closed();});
            		 }	
                }
            });
        }
        //驳回
        function rejectedData(){
        	
        	mini.confirm("确定驳回记录？", "确定？",
                    function (action) {
                        if (action == "ok") {
                        	lc.mask("正在处理中,请稍后...");
                        	$.ajax({
                        		url : "${ctx}/houseImage/updateAudit.action?houseId=${houseId}&agentId=${agentId}&mobile=${mobile}&token=${token}&flag=1",
                                //url : "${ctx}/houseImage/sendMessage.action?houseId=${houseId}&agentId=${agentId}",
                                cache : false,
                                dataType : 'text',
                                success : function(data) {
                            		 if(data == 1){
                            			 lc.unmask();
                            			 mini.alert("驳回成功!","成功",function(){closed();});
                            		 }else{
                            			 lc.unmask();
                            			 mini.alert("驳回失败,请稍后重试!","错误",function(){closed();});
                            		 }	
                                }
                            });
                        } else {

							
                        }
                    }
                );
        	
        	
        }
    </script>

    <div class="description">
       <%-- <jsp:include page="../common/footer.jsp"></jsp:include> --%>
    </div>
</body>
</html>