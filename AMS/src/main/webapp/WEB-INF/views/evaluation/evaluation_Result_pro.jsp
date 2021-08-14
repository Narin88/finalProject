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
<div id = "bigbig"></div>
  <div id="container0"></div>
<div id="container1"></div>
<div id="container2"></div>
<div id="container3"></div>
<div id="container4"></div>
<div id="container5"></div>
<div id="container6"></div>
<div id="container7"></div>
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

	var label = ['','매우 불만족','불만족', '보통','만족','매우 만족']
	var colors =[ '#009EE0', '#008AC5', '#008AC5', '#EB001F','#BE3075']
	var qname =['', '1. 교수는 수업시간을 잘 지켰습니까?', '2. 강의 교재 및 자료는 학습에 도움이 되었습니까?', '3. 교수는 수업을 위한 준비를 잘했습니까?', '4. 수업의 내용과 분량은 학습을 하기에 충분했습니까?', '5. 강의는 학습 내용을 이해하기 쉽게 설명되었습니까?', '6. 강의를 통해 많은 것을 배웠습니까?']
	
	
	
	var opennum = '${num}';
	console.log(opennum);
	$.ajax({
		url:"${pageContext.request.contextPath }/Eresultpro",
		method:'post',
		data: {opennum: opennum},
		dataType: "JSON",
		success: function(data){
			console.log(data);
/* 			for(i=0; i<6; i++) {   
				var opendata = pushdata(data['q'+(i+1)]);  
				console.log(opendata);
				 draw(opendata, i); 
			} */
			for(var i = 1; i < 7; i++) {
				var opendata = pushdata(data['q' + i]);  
				 draw(opendata, i); 
			}
		},
		error: function(err) {
			console.log(err);
		},
		async: false,
	})//end of ajax

	
function pushdata(data){
	var chartData = [];
	for(i=0; i<data.length; i++){
		var opendata = [data[i].a1 , parseInt(data[i].cnt), colors[i], label[data[i].a1] ]; // 잠시만 함 보구요넵
		chartData.push(opendata);
	}
	return chartData;
}

async function draw(data, idx){

await Highcharts.chart('container'+idx, {

	  chart: {
	    type: 'item'
	  },

	  title: {
	    text: qname[idx]
	  },


	  legend: {
	    labelFormat: '{name} <span style="opacity: 0.4">{y}</span>'
	  },
	
	  series: [{
	    name: '선택',
	    keys: ['name', 'y','colors','label'],
	    data: data,
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
})

}
//


</script>
</body>
</html>