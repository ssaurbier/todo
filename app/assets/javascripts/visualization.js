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
            data: [1, 3]
        }, {
            name: 'Code Projects',
            data: [2, 1]
        }]
    });
});
