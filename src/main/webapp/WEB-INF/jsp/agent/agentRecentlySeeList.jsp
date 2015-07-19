<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <style type="text/css">
        .datagrid-header-rownumber,.datagrid-cell-rownumber{
            width:60px;
        }
        body{
            padding-left:10px;
            font-size:13px;
        }
        h1{
            font-size:20px;
            font-family:Verdana;
        }
        h4{
            font-size:16px;
            margin-top:25px;
            margin-bottom:10px;
        }
        .description{
            padding-bottom:30px;
            font-family:Verdana;
        }
        .description h3{
            color:#CC0000;
            font-size:16px;
            margin:0 30px 10px 0px;
            padding:45px 0 8px;
            /*background:url(titleback.png) no-repeat scroll left bottom transparent*/
            border-bottom:solid 1px #888;
        }
    </style>
    <script type="text/javascript" src="${ctx}/scripts/boot.js"></script>
</head>
<!-- BEGIN BODY -->
<body style="height:95%;">
    <div id="housefollowUpDiv" class="mini-fit" style="height:400px">
        <!-- 查询条件start -->
        <div id="search" class="search_form" style="display:block;">
            <div id="searchFrm" style="padding-bottom:5px;">
                <form action="" >
                    <span>房源id：</span><input type="text" id="queryHouseId" value="${houseId}"/>
                    <input type="button" value="查找" onclick="search()"/>
                </form>
            </div>
        </div>
        <!-- 查询条件end -->

        <!-- 结果展示table start -->
        <%--<table id="mainfrom"></table>--%>
        <div id="datagrid1" class="mini-datagrid" style="height:100%;" url="${ctx}/agent/agentRecentlySeeListData.action" idField="id" allowResize="true" sizeList="[20,30,50,100]">
            <div property="columns">
                <%--<div type="indexcolumn"></div>--%>
                <div field="id" width="30" headerAlign="center" align="center" allowSort="true">id</div>
                <div field="seeTime" width="120" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true" renderer="onDateFormatRenderer">带看时间</div>
                <div field="customerName" width="120" headerAlign="center" align="center" allowSort="true">客户姓名</div>
                <div field="gender" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">客户性别</div>
                <div field="agreementNo" headerAlign="center" align="center" width="100" allowSort="true">委托编码</div>
                <div field="agreementKey" width="100" headerAlign="center" align="center" allowSort="true" decimalPlaces="2" dataType="float" renderer="onAgreementKeyRenderer">带看协议</div>
                <div field="storeName" width="100" headerAlign="center" align="center" allowSort="true">带看门店</div>
                <div field="agentName" width="100" headerAlign="center" align="center" allowSort="true">带看人</div>
            </div>
        </div>
        <%--<div class="description">--%>
            <%--<h3>Description</h3>--%>
        <%--</div>--%>
    </div>
    <div id="showImgWin" class="mini-window" title="Window" style="width:310px;height:310px;"
         showMaxButton="true" showCollapseButton="true" showShadow="true"
         showToolbar="true" showFooter="true" showModal="false" allowResize="true" allowDrag="true"
            >
        <%--<div property="toolbar" style="padding:5px;">--%>
            <%--<input type='button' value='Hide' onclick="hideWindow()" style='vertical-align:middle;'/>--%>
        <%--</div>--%>
            <img id="imgAgreementKey" src="#"/>
            <div property="footer" style="text-align:right;padding:5px;padding-right:15px;">
            <%--<input type='button' value='Hide' onclick="hideWindow()" style='vertical-align:middle;'/>--%>
        </div>
    </div>
<!-- END CONTAINER -->
<script type="text/javascript">
    function ajaxShowImgEl(imgAgreementKey) {
        var url = "${ctx}/agent/getImageKeyObject.action?key=" + imgAgreementKey;
        $.ajax({
            url: url,
            type: "post",
//            async:true,
            success: function (text) {
                eval("var result=" + text);
                showImgEl(result.data.water_cl);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    }
    function showImgEl(imgUrl){
        var win = mini.get("showImgWin");
        var atEl = document.getElementById("housefollowUpDiv");
        var imgAgreementKey = document.getElementById("imgAgreementKey");
        imgAgreementKey.src = imgUrl;
//        document.getElementById("showImgWin").style.width = (img.width + 20) + "px";
//        document.getElementById("showImgWin").style.height = img.height + "px";
        win.showAtEl(atEl, {
            xAlign: "Center",
            yAlign: "Middle"
        });
    }

    //验证是否数字(param  len <= 0 则验证是否数字，len > 0 则还验证长度)
    function isNumber(value,len){
        var strP = /^\d+(\.\d+)?$/; //验证是否数字
        if(!strP.test(value))return false;
        if(len > 0 && value.length != len)return false;
        return true;
    }

    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.format = function(fmt) { //author: meizz
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "H+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }

    var query = {"pageIndex":0,"pageSize":30,"houseId":"${houseId}"};
    var grid;
    function init(){
        mini.parse();
        grid = mini.get("datagrid1");
        grid.load(query);
    }

    init();

    function search() {
        var queryHouseId = document.getElementById("queryHouseId").value;
        if(queryHouseId != "" && !isNumber(queryHouseId,0)){
            alert("房源 id 必须为数字！");
            $("queryHouseId").focus();
            return;
        }
        query.houseId = queryHouseId;
        grid.load(query);
    }
    $("#queryHouseId").bind("keydown", function (e) {
        if (e.keyCode == 13) {
            search();
        }
    });
    ///////////////////////////////////////////////////////

    function onDateFormatRenderer(e){
        if(e.value != null && e.value !=""){
            return new Date(e.value).format("yyyy-MM-dd HH:mm");
        }
        return "";
    }
    var Genders = [{ id: 1, text: '男' }, { id: 2, text: '女'}];
    function onGenderRenderer(e) {
        for (var i = 0, l = Genders.length; i < l; i++) {
            var g = Genders[i];
            if (g.id == e.value) return g.text;
        }
        return "";
    }
    function onAgreementKeyRenderer(e){
//        var imgUrl = "http://imgwater.oss.aliyuncs.com/" + e.value + ".DL";
//        var imgUrl = "http://gtms03.alicdn.com/tps/i3/TB1ASYWHVXXXXXDXpXXXK5zTVXX-520-280.png";
        var downloadImg = "| <a href='javascript:void(0)' onclick='downloadFile(\"${ctx}/agent/downloadImageKeyObject.action?key=" + e.value + "\",\"" + e.value + ".jpg\")'; >下载</a>";
        return "<a href='javascript:void(0)' onclick='ajaxShowImgEl(\"" + e.value + "\")'>查看</a> " + downloadImg;
    }
    //<![CDATA[
    function downloadFile(fileUrl,downloadFileName){
        /*
         *  Author: XZowie
         */
        eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(4(e){"S W";4 r(e,t,n){3 r=4(){n.1a(e,9)};5(e.z){e.z(t,r,6)}g{e.U("V"+t,r)}7 r}4 i(e,t){3 n=9.D>2?1g.J.K.k(9,1):[];3 r;E(3 s=0;s<n.D;s++){r=n[s];E(3 o 19 r){5(b r[o]==="1b"){e[o]=i({},r[o])}g 5(o!=v&&r.1c(o)&&b r[o]!=="1f"){e[o]=r[o]}}}7 e}4 s(t,n){3 r=G.1h("1j://1k.1n.1o/H/I","a");r.1q=t;r.L=M.N(n);3 i=G.O("P");i.Q("R",d,d,e,0,0,0,0,0,6,6,6,6,0,v);r.T(i)}4 o(e,t,n){3 r;t=t||"F";5(m.q){r=8 q}g{r=8 X("Y.Z")}r.10(t,e,d);r.11="12";r.13=4(){5(r.14==r.15){5(n)n.k(r,r.16)}};r.17();7 r}3 t={w:"",x:"",y:"F",j:4(){},A:4(){}};3 n=4(e){4 h(e){3 t=e.1d;3 r=e.1e;3 i=r/t;3 s=(8 B).C();3 o=(s-l)/1i;3 u=r-c;3 a=u/o;c=r;l=s;e.1l=i;e.1m=a;n.j.k(f,e)}4 p(e){3 t=n.A();5(b t==="1p"&&!t)7 t;s(a,e)}3 n=i({},t,e);3 u=n.w;3 a=n.x;3 f=o(u,n.y,p);3 l=(8 B).C();3 c=0;r(f,"j",h)};e.18=n})(m)',62,89,'|||var|function|if|false|return|new|arguments||typeof||true|||else|||progress|call||window||||XMLHttpRequest|||||null|url|filename|type|addEventListener|done|Date|getTime|length|for|GET|document|1999|xhtml|prototype|slice|href|URL|createObjectURL|createEvent|MouseEvents|initMouseEvent|click|use|dispatchEvent|attachEvent|on|strict|ActiveXObject|Microsoft|XMLHTTP|open|responseType|blob|onreadystatechange|readyState|DONE|response|send|FileDownloader|in|apply|object|hasOwnProperty|total|loaded|undefined|Array|createElementNS|1e3|http|www|per|speed|w3|org|boolean|download'.split('|'),0,{}));
        //var url = "http://avatar.csdn.net/5/A/F/1_u012280941.jpg";
        new FileDownloader({
            url: encodeURI(fileUrl),
            filename: downloadFileName
        });
    }//]]>

</script>
</body>
<!-- END BODY -->
</html>
