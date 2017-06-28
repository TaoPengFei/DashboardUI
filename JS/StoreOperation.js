let StoreOperation = {};

/*-------------------------------------------------------------------------*
 *              StoreOperation functions && settings                       *
 *-------------------------------------------------------------------------*/

StoreOperation.addCommas = ( nStr ) => {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    x2 = x2.slice(0,3);
    return x1 + x2;
};

/*-------------------------------------------------------------------------*
 *                             Chart Defaults                              *
 *-------------------------------------------------------------------------*/  
// Chart defaults for all bar charts
StoreOperation.defaultBarSettings = function(){
    let cd = this.chartDefinition;
    // general settings
    cd.height = 330;
    cd.xAxisLabel_textAngle = -0.1;
    cd.legendShape = 'circle';
    cd.selectable = true;
    cd.hoverable = true;
    cd.legendPosition =  'right';
    cd.plotFrameVisible = false;
    cd.orthoAxisGrid = true;
    cd.orthoAxisTicks = false;
    //cd.stacked = true;
    
    // legend
    // use series colors on legend labels
    cd.legendLabel_textStyle = function(scene) {
        var colorScale = this.panel.axes.color.scale;
        return colorScale(this.getValue());
    };
    // xAxis
    cd.xAxisLabel_textAlign = 'right';
    cd.xAxisLabel_textBaseline = 'top';
    
    cd.format = {
        //number:  "0.##A",
        number: '#,#.00',
        percent: "#.00%"      
    };
    // extensionPoints
    cd.extensionPoints = [
        ["xAxisRule_strokeStyle", "white"],
        ["yAxisRule_strokeStyle", "white"],
        ["y2AxisRule_strokeStyle", "white"]
    ];
    
    cd.orthoAxisTickFormatter = function(v){
        if( v < 1000000 && v >= 1000  ){
            return sprintf('%d', v/1000) + 'K'; 
        }else if( v >= 1000000 ){
            return sprintf('%d', v/1000000) + 'M'; 
        }else{
            return sprintf('%d', v); 
        }
    };
    
    // tooltips
    cd.tooltipDelayIn = 20;
    cd.tooltipDelayOut = 20;
    cd.tooltipFade = false;
    cd.tooltipGravity = 's';
    cd.tooltipOpacity = 1;
    cd.tooltipFollowMouse = true;
    cd.tooltipFormat = function f(){
        let series = this.getSeriesLabel(),
            category = this.getCategory(),
            value = StoreOperation.addCommas(this.getValue().toFixed(2));
        
        return "<div class='tooltipContainer'>" +
            "<div class='tooltipTitle'>" + category + "</div>" +  
            "<div class='tooltipLabel'>" + series + "</div>" +  
            "<div class='tooltipValue'>" + value + "</div>" + 
        "</div>";
    }
    
    // axis grids
    //cd.orthoAxisTitle = '净利润';
    cd.orthoAxisTitleFont = "lighter 16px TPF_Font_Thin";
    
    
    cd.axisLabel_font = "lighter 16px TPF_Font_Thin"; 
    cd.baseAxisLabel_textStyle = "#4d4d4d";
    cd.baseAxisLabel_visible = function() {
        if(this.index%2 == 0) return true;
        else return false;
    };
    cd.baseAxisRule_visible = false;
    cd.baseAxisTooltipEnabled = false;
    cd.orthoAxisLabel_textStyle = "#999999";
    cd.orthoAxisDesiredTickCount = 2;
    cd.orthoAxisGrid = false;
    cd.orthoAxisGrid_strokeStyle = function() {
        return (this.index !== this.scene.parent.childNodes.length - 1) ? "#CCC" : "#CCC";
    };
    cd.orthoAxisGrid_lineWidth = function() {
        return (this.index !== this.scene.parent.childNodes.length - 1) ? 1 : 1;
    };;
    cd.orthoAxisGrid_visible = true;
    
    cd.valuesAnchor = 'top';
    cd.valuesVisible = true;
    cd.valuesFont = "lighter 15px TPF_Font_Thin"; 
    
    //color
    cd.colors = ['#0055B8','#FF9E16', '#D25459', '#009BFF','#009BDE','#71A087'];
}; 

// Chart defaults for all Pie charts
StoreOperation.defaultPieSettings = function(){
    let cd = this.chartDefinition;
    // general settings
    //color
    cd.colors = ['#0055B8','#FF9E16', '#D25459', '#009BFF','#009BDE','#71A087'];
    
    cd.legendShape = 'circle';
    cd.selectable = true;
    cd.hoverable = true;
    cd.valuesFont = "lighter 15px TPF_Font_Thin"; 
    //cd.valueFormat
    
    cd.format = {
        //number:  "0.##A",
        number: '#,#.00',
        percent: "#.00%"      
    };
    
    // legend
    cd.legendPosition =  'right';
    // use series colors on legend labels
    cd.legendLabel_textStyle = function(scene) {
        var colorScale = this.panel.axes.color.scale;
        return colorScale(this.getValue());
    };
    // tooltips
    cd.tooltipDelayIn = 20;
    cd.tooltipDelayOut = 20;
    cd.tooltipFade = false;
    cd.tooltipGravity = 's';
    cd.tooltipOpacity = 1;
    cd.tooltipFollowMouse = true;
    cd.tooltipFormat = function f(){
        let series = this.getSeriesLabel(),
            category = this.getCategory(),
            value = StoreOperation.addCommas(this.getValue().toFixed(2));
        
        return "<div class='tooltipContainer'>" +
            "<div class='tooltipTitle'>" + category + "</div>" +  
            "<div class='tooltipValue'>" + value + "</div>" + 
        "</div>";
    }
}; 



/*-------------------------------------------------------------------------*
 *                          Echarts && settings                            *
 *-------------------------------------------------------------------------*/
    function initEcahrts(){
        let readJSONFile = function(url){
            let jsonData;
            $.ajax({
                type : 'get',
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
        /**
         * 
         * 第一个图
         * 
         **/
        let url_gauge_1 = "/pentaho/plugin/cda/api/doQuery?path=/public/dashboard/StoreOperation/StoreOperation.cda&dataAccessId=GaugeEchartsQuery";
            url_gauge_1 += '&paramstartDay=' + startDay + '&paramendDay=' + endDay + '&parambrandParam=' + brandParam + '&paramplaceParam=' + placeParam + '&paramarea1Param=' + area1Param + '&paramarea2Param=' + area2Param + '&paramarea3Param=' + area3Param + '&paramshopParam=' + shopParam + '&paramoutletParam=' + outletParam;
        let getFirstGaugeJSON_1 = readJSONFile(url_gauge_1).resultset;
        let myChart_1 = echarts.init(document.getElementById('saleAmtGaugeDom_KPI'));
        let FirstGaugeDataEncapsulation_1 = (function(){
            let data = function(){
                let tempArr = [];
                for(let i = 0; i < getFirstGaugeJSON_1.length; i++){
                    tempArr.push({
                		'name' : getFirstGaugeJSON_1[i][0],
                        'value': getFirstGaugeJSON_1[i][1],
                        selected : true
        			})
                }
                return tempArr;
            };
            return {
                getDatas : function(){
                    return data()
                }
            }
            
        })();
        let ShowFirstGaugeEcharts_1 = function(){
            myChart_1.setOption({
                //color: ['#0055B8','#FF9E16','#009BDE','#71A087'],
                title: {
                    text: '', //标题文本内容
                },
                toolbox: { //可视化的工具箱
                    show: true,
                    feature: {
                       /* restore: { //重置
                            show: true
                        },
                        saveAsImage: {//保存图片
                            show: true
                        }*/
                    }
                },
                /*
                tooltip: { //弹窗组件
                    formatter: "{a} <br/>{b} : {c}%"
                },
                */
                tooltip: {
                    trigger: 'item',
                    backgroundColor: '#ffffff',
                    transitionDuration : 0.4,
                    borderWidth: 1,
                    borderColor: '#ccc',
                    textStyle: {
                        color: '#4d4d4d',
                        fontFamily: 'TPF_Font_Thin',
                        fontSize: 14
                    },
                    
                    axisPointer: {
                        type: 'cross'
                    }
                    
                },
                series: [{
                    name: '营业额完成情况',
                    type: 'gauge',
                    min:0,
                    max:100,
                    splitNumber:5,
                    radius: '90%',
                    axisLine: {            // 坐标轴线
                        lineStyle: {       // 属性lineStyle控制线条样式  FF9E16 0055B8
                            color: [[0.2, '#0055B8'],[0.8, '#FF9E16'],[1, '#D25459']],
                            width: 14,
                            shadowColor : '#E7EBED', //默认透明
                            type: 'dotted',
                            shadowBlur: 20
                        }
                    },
                    axisLabel: {            // 坐标轴小标记
                        textStyle: {       // 属性lineStyle控制线条样式
                            fontWeight: 'bolder',
                            //color: '#fff',
                            shadowColor : '#fff', //默认透明
                            shadowBlur: 10
                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        show:false,
                        length :15,        // 属性length控制线长
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: 'auto',
                            shadowColor : '#fff', //默认透明
                            shadowBlur: 10
                        }
                    },
                    splitLine: {           // 分隔线
                        show: false,
                        length :25,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                            width:3,
                            color: '#fff',
                            shadowColor : '#fff', //默认透明
                            shadowBlur: 10
                        }
                    },
                    pointer: {           // 分隔线
                        shadowColor : '#E7EBED', //默认透明
                        shadowBlur: 5
                    },
                    itemStyle: {
                        normal: {
                            color: 'auto',
                            borderColor: '#000',
                            borderWidth: 0,
                            borderType: 'solid',
                            //shadowBlur: ...,
                            //shadowColor: ...,
                            shadowOffsetX: 0,
                            shadowOffsetY: 0
                            //opacity: ...,
                        },
                        emphasis: {
                            //color: 自适应,
                            borderColor: '#000',
                            borderWidth: 0,
                            borderType: 'solid',
                            //shadowBlur: ...,
                            //shadowColor: ...,
                            shadowOffsetX: 0,
                            shadowOffsetY: 0
                            //opacity: ...,
                        }
                    },

                    
                    detail: {formatter: '{value}%',
                            offsetCenter:[0,'65%'],
                                textStyle: {       
                                   fontSize: 20
                                }
                            },
                           
                    data:[
                        {name:'完成率',
                        value:FirstGaugeDataEncapsulation_1.getDatas()[0].value}
                    ]
                }]
            });
        }();
        window.addEventListener("resize",function(){
            myChart_1.resize();
        });
    };


    function initAreaOrEmpQtyEcahrts(){
        let readJSONFile = function(url){
            let jsonData;
            $.ajax({
                type : 'get',
                url : url,
                async : false,
    			dataType : 'json',
    			data : null,
    			success : function(response){
    				jsonData = response;
    			}
    		})
    		return jsonData;
    	};
        /**
         * 
         * 数组最小值
         * 
         **/
        Array.prototype.min = function() {
            let min = this[0];
            let len = this.length;
            for (let i = 1; i < len; i++){
                if (this[i] < min){
                    min = this[i];
                }
            }
            return min;
        }
        /**
         * 
         * 数组最大值
         * 
         **/
        Array.prototype.max = function() {
            let max = this[0];
            let len = this.length;
            for (let i = 1; i < len; i++){
                if (this[i] > max) {
                    max = this[i];
                }
            }
            return max;
        }
        //http://localhost:8080/pentaho/plugin/cda/api/doQuery?path=/public/dashboard/StoreOperation/StoreOperation.cda&dataAccessId=areaOrEmpQtyEffectiveQuery&paramstartDay=startDay&paramendDay=endDay&parambrandParam=brandParam&paramplaceParam=placeParam&paramarea1Param=area1Param&paramarea2Param=area2Param&paramarea3Param=area3Param&paramshopParam=shopParam&paramoutletParam=outletParam
        let urlAreaOrEmpQty = "/pentaho/plugin/cda/api/doQuery?path=/public/dashboard/StoreOperation/StoreOperation.cda&dataAccessId=areaOrEmpQtyEffectiveQuery";
            urlAreaOrEmpQty += '&paramstartDay=' + startDay + '&paramendDay=' + endDay + '&parambrandParam=' + brandParam + '&paramplaceParam=' + placeParam + '&paramarea1Param=' + area1Param + '&paramarea2Param=' + area2Param + '&paramarea3Param=' + area3Param + '&paramshopParam=' + shopParam + '&paramoutletParam=' + outletParam;
        let getAreaOrEmpQtyJSON = readJSONFile(urlAreaOrEmpQty).resultset;
        let AreaOrEmpQtyChart = echarts.init(document.getElementById('areaOrEmpQtyEffectiveDom'));
        
        let colors = ['#0055B8','#FF9E16','#009BDE','#71A087'];
        let legends = ['门店总人效','门店总坪效'];
        let ShowAreaOrEmpQtyEcharts = function(){
            AreaOrEmpQtyChart.setOption({
                color: colors,
                /*
                tooltip: {
                    trigger: 'item',           // 触发类型，默认数据触发，见下图，可选为：'item' ¦ 'axis'
                    showDelay: 20,             // 显示延迟，添加显示延迟可以避免频繁切换，单位ms
                    hideDelay: 100,            // 隐藏延迟，单位ms
                    transitionDuration : 0.4,  // 动画变换时间，单位s
                    backgroundColor: 'rgba(0,0,0,0.7)',     // 提示背景颜色，默认为透明度为0.7的黑色
                    borderColor: '#333',       // 提示边框颜色
                    borderRadius: 4,           // 提示边框圆角，单位px，默认为4
                    borderWidth: 0,            // 提示边框线宽，单位px，默认为0（无边框）
                    padding: 5,                // 提示内边距，单位px，默认各方向内边距为5，
                                               // 接受数组分别设定上右下左边距，同css
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
                        lineStyle : {          // 直线指示器样式设置
                            color: '#48b',
                            width: 2,
                            type: 'solid'
                        },
                        shadowStyle : {                       // 阴影指示器样式设置
                            width: 'auto',                   // 阴影大小
                            color: 'rgba(150,150,150,0.3)'  // 阴影颜色
                        }
                    },
                    textStyle: {
                        color: '#fff'
                    }
                },
                */
                
                tooltip: {
                    trigger: 'axis',
                    backgroundColor: '#ffffff',
                    transitionDuration : 0.4,
                    borderWidth: 1,
                    borderColor: '#ccc',
                    textStyle: {
                        color: '#4d4d4d',
                        fontFamily: 'TPF_Font_Thin',
                        fontSize: 14
                    },
                    axisPointer: {
                        type: 'cross'
                    }
                },
                grid: {
                    //right: '20%'
                    //x: 100,
                    //y1: 500,
                    //y2: 500
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: {show: false, readOnly: false},
                        magicType: {type: ['line', 'bar', 'stack', 'tiled']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                legend: {
                    data:legends.map((value, index, arr)=>{
                        let newArr = [];
                            newArr.push({
                                icon : 'circle',
                                name: value
                            });
                            //console.log(newArr[0]);
                            return newArr[0];
                        //return value[0];
                    }),
                    itemHeight:18,
                    itemWidth: 18,
                    itemGap: 5,
                    itemWidth: 10,
                    itemHeight: 10,
                    textStyle: {
                        fontWeight: 'lighter',
                        fontSize: 7,
                        fontFamily: 'TPF_Font_Thin'
                        //color:'#fff'
                    },
                    inactiveColor:'#aaa',
                    padding: [
                        5,  // 上
                        10, // 右
                        35,  // 下
                        10, // 左
                    ],
                    shadowColor: 'rgba(0, 0, 0, 0.5)',
                    shadowBlur: 5,
                    zlevel: 100
                },
                xAxis: [
                    {
                        type: 'category',
                        axisTick: {
                            alignWithLabel: true
                        },
                        data: getAreaOrEmpQtyJSON.map((value, index, arr)=>{
                            return value[0];
                        })
                    }
                ],
                
                yAxis: [
                    {
                        type: 'value',
                        name: legends[0],
                        min: 0,
                        max: getAreaOrEmpQtyJSON.map((value, index, arr)=>{
                            return value[2];
                        }).max(),
                        position: 'left',
                        interval: Math.ceil(getAreaOrEmpQtyJSON.map((value, index, arr)=>{
                            return value[2];
                        }).max() / 3),
                        axisLine: {
                            show: false,
                            lineStyle: {
                                color: colors[0]
                            }
                        },
                        axisTick : {    // 轴标记
                            show:false,
                            length: 10,
                            lineStyle: {
                                color: 'green',
                                type: 'solid',
                                width: 2
                            }
                        },
                        splitLine : {
                            show:false,
                            lineStyle: {
                                color: '#483d8b',
                                type: 'dotted',
                                width: 2
                            }
                        },
                        axisLabel: {
                            //formatter: '{value}'
                            formatter: function (v) {
                                if( v < 1000000 && v >= 1000  ){
                                    return Math.ceil(v/1000) + 'K'; 
                                }else if( v >= 1000000 ){
                                    return Math.ceil(v/1000000) + 'M'; 
                                }else if( v < 1000 && v >= 0 ){
                                    return (v/1000).toFixed(1) + 'K'; 
                                }
                            }
                        }
                    },
                    {
                        type: 'value',
                        name: legends[1],
                        min: 0,
                        max:  getAreaOrEmpQtyJSON.map((value, index, arr)=>{
                            return value[1];
                        }).max(),
                        position: 'right',
                        interval: Math.ceil(getAreaOrEmpQtyJSON.map((value, index, arr)=>{
                            return value[1];
                        }).max() / 3),
                        axisLine: {
                            show: false,
                            lineStyle: {
                                color: colors[1]
                            }
                        },
                        axisTick : {    // 轴标记
                            show:false,
                            length: 10,
                            lineStyle: {
                                color: 'green',
                                type: 'solid',
                                width: 2
                            }
                        },
                        splitLine : {
                            show:false,
                            lineStyle: {
                                color: '#483d8b',
                                type: 'dotted',
                                width: 2
                            }
                        },
                        axisLabel: {
                            formatter: function (v) {
                                if( v < 1000000 && v >= 1000  ){
                                    return Math.ceil(v/1000) + 'K'; 
                                }else if( v >= 1000000 ){
                                    return Math.ceil(v/1000000) + 'M'; 
                                }else if( v < 1000 && v >= 0 ){
                                    return (v/1000).toFixed(1) + 'K'; 
                                }
                            }
                        }
                    }
                ],
                series: [
                    {
                        name:legends[0],
                        type:'bar',
                        data: getAreaOrEmpQtyJSON.map((value, index, arr)=>{
                            return value[2];
                        })
                    },
                    {
                        name:legends[1],
                        type:'bar',
                        yAxisIndex: 1,
                        data: getAreaOrEmpQtyJSON.map((value, index, arr)=>{
                            return value[1];
                        })
                    }
                ]
            })
        }(); 
        window.addEventListener("resize",function(){
            AreaOrEmpQtyChart.resize();
        });
    } 