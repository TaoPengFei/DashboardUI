let GeneralManager = {};

/*-------------------------------------------------------------------------*
 *              GeneralManager functions && settings                       *
 *-------------------------------------------------------------------------*/

GeneralManager.addCommas = ( nStr ) => {
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
GeneralManager.defaultBarSettings = function(){
    let cd = this.chartDefinition;
    // general settings
    cd.xAxisLabel_textAngle = -0.1;
    cd.legendShape = 'circle';
    cd.selectable = true;
    cd.hoverable = true;
    cd.legendPosition =  'top';
    cd.plotFrameVisible = false;
    cd.orthoAxisGrid = true;
    cd.orthoAxisTicks = false;
    // legend
    // xAxis
    cd.xAxisLabel_textAlign = 'right';
    cd.xAxisLabel_textBaseline = 'top';
    
    cd.format = {
        number:  "0.##A",
        percent: "#.00%"      
    };
    // extensionPoints
    cd.extensionPoints = [
        ["xAxisRule_strokeStyle", "white"],
        ["yAxisRule_strokeStyle", "white"],
        ["y2AxisRule_strokeStyle", "white"]
    ];
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
            value = GeneralManager.addCommas(this.getValue().toFixed(2));
        
        return "<div class='tooltipContainer'>" +
            "<div class='tooltipTitle'>" + category + "</div>" +  
            "<div class='tooltipLabel'>" + series + "</div>" +  
            "<div class='tooltipValue'>" + value + "</div>" + 
        "</div>";
    }
    // axis grids
    //cd.axisLabel_font = "lighter 16px Open Sans";
    cd.axisLabel_font = "lighter 16px TPF_Font_Thin"; 
    cd.baseAxisGrid = true;
    cd.baseAxisGrid_strokeStyle = "#FFF";
    cd.baseAxisGrid_lineWidth = 4;
    cd.baseAxisLabel_textStyle = "#01665e";
    cd.baseAxisRule_visible = false;
    cd.baseAxisTooltipEnabled = false;
    cd.orthoAxisLabel_textStyle = "#999999";
    // use series colors on legend labels
    cd.legendLabel_textStyle = function(scene) {
        var colorScale = this.panel.axes.color.scale;
        return colorScale(this.getValue());
    };
}; 

// Chart defaults for all Pie charts
GeneralManager.defaultPieSettings = function(){
    let cd = this.chartDefinition;
    // general settings
    cd.legendShape = 'circle';
    cd.selectable = true;
    cd.hoverable = true;
    // legend
    cd.legendPosition =  'bottom';
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
            value = GeneralManager.addCommas(this.getValue().toFixed(2));
        
        return "<div class='tooltipContainer'>" +
            "<div class='tooltipTitle'>" + category + "</div>" +  
            "<div class='tooltipValue'>" + value + "</div>" + 
        "</div>";
    }
}; 
// Chart defaults for all Line charts
GeneralManager.defaultLineSettings = function(){
    let cd = this.chartDefinition;
    
    cd.colors = ['#01665e', '#f46d43'];
    //cd.colors = ['#0055B8'];
    cd.height = 330;
    //cd.plotBg_fillStyle = "#f2f2f2";
    cd.plotFrameVisible = false;
    cd.margins = "0 1 1 -12";
    
    // legend
    cd.legendPosition = "top";
    cd.legendAlign = "right"; 
    cd.legendLabel_font = "lighter 16px Open Sans";
    cd.legendLabel_textDecoration = pvc.finished("none");
    cd.legendItemPadding = 0;
    cd.legendMargins = "0 0 -14 0";
    cd.legendItemSize = 80;
    cd.legendDot_shape = 'circle';
    cd.legendDot_fillStyle = pvc.finished(function(scene) {  
        var c = this.delegate();
        return scene.isActive
            ? c
            : "#FFF";
    });
    cd.legendDot_strokeStyle = pvc.finished(function(scene) { 
        return this.delegate();
    });
    cd.legendDot_lineWidth = pvc.finished(4);
    cd.legendDot_shapeRadius = pvc.finished(3);
    cd.legendDrawLine = false;
    cd.legendDot_cursor = "pointer";
    
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
        var series = this.getSeriesLabel(),
            category = this.getCategory(),
            value = GeneralManager.addCommas(this.getValue().toFixed(0)),
            seriesClass = (series == 'Sales') ? 'sales' : 'target';
        
        return "<div class='tooltipContainer " + seriesClass + "'>" +
            "<div class='tooltipTitle'>" + category + "</div>" +  
            "<div class='tooltipLabel'>" + series + "</div>" +  
            "<div class='tooltipValue'>￥" + value + "</div>" + 
        "</div>";
    }
    
    // axis grids
    //cd.axisLabel_font = "lighter 16px Open Sans"; TPF_Font_Thin
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
    cd.orthoAxisGrid = true;
    cd.orthoAxisGrid_strokeStyle = function() {
        return (this.index !== this.scene.parent.childNodes.length - 1) ? "#CCC" : "#CCC";
    };
    cd.orthoAxisGrid_lineWidth = function() {
        return (this.index !== this.scene.parent.childNodes.length - 1) ? 1 : 1;
    };;
    cd.orthoAxisGrid_visible = true;
    
    // add horizontal line at max value
    cd.orthoAxisRule_visible = false;
    cd.orthoAxisTicks = false;
    cd.orthoAxisLabel_visible = function() {
        return this.index === this.scene.parent.childNodes.length - 1;
    };
    cd.orthoAxisLabel_textMargin = 8;
    cd.orthoAxisLabel_textAlign = 'left';
    cd.orthoAxisLabel_textBaseline = 'bottom';
    cd.orthoAxisTickFormatter = function (value) {
        return '$' + GeneralManager.addCommas(value);
    };
    
    // lines
    cd.line_lineWidth = pvc.finished(4);
    
    // dots
    cd.dotsVisible = true;
    cd.dot_shapeRadius = pvc.finished(3);
    cd.dot_lineWidth = pvc.finished(4);
    cd.hoverable = true;
    cd.dot_fillStyle = pvc.finished(function(scene) {  
        var c = this.delegate();
        return scene.isActive
            ? c
            : "#FFF";
    });
    cd.dot_strokeStyle = pvc.finished(function(scene) { 
        return this.delegate();
    });
    
    // Add hoverable behavior to the legend label
    cd.legendLabel_call = function() {
        this
        .events('all')
        .event('point', function(scene) {
            var panel = scene.panel();
            if(scene.hoverable() && !panel.selectingByRubberband() && !panel.animating()) {
                scene.setActive(true);
                panel.renderInteractive();
            }
        })
        .event('unpoint', function(scene) {
            var panel = scene.panel();
            if(scene.hoverable() && !panel.selectingByRubberband() && !panel.animating()) {
                 // Clears THE active scene, if ANY (not necessarily = scene)
                if(scene.clearActive()) panel.renderInteractive();
            }
        });
    };
    
    // others
    cd.format = {
        number:  "0.##A",
        percent: "#.00%"      
    };
    
    cd.extensionPoints = [
        ["xAxisRule_strokeStyle", "white"],
        ["yAxisRule_strokeStyle", "white"],
        ["y2AxisRule_strokeStyle", "white"]
    ];
    
    cd.xAxisLabel_textAngle = -0.1;
    cd.stacked = true;
    cd.legendShape = 'circle';
    cd.selectable = true;
    cd.hoverable = true;
    cd.legendPosition =  'top';
    cd.plotFrameVisible = false;
    cd.orthoAxisGrid = true;
    cd.orthoAxisTicks = false;
    cd.xAxisLabel_textAlign = 'right';
    cd.xAxisLabel_textBaseline = 'top';
    cd.orthoAxisTickFormatter = function(v){
        if( v < 1000000 && v >= 1000  ){
            return sprintf('%d', v/1000) + 'K'; 
        }else if( v >= 1000000 ){
            return sprintf('%d', v/1000000) + 'M'; 
        }else{
            return sprintf('%d', v/1000) + 'K'; 
        }
    };
}; 