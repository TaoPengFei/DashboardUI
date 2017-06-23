let OperationsDirector = {};

/*-------------------------------------------------------------------------*
 *              GeneralManager functions && settings                       *
 *-------------------------------------------------------------------------*/

OperationsDirector.addCommas = ( nStr ) => {
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
// Chart defaults for all Pie charts
OperationsDirector.defaultPieSettings = function(){
    let cd = this.chartDefinition;
    // general settings
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
            value = OperationsDirector.addCommas(this.getValue().toFixed(2));
        
        return "<div class='tooltipContainer'>" +
            "<div class='tooltipTitle'>" + category + "</div>" +  
            "<div class='tooltipValue'>" + value + "</div>" + 
        "</div>";
    }
}; 

// Chart defaults for all bar charts
OperationsDirector.defaultBarSettings = function(){
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
    cd.stacked = true;
    
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
    /*
    cd.orthoAxisTickFormatter = function(v){
        if( v < 1000000 && v >= 1000  ){
            return sprintf('%d', v/1000) + 'K'; 
        }else if( v >= 1000000 ){
            return sprintf('%d', v/1000000) + 'M'; 
        }else{
            return sprintf('%d', v); 
        }
    };
    */
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
            value = OperationsDirector.addCommas(this.getValue().toFixed(2));
        
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
    cd.colors = ['#0055B8','#FF9E16','#009BDE','#71A087'];
}; 
// Chart defaults for all Line charts
OperationsDirector.defaultLineSettings = function () {
    let e = this.chartDefinition;
    //e.colors = ["#01665e", "#f46d43"],
    e.colors = ['#0055B8','#FF9E16','#009BDE','#71A087'],
    e.height = 330,
    e.plotFrameVisible = !1,
    e.margins = "0 1 1 -12",
    e.legendPosition = "top",
    e.legendAlign = "right",
    e.legendLabel_font = "lighter 16px Open Sans",
    e.legendLabel_textDecoration = pvc.finished("none"),
    e.legendItemPadding = 0,
    e.legendMargins = "0 0 -14 0",
    e.legendItemSize = 80,
    e.legendDot_shape = "circle",
    e.legendDot_fillStyle = pvc.finished(function (e) {
        var t = this.delegate();
        return e.isActive ? t : "#FFF"
    }),
    e.legendDot_strokeStyle = pvc.finished(function (e) {
        return this.delegate()
    }),
    e.legendDot_lineWidth = pvc.finished(4),
    e.legendDot_shapeRadius = pvc.finished(3),
    e.legendDrawLine = !1,
    e.legendDot_cursor = "pointer",
    e.legendLabel_textStyle = function (e) {
        return (0, this.panel.axes.color.scale)(this.getValue())
    },
    e.tooltipDelayIn = 20,
    e.tooltipDelayOut = 20,
    e.tooltipFade = !1,
    e.tooltipGravity = "s",
    e.tooltipOpacity = 1,
    e.tooltipFollowMouse = !0,
    e.tooltipFormat = function () {
        var e = this.getSeriesLabel(),
            t = this.getCategory(),
            i = OperationsDirector.addCommas(this.getValue().toFixed(0));
        return "<div class='tooltipContainer " + ("Sales" == e ? "sales" : "target") + "'><div class='tooltipTitle'>" + t + "</div><div class='tooltipLabel'>" + e + "</div><div class='tooltipValue'>￥" + i + "</div></div>"
    },
    e.axisLabel_font = "lighter 16px TPF_Font_Thin",
    e.baseAxisLabel_textStyle = "#4d4d4d",
    e.baseAxisLabel_visible = function () {
        return this.index % 2 == 0
    },
    e.baseAxisRule_visible = !1,
    e.baseAxisTooltipEnabled = !1,
    e.orthoAxisLabel_textStyle = "#999999",
    e.orthoAxisDesiredTickCount = 2,
    e.orthoAxisGrid = !0,
    e.orthoAxisGrid_strokeStyle = function () {
        return this.index,
        this.scene.parent.childNodes.length,
        "#CCC"
    },
    e.orthoAxisGrid_lineWidth = function () {
        return this.index,
        this.scene.parent.childNodes.length,
        1
    },
    e.orthoAxisGrid_visible = !0,
    e.orthoAxisRule_visible = !1,
    e.orthoAxisTicks = !1,
    e.orthoAxisLabel_visible = function () {
        return this.index === this.scene.parent.childNodes.length - 1
    },
    e.orthoAxisLabel_textMargin = 8,
    e.orthoAxisLabel_textAlign = "left",
    e.orthoAxisLabel_textBaseline = "bottom",
    e.orthoAxisTickFormatter = function (e) {
        return "$" + OperationsDirector.addCommas(e)
    },
    e.line_lineWidth = pvc.finished(4),
    e.dotsVisible = !0,
    e.dot_shapeRadius = pvc.finished(3),
    e.dot_lineWidth = pvc.finished(4),
    e.hoverable = !0,
    e.dot_fillStyle = pvc.finished(function (e) {
        var t = this.delegate();
        return e.isActive ? t : "#FFF"
    }),
    e.dot_strokeStyle = pvc.finished(function (e) {
        return this.delegate()
    }),
    e.legendLabel_call = function () {
        this.events("all").event("point", function (e) {
            var t = e.panel();
            !e.hoverable() || t.selectingByRubberband() || t.animating() || (e.setActive(!0), t.renderInteractive())
        }).event("unpoint", function (e) {
            var t = e.panel();
            !e.hoverable() || t.selectingByRubberband() || t.animating() || e.clearActive() && t.renderInteractive()
        })
    },
    e.format = {
        number: "0.##A",
        percent: "#.00%"
    },
    e.extensionPoints = [
        ["xAxisRule_strokeStyle", "white"],
        ["yAxisRule_strokeStyle", "white"],
        ["y2AxisRule_strokeStyle", "white"]
    ],
    e.xAxisLabel_textAngle = -.1,
    e.stacked = !0,
    e.legendShape = "circle",
    e.selectable = !0,
    e.hoverable = !0,
    e.legendPosition = "top",
    e.plotFrameVisible = !1,
    e.orthoAxisGrid = !0,
    e.orthoAxisTicks = !1,
    e.xAxisLabel_textAlign = "right",
    e.xAxisLabel_textBaseline = "top",
    e.orthoAxisTickFormatter = function (e) {
        return e < 1e6 && e >= 1e3 ? sprintf("%d", e / 1e3) + "K" : e >= 1e6 ? sprintf("%d", e / 1e6) + "M" : sprintf("%d", e / 1e3) + "K"
    }
}; 

// Chart defaults for all Stacked Line charts
OperationsDirector.defaultStackedLineSettings = function () {
    let cd = this.chartDefinition;
    
    // general settings
    cd.colors = ['#0055B8','#FF9E16','#009BDE','#71A087'];
    cd.xAxisLabel_textAngle = -0.1;
    cd.legendShape = 'circle';
    cd.selectable = true;
    cd.hoverable = true;
    cd.legendPosition =  'right';
    cd.plotFrameVisible = false;
    cd.orthoAxisGrid = true;
    cd.orthoAxisTicks = false;
    
    // legend
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
    
    // axis grids
    cd.orthoAxisTitle = '计入的营业额';
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
    //cd.orthoAxisDesiredTickCount = 2;
    cd.orthoAxisGrid = true;
    cd.orthoAxisGrid_strokeStyle = function() {
        return (this.index !== this.scene.parent.childNodes.length - 1) ? "#CCC" : "#CCC";
    };
    cd.orthoAxisGrid_lineWidth = function() {
        return (this.index !== this.scene.parent.childNodes.length - 1) ? 1 : 1;
    };;
    //cd.orthoAxisGrid_visible = true;
    
    cd.valuesAnchor = 'top';
    //cd.valuesVisible = true;
    cd.valuesFont = "lighter 15px TPF_Font_Thin"; 
    
    // tooltips
    cd.tooltipDelayIn = 20;
    cd.tooltipDelayOut = 20;
    cd.tooltipFade = false;
    cd.tooltipGravity = 's';
    cd.tooltipOpacity = 1;
    cd.tooltipFollowMouse = true;
    
    cd.tooltipFormat = function f(){
        var series = this.getSeriesLabel(),
            category = this.getCategory(),
            value = OperationsDirector.addCommas(this.getValue().toFixed(2)),
            seriesClass = (series == 'Sales') ? 'sales' : 'target';
        
        return "<div class='tooltipContainer " + seriesClass + "'>" +
            "<div class='tooltipTitle'>" + category + "</div>" +  
            "<div class='tooltipLabel'>" + series + "</div>" +  
            "<div class='tooltipValue'>" + value*100 + "%</div>" + 
        "</div>";
    }
    
    
    
}; 