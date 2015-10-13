$(function () {
  var lists = ["errands", "To Do"];
  var items = [50, 1];

  $.ajax({
    method: "GET",
    url: "/items"
    dataType: "json"
  })

  .done(function(data){
  


  });

    $('#container').highcharts({

        chart: {
            type: 'bar'
        },
        title: {
            text: 'Fruit Consumption'
        },
        xAxis: {
            categories: lists
        },
        yAxis: {
            title: {
                text: 'Fruit eaten'
            }
        },
        series: [{
            name: 'Chores',
            data: items
        }]
    });
});
