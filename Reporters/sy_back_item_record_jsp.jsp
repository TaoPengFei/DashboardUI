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
	<title>退菜流水报表</title>
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
  span.text_name{width:60px;text-align:right; float:left;line-height:20px;height:20px;}
 .combo-text{
	width:115px !important;
 }
  .reportHeader{
	
	border-bottom:1px dashed silver;
} 
</style>
<body class="bg">
		
	<div class="reportHeader" style="margin:20px 0;">
		<!--<ul>
			<li><span class="text_name" id="bra"></span><select id="Brand" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="pla"></span><select id="Place" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
		</ul>-->
		<ul>
			<li><span class="text_name" id="are1"></span><select id="Area1" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="are2"></span><select id="Area2" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="are3"></span><select id="Area3" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="shop"></span><select id="Shop" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="out1"></span><select id="Outlet" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
		</ul>
		<ul>			
			<li><span class="text_name" id="dept"></span><select id="Deptment" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="ite1"></span><select id="Item1" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="ite2"></span><select id="Item2" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="ite3"></span><select id="Item3" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="dish"></span><select id="Dishes" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>						
		</ul>
		
		<ul>
			<li><span class="text_name" id="voiduser"></span><select id="VoidUser" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="voidreason"></span><select id="VoidReason" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name" id="checkno"></span><select id="CheckNo" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<!--<li><span class="text_name" id="tableno"></span><select id="TableNo" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>-->
			<li><span class="text_name" id="checkopenstation"></span><select id="CheckOpenStation" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>		
		</ul>
		
		<ul>					
			<li><span class="text_name" id="std"></span><select id="StartDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;" data-options="formatter:myformatter,parser:myparser"></select></li>
			<li><span class="text_name" id="edd"></span><select id="EndDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;"  data-options="formatter:myformatter,parser:myparser"></select></li>	
		</ul>
		
		<ul>	
		
			<li>
				<span class="text_name" id="outtyp"></span><select  id="outputType" name="outputType" style="width:120px;height:22px;margin-bottom:5px;" > 
					<option value="table/html;page-mode=page">HTML</option>
					<option value="pageable/pdf">PDF</option>
					<option value="table/excel;page-mode=flow">Excel2003</option>
					<option value="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;page-mode=flow">Excel2007</option>
					
					<!--
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
	
	<iframe id="report" width="100%"   title="报表预览" frameborder=no style="width:100%;padding:0px 0px;" onload="resizeReportIframe(this)" ></iframe>
	<script type="text/javascript" src="/pentaho/BI/i18n/js/report.internationalization.js"></script>
</body>
<script type="text/javascript" src="/pentaho/js/sy_resizeIframe.js"></script>
<script type="text/javascript">
	
	
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
		if(jQuery.i18n.browserLang() === "zh-CN" || jQuery.i18n.browserLang() === "zh"){
			var option_str="<option value= -1>所有</option>";
		}else if( jQuery.i18n.browserLang() === "en" || jQuery.i18n.browserLang() === "en-US" ){
			var option_str="<option value= -1>All</option>";
		}else{
			var option_str="<option value= -1>All</option>";
		}
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
			var startday = new Date(endday.getTime());
		   //uom = uom.getFullYear() + "-" + (uom.getMonth()+1) + "-" + uom.getDate(); 
  　　　　 //var start_time = new Date() ; 
           //start_time.setDate(start_time.getDate()+n);
		   //start_time = start_time.getFullYear() + "-" + (start_time.getMonth()+1) + "-" + start_time.getDate();  
         
   　　　　$("#StartDay").datebox("setValue",myformatter(startday));
   　　　　$("#EndDay").datebox("setValue",myformatter(endday));
    });
	
	
	
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
			*                  品牌部分                  *
			*********************************************/
			url_brand = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=BrandQuery&paramlanguage=" + jQuery.i18n.browserLang();
			var BrandData = readJSONFile(url_brand).resultset;
			//alert(BrandData);
			var BrandStr = "";
			$.each(
				BrandData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					BrandStr += "<option value=" + BrandData[i][0] + ">"+BrandData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#Brand").html(BrandStr);
			/*********************************************
			*                 商圈部分                   *
			*********************************************/
			url_place = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=PlaceQuery&paramlanguage=" + jQuery.i18n.browserLang();
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
			/*********************************************
			*                 菜品部门部分                   *
			*********************************************/
			url_Deptment = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=ItemDeptment&paramlanguage=" + jQuery.i18n.browserLang();
			var DeptmentData = readJSONFile(url_Deptment).resultset;
			var DeptmentStr = "";
			$.each(
				DeptmentData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					DeptmentStr += "<option value=" + DeptmentData[i][0] + ">"+DeptmentData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#Deptment").html(DeptmentStr);
			/*********************************************
			*                 菜品部分                   *
			********************************************
			url_Dishes = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=ItemName&paramlanguage=" + jQuery.i18n.browserLang();
			var DishesData = readJSONFile(url_Dishes).resultset;
			var DishesStr = "";
			$.each(
				DishesData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					DishesStr += "<option value=" + DishesData[i][0] + ">"+DishesData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#Dishes").html(DishesStr);*/
			/*********************************************
			*                 退菜人员部分                   *
			*********************************************/
			url_VoidUser = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=VoidUserName&paramlanguage=" + jQuery.i18n.browserLang();
			var VoidUserData = readJSONFile(url_VoidUser).resultset;
			var VoidUserStr = "";
			$.each(
				VoidUserData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					VoidUserStr += "<option value=" + VoidUserData[i][0] + ">"+VoidUserData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#VoidUser").html(VoidUserStr);
			/*********************************************
			*                 退菜原因部分                   *
			*********************************************/
			url_VoidReason = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=VoidReasonName&paramlanguage=" + jQuery.i18n.browserLang();
			var VoidReasonData = readJSONFile(url_VoidReason).resultset;
			var VoidReasonStr = "";
			$.each(
				VoidReasonData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					VoidReasonStr += "<option value=" + VoidReasonData[i][0] + ">"+VoidReasonData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#VoidReason").html(VoidReasonStr);
			/*********************************************
			*                 单号部分                   *
			*********************************************/
			url_CheckNo = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=CheckNo&paramlanguage=" + jQuery.i18n.browserLang();
			var CheckNoData = readJSONFile(url_CheckNo).resultset;
			var CheckNoStr = "";
			$.each(
				CheckNoData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					CheckNoStr += "<option value=" + CheckNoData[i][0] + ">"+CheckNoData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#CheckNo").html(CheckNoStr);
			/*********************************************
			*                 台号部分                   *
			*********************************************/
			url_TableNo = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=TableNo&paramlanguage=" + jQuery.i18n.browserLang();
			var TableNoData = readJSONFile(url_TableNo).resultset;
			var TableNoStr = "";
			$.each(
				TableNoData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					TableNoStr += "<option value=" + TableNoData[i][0] + ">" +TableNoData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#TableNo").html(TableNoStr);
			/*********************************************
			*                 POS号部分                   *
			*********************************************/
			url_CheckOpenStation = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=CheckOpenStation&paramlanguage=" + jQuery.i18n.browserLang();
			var CheckOpenStationData = readJSONFile(url_CheckOpenStation).resultset;
			var CheckOpenStationStr = "";
			$.each(
				CheckOpenStationData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					CheckOpenStationStr += "<option value=" + CheckOpenStationData[i][0] + ">" +CheckOpenStationData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#CheckOpenStation").html(CheckOpenStationStr);
			/*********************************************
			*                 营业区部分                   *
			********************************************
			url_Shop = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=ShopName&paramlanguage=" + jQuery.i18n.browserLang();
			var ShopData = readJSONFile(url_Shop).resultset;
			var ShopStr = "";
			$.each(
				ShopData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					ShopStr += "<option value=" + ShopData[i][0] + ">" +ShopData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#Shop").html(ShopStr);*/
			
			
			/*********************************************
			*       大区、省、城市、酒店、营业区数据初始化       *
			*********************************************/
			
			url_area_outlet = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=Area1Query&paramlanguage=" + jQuery.i18n.browserLang();
			var AreaOutletData = readJSONFile(url_area_outlet).resultset;
			var Area1Str = "";		//大区
			var Area2Str = "";		//省
			var Area3Str = "";		//城市
			var ShopStr = "";	    //酒店
			var OutletStr = "";     //营业区
			$.each(
				AreaOutletData,
				function(i,row){
					Area1Str += "<option value=" + AreaOutletData[i][0]+">" + AreaOutletData[i][1] + "</option>";
					Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
					Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
					ShopStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7]+ "</option>";
					OutletStr += "<option value=" + AreaOutletData[i][8]+">" + AreaOutletData[i][9]+ "</option>";
				}
			);
			$("#Area1").html(Area1Str);
			$("#Area2").html(Area2Str);
			$("#Area3").html(Area3Str);
			$("#Shop").html(ShopStr);
			$("#Outlet").html(OutletStr);
			//可对指定下拉框进行查重
			removeOptionElements("#Area1,#Area2,#Area3,#Shop,#Outlet");
			
			/*********************************************
			*        大区、省、城市、酒店、营业区点击事件        *
			*********************************************/	
			var Area1_Selected="";
			var Area2_Selected="";
			var Area3_Selected="";
			var Shop_Selected="";
			var Outlet_Selected="";
			//选择大区		
			var Area1Event = function(){
				$("#Area1").change(function(){
					Area1_Selected  = $("#Area1").val();	//获取大区选中值
					Area2_Selected  = $("#Area2").val();	//获取省选中值
					Area3_Selected  = $("#Area3").val();	//获取城市选中值
					Shop_Selected = $("#Shop").val();	    //获取酒店选中值
					Outlet_Selected = $("#Outlet").val();   //获取营业区选中值
					
					Area2Str = "";		//省
					Area3Str = "";		//城市
					ShopStr = "";	    //酒店
					OutletStr = "";
					$.each(
						AreaOutletData,
						function(i,row){							
							//指定项：列出大区所对应的省、城市、酒店、营业区记录
							if(Area1_Selected == AreaOutletData[i][0] ){
								Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
								ShopStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][8]+">" + AreaOutletData[i][9] + "</option>";
							}
							//所有：列出所有记录
							else if(Area1_Selected== -1){
								Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
								ShopStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][8]+">" + AreaOutletData[i][9] + "</option>";
							}
						}					
					);
					if(Area1_Selected != -1){
						//获取省列表
						Area2Str=getOptionElements(AreaOutletData,Area1_Selected,Area2_Selected,0,2,3);
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area1_Selected,Area3_Selected,0,4,5);
						//获取酒店列表	
						ShopStr=getOptionElements(AreaOutletData,Area1_Selected,Shop_Selected,0,6,7);
						//获取营业区列表
						OutletStr=getOptionElements(AreaOutletData,Area1_Selected,Outlet_Selected,0,8,9);
					}
					$("#Area2").html(Area2Str);
					$("#Area3").html(Area3Str);
					$("#Shop").html(ShopStr);
					$("#Outlet").html(OutletStr);
					//去除重复
					removeOptionElements("#Area2,#Area3,#Shop,#Outlet");	 
					//判断之前选中值是否在更新后的下拉框内，若再默认选中

				});
			}();
			//选择省	
			var Area2Event = function(){
				$("#Area2").change(function(){
					Area1_Selected  = $("#Area1").val();	//获取大区选中值
					Area2_Selected  = $("#Area2").val();	//获取省选中值
					Area3_Selected  = $("#Area3").val();	//获取城市选中值
					Shop_Selected = $("#Shop").val();	    //获取酒店选中值
					Outlet_Selected = $("#Outlet").val();   //获取营业区选中值
				    //alert(Area2_Selected);
					Area1Str = "";		//大区
					Area3Str = "";		//城市
					ShopStr = "";		//酒店
					OutletStr = "";     //营业区
					$.each(
						AreaOutletData,
						function(i,row){
							
							//指定项：列出省所对应的大区、城市、酒店记录
							if(Area2_Selected != -1 && Area2_Selected == AreaOutletData[i][2] ){   
								//Area1Str += "<option value=" + AreaOutletData[i][0]+">" + AreaOutletData[i][1] + "</option>";
								Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
								//OutletStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
								//Area1_Selected	=	AreaOutletData[i][0];		//获取选中省所对应大区
								//Area3_Selected	=	AreaOutletData[i][4];		//获取省选中值	
								//Outlet_Selected =	AreaOutletData[i][6];		//获取门店选中值	存在问题
							}
							//所有：列出所有记录
							else if(Area2_Selected== -1){
								Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
								ShopStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][8]+">" + AreaOutletData[i][9] + "</option>";
							}
						}
					);
					$("#Area1").val(Area1_Selected); 
					if(Area2_Selected!= -1){
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area2_Selected,Area3_Selected,2,4,5);
						//获取酒店列表	
						ShopStr=getOptionElements(AreaOutletData,Area2_Selected,Shop_Selected,2,6,7);
						OutletStr=getOptionElements(AreaOutletData,Area2_Selected,Outlet_Selected,2,8,9);
					}
					else  if(Area1_Selected!= -1){
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area1_Selected,Area3_Selected,0,4,5);
						//获取酒店列表	
						ShopStr=getOptionElements(AreaOutletData,Area1_Selected,Shop_Selected,0,6,7);
						OutletStr=getOptionElements(AreaOutletData,Area1_Selected,Outlet_Selected,2,8,9);
					}
				    
					$("#Area3").html(Area3Str);
					$("#Shop").html(ShopStr);
					$("#Outlet").html(OutletStr);
					//去除重复
					removeOptionElements("#Area3,#Shop,#Outlet");	
					//判断之前选中值是否在更新后的下拉框内，若再默认选中
					 
				});
			}();
			//选择城市	
			var Area3Event = function(){
				$("#Area3").change(function(){
					Area1_Selected  = $("#Area1").val();	//获取大区选中值
					Area2_Selected  = $("#Area2").val();	//获取省选中值
					Area3_Selected  = $("#Area3").val();	//获取城市选中值
					Shop_Selected = $("#Shop").val();	    //获取酒店选中值
					Outlet_Selected = $("#Outlet").val();   //获取营业区选中值

					Area1Str = "";		//大区
					Area2Str = "";		//省
					ShopStr = "";		//酒店
					OutletStr = "";     //营业区
					$.each(
						AreaOutletData,
						function(i,row){
							
							//指定项：列出城市所对应的大区、省、酒店记录
							if(Area3_Selected!= -1 &&  Area3_Selected == AreaOutletData[i][4] ){ 
								//Area1Str += "<option value=" + AreaOutletData[i][0]+">" + AreaOutletData[i][1] + "</option>";
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								ShopStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
								//Area1_Selected	=	AreaOutletData[i][0];		//获取选中省所对应大区
								//Area2_Selected  =	AreaOutletData[i][2];		//获取省选中值	
								//Outlet_Selected =	AreaOutletData[i][6];		//获取门店选中值	
							}
							//所有：列出所有记录
							else if(Area3_Selected== -1){
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								ShopStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][8]+">" + AreaOutletData[i][9] + "</option>";
							}
						}
					);
					$("#Area1").val(Area1_Selected);
				    if(Area3_Selected!= -1){
						//获取省列表
						//Area2Str=getOptionElements(AreaOutletData,Area1_Selected,Area2_Selected,0,2,3);
						//获取门店列表	
						ShopStr=getOptionElements(AreaOutletData,Area3_Selected,Shop_Selected,4,6,7);
						OutletStr=getOptionElements(AreaOutletData,Area3_Selected,Outlet_Selected,4,8,9);
					}
					
					else if(Area2_Selected!= -1){
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area2_Selected,Area3_Selected,2,4,5);
						//获取门店列表	
						ShopStr=getOptionElements(AreaOutletData,Area2_Selected,Shop_Selected,2,6,7);
						OutletStr=getOptionElements(AreaOutletData,Area2_Selected,Outlet_Selected,2,8,9);
					}
					else if(Area1_Selected!= -1){
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area1_Selected,Area3_Selected,0,4,5);
						//获取门店列表	
						ShopStr=getOptionElements(AreaOutletData,Area1_Selected,Shop_Selected,0,6,7);
						OutletStr=getOptionElements(AreaOutletData,Area1_Selected,Outlet_Selected,0,8,9);
					}
					//$("#Area2").html(Area2Str);
					$("#Shop").html(ShopStr);
					$("#Outlet").html(OutletStr);
					//去除重复
					removeOptionElements("#Shop,#Outlet");//#Area2,
					
					
				});
			}();		
			
			//选择酒店	
			var ShopEvent = function(){
				$("#Shop").change(function(){
					Area1_Selected  = $("#Area1").val();	//获取大区选中值
					Area2_Selected  = $("#Area2").val();	//获取省选中值
					Area3_Selected  = $("#Area3").val();	//获取城市选中值
					Shop_Selected = $("#Shop").val();	    //获取酒店选中值
					Outlet_Selected = $("#Outlet").val();   //获取营业区选中值

					Area1Str = "";		//大区
					Area2Str = "";		//省
					Area3Str = "";		//市
					OutletStr = "";     //营业区
					$.each(
						AreaOutletData,
						function(i,row){
							
							//指定项：列出城市所对应的大区、省、酒店记录
							if(Shop_Selected!= -1 &&  Shop_Selected == AreaOutletData[i][6] ){ 
								//Area1Str += "<option value=" + AreaOutletData[i][0]+">" + AreaOutletData[i][1] + "</option>";
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][8]+">" + AreaOutletData[i][9] + "</option>";
								//Area1_Selected	=	AreaOutletData[i][0];		//获取选中省所对应大区
								//Area2_Selected  =	AreaOutletData[i][2];		//获取省选中值	
								//Outlet_Selected =	AreaOutletData[i][6];		//获取门店选中值	
							}
							//所有：列出所有记录
							else if(Shop_Selected== -1){
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								//ShopStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][8]+">" + AreaOutletData[i][9] + "</option>";
							}
						}
					);
					$("#Area1").val(Area1_Selected);
					if(Shop_Selected!= -1){
						OutletStr=getOptionElements(AreaOutletData,Shop_Selected,Outlet_Selected,6,8,9);
					}
				    else if(Area3_Selected!= -1){
						//获取省列表
						//Area2Str=getOptionElements(AreaOutletData,Area1_Selected,Area2_Selected,0,2,3);
						//获取门店列表	
						ShopStr=getOptionElements(AreaOutletData,Area3_Selected,Shop_Selected,4,6,7);
						OutletStr=getOptionElements(AreaOutletData,Area3_Selected,Outlet_Selected,4,8,9);
					}
					
					else if(Area2_Selected!= -1){
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area2_Selected,Area3_Selected,2,4,5);
						//获取门店列表	
						ShopStr=getOptionElements(AreaOutletData,Area2_Selected,Shop_Selected,2,6,7);
						OutletStr=getOptionElements(AreaOutletData,Area2_Selected,Outlet_Selected,2,8,9);
					}
					else if(Area1_Selected!= -1){
						Area2Str=getOptionElements(AreaOutletData,Area1_Selected,Area2_Selected,0,2,3);
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area1_Selected,Area3_Selected,0,4,5);
						//获取门店列表	
						ShopStr=getOptionElements(AreaOutletData,Area1_Selected,Shop_Selected,0,6,7);
						OutletStr=getOptionElements(AreaOutletData,Area1_Selected,Outlet_Selected,0,8,9);
					}
					//$("#Area2").html(Area2Str);
					$("#Outlet").html(OutletStr);
					//去除重复
					removeOptionElements("#Outlet");//#Area2,
					
					
				});
			}();	
			/*********************************************************************
			*                 餐品大类、餐品中类、餐品小类、菜品部分                   *
			*********************************************************************/	
			
			url_Item = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=ItemCategoryQuery&paramlanguage=" + jQuery.i18n.browserLang();
			var AreaOutletData1 = readJSONFile(url_Item).resultset;
			var Item1Str = "";		//餐品大类
			var Item2Str = "";		//餐品中类
			var Item3Str = "";		//餐品小类
			var ItemNameStr = "";   //菜品 
			
			$.each(
				AreaOutletData1,
				function(i,row){
					Item1Str += "<option value=" + AreaOutletData1[i][0]+">" + AreaOutletData1[i][1] + "</option>";
					Item2Str += "<option value=" + AreaOutletData1[i][2]+">" + AreaOutletData1[i][3] + "</option>";
					Item3Str += "<option value=" + AreaOutletData1[i][4]+">" + AreaOutletData1[i][5] + "</option>";
					ItemNameStr += "<option value=" + AreaOutletData1[i][6]+">" + AreaOutletData1[i][7]+ "</option>";
				}
			);
			$("#Item1").html(Item1Str);
			$("#Item2").html(Item2Str);
			$("#Item3").html(Item3Str);
			$("#Dishes").html(ItemNameStr);
			//可对指定下拉框进行查重
			removeOptionElements("#Item1,#Item2,#Item3,#Dishes");
			
			/*********************************************
			*        餐品大类、餐品中类、餐品小类点击事件        *
			*********************************************/	
			var Item1_Selected="";
			var Item2_Selected="";
			var Item3_Selected="";
		    var ItemName_Selected="";
			
			//选择餐品大类		
			var Item1Event = function(){
				$("#Item1").change(function(){
					Item1_Selected  = $("#Item1").val();	//获取餐品大类选中值
					Item2_Selected  = $("#Item2").val();	//获取餐品中类选中值
					Item3_Selected  = $("#Item3").val();	//获取餐品小类选中值
				    ItemName_Selected = $("#Dishes").val(); //获取菜品选中值
					
					Item2Str = "";		//餐品中类
					Item3Str = "";		//餐品小类
					ItemNameStr = "";   //菜品
					$.each(
						AreaOutletData1,
						function(i,row){							
							//指定项：列出餐品大类所对应的餐品中类、餐品小类
							if(Item1_Selected == AreaOutletData1[i][0] ){
								Item2Str += "<option value=" + AreaOutletData1[i][2]+">" + AreaOutletData1[i][3] + "</option>";
								Item3Str += "<option value=" + AreaOutletData1[i][4]+">" + AreaOutletData1[i][5] + "</option>";
								ItemNameStr += "<option value=" + AreaOutletData1[i][6]+">" + AreaOutletData1[i][7] + "</option>";
							}
							//所有：列出所有记录
							else if(Item1_Selected== -1){
								Item2Str += "<option value=" + AreaOutletData1[i][2]+">" + AreaOutletData1[i][3] + "</option>";
								Item3Str += "<option value=" + AreaOutletData1[i][4]+">" + AreaOutletData1[i][5] + "</option>";
								ItemNameStr += "<option value=" + AreaOutletData1[i][6]+">" + AreaOutletData1[i][7] + "</option>";
							}
						}					
					);
					if(Item1_Selected != -1){
						//获取餐品中类列表
						Item2Str=getOptionElements(AreaOutletData1,Item1_Selected,Item2_Selected,0,2,3);
						//获取餐品小类列表
						Item3Str=getOptionElements(AreaOutletData1,Item1_Selected,Item3_Selected,0,4,5);
						//获取菜品列表
						ItemNameStr=getOptionElements(AreaOutletData1,Item1_Selected,ItemName_Selected,0,6,7);
						
					}
					$("#Item2").html(Item2Str);
					$("#Item3").html(Item3Str);
					$("#Dishes").html(ItemNameStr);
					//去除重复
					removeOptionElements("#Item2,#Item3,#Dishes");	 
					//判断之前选中值是否在更新后的下拉框内，若再默认选中

				});
			}();
			//选择中类	
			var Item2Event = function(){
				$("#Item2").change(function(){
					Item1_Selected  = $("#Item1").val();	//获取餐品大类选中值
					Item2_Selected  = $("#Item2").val();	//获取餐品中类选中值
					Item3_Selected  = $("#Item3").val();	//获取餐品小类选中值
					ItemName_Selected = $("#Dishes").val(); //获取菜品选中值
				    //alert(Area2_Selected);
					Item1Str = "";		//餐品大类
					Item3Str = "";		//餐品小类
					ItemNameStr = "";   //菜品
					$.each(
						AreaOutletData1,
						function(i,row){
							
							//指定项：列出省所对应的餐品大类、餐品中类
							if(Item2_Selected != -1 && Item2_Selected == AreaOutletData1[i][2] ){   
							
								Item3Str += "<option value=" + AreaOutletData1[i][4]+">" + AreaOutletData1[i][5] + "</option>";
								
							}
							//所有：列出所有记录
							else if(Item2_Selected== -1){
								Item3Str += "<option value=" + AreaOutletData1[i][4]+">" + AreaOutletData1[i][5] + "</option>";
								ItemNameStr += "<option value=" + AreaOutletData1[i][6]+">" + AreaOutletData1[i][7] + "</option>";
							}
						}
					);
					$("#Item1").val(Area1_Selected); 
					if(Item2_Selected!= -1){
						//获取餐品小类列表
						Item3Str=getOptionElements(AreaOutletData1,Item2_Selected,Item3_Selected,2,4,5);	
						ItemNameStr =getOptionElements(AreaOutletData1,Item2_Selected,Item3_Selected,2,6,7);
					}
					else  if(Item1_Selected!= -1){
						//获取餐品小类列表
						Item3Str=getOptionElements(AreaOutletData1,Item1_Selected,Item3_Selected,0,4,5);	
						ItemNameStr=getOptionElements(AreaOutletData1,Item1_Selected,Item3_Selected,0,6,7);
					}				    
					$("#Item3").html(Item3Str);
					$("#Dishes").html(ItemNameStr);	
					//去除重复
					removeOptionElements("#Item3,#Dishes");	
					//判断之前选中值是否在更新后的下拉框内，若再默认选中				 
				});
			}();
			
			//选择小类	
			var Item3Event = function(){
				$("#Item3").change(function(){
					Item1_Selected  = $("#Item1").val();	//获取餐品大类选中值
					Item2_Selected  = $("#Item2").val();	//获取餐品中类选中值
					Item3_Selected  = $("#Item3").val();	//获取餐品小类选中值
				    ItemName_Selected = $("#Dishes").val(); //获取菜品选中值

					Item1Str = "";		//大类
					Item2Str = "";		//中类
					ItemNameStr = "";   //菜品
					$.each(
						AreaOutletData1,
						function(i,row){
							
							//指定项：列出小类所对应的大类、中类、菜品记录
							if(Item3_Selected!= -1 &&  Item3_Selected == AreaOutletData1[i][4] ){ 
								//Area1Str += "<option value=" + AreaOutletData[i][0]+">" + AreaOutletData[i][1] + "</option>";
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								ItemNameStr += "<option value=" + AreaOutletData1[i][6]+">" + AreaOutletData1[i][7] + "</option>";
								//Area1_Selected	=	AreaOutletData[i][0];		//获取选中省所对应大区
								//Area2_Selected  =	AreaOutletData[i][2];		//获取省选中值	
								//Outlet_Selected =	AreaOutletData[i][6];		//获取门店选中值	
							}
							//所有：列出所有记录
							else if(Item3_Selected== -1){
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								ItemNameStr += "<option value=" + AreaOutletData1[i][6]+">" + AreaOutletData1[i][7] + "</option>";
							}
						}
					);
					$("#Item1").val(Item1_Selected);
				    if(Item3_Selected!= -1){
						//获取省列表
						//Area2Str=getOptionElements(AreaOutletData,Area1_Selected,Area2_Selected,0,2,3);
						//获取门店列表	
						ItemNameStr=getOptionElements(AreaOutletData1,Item3_Selected,ItemName_Selected ,4,6,7);
					}
					
					else if(Item2_Selected!= -1){
						//获取市列表
						Item3Str=getOptionElements(AreaOutletData1,Item2_Selected,Item3_Selected,2,4,5);
						//获取门店列表	
						ItemNameStr=getOptionElements(AreaOutletData1,Item2_Selected,ItemName_Selected,2,6,7);
					}
					else if(Item1_Selected!= -1){
						//获取市列表
						Item3Str=getOptionElements(AreaOutletData1,Item1_Selected,Item3_Selected,0,4,5);
						//获取门店列表	
						ItemNameStr=getOptionElements(AreaOutletData1,Item1_Selected,ItemName_Selected,0,6,7);
					}
					//$("#Area2").html(Area2Str);
					$("#Dishes").html(ItemNameStr);
					//去除重复
					removeOptionElements("#Dishes");//#Area2,
					
					
				});
			}();		
			/*********************************************
			*                  排序方式部分              *
			*********************************************/
			url_Sort = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=BackItemSort&paramlanguage=" + jQuery.i18n.browserLang();
			var SortData = readJSONFile(url_Sort).resultset;
			//alert(BrandData);
			var SortStr = "";
			$.each(
				SortData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					SortStr += "<option value=" + SortData[i][0] + ">"+SortData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#Sort").html(SortStr);
			/*************************************************
			 *                   事件函数                                          *
			*************************************************/		
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
					/*酒店区*/
					var ShopParam = $("#Shop option:selected").val();
					if(ShopParam!= -1 && ShopParam!=undefined)url_param=url_param+"&shopid=" + ShopParam;
					/*营业区*/															
					var OutletParam = $("#Outlet option:selected").val();
					if(OutletParam!= -1 && OutletParam!=undefined)url_param=url_param+"&outletid=" + OutletParam;	
					/*部门*/
					var DeptmentParam = $("#Deptment option:selected").val();
					if(DeptmentParam!= -1 && DeptmentParam!=undefined)url_param=url_param+"&itemdeptid=" + DeptmentParam;
					/*餐品大类*/
					var Item1Param = $("#Item1 option:selected").val();
					if(Item1Param!= -1 && Item1Param!=undefined)url_param=url_param+"&itemcatid1=" + Item1Param;	
					/*餐品中类*/
					var Item2Param = $("#Item2 option:selected").val();
					if(Item2Param!= -1 && Item2Param!=undefined)url_param=url_param+"&itemcatid2=" + Item2Param;
					/*餐品小类*/
					var Item3Param = $("#Item3 option:selected").val();
					if(Item3Param!= -1 && Item3Param!=undefined)url_param=url_param+"&itemcatid3=" + Item3Param;
					/*菜品*/
					var DishesParam = $("#Dishes option:selected").val();
					if(DishesParam!= -1 && DishesParam!=undefined)url_param=url_param+"&itemid=" + DishesParam;
					
					/*退菜员工*/
					var VoidUserParam = $("#VoidUser option:selected").val();
					if(VoidUserParam!= -1 && VoidUserParam!=undefined)url_param=url_param+"&voiduserid=" + VoidUserParam;
					/*退菜原因*/
					var VoidReasonParam = $("#VoidReason option:selected").val();
					if(VoidReasonParam!= -1 && VoidReasonParam!=undefined)url_param=url_param+"&voidreasonid=" + VoidReasonParam;
					/*单号*/
					var CheckNoParam = $("#CheckNo option:selected").val();
					if(CheckNoParam!= -1 && CheckNoParam!=undefined)url_param=url_param+"&checkno=" + CheckNoParam;
					/*台号*/
					var TableNoParam = $("#TableNo option:selected").val();
					if(TableNoParam!= -1 && TableNoParam!=undefined)url_param=url_param+"&tableno=" + TableNoParam;
					/*POS机号*/
					var CheckOpenStationParam = $("#CheckOpenStation option:selected").val();
					if(CheckOpenStationParam!= -1 && CheckOpenStationParam!=undefined)url_param=url_param+"&checkopenstationid=" + CheckOpenStationParam;
					/*开始日期*/
					var StartDayParam = $("#StartDay").datebox("getValue");
					if(StartDayParam!="" && StartDayParam!=undefined)url_param=url_param+"&startday=" + StartDayParam;
					/*结束日期*/
					var EndDayParam = $("#EndDay").datebox("getValue");
					if(EndDayParam!="" && EndDayParam!=undefined)url_param=url_param+"&endday=" + EndDayParam;
					
					/*排序方式*/
					var SortParam = $("#Sort option:selected").val();
					if(SortParam!= -1 && SortParam!=undefined)url_param=url_param+"&sort=" + SortParam;
										
					/*输出类型*/
					var OutPutParam = $("#outputType").val();
					if(OutPutParam!="" && OutPutParam!=undefined)url_param=url_param+"&output-target=" + OutPutParam;
					 
					var page = 0; 
					/*****************************************************
					*                          报表的url                 *
					*****************************************************/
					var url="/pentaho/api/repos/%3Apublic%3Areport%3Asy_back_item_record.prpt/viewer?" +url_param+ 
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