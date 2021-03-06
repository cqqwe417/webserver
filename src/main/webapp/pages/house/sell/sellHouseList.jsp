<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <title>售房列表查询</title>
    <script type="text/javascript" src="scripts/boot.js?v=${version}"></script>
</head>
<body style="height:100%;">
    <div style="width:100%;">
        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:99%;">
                <!-- <tr>
	                 <td>
 	                	<a class="mini-button" id="addbtn" iconCls="icon-add">新增</a>
	                	<a class="mini-button" id="updatebtn" iconCls="icon-edit">修改</a>
 	                	<a class="mini-button" id="deletebtn" iconCls="icon-remove">删除</a> 
	                	<a class="mini-button" id="changesub" iconCls="icon-redo">转移</a>
	                	<a class="mini-button" id="mergesub" iconCls="icon-redo">合并</a>
	                 </td>
	            </tr> -->
	            <tr>     
                    <td id="search">
                    	<span>城市：</span>
                    	<input id="cityId" name="cityId" class="mini-combobox" textField="text" valueField="id" url="<%=path%>/dicAreaNew/getEnableCitySimpleList.action"/>
                    	<span>房源ID：</span>
                    	<input name="houseId" id="houseId" class="mini-textbox" emptyText="输入房源ID精确查找" style="width:150px;"/>
                        <span>小区名：</span>
                        <input name="estateId" id="estateId" class="mini-autocomplete" width="200px" loadingText="无数据" textField="text" valueField="id" />
                        <span>座栋号：</span>
                        <input name="buildingId" id="buildingId" class="mini-combobox"  textField="text" valueField="id" data="[{id:0,text:'全部'}]" value="0"/>
                        <span>房间号：</span>
                        <input name="room" id="room" class="mini-textbox" emptyText="房间号可模糊匹配" style="width:150px;"/>
                        <span>房源标签：</span>
                        <div name="isFiveYears" class="mini-checkbox" checked="false" readOnly="false" text="满二年" trueValue="1" falseValue="0"></div>
                        <div name="isOnlyOne" class="mini-checkbox" checked="false" readOnly="false" text="满五唯一" style="margin-left:5px;" trueValue="1" falseValue="0"></div>
                        <br>
                        <span>发布时间：</span>
                        <input id="startTime" style="width:120px" name="startTime" class="mini-datepicker"  format="yyyy-MM-dd" showOkButton="true" showClearButton="false"/>-<input name="endTime" id="endTime" allowInput="false" class="mini-datepicker" format="yyyy-MM-dd" showOkButton="true" style="width:120px"  showClearButton="false"/>
                        <span>房源状态：</span>
                        <input name="status" id="status" class="mini-combobox"  textField="text" valueField="id" value="-1" data="[{id:-1,text:'全部'},{id:1,text:'有效'},{id:0,text:'无效'}]"/>
                        <span>经纪人类型：</span>
                        <input name="agentType" id="agentType" class="mini-combobox"  textField="text" valueField="id" value="3" data="[{id:3,text:'发布人'},{id:1,text:'委托人'},{id:2,text:'钥匙人'},{id:4,text:'实景人'},{id:5,text:'录入经纪人'},{id:6,text:'一般委托经纪人'},{id:0,text:'无关联经纪人房源'}]"/>
                        <span>门店：</span>
                        <input name="store" id="store" class="mini-combobox"  textField="text" valueField="id" />
                        <span>经纪人：</span>
                        <input name="agent" id="agent" class="mini-combobox"  textField="text" valueField="id" data="[{id:0,text:'全部'}]" value="0"/>
                        <a class="mini-button" id="searchBtn" iconCls="icon-search">查询</a>
                        <a class="mini-button" id="resetBtn" iconCls="icon-cancel">重置</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
    <!--列表-->
    
    <div class="mini-fit" style="height:400px">
          <div id="dg" class="mini-datagrid" sizeList="[30]" pageSize=30 style="height:100%;" url="<%=path%>/houseResource/sell/list.action" multiSelect="true" showfooter="false">
              <div property="columns">
                  <div type="indexcolumn" width="10"></div>
                  <div field="houseId"  align="left" headeralign="left" width="15">房源ID</div>
                  <div field="estateName"  align="left" headeralign="left" width="30">小区名</div>
                  <div field="buildingName"  align="left" headeralign="left" width="20">座栋号</div>
                  <div field="room"  align="left" headeralign="left" width="10">房间号</div>
                  <div field="huxing" align="left" headeralign="left" width="20">户型</div>
                  <div field="area" align="left" headeralign="left" width="20" allowSort="true">面积(㎡)</div>
                  <div field="unitPrice" align="left" headeralign="left" width="15" allowSort="true">单价（元/㎡）</div>
                  <div field="price" align="left" headeralign="left" width="15" allowSort="true">售价（万）</div>
                  <div field="publisher" align="left" headeralign="left" width="20">发布人</div>
                  <div field="publishDate" align="left" headeralign="left" width="25">发布时间</div>
                  <div field="status" align="left" headeralign="left" width="10">房源状态</div>
                  <div name="action" headeralign="left"  align="left" width="40">操作</div>
              </div>
          </div>
    </div>
</body>
<script type="text/javascript" src="scripts/pages/house/sell/sellHouseList.js?v=${version}"></script>
</html>
