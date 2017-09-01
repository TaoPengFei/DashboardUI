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
	<title>品类结构分析</title>
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
<body  class="bg">
		
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
			<li><span class="text_name" id="std"></span><select id="StartDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;" data-options="formatter:myformatter,parser:myparser"></select></li>
			<li><span class="text_name" id="edd"></span><select id="EndDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;"  data-options="formatter:myformatter,parser:myparser"></select></li>
			
		</ul>
		
		<ul>
			
			<li style="width:400px;"><span class="text_name" id="typs"></span><span id="ItemSumTypeSpan" style="text-align:left;margin-bottom: 7px;width:80px;height:25px;" ></span></li>		
		
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
			<li><span class="text_name" id="sortw"></span><select id="SortType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			
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
				if(BrandParam!= -1 && BrandParam!=undefined)url_param=url_param+"&brandid=" + BrandParam;
				//var BrandParam = $("#selbrandname option:selected").text();		//取内容
				/*商圈*/
				var PlaceParam = $("#Place option:selected").val();
				if(PlaceParam!= -1 && PlaceParam!=undefined)url_param=url_param+"&placeid=" + PlaceParam;
				/*大区*/
				var Area1Param = $("#Area1 option:selected").val();
				if(Area1Param!= -1 && Area1Param!=undefined)url_param=url_param+"&areaid1=" + Area1Param;
				/*省市*/
				var Area2Param = $("#Area2 option:selected").val();
				if(Area2Param!= -1 && Area2Param!=undefined)url_param=url_param+"&areaid2=" + Area2Param;
				/*市*/
				var Area3Param = $("#Area3 option:selected").val();
				if(Area3Param!= -1 && Area3Param!=undefined)url_param=url_param+"&areaid3=" + Area3Param;
				/*门店*/
				var OutletParam = $("#Outlet option:selected").val();
				if(OutletParam!= -1 && OutletParam!=undefined)url_param=url_param+"&outletid=" + OutletParam;	
				/*市段*/
				var PeriodTypeParam = $("#PeriodType option:selected").val();
				if(PeriodTypeParam!= -1 && PeriodTypeParam!=undefined)url_param=url_param+"&periodtypeid=" + PeriodTypeParam;
				/*渠道*/
				var ChannelParam = $("#Channel option:selected").val();
				if(ChannelParam!= -1 && ChannelParam!=undefined)url_param=url_param+"&channelid=" + ChannelParam;
				/*顾客档次*/
				var GuestGradeTypeParam = $("#GuestGradeType option:selected").val();
				if(GuestGradeTypeParam!= -1 && GuestGradeTypeParam!=undefined)url_param=url_param+"&guestgradetypeid=" + GuestGradeTypeParam;
				/*人数档次*/
				var GuestNoTypeParam = $("#GuestNoType option:selected").val();
				if(GuestNoTypeParam!= -1 && GuestNoTypeParam!=undefined)url_param=url_param+"&guestnotypeid=" + GuestNoTypeParam;
				
				/*排序方法*/
				var SortTypeParam = $("#SortType option:selected").val();		
				if(SortTypeParam!= -1 && SortTypeParam!=undefined)url_param=url_param+"&sort=" + SortTypeParam;
				
				/*开始日期*/
				var StartDayParam = $("#StartDay").datebox("getValue");
				if(StartDayParam!="" && StartDayParam!=undefined)url_param=url_param+"&startday=" + StartDayParam;
				/*结束日期*/
				var EndDayParam = $("#EndDay").datebox("getValue");
				if(EndDayParam!="" && EndDayParam!=undefined)url_param=url_param+"&endday=" + EndDayParam;
				/*输出类型*/
				var OutPutParam = $("#outputType").val();
				if(OutPutParam!="" && OutPutParam!=undefined)url_param=url_param+"&output-target=" + OutPutParam;
				/*汇总方式*/
				var TypeSumParam = $('#ItemSumTypeSpan input[name="CategorySumType"]:checked ').val();
				if(TypeSumParam!="" && TypeSumParam!=undefined)url_param=url_param+"&itemid=" + TypeSumParam;
				var page = 0; 
				/*****************************************************
				*                          报表的url                 *
				*****************************************************/
				var url="/pentaho/api/repos/%3Apublic%3Areport%3Asy_category_structure_analyze.prpt/viewer?" +url_param+ 
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
			*                 市段部分                   *
			*********************************************/
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
			*                 汇总方式部分               *
			*********************************************/
			url_type_sum = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=CategorySumType&paramlanguage=" + jQuery.i18n.browserLang();
			var TypeSumData = readJSONFile(url_type_sum).resultset;
			var ItemSumTypeStr = "";
			$.each(
				TypeSumData,
				function(i,row){
					if(i == 0)
						ItemSumTypeStr += "<input type='radio' name='CategorySumType'  value=" + TypeSumData[i][0] + " checked>"+TypeSumData[i][1] ;
					else 
						ItemSumTypeStr += "<input type='radio' name='CategorySumType'  value=" + TypeSumData[i][0] + " >"+TypeSumData[i][1] ;
					//ItemSumTypeStr += "<option value=" + TypeSumData[i][0] + ">"+TypeSumData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#ItemSumTypeSpan").html(ItemSumTypeStr);
			/*********************************************
			*                 排序方法                   *
			*********************************************/
			url_SortType = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=CategoryStructureSort&paramlanguage=" + jQuery.i18n.browserLang();
			var SortTypeData = readJSONFile(url_SortType).resultset;
			var SortTypeStr = "";
			$.each(
				SortTypeData,
				function(i,row){
	
					SortTypeStr += "<option value=" + SortTypeData[i][0] + ">"+SortTypeData[i][1] + "</option>";
					
				}
			);
			$("#SortType").html(SortTypeStr);
	    }();
	})(jQuery);	
 </script>
 <script type="text/javascript" src="/pentaho/js/sy_report_select.js"></script>
</html>