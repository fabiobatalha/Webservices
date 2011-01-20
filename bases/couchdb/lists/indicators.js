function(head, req) {
    // !json templates.indicators
    // !code _attachments/js/collections_list.js

    var chart1; // globally available
    var Mustache = require('vendor/couchapp/lib/mustache');
    var register = null;
    var body = null;
    var post = new Array();
    var collections = new Array();
    var types = new Array();
    var series = new Object();
    series.i = new Array;
    series.t = new Array;
    series.h = new Array;

    start({
        "headers": {
            "Content-Type": "text/html"
        }
    });

    Array.prototype.getUniqueValues = function () {
        var hash = new Object();
        for (j = 0; j < this.length; j++) {hash[this[j]] = true}
        var array = new Array();
        for (value in hash) {array.push(value)};
        return array;
   }

    while (row = getRow()) {
      collections.push(row.key[0]);
      types.push(row.key[1]);
      post.push(row.value);

      if (row.key[1] == "i"){
         series.i.push(Math.log(row.value,10));
      }else if (row.key[1] == "h"){
         series.h.push(Math.log(row.value,10));
      }else if (row.key[1] == "t"){
         series.t.push(Math.log(row.value,10));
      }

    }

    var options = {
      chart: {
         renderTo: 'container',
         defaultSeriesType: 'column'
      },
      title: {
         text: 'SciELO Network Indicators'
      },
      subtitle: {
         text: 'Source: www.scielo.org'
      },
      xAxis: {
         categories: collections.getUniqueValues()
         //categories: ['scl','esp','arg']
      },
      yAxis: {
        min:0,
/*
        labels: {
            formatter: function() {
                return Math.pow(10,this.value);
            },
*/
         title: {
            text: 'Totals'
         }
      },
      legend: {
         layout: 'vertical',
         backgroundColor: '#FFFFFF',
         align: 'left',
         verticalAlign: 'top',
         x: 100,
         y: 70,
         floating: true,
         shadow: true
      },

     tooltip: {
         formatter: function() {
            return ''+this.x +': '+ this.y +' mm';
         }
      },


/*
      tooltip: {
          formatter: function() {
              return '<b> ulele'+ this.y +
                  '</b> = log(<b>'+ Math.round(Math.pow(10,this.y)) +'</b>,10)';
          }
      },
*/

      plotOptions: {
         column: {
            pointPadding: 0.2,
            borderWidth: 0
         }
      },
      series: []
   }



   options.series.push({name: "issues", data: series.i });
   options.series.push({name: "articles", data: series.h });
   options.series.push({name: "title", data: series.t });


    var myJSONText = JSON.stringify(options);

    registers = {"rows" : myJSONText };
    return Mustache.to_html(templates.indicators,registers);

}