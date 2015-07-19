/**
 * @author carvink
 * @include "../../../lf/lf.common.js"
 */
lc.ns("lf.house.house.sell.list");
lf.house.house.sell.list={
	init:function(){
		$("#searchBtn").click(lc.proxyFn(function(){
			this.search();
		},this));
		$("#resetBtn").click(lc.proxyFn(function(){
			this.reset();
		},this));
		
		var houseId = mini.get("houseId");
		houseId.on("blur", lc.proxyFn(function() {
			if (houseId.getValue() != "") {
				this.houseIdSelectiveUnvisible();
			} else {
				this.houseIdSelectiveVisible();
			}
		},this));
		var cityId = mini.get("cityId");
		var estateId = mini.get("estateId");
		this.selectedEstate = false;
		estateId.setUrl(lc.rootPath("subEstate/tips.action?cityId=43"));
		estateId.on("valuechanged",lc.proxyFn(function(e){
			this.selectedEstate = e.selected?true:false;
			this.loadBuildingList(e.value);
		},this));
		cityId.on("valuechanged",lc.proxyFn(function(e){
			if(e.value != "" && e.value != 0){
				estateId.setUrl(lc.rootPath("subEstate/tips.action?cityId="+e.value));
			}
		},this));
		
		mini.get("agentType").on("valuechanged",lc.proxyFn(function(e){
			if(e.value == 0){
				this.agentTypeSelectiveUnvisible();
			}else{
				this.agentTypeSelectiveVisible();
			}
		},this));
		
		
		mini.get("store").on("valuechanged",lc.proxyFn(function(e){
			this.loadAgent(e.value);
		},this));
		
		mini.get("startTime").on("drawdate",lc.proxyFn(function(e){
			var currentDate = new Date();
			if (e.date.getTime() > currentDate.getTime()) {
                e.allowSelect = false;
            }
		},this));
		
		
		mini.get("endTime").on("drawdate",lc.proxyFn(function(e){
			var currentDate = new Date();
			if (e.date.getTime() > currentDate.getTime()) {
                e.allowSelect = false;
            }
		},this));
		

		cityId.setValue(43);
		this.loadStore();
		this.initGrid();
	},
	initGrid:function(){	
		var grid=this.grid=mini.get("dg");
		this.search();
		var status={
			4:"无效",
			2:"有效"
		},whether={
			0:"否",
			1:"是"
		};
		grid.on("drawcell", function(e) {
			var record = e.record, field = e.field, value = e.value, column = e.column;
			if (column.name == "action") {
				var str = "设置为有效";
				if(record.status != 4){
					str = "设置为无效";
				}
				
				var lock = record.lockStatus == 0 ?'锁定':'解锁';
				var html = lc.strFormat('<a class="mini-button" style="padding-left:10px;padding-right:10px;" onclick="lf.house.house.sell.list.updateHouseStatus({0},{1})">{2}</a>' +
										'<a class="mini-button" style="margin-left:5px;padding-left:10px;padding-right:10px;" onclick="lf.house.house.sell.list.detail({0},{3})">详情</a>',
										record.houseId,record.status,str,e.rowIndex);
				e.cellHtml = html;
			}else if(field == "status"){
				e.cellHtml = status[value];
			}else if(field == "publishDate"){
				if(value){
					e.cellHtml = lc.dateFormat(value);
				}
			}else if(field == "area"){
				if(!value){
					value = 0;
				}
			}else if(field == "status"){
				//alert(status[value]);
				e.cellHtml = status[value];
			}else if(field == "hasPoint" || field == "hasContour"){
				e.cellHtml = whether[value];
			}
			
		});
	},
	/**	
	 * 修改房源状态
	 * @param {} houseId
	 * @param {} status
	 */
	updateHouseStatus:function(houseId,status){
		mini.confirm(status==2?"确定要将该房源设置为无效吗？":"确定要将该房源设置为有效吗？","提示",function(e){
			if(e == "ok"){
				if(status == 4){
					status = 2;
				}else if(status == 2){
					status = 4;
				}
				lc.ajax({
					url:lc.rootPath("houseResource/sell/setHouseResourceStatus.action"),
					data:{
						houseResourceStatus:status,
						houseId:houseId
					},
					success:function(data){
						if(data.status == 1){
							lf.house.house.sell.list.grid.reload();
						}else{
							mini.alert(data.message);
						}
					},
					error:function(){
						mini.alert("操作失败，请重试");
					}
				},"正在修改房源状态，请稍后...");
			}
		});
	},
	detail:function(houseId,index){
		var row = this.grid.getRow(index);
		var title = row.estateName+row.buildingName+row.room;
		parent.lf.huigouserver.index.addTabs({
			name:"HouseDetail"+houseId,
			title:title,
			showCloseButton:true,
			url:lc.rootPath("houseResource/sell/tabPage.action?houseId="+houseId)
		});
	},
	search:function(){
		var houseId = mini.get("houseId");
		if (houseId.value == '') {
			var startTime = mini.get("startTime");
			var endTime = mini.get("endTime");
			if (startTime.getValue() != '' && endTime.getValue() != '') {
				if (endTime.getValue().getTime() < startTime.getValue()
						.getTime()) {
					mini.alert("结束时间不可小于开始时间");
					return;
				}
			}
		}
		var form = new mini.Form("#search");
		var data = form.getData(true);
		if(houseId.value != ''){
			lc.removeObjectProperty(data,"startTime,endTime,estateId,estateName,buildingId,room");
		}else{
			var estateId = mini.get("estateId");
			if(!this.selectedEstate && estateId != ''){
				data.estateName =data.estateId;
				delete data.estateId;
			}
		}
		lc.removeObjectEmptyValueProperty(data);
		this.grid.load(data);
	},
	reset:function(){
		var form = new mini.Form("#search");
		form.reset();
		mini.get("cityId").setValue(43);
		mini.get("estateId").setUrl(lc.rootPath("subEstate/tips.action?cityId=43"));
		this.houseIdSelectiveVisible();
		this.agentTypeSelectiveVisible();
		this.selectedEstate = false;
		mini.get("store").select(0);
	},
	houseIdSelectiveUnvisible : function() {
		mini.get("estateId").disable();
		mini.get("room").disable();
		mini.get("buildingId").disable();
		mini.get("startTime").disable();
		mini.get("endTime").disable();
	},
	houseIdSelectiveVisible : function() {
		mini.get("estateId").enable();
		mini.get("room").enable();
		mini.get("buildingId").enable;
		mini.get("startTime").enable();
		mini.get("endTime").enable();
	},
	agentTypeSelectiveUnvisible:function(){
		mini.get("store").disable();
		mini.get("agent").disable();
	},
	agentTypeSelectiveVisible:function(){
		mini.get("store").enable();
		mini.get("agent").enable();
	},
	loadBuildingList:function(subEstateId){
		var buildingId = mini.get("buildingId");
		if(this.selectedEstate && subEstateId != ''){
			buildingId.load(lc.rootPath(lc.strFormat("subEstate/building/list.action?subEstateId={0}",subEstateId)));
			buildingId.setData([{id:0,text:'全部'}].concat(buildingId.getData()));
		}else{
			buildingId.setData([{
				id : 0,
				text : '全部'
			}]);
		}
		buildingId.select(0);
	},
	loadStore:function(){
		var store = mini.get("store");
		store.load(lc.rootPath(lc.strFormat("store/simple/list.action?cityId={0}",mini.get("cityId").value)));
		store.setData([{id:0,text:'全部'}].concat(store.getData()));
		store.select(0);
		this.loadAgent(0);
	},
	loadAgent:function(storeId){
		var agentList = mini.get("agent");
		if(storeId != 0){
			agentList.load(lc.rootPath(lc.strFormat("agent/simple/list.action?storeId={0}",storeId)));
			agentList.setData([{id:0,text:'全部'}].concat(agentList.getData()));
		}else{
			agentList.setData([{
				id : 0,
				text : '全部'
			}]);
		}
		agentList.select(0);
	}
};

$(function(){
	lf.house.house.sell.list.init();
});
