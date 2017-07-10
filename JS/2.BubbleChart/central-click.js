/**
 * central-click.js
 */
d3.svg.BubbleChart.define("central-click", function (options) {
    let self = this;

    self.setup = (function (node) {
        let original = self.setup;
        return function (node) {
            let fn = original.apply(this, arguments);
            self.event.on("click", function(node) {
                if (node.selectAll("text.central-click")[0].length === 1 
                    && options.centralClick && node.datum) {
                    let nodeDatum = node.datum();
                    if (nodeDatum.item) {
                        options.centralClick(nodeDatum.item);
                    }
                }
            });
            return fn;
        };
    })();

    self.reset = (function (node) {
        let original = self.reset;
        return function (node) {
            let fn = original.apply(this, arguments);
            node.select("text.central-click").remove();
            return fn;
        };
    })();

    self.moveToCentral = (function (node) {
        let original = self.moveToCentral;
        return function (node) {
            let fn = original.apply(this, arguments);
            let transition = self.getTransition().centralNode;
                transition.each("end", function() {
                    node.append("text").classed({"central-click": true})
                        .attr(options.attr)
                        .style(options.style)
                        .attr("x", (d) => {return d.cx;})
                        .attr("y", (d) => {return d.cy;})
                        .text(options.text)
                        .style("opacity", 0)
                        .transition()
                        .duration(self.getOptions().transitDuration / 2)
                        .style("opacity", "0.8");
                });
            return fn;
        };
    })();
});
 