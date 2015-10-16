$(function () {
    $('#container').highcharts({
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Your Activity'
        },
        xAxis: {
            categories: ['Today', 'Tomorrow']
        },
        yAxis: {
            title: {
                text: 'Chores to complete'
            }
        },
        series: [{
            name: 'Errands',
            data: [1, 4]
        }, {
            name: 'Code Projects',
            data: [5, 3]
        }]
    });
});
