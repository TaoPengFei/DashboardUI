<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/pentaho/themes/default/easyui.css">
	<script src="/pentaho/js/jquery-1.7.2.min.js"></script>
	<script src="/pentaho/js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		if (navigator.browserLanguage != "undefined" && navigator.browserLanguage != null) { 
			if (navigator.systemLanguage == "zh-CN" || navigator.systemLanguage == "zh") { 
				document.write("<script src='/pentaho/js/easyui-lang-zh_CN.js'><\/script>"); 
			} 
		}
	//firefox、chrome,360 
		else { 
			if (navigator.language == "zh-CN" || navigator.systemLanguage == "zh") { 
			document.write("<script src='/pentaho/js/easyui-lang-zh_CN.js'><\/script>"); 
			} 
		} 
	</script>
	<script type="text/javascript" src="/pentaho/BI/i18n/js/jquery.i18n.properties-1.0.9.js"></script>
	
	<title>营业综合分析</title>
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
    span.text_name{
		width:60px;text-align:right; float:left;height:25px;
	}
    .combo-text{
	    width:115px !important;
    }
 
</style>
<body class="bg">
		
	<div class="reportHeader" style="margin:20px 0;">
		<ul>
			<li><span class="text_name" id="bra"></span><select id="Brand" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="pla"></span><select id="Place" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
		</ul>
		<ul>
			<li><span class="text_name" id="are1"></span><select id="Area1" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="are2"></span><select id="Area2" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="are3"></span><select id="Area3" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="out"></span><select id="Outlet" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
		</ul>
		<ul>			
			<li><span class="text_name" id="pet"></span><select id="PeriodType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>						
			<li><span class="text_name" id="cha"></span><select id="Channel" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>			
			<li><span class="text_name" id="ggt"></span><select id="GuestGradeType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>			
			<li><span class="text_name" id="gnt"></span><select id="GuestNoType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>						
		</ul>
		
		<ul>
		    <li><span class="text_name" id="stt"></span><select id="Starttime" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
		    <li><span class="text_name" id="edt"></span><select id="Endtime" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="std"></span><input id="StartDay" class="easyui-datebox" style="width:120px;height:22px;margin-bottom:5px;"  data-options="formatter:myformatter,parser:myparser"></li>			
			<li><span class="text_name" id="edd"></span><input id="EndDay" class="easyui-datebox"   style="width:120px;height:22px;margin-bottom:5px;"  data-options="formatter:myformatter,parser:myparser"></li>
				
		</ul>
		
         <ul>  		
			
			<li style="width:400px;"><span class="text_name" id="typs"></span><span id="TypeSum" style="text-align:left;margin-bottom: 7px;width:80px;height:25px;" ></span></li>		
		
			<li>
				<span class="text_name" id="outtyp"></span><select  id="outputType" name="outputType" style="width:120px;height:22px;margin-bottom:5px;" > 
					<!--<option value=table/html;page-mode=page>HTML</option>
					<option value=pageable/pdf>PDF</option>
					<option value=table/excel;page-mode=flow>Excel</option>
					<option value="table/csv;page-mode=stream">CSV文件</option>
					<option value="table/rtf;page-mode=flow">RTF文件</option>
					<option value="pageable/text">Text</option>-->
				</select>
			</li>
			<li><span class="text_name" id="sortw"></span><select id="Sort" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li style="text-align:right;width:175px;" >
				<span id="Btn" style="text-align:left;margin-bottom: 5px;width:80px;height:22px;" >
					<button id="btn" class="" style="margin-left:5px;width:80px;height:25px;font-size:11px" parame="" onmouseover="this.style.background='#5985b6'" onmouseout="this.style.background=''"></button>
				</span>
			</li>
			
		 </ul>
	</div>
	
	<iframe id="report" width="100%"   title="报表预览" style="width:98%;padding:0px 0px;" onload="resizeReportIframe(this)" ></iframe>
	<script type="text/javascript" src="/pentaho/BI/i18n/js/report.internationalization.js"></script>
	
</body>
<script type="text/javascript" src="/pentaho/js/sy_resizeIframe.js"></script>
 <script type="text/javascript">  
		var bindEvents = function(){
		
			$("#Btn").bind("click",function(){
				var url_param="";	
				/*品牌*/
				var BrandParam = $("#Brand option:selected").val();		//取ID
				if(BrandParam!= -1 && BrandParam!=undefined)url_param=url_param+"&brand_var=" + BrandParam;
				//var BrandParam = $("#selbrandname option:selected").text();		//取内容
				/*商圈*/
				var PlaceParam = $("#Place option:selected").val();
				if(PlaceParam!= -1 && PlaceParam!=undefined)url_param=url_param+"&place_var=" + PlaceParam;
				/*大区*/
				var Area1Param = $("#Area1 option:selected").val();
				if(Area1Param!= -1 && Area1Param!=undefined)url_param=url_param+"&daqu_var=" + Area1Param;
				/*省市*/
				var Area2Param = $("#Area2 option:selected").val();
				if(Area2Param!= -1 && Area2Param!=undefined)url_param=url_param+"&shengshi_var=" + Area2Param;
				/*市*/
				var Area3Param = $("#Area3 option:selected").val();
				if(Area3Param!= -1 && Area3Param!=undefined)url_param=url_param+"&city_var=" + Area3Param;
				/*门店*/
				var OutletParam = $("#Outlet option:selected").val();
				if(OutletParam!= -1 && OutletParam!=undefined)url_param=url_param+"&outlet_var=" + OutletParam;	
				/*市段*/
				var PeriodTypeParam = $("#PeriodType option:selected").val();
				if(PeriodTypeParam!= -1 && PeriodTypeParam!=undefined)url_param=url_param+"&period_var=" + PeriodTypeParam;
				/*渠道*/
				var ChannelParam = $("#Channel option:selected").val();
				if(ChannelParam!= -1 && ChannelParam!=undefined)url_param=url_param+"&channel_var=" + ChannelParam;
				/*顾客档次*/
				var GuestGradeTypeParam = $("#GuestGradeType option:selected").val();
				if(GuestGradeTypeParam!= -1 && GuestGradeTypeParam!=undefined)url_param=url_param+"&guestgrade_var=" + GuestGradeTypeParam;
				/*人数档次*/
				var GuestNoTypeParam = $("#GuestNoType option:selected").val();
				if(GuestNoTypeParam!= -1 && GuestNoTypeParam!=undefined)url_param=url_param+"&guestnotype_var=" + GuestNoTypeParam;
				
				/*开始时间*/
				var StarttimeParam = $("#Starttime option:selected").val();
				if(StarttimeParam!="" && StarttimeParam!=undefined)url_param=url_param+"&hour_beg=" + StarttimeParam;
				/*结束时间*/
				var EndtimeParam = $("#Endtime option:selected").val();
				if(EndtimeParam!="" && EndtimeParam!=undefined)url_param=url_param+"&hour_end=" + EndtimeParam;
				
				/*开始日期*/
				var StartDayParam = $("#StartDay").datebox("getValue");
				if(StartDayParam!="" && StartDayParam!=undefined)url_param=url_param+"&rq_begin=" + StartDayParam;
				
				/*结束日期*/
				var EndDayParam = $("#EndDay").datebox("getValue");
				if(EndDayParam!="" && EndDayParam!=undefined)url_param=url_param+"&rq_end=" + EndDayParam;
				
				/*输出类型*/
				var OutPutParam = $("#outputType").val();
				if(OutPutParam!="" && OutPutParam!=undefined)url_param=url_param+"&output-target=" + OutPutParam;
				/*汇总方式*/
				var TypeSumParam = $('#TypeSum input[name="OutletSumType"]:checked ').val();
				if(TypeSumParam!="" && TypeSumParam!=undefined)url_param=url_param+"&huizong_m=" + TypeSumParam;
				
				/*排序方式*/
				var SortParam = $("#Sort option:selected").val();
				if(SortParam!= -1 && SortParam!=undefined)url_param=url_param+"&SortSelect=" + SortParam;
				
				
				var page = 0; 
				
				/*****************************************************
				*                          报表的url                 *
				*****************************************************/
				var url="/pentaho/api/repos/%3Apublic%3Areport%3Asy_outlet_sale_summery_analyze.prpt/viewer?" +url_param+ 
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
		   })
        	
	    };
		
	var ReportWeb = (function($){  //下面是不相同部分内容
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
			*                  排序方式部分              *
			*********************************************/
			url_Sort = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=OutletSaleSummySort&paramlanguage=" + jQuery.i18n.browserLang();
			var SortData = readJSONFile(url_Sort).resultset;
			var SortStr = "";
			$.each(
				SortData,
				function(i,row){
					SortStr += "<option value=" + SortData[i][0] + ">"+SortData[i][1] + "</option>";
				}
			);
			$("#Sort").html(SortStr);
		
			/*********************************************
			*                 市段部分                   *
			*********************************************/
			//  "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=ChannelQuery&paramlanguage=" + jQuery.i18n.browserLang();
			url_PeriodType = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=PeriodTypeQuery&paramlanguage=" + jQuery.i18n.browserLang();
			var PeriodTypeData = readJSONFile(url_PeriodType).resultset;
			var PeriodTypeStr = "";
			$.each(
				PeriodTypeData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					PeriodTypeStr += "<option value=" + PeriodTypeData[i][0] + ">"+PeriodTypeData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#PeriodType").html(PeriodTypeStr);
			/*********************************************
			*                 渠道部分                   *
			*********************************************/
			url_Channel = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=ChannelQuery&paramlanguage=" + jQuery.i18n.browserLang();
		    //url_Channel = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=ChannelQuery&paramlanguage=" + language;
			//alert("当前浏览器的语言标识：" + jQuery.i18n.browserLang());
			//url_Channel += "&paramlanguage=" + jQuery.i18n.browserLang();
			
			var ChannelData = readJSONFile(url_Channel).resultset;
			var ChannelStr = "";
			$.each(
				ChannelData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					ChannelStr += "<option value=" + ChannelData[i][0] + ">"+ChannelData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#Channel").html(ChannelStr);
			/*********************************************
			*                 顾客档次部分               *
			*********************************************/
			url_GuestGradeType = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=GuestGradeTypeQuery&paramlanguage=" + jQuery.i18n.browserLang();
			var GuestGradeTypeData = readJSONFile(url_GuestGradeType).resultset;
			var GuestGradeTypeStr = "";
			$.each(
				GuestGradeTypeData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					GuestGradeTypeStr += "<option value=" + GuestGradeTypeData[i][0] + ">"+GuestGradeTypeData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#GuestGradeType").html(GuestGradeTypeStr);
			/*********************************************
			*                 人数档次部分               *
			*********************************************/
			url_GuestNoType = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=GuestNoTypeQuery&paramlanguage=" + jQuery.i18n.browserLang();
			var GuestNoTypeData = readJSONFile(url_GuestNoType).resultset;
			var GuestNoTypeStr = "";
			$.each(
				GuestNoTypeData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					GuestNoTypeStr += "<option value=" + GuestNoTypeData[i][0] + ">"+GuestNoTypeData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#GuestNoType").html(GuestNoTypeStr);

			/*********************************************
			*                 开始时间               *
			*********************************************/
			
			url_timetype = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=Selecthour";
			var timeData = readJSONFile(url_timetype).resultset;
			var timeTypeStr = "";
			$.each(
				timeData,
				function(i,row){
					timeTypeStr += "<option value=" + timeData[i][0] + ">"+timeData[i][1] + "</option>";
				}
			);
			$("#Starttime").html(timeTypeStr);
			/*********************************************
			*                 结束时间               *
			*********************************************/
			
			url_timetype1 = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=Selecthour";
			var timeData1 = readJSONFile(url_timetype1).resultset;
			var timeTypeStr1 = "";
			$.each(
				timeData1,
				function(i,row){
					if(i == 23)
						timeTypeStr1 += "<option value=" + timeData1[i][0] + " selected ="+ "selected"+">"+timeData1[i][1] + "</option>";
					else
						timeTypeStr1 += "<option value=" + timeData1[i][0] + ">"+timeData1[i][1] + "</option>";
				}
			);
			$("#Endtime").html(timeTypeStr1);				
			/*********************************************
			*                 汇总方式部分               *
			*********************************************/			
			url_type_sum = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=OutletSumType&paramlanguage=" + jQuery.i18n.browserLang();
			var TypeSumData = readJSONFile(url_type_sum).resultset;
			var TypeSumStr = "";
			$.each(
				TypeSumData,
				function(i,row){
				
					if(i == 0)
						TypeSumStr += "<input type='radio' name='OutletSumType'  value=" + TypeSumData[i][0] + " checked>"+TypeSumData[i][1] ;
					else 
						TypeSumStr += "<input type='radio' name='OutletSumType'  value=" + TypeSumData[i][0] + " >"+TypeSumData[i][1] ;
				}
			);
			$("#TypeSum").html(TypeSumStr);
			
			
	    }();
	})(jQuery);	
 </script>
 <script type="text/javascript" src="/pentaho/js/sy_report_select.js"></script>
</html>