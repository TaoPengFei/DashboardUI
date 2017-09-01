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
	<title>营业收入报表</title>
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
		width:60px;text-align:right; float:left;line-height:20px;height:20px
	}
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
			<!--
			<li><span class="text_name">市段:</span><select id="PeriodType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name">渠道:</span><select id="Channel" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name">顾客档次:</span><select id="GuestGradeType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name">人数档次:</span><select id="GuestNoType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			-->
			<!--
			<li><span class="text_name">开始日期:</span><select id="StartDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;" data-options="formatter:myformatter,parser:myparser"></select></li>
			
			<li><span class="text_name" id="dat"></span><select id="EndDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;"  data-options="formatter:myformatter,parser:myparser"></select></li>-->
			
			
			<ul>					
			<li><span class="text_name" id="std"></span><select id="StartDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;" data-options="formatter:myformatter,parser:myparser"></select></li>
			<li><span class="text_name" id="edd"></span><select id="EndDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;"  data-options="formatter:myformatter,parser:myparser"></select></li>
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
			<!--
			<li style="width:400px;"><span class="text_name">汇总方式:</span><span id="TypeSum" style="text-align:left;margin-bottom: 7px;width:80px;height:25px;" ></span></li>		
			-->
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
			var startday = new Date(today.getTime() - 1*24*60*60*1000);
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
			
			
	
			
			/*************************************************
			 *                   事件函数                                          *
			*************************************************/		
			var bindEvents = function(){
				$("#Btn").bind("click",function(){
					var url_param="";	
					/*品牌*/
					var BrandParam = $("#Brand option:selected").val();		//取ID
					if(BrandParam!= -1 && BrandParam!=undefined)url_param=url_param+"&brandSelect=" + BrandParam;
					//var BrandParam = $("#selbrandname option:selected").text();		//取内容
					/*商圈*/
					var PlaceParam = $("#Place option:selected").val();
					if(PlaceParam!= -1 && PlaceParam!=undefined)url_param=url_param+"&placeSelect=" + PlaceParam;
					/*大区*/
					var Area1Param = $("#Area1 option:selected").val();
					if(Area1Param!= -1 && Area1Param!=undefined)url_param=url_param+"&AreaFirstSelect=" + Area1Param;
					/*省市*/
					var Area2Param = $("#Area2 option:selected").val();
					if(Area2Param!= -1 && Area2Param!=undefined)url_param=url_param+"&AreaSecondSelect=" + Area2Param;
					/*市*/
					var Area3Param = $("#Area3 option:selected").val();
					if(Area3Param!= -1 && Area3Param!=undefined)url_param=url_param+"&AreaThirdSelect=" + Area3Param;
					/*门店*/
					var ShopParam = $("#Shop option:selected").val();
					if(ShopParam!= -1 && ShopParam!=undefined)url_param=url_param+"&m_ShopId=" + ShopParam;	
					
					/*营业区*/
					var OutletParam = $("#Outlet option:selected").val();
					if(OutletParam!= -1 && OutletParam!=undefined)url_param=url_param+"&m_outletId=" + OutletParam;	
					
					/*开始日期*/
				    var StartDayParam = $("#StartDay").datebox("getValue");
				    if(StartDayParam!="" && StartDayParam!=undefined)url_param=url_param+"&m_BegDate=" + StartDayParam;
				    /*结束日期*/
				    var EndDayParam = $("#EndDay").datebox("getValue");
				    if(EndDayParam!="" && EndDayParam!=undefined)url_param=url_param+"&m_EndDate=" + EndDayParam;
					/*输出类型*/
					var OutPutParam = $("#outputType").val();
					if(OutPutParam!="" && OutPutParam!=undefined)url_param=url_param+"&output-target=" + OutPutParam;
					 
					var page = 0; 
					/*****************************************************
					*                          报表的url                 *
					*****************************************************/
					var url="/pentaho/api/repos/%3Apublic%3Areport%3Asy_taking_report.prpt/viewer?" +url_param+ 
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
					//alert(url_param);
					//alert(url);
					
					
					
					
					//var SearchCheck = function(reportUrl){
						//	if( !(reportUrl.search(/&m_ShopId=-1/) == -1) && reportUrl.search(/&m_outletId/) == -1 ){
						//		alert("请选择酒店或营业区！");
						//	}else{
						//		$("#report").attr("src", reportUrl);
						//	}
				//	}(url);
				
				
					
			     	$("#report").attr("src", url);
				});
			}();
		}();
	})(jQuery);
</script>
</html>