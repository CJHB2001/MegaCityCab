
//chart default
var options = {
  series: [65, 20, 15],
  chart: {
    type: 'pie',
    width: '350',
  },
  legend: {
    show: false,
  },

  labels: ['Active Trips', 'Complete Trips', 'Cancel Trips'],
  responsive: [
    {
      breakpoint: 480,
      options: {
        chart: {
          width: 300,
        },
      },
    },
  ],
};

var chart = new ApexCharts(document.querySelector('#chart'), options);
chart.render();

//Spine Chart
var options = {
  series: [
    {
      name: 'Revenue',
      type: 'column',
      data: [440, 505, 414, 671, 227, 413, 201, 352, 752, 320, 257, 750],
    },
    {
      name: 'Trips',
      type: 'line',
      data: [23, 42, 35, 27, 43, 22, 17, 31, 22, 22, 12, 16],
    },
  ],
  chart: {
    height: 350,
    type: 'line',
  },
  stroke: {
    width: [4, 4],
  },
  title: {
    text: 'Revenue Status',
  },
  dataLabels: {
    enabled: true,
    enabledOnSeries: [1],
  },
  labels: [
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
  ],
  xaxis: {
    type: 'datetime',
  },
  yaxis: [
    {
      title: {
        text: 'Revenue',
      },
    },
    {
      opposite: true,
      title: {
        text: 'Trips',
      },
    },
  ],
};

var spineChart = new ApexCharts(
  document.querySelector('#spine-chart'),
  options
);
spineChart.render();
