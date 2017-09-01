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
	<title>报表前端模板</title>
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
  span.text_name{width:60px;text-align:right; float:left;height:25px;}
 .combo-text{
	width:115px !important;
 }
 
</style>
<body class="bg">
		
	<div class="reportHeader" style="margin:20px 0;">
		<!--
		<ul>
			<li><span class="text_name">品牌:</span><select id="Brand" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name">商圈:</span><select id="Place" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
		</ul>
		<ul>
			<li><span class="text_name">大区:</span><select id="Area1" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name">省市:</span><select id="Area2" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name">市:</span><select id="Area3" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
			<li><span class="text_name">门店:</span><select id="Outlet" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>
		</ul>
		<ul>			
			<li><span class="text_name">市段:</span><select id="PeriodType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>						
			<li><span class="text_name">渠道:</span><select id="Channel" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>			
			<li><span class="text_name">顾客档次:</span><select id="GuestGradeType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>			
			<li><span class="text_name">人数档次:</span><select id="GuestNoType" class="" style="width:120px;height:22px;margin-bottom:5px;"  ></select></li>						
		</ul>
		-->
		<ul>					
			<li><span class="text_name">开始日期:</span><select id="StartDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;" data-options="formatter:myformatter,parser:myparser"></select></li>
			<li><span class="text_name">结束日期:</span><select id="EndDay" class="easyui-datebox" style="width:130px;height:20px;margin-bottom:5px;"  data-options="formatter:myformatter,parser:myparser"></select></li>
		</ul>
		
		<ul>
			
			<li style="width:400px;"><span class="text_name">汇总方式:</span><span id="ItemSumTypeSpan" style="text-align:left;margin-bottom: 7px;width:80px;height:25px;" ></span></li>		
		
			<li>
				<span class="text_name">输出类型:</span><select  id="outputType" name="outputType" style="width:120px;height:22px;margin-bottom:5px;" > 
					<option value="table/html;page-mode=page">HTML</option>
					<option value="pageable/pdf">PDF</option>
					<option value="table/excel;page-mode=flow">Excel</option><!--
					<option value="table/csv;page-mode=stream">CSV文件</option>
					<option value="table/rtf;page-mode=flow">RTF文件</option>
					<option value="pageable/text">Text</option>-->
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
		var option_str="<option value= -1>所有</option>";
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
			//var today = new Date(); 
			//var endday = new Date(today.getTime() - 1*24*60*60*1000);
			//var startday = new Date(endday.getTime() - 31*24*60*60*1000);
			
			var today = new Date(); 
			var endday = new Date(today.getTime() - 0*24*60*60*1000);			
			var startday = new Date("2016-01-01");    //设置为固定时间2016-01-01
			
			
			
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
			*                  品牌部分                  *
			*********************************************/   /*
			url_brand = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=BrandQuery";
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
			$("#Brand").html(BrandStr);   */
			/*********************************************
			*                 商圈部分                   *
			*********************************************/    /*
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
			$("#Place").html(PlaceStr);     */
			/*********************************************
			*                 市段部分                   *
			*********************************************/  /*
			url_PeriodType = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=PeriodTypeQuery";
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
			$("#PeriodType").html(PeriodTypeStr);    */
			/*********************************************
			*                 渠道部分                   *
			*********************************************/  /*
			url_Channel = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=ChannelQuery";
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
			$("#Channel").html(ChannelStr);   */
			/*********************************************
			*                 顾客档次部分               *
			*********************************************/  /*
			url_GuestGradeType = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=GuestGradeTypeQuery";
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
			$("#GuestGradeType").html(GuestGradeTypeStr); */
			/*********************************************
			*                 人数档次部分               *
			*********************************************/  /*
			url_GuestNoType = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=GuestNoTypeQuery";
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
		    */	
			/*********************************************
			*                 汇总方式部分               *
			*********************************************/
			url_type_sum = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=DataTestType";
			var TypeSumData = readJSONFile(url_type_sum).resultset;
			var ItemSumTypeStr = "";
			$.each(
				TypeSumData,
				function(i,row){
					//alert(i);
					//alert(row[1]);
					//汇总方式未设置默认值
					//ItemSumTypeStr += "<input type='radio' name='ItemSumType'  value=" + TypeSumData[i][0] + " checked>"+TypeSumData[i][1] ;
					//汇总方式设置默认值
					if(i == 2)
						ItemSumTypeStr += "<input type='radio' name='ItemSumType'  value=" + TypeSumData[i][0] + " checked>"+TypeSumData[i][1] ;
					else 
						ItemSumTypeStr += "<input type='radio' name='ItemSumType'  value=" + TypeSumData[i][0] + " >"+TypeSumData[i][1] ;
					//ItemSumTypeStr += "<option value=" + TypeSumData[i][0] + ">"+TypeSumData[i][1] + "</option>";
					//alert(brandPlaceData[i][1]);
				}
			);
			$("#ItemSumTypeSpan").html(ItemSumTypeStr);
			
			
			/*********************************************
			*       大区、省、城市、门店数据初始化       *
			*********************************************/  /**
			
			url_area_outlet = "/pentaho/plugin/cda/api/doQuery?path=/public/report/sy_report.cda&dataAccessId=AreaQuery";
			var AreaOutletData = readJSONFile(url_area_outlet).resultset;
			var Area1Str = "";		//大区
			var Area2Str = "";		//省
			var Area3Str = "";		//城市
			var OutletStr = "";	//门店
			$.each(
				AreaOutletData,
				function(i,row){
					Area1Str += "<option value=" + AreaOutletData[i][0]+">" + AreaOutletData[i][1] + "</option>";
					Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
					Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
					OutletStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7]+ "</option>";
				}
			);
			$("#Area1").html(Area1Str);
			$("#Area2").html(Area2Str);
			$("#Area3").html(Area3Str);
			$("#Outlet").html(OutletStr);
			//可对指定下拉框进行查重
			removeOptionElements("#Area1,#Area2,#Area3,#Outlet");
			*/
			/*********************************************
			*        大区、省、城市、门店点击事件        *
			*********************************************/	/**
			var Area1_Selected="";
			var Area2_Selected="";
			var Area3_Selected="";
			var Outlet_Selected="";
			//选择大区		
			var Area1Event = function(){
				$("#Area1").change(function(){
					Area1_Selected  = $("#Area1").val();	//获取大区选中值
					Area2_Selected  = $("#Area2").val();	//获取省选中值
					Area3_Selected  = $("#Area3").val();	//获取城市选中值
					Outlet_Selected = $("#Outlet").val();	//获取门店选中值
					
					Area2Str = "";		//省
					Area3Str = "";		//城市
					OutletStr = "";		//门店
					$.each(
						AreaOutletData,
						function(i,row){							
							//指定项：列出大区所对应的省、城市、门店记录
							if(Area1_Selected == AreaOutletData[i][0] ){
								Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
							}
							//所有：列出所有记录
							else if(Area1_Selected== -1){
								Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
							}
						}					
					);
					if(Area1_Selected != -1){
						//获取省列表
						Area2Str=getOptionElements(AreaOutletData,Area1_Selected,Area2_Selected,0,2,3);
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area1_Selected,Area3_Selected,0,4,5);
						//获取门店列表	
						OutletStr=getOptionElements(AreaOutletData,Area1_Selected,Outlet_Selected,0,6,7);
					}
					$("#Area2").html(Area2Str);
					$("#Area3").html(Area3Str);
					$("#Outlet").html(OutletStr);
					//去除重复
					removeOptionElements("#Area2,#Area3,#Outlet");	 
					//判断之前选中值是否在更新后的下拉框内，若再默认选中

				});
			}();
			//选择省	
			var Area2Event = function(){
				$("#Area2").change(function(){
					Area1_Selected  = $("#Area1").val();	//获取大区选中值
					Area2_Selected  = $("#Area2").val();	//获取省选中值
					Area3_Selected  = $("#Area3").val();	//获取城市选中值
					Outlet_Selected = $("#Outlet").val();	//获取门店选中值
				    //alert(Area2_Selected);
					Area1Str = "";		//大区
					Area3Str = "";		//城市
					OutletStr = "";		//门店
					$.each(
						AreaOutletData,
						function(i,row){
							
							//指定项：列出省所对应的大区、城市、门店记录
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
								OutletStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
							}
						}
					);
					$("#Area1").val(Area1_Selected); 
					if(Area2_Selected!= -1){
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area2_Selected,Area3_Selected,2,4,5);
						//获取门店列表	
						OutletStr=getOptionElements(AreaOutletData,Area2_Selected,Outlet_Selected,2,6,7);
					}
					else  if(Area1_Selected!= -1){
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area1_Selected,Area3_Selected,0,4,5);
						//获取门店列表	
						OutletStr=getOptionElements(AreaOutletData,Area1_Selected,Outlet_Selected,0,6,7);
					}
				    
					$("#Area3").html(Area3Str);
					$("#Outlet").html(OutletStr);
					//去除重复
					removeOptionElements("#Area3,#Outlet");	
					//判断之前选中值是否在更新后的下拉框内，若再默认选中
					 
				});
			}();
			//选择城市	
			var Area3Event = function(){
				$("#Area3").change(function(){
					Area1_Selected  = $("#Area1").val();	//获取大区选中值
					Area2_Selected  = $("#Area2").val();	//获取省选中值
					Area3_Selected  = $("#Area3").val();	//获取城市选中值
					Outlet_Selected = $("#Outlet").val();	//获取门店选中值

					Area1Str = "";		//大区
					Area2Str = "";		//省
					OutletStr = "";		//门店
					$.each(
						AreaOutletData,
						function(i,row){
							
							//指定项：列出城市所对应的大区、省、门店记录
							if(Area3_Selected!= -1 &&  Area3_Selected == AreaOutletData[i][4] ){ 
								//Area1Str += "<option value=" + AreaOutletData[i][0]+">" + AreaOutletData[i][1] + "</option>";
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
								//Area1_Selected	=	AreaOutletData[i][0];		//获取选中省所对应大区
								//Area2_Selected  =	AreaOutletData[i][2];		//获取省选中值	
								//Outlet_Selected =	AreaOutletData[i][6];		//获取门店选中值	
							}
							//所有：列出所有记录
							else if(Area3_Selected== -1){
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								OutletStr += "<option value=" + AreaOutletData[i][6]+">" + AreaOutletData[i][7] + "</option>";
							}
						}
					);
					$("#Area1").val(Area1_Selected);
				    if(Area3_Selected!= -1){
						//获取省列表
						//Area2Str=getOptionElements(AreaOutletData,Area1_Selected,Area2_Selected,0,2,3);
						//获取门店列表	
						OutletStr=getOptionElements(AreaOutletData,Area3_Selected,Outlet_Selected,4,6,7);
					}
					
					else if(Area2_Selected!= -1){
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area2_Selected,Area3_Selected,2,4,5);
						//获取门店列表	
						OutletStr=getOptionElements(AreaOutletData,Area2_Selected,Outlet_Selected,2,6,7);
					}
					else if(Area1_Selected!= -1){
						//获取市列表
						Area3Str=getOptionElements(AreaOutletData,Area1_Selected,Area3_Selected,0,4,5);
						//获取门店列表	
						OutletStr=getOptionElements(AreaOutletData,Area1_Selected,Outlet_Selected,0,6,7);
					}
					//$("#Area2").html(Area2Str);
					$("#Outlet").html(OutletStr);
					//去除重复
					removeOptionElements("#Outlet");//#Area2,
					
					  
				});
			}();	*/
			//选择门店	
			/*var OutletEvent = function(){
				$("#Outlet").change(function(){
					Area1_Selected  = $("#Area1").val();	//获取大区选中值
					Area2_Selected  = $("#Area2").val();	//获取省选中值
					Area3_Selected  = $("#Area3").val();	//获取城市选中值
					Outlet_Selected = $("#Outlet").val();	//获取门店选中值

					Area1Str = "<option value=''>所有</option>";		//大区
					Area2Str = "<option value=''>所有</option>";		//省
					Area3Str = "<option value=''>所有</option>";		//城市
					$.each(
						AreaOutletData,
						function(i,row){
							//选中指定项时：获取门店所对应的大区、省、城市值
							if(Outlet_Selected!="" && Outlet_Selected == AreaOutletData[i][6] ){
								//Area1Str += "<option value=" + AreaOutletData[i][0]+">" + AreaOutletData[i][1] + "</option>";
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								//Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
								//Area1_Selected  = AreaOutletData[i][0];	//获取选中省所对应大区
								//Area2_Selected  = AreaOutletData[i][2];	//获取省选中值
								//Area3_Selected  = AreaOutletData[i][4];	//获取城市选中值	
							}	
							//所有：列出所有记录
							else if(Outlet_Selected==""){
								//Area2Str += "<option value=" + AreaOutletData[i][2]+">" + AreaOutletData[i][3] + "</option>";
								//Area3Str += "<option value=" + AreaOutletData[i][4]+">" + AreaOutletData[i][5] + "</option>";
							}
						}
					);
					if(Outlet_Selected!=""){
						//获取省列表
						//Area2Str=getOptionElements(AreaOutletData,Area1_Selected,Area2_Selected,0,2,3);
						//获取城市列表	
						//Area3Str=getOptionElements(AreaOutletData,Area2_Selected,Area3_Selected,2,4,5);
					}
					$("#Area1").val(Area1_Selected);
					$("#Area2").html(Area2Str);
					$("#Area3").html(Area3Str);
					//去除重复
					removeOptionElements("#Area2,#Area3");
				});
			}();	
			*/
			/*************************************************
			 *                   事件函数                                          *
			*************************************************/		
			var bindEvents = function(){
				$("#Btn").bind("click",function(){
					var url_param="";	
					/*品牌*/
					//var BrandParam = $("#Brand option:selected").val();		//取ID
					//if(BrandParam!= -1 && BrandParam!=undefined)url_param=url_param+"&BrandSelect=" + BrandParam;
					//var BrandParam = $("#selbrandname option:selected").text();		//取内容
					/*商圈*/
					//var PlaceParam = $("#Place option:selected").val();
					//if(PlaceParam!= -1 && PlaceParam!=undefined)url_param=url_param+"&PlaceSelect=" + PlaceParam;
					/*大区*/
					//var Area1Param = $("#Area1 option:selected").val();
					//if(Area1Param!= -1 && Area1Param!=undefined)url_param=url_param+"&AreaFirstSelect=" + Area1Param;
					/*省市*/
					//var Area2Param = $("#Area2 option:selected").val();
					//if(Area2Param!= -1 && Area2Param!=undefined)url_param=url_param+"&AreaSecondSelect=" + Area2Param;
					/*市*/
					//var Area3Param = $("#Area3 option:selected").val();
					//if(Area3Param!= -1 && Area3Param!=undefined)url_param=url_param+"&AreaThirdSelect=" + Area3Param;
					
					/*门店*/															
					//var OutletParam = $("#Outlet option:selected").val();
					//if(OutletParam!= -1 && OutletParam!=undefined)url_param=url_param+"&OutletNameSelect=" + OutletParam;	
									
					/*市段*/
					//var PeriodTypeParam = $("#PeriodType option:selected").val();
					//if(PeriodTypeParam!= -1 && PeriodTypeParam!=undefined)url_param=url_param+"&PeriodSelect=" + PeriodTypeParam;
					/*渠道*/
					//var ChannelParam = $("#Channel option:selected").val();
					//if(ChannelParam!= -1 && ChannelParam!=undefined)url_param=url_param+"&ChannelSelect=" + ChannelParam;
					/*顾客档次*/
					//var GuestGradeTypeParam = $("#GuestGradeType option:selected").val();
					//if(GuestGradeTypeParam!= -1 && GuestGradeTypeParam!=undefined)url_param=url_param+"&GuestGradeSelect=" + GuestGradeTypeParam;
					/*人数档次*/
					//var GuestNoTypeParam = $("#GuestNoType option:selected").val();
					//if(GuestNoTypeParam!= -1 && GuestNoTypeParam!=undefined)url_param=url_param+"&GuestNoSelect=" + GuestNoTypeParam;
					
					/*开始日期*/
					var StartDayParam = $("#StartDay").datebox("getValue");
					if(StartDayParam!="" && StartDayParam!=undefined)url_param=url_param+"&StartDateSelect=" + StartDayParam;
					/*结束日期*/
					var EndDayParam = $("#EndDay").datebox("getValue");
					if(EndDayParam!="" && EndDayParam!=undefined)url_param=url_param+"&EndDateSelect=" + EndDayParam;
					
					/*汇总方式*/
					var TypeSumParam = $('#ItemSumTypeSpan input[name="ItemSumType"]:checked ').val();
					if(TypeSumParam!="" && TypeSumParam!=undefined)url_param=url_param+"&AllSelect=" + TypeSumParam;
					
					/*输出类型*/
					var OutPutParam = $("#outputType").val();
					if(OutPutParam!="" && OutPutParam!=undefined)url_param=url_param+"&output-target=" + OutPutParam;
					 
					var page = 0; 
					/*****************************************************
					*                          报表的url                 *
					*****************************************************/
					var url="/pentaho/api/repos/%3Apublic%3Areport%3Asy_Data_Test_report.prpt/viewer?" +url_param+ 
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