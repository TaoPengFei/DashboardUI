let Pie1 = {};

/*-------------------------------------------------------------------------*
 *                        Pie1 functions && settings                       *
 *-------------------------------------------------------------------------*/
Pie1.addCommas = ( nStr ) => {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    let rgx = /(\d+)(\d{3})/;
    
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    x2 = x2.slice(0,3);
    return x1 + x2;
};

/*-------------------------------------------------------------------------*
 *                             D3 && settings                              *
 *-------------------------------------------------------------------------*/
function initD3(){
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
        });
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
    /**
     * 
     * 数组求和
     * 
    **/
    Array.prototype.sum = function (){
        let result = 0;
        for(let i = 0; i < this.length; i++) {
            result += this[i];
        }
        return result;
    };
    
    let urlD3Pie1 = "/pentaho/plugin/cda/api/doQuery?path=/public/UI/D3/PieChart/pie1.cda&dataAccessId=pie1";
        //urlD3Pie1 += '&paramstartDay=' + startDay + '&paramendDay=' + endDay + '&parambrandParam=' + brandParam + '&paramplaceParam=' + placeParam + '&paramarea1Param=' + area1Param + '&paramarea2Param=' + area2Param + '&paramarea3Param=' + area3Param + '&paramshopParam=' + shopParam + '&paramoutletParam=' + outletParam;
    let getD3Pie1JSON = readJSONFile(urlD3Pie1).resultset;
    let colors = ['#FF9E16', '#0055B8'];
    let d3Pie = new d3pie("pieChart", {
        header: {
            title: {
                text: (function(){
                    return getD3Pie1JSON.sort(function(a,b){
                        return b[1]-a[1];
                    })[0][0];
                })(),
                color: "#0055B8",
    			fontSize: 24,
    			font: "open sans"
    		},
    		subtitle: {
                text: (function(){
                    let maxJSON = getD3Pie1JSON.map((value, index, arr) => {
                        let newArr = [];
                            newArr.push(value[1]);
                        return newArr[0];
                    }).max();
                    let sumJSON = getD3Pie1JSON.map((value, index, arr) => {
                        let newArr = [];
                            newArr.push(value[1]);
                        return newArr[0];
                    }).sum();
                    return ((maxJSON / sumJSON) * 100).toFixed(2) + '%';
                })(),
    			//color: "#0055B8",
    			fontSize: 42,
    			font: "TPF_Font_Thin"
    		},
    		titleSubtitlePadding: 9,
            location: "pie-center"
    	},
        /*
    	footer: {
    		color: "#999999",
    		fontSize: 10,
    		font: "open sans",
    		location: "bottom-left"
    	},
        */
        size: {
            canvasHeight: (function(){
                //console.log($("#pieChart").height()); clientHeight scrollHeight
                console.log($("#pieChart").clientHeight);
                console.log(document.getElementById("pieChart").clientHeight);
                console.log(document.getElementById("pieChart").offsetHeight);
                console.log(document.getElementById("pieChart").scrollHeight);
                console.log($("#pieChart").width());
                console.log($("#pieChart"));
                return 500;
            })(),
    	    canvasWidth: (function(){
                return $("#pieChart").width();   
    	    })(),
            //"canvasWidth": 590,
        	pieInnerRadius: "80%"
    	},
    	data: {
    		sortOrder: "value-desc",
            content: getD3Pie1JSON.map((value, index, arr) => {
                let newArr = [];
                    newArr.push({
                        label: value[0],
                    	value: value[1],
                        color: colors[index]
                    });
                return newArr[0];
            })
    	},
        tooltips: {
            enabled: true,
            type: "placeholder",
            //string: "{label}: {percentage}%",
            string: "{label}: {value}",
            placeholderParser: function(index, data) {
                //console.log(index);
                //console.log(data.value.toFixed(2));
                //data.label = data.label + "!";
                //data.percentage = data.percentage.toFixed(2);
                data.value = Pie1.addCommas(data.value.toFixed(2));
                return data.value;
                /*
                data.label = data.label + "!";
                data.percentage = data.percentage.toFixed(2);
                data.value = data.value.toFixed(2);
                */
            },
            styles: {
                fadeInSpeed: 500,
                //backgroundColor: "#00cc99",
                backgroundColor: "silver",
                backgroundOpacity: 0.8,
                color: "#ffffcc",
                borderRadius: 4,
                font: "verdana",
                fontSize: 20,
                padding: 20
            }
        },
    	labels: {
    		outer: {
    			pieDistance: 32
    		},
    		inner: {
    			hideWhenLessThanPercentage: 3
    		},
    		mainLabel: {
    			fontSize: 20
    		},
    		percentage: {
    			color: "#ffffff",
    			decimalPlaces: 0
    		},
    		value: {
    			color: "#adadad",
    			fontSize: 20
    		},
    		lines: {
    			enabled: true
    		},
    		truncation: {
    			enabled: true
    		}
    	},
    	effects: {
    		pullOutSegmentOnClick: {
    			effect: "linear",
    			speed: 400,
    			size: 8
    		}
    	},
        callbacks: {
            onClickSegment: function(a) {
    			console.log(a.data);
    		}
    	}
        /*
    	misc: {
    		gradient: {
    			enabled: true,
    			percentage: 100
    		}
    	},*/   
    });  
}; 