$(document).ready(function () {
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
    let urlD3Bubble1 = "/pentaho/plugin/cda/api/doQuery?path=/public/UI/D3/BubbleChart/BubbleChart1.cda&dataAccessId=bubbleQuery";
        //urlD3Bubble1 += '&paramstartDay=' + startDay + '&paramendDay=' + endDay + '&parambrandParam=' + brandParam + '&paramplaceParam=' + placeParam + '&paramarea1Param=' + area1Param + '&paramarea2Param=' + area2Param + '&paramarea3Param=' + area3Param + '&paramshopParam=' + shopParam + '&paramoutletParam=' + outletParam;
    let getD3Bubble1JSON = readJSONFile(urlD3Bubble1).resultset;
    let bubbleChart = new d3.svg.BubbleChart({
        supportResponsive: true,
        //container: => use @default
        size: 600,
        //viewBoxSize: => use @default
        innerRadius: 600 / 3.5,
        //outerRadius: => use @default
        radiusMin: 50,
        //radiusMax: use @default
        //intersectDelta: use @default
        //intersectInc: use @default
        //circleColor: use @default
        circleColor: ['#2682FF','#FFB946','#87C31E'],
        data: {
            items: getD3Bubble1JSON.map((value, index, arr) => {
                let newArr = [];
                    newArr.push({
                        text: value[0],
                        count: value[1]
                    });
                return newArr[0];
            }),
            eval: (item) => {
                return item.count;
            },
            classed: (item) => {
                return item.text.split(" ").join("");
            }
        },
        plugins: [
            {
                name: "central-click",
                options: {
                    text: "(查看更多)",
                    style: {
                        'font-size': "10px",
                        'font-style': "italic",
                        'font-family': "Source Sans Pro, sans-serif",
                        //"font-family": "TPF_Font_Thin", 
                        //"font-weight": "700",
                        'text-anchor': "middle",
                        fill: "white"
                    },
                    attr: {dy: "65px"},
                    centralClick: (item) => {
                        console.log(item);
                        console.log(item.text);
                    }
                }
            },
            {
                name: "lines",
                options: {
                    format: [
                        {// Line #0
                            textField: "count",
                            classed: {count: true},
                            style: {
                                "font-size": "28px",
                                "font-family": "Source Sans Pro, sans-serif",
                                "text-anchor": "middle",
                                fill: "white"
                            },
                            attr: {
                                dy: "0px",
                                x: function (d) {return d.cx;},
                                y: function (d) {return d.cy;}
                            }
                        },
                        {// Line #1
                            textField: "text",
                            classed: {text: true},
                            style: {
                                "font-size": "10px",
                                "font-family": "Source Sans Pro, sans-serif",
                                "text-anchor": "middle",
                                fill: "white"
                            },
                            attr: {
                                dy: "20px",
                                x: (d) => {
                                    return d.cx;
                                },
                                y: (d) => {
                                    return d.cy;
                                }
                            }
                        }
                    ],
                    centralFormat: [
                        {// Line #0
                            style: {"font-size": "50px"},
                            attr: {}
                        },
                        {// Line #1
                            style: {"font-size": "30px"},
                            attr: {dy: "40px"}
                        }
                    ]
                }
            }
        ]
    });
});
 