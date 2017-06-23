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
    cd.colors = ['#0055B8','#FF9E16','#009BDE','#71A087'];
}; 

// Chart defaults for all Pie charts
StoreOperation.defaultPieSettings = function(){
    let cd = this.chartDefinition;
    // general settings
    //color
    cd.colors = ['#0055B8','#FF9E16','#009BDE','#71A087'];
    
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