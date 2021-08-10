<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/item-series.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<figure class="highcharts-figure">
  <div id="container"></div>

</figure>
<head>
<style>
.highcharts-figure, .highcharts-data-table table {
  min-width: 320px; 
  max-width: 800px;
  margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
  padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
  padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}
.highcharts-data-table tr:hover {
  background: #f1f7ff;
}


input[type="number"] {
	min-width: 50px;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<script>
Highcharts.chart('container', {

	  chart: {
	    type: 'item'
	  },

	  title: {
	    text: 'Highcharts item chart'
	  },

	  subtitle: {
	    text: 'Parliament visualization'
	  },

	  legend: {
	    labelFormat: '{name} <span style="opacity: 0.4">{y}</span>'
	  },

	  series: [{
	    name: 'Representatives',
	    keys: ['name', 'y', 'color', 'label'],
	    data: [
	      ['The Left', 69, '#BE3075', 'DIE LINKE'],
	      ['Social Democratic Party', 153, '#EB001F', 'SPD'],
	      ['Alliance 90/The Greens', 67, '#64A12D', 'GRÜNE'],
	      ['Free Democratic Party', 80, '#FFED00', 'FDP'],
	      ['Christian Democratic Union', 200, '#000000', 'CDU'],
	      ['Christian Social Union in Bavaria', 46, '#008AC5', 'CSU'],
	      ['Alternative for Germany', 94, '#009EE0', 'AfD']
	    ],
	    dataLabels: {
	      enabled: true,
	      format: '{point.label}'
	    },

	    // Circular options
	    center: ['50%', '88%'],
	    size: '170%',
	    startAngle: -100,
	    endAngle: 100
	  }]
	});
</script>
</body>
</html>