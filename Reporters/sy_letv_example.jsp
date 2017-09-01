<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/pentaho/themes/default/easyui.css">
	<!--<link rel="stylesheet" type="text/css" href="/pentaho/themes/icon.css">-->
	<!--<link rel="stylesheet" type="text/css" href="/pentaho/css/demo.css">
	height: 100%； overflow-y: scroll;overflow-x: scroll; ;
	-->
	<script src="/pentaho/js/jquery-1.7.2.min.js"></script>
	<script src="/pentaho/js/jquery.easyui.min.js"></script>
	<title></title>
</head>
<style type="text/css">
.bg{
	font-size:12px;
	font-family:宋体;
} 

    ul, li {
    list-style:none;
    margin:0;
    padding:0;
    border:0px solid #666;
  }
   ul {
    border-width:0 0 0 0;
    height:30px;
  }
   li {
    width:200px;
    float:left;
    text-align:left;
    border-width:0 0 0 0;
	height:25px;
  } 
  span.text_name{width:60px;text-align:right; float:left;height:20px;line-height:20px;}
 .combo-text{
	width:115px !important;
 }
 
</style>
</style>
<body class="bg">
	<div  style="margin:20px 0;">
		<ul>
			<li><span class="text_name">门店:</span><select id="Place" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name">开始日期:</span><select id="StartDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;" data-options="formatter:myformatter,parser:myparser"></select></li>
			<li><span class="text_name">结束日期:</span><select id="EndDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;"  data-options="formatter:myformatter,parser:myparser"></select></li>
			<li>
				<span class="text_name">输出类型:</span><select  id="outputType" name="outputType" style="width:120px;height:22px;margin-bottom:5px;" > 
					<option value="table/html;page-mode=page">HTML</option>
					<option value="pageable/pdf">PDF</option>
					<option value="table/excel;page-mode=flow">Excel</option>
					<!-- 
					<option value="table/html;page-mode=flow">HTML(flow版)</option>
					<option value="table/html;page-mode=stream">HTML(stream版)</option>
					<option value="table/csv;page-mode=stream">CSV文件</option>
					<option value="table/rtf;page-mode=flow">RTF文件</option>
					<option value="pageable/text">Text</option>
					-->
				</select>
			</li>
			<li style="text-align:right;width:175px;" >
				<span id="Btn" style="text-align:left;margin-bottom: 5px;width:80px;height:22px;" >
					<button id="btn" class="" style="margin-left:5px;width:80px;height:25px;font-size:11px" parame="" onmouseover="this.style.background='#5985b6'" onmouseout="this.style.background=''">查询</button>
				</span>
			</li>
		</ul>
	</div>
	
	<iframe id="report" width="100%"   title="报表预览" style="width:98%;padding:10px 10px;" onload="resizeReportIframe(this)" ></iframe>

</body>
<script type="text/javascript">
	//由于默认页面加载时未加载iframe报表，所以不执行onload事件，在页面初始化时进行iframe高度赋值（根据浏览器自动计算）；
	var default_iframe_height=$(window).height() - 160+ 'px';;
	document.getElementById('report').height=default_iframe_height;
	//去除select 中option的value相同项
	function removeOptionElements(selectId){
		$(selectId).each(function(i,n){
    	    var options = "";
    	    $(n).find("option").each(function(j,m){
    	    	//alert(options.indexOf());
    	        if(options.indexOf($(m)[0].outerHTML) == -1){
    	            options += $(m)[0].outerHTML;
    	        }
    	    });
    	    $(n).html(options);
    	});
	}
	
	/**
	*根据选中值获取option
	*AreaOutletData:CDA获取的数据集；
	*judge_selected:当前下拉框选中值
	*option_selected:组合str的option当前选中值，当在新的列表范围内，设定默认选中
	*rowNumber1:查询对比值（获取option对应数据集范围）
	*rowNumber2:option value值
	*rowNumber3:option text值
	*/
	function getOptionElements(AreaOutletData,judge_selected,option_selected,rowNumber1,rowNumber2,rowNumber3){
		var option_str="<option value='-1'>所有</option>";
		//alert(judge_selected);
		$.each(
			AreaOutletData,
			function(i,row){
					if( judge_selected == AreaOutletData[i][rowNumber1] ){
						//判断之前值是否已经选中
						option_str += "<option value=" + AreaOutletData[i][rowNumber2];
						if(option_selected==AreaOutletData[i][rowNumber2])
							option_str += "  selected ";
						option_str+=">" + AreaOutletData[i][rowNumber3] + "</option>";
					}
			}
		);
		
		return option_str;
	}

     
	//将日历控件的日期的输出格式转换成特定格式
	function myformatter(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	}
	function myparser(s){
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
	};
	$(function(){

            //设置时间
			var today = new Date(); 
			var endday = new Date(today.getTime() - 1*24*60*60*1000);
			var startday = new Date(endday.getTime() - 31*24*60*60*1000);
		   //uom = uom.getFullYear() + "-" + (uom.getMonth()+1) + "-" + uom.getDate(); 
  　　　　 //var start_time = new Date() ; 
           //start_time.setDate(start_time.getDate()+n);
		   //start_time = start_time.getFullYear() + "-" + (start_time.getMonth()+1) + "-" + start_time.getDate();  
   　　　　$("#StartDay").datebox("setValue",myformatter(startday));
   　　　　$("#EndDay").datebox("setValue",myformatter(endday));
    });
	
	function resizeReportIframe(obj) {
            //console.log(obj)
            //console.log(obj.contentWindow);
            //obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
			obj.style.height = $(window).height() - 160+ 'px';
           // var dashb = $("#dashb");
			// var height= ($(window).height()-100);
			// dashb.attr("height",height);
		 
            //console.log(dashb.contents().find("body").height());
    }
	
	var ReportWeb = (function($){
		var getValue = function(){
			//获取CDA元素
			var readJSONFile = function(url){
				var jsonData;
				$.ajax({
					type : 'GET',
					url : url,
					async : false,
					dataType : 'json',
					data : null,
					success : function(response){
						jsonData = response;
						//alert(jsonData);
					}
				})
				return jsonData;
			};
			/*********************************************
			*                 门店部分                   *
			*********************************************/
			url_place = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=PlaceQuery";
			var PlaceData = readJSONFile(url_place).resultset;
			var PlaceStr = "";
			$.each(
				PlaceData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					PlaceStr += "<option value=" + PlaceData[i][0] + ">"+PlaceData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#Place").html(PlaceStr);
			
			/*************************************************
			*                   事件函数                     *
			*************************************************/		
			var bindEvents = function(){
				$("#Btn").bind("click",function(){
					
					/*门店*/
					var PlaceParam = $("#Place option:selected").val();
					if(PlaceParam!=-1 && PlaceParam!=undefined)url_param=url_param+"&place=" + PlaceParam;
					/*开始日期*/
					var StartDayParam = $("#StartDay").datebox("getValue");
					if(StartDayParam!="" && StartDayParam!=undefined)url_param=url_param+"&start_day=" + StartDayParam;
					/*结束日期*/
					var EndDayParam = $("#EndDay").datebox("getValue");
					if(EndDayParam!="" && EndDayParam!=undefined)url_param=url_param+"&end_day=" + EndDayParam;
					/*输出类型*/
					var OutPutParam = $("#outputType").val();
					if(OutPutParam!="" && OutPutParam!=undefined)url_param=url_param+"&output-target=" + OutPutParam;
					var page = 0; 
					/*****************************************************
					*                          报表的url                 *
					*****************************************************/
					//http://180.168.194.221:8090/pentaho/api/repos/%3Apublic%3Areport%3Asy_sale_trend_analyze.prpt/viewer?ts=1470623629908
					var url="/pentaho/api/repos/%3Apublic%3Areport%3Asy_sale_trend_analyze.prpt/viewer?" +url_param+ 
					/*
					"&brand_query=" + BrandParam + 
					"&place_query=" + PlaceParam +
					"&area_level1=" + Area1Param +
					"&area_level2=" + Area2Param +
					"&area_level3=" + Area3Param +
					"&outlet_query=" + OutletParam +
					//"&periodtypename=" + PeriodTypeParam +
					//"&channelname=" + ChannelParam +
					//"&guestgradetypename=" + GuestGradeTypeParam +
					//"&guestnotypename=" + GuestNoTypeParam +
					"&start_day=" + StartDayParam +
					"&end_day=" + EndDayParam +
					//"&ItemName=" + TypeSumParam +
					//"&output-target=table%2Fhtml%3Bpage-mode%3Dpage" + 
					"&output-target=" + OutPutParam +
					*/
					"&accepted-page=0" + 
					"&showParameters=false" + 
					"&renderMode=REPORT" + 
					"&htmlProportionalWidth=false" + 
					"&webuser=admin";
			      	$("#report").attr("src", url);
				});
			}();
		}();
	})(jQuery);
</script>
</html>