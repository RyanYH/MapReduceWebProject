<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
  google.charts.load("current", {packages:['corechart']});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ["영화명", "선호도", { role: "style" } ],
      <c:forEach var="vo" items="${list}">
      ['<c:out value="${vo.title}"/>', <c:out value="${vo.like}"/>, '<c:out value="${vo.color}"/>'],
      </c:forEach>
    ]);

   var view = new google.visualization.DataView(data);
   view.setColumns([0, 1,
                     { calc: "stringify",
                       sourceColumn: 1,
                       type: "string",
                       role: "annotation" },
                     2]);

    var options = {
      title: "영화별 선호도 현황",
      width: 450,
      height: 350,
      bar: {groupWidth: "95%"},
      legend: { position: "none" },
    };
    var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
    chart.draw(view, options);
   }

    google.charts.setOnLoadCallback(drawChart1);
    function drawChart1() {
      var data = google.visualization.arrayToDataTable([
           ['영화명', '예매율'],
        <c:forEach var="vo" items="${list}">
        ['<c:out value="${vo.title}"/>',     <c:out value="${vo.percent}"/>],
        </c:forEach>
        
      ]);

      var options = {
        title: '영화별 예매순위 현황',
        is3D: true,
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
      chart.draw(data, options);
    }
  $(function () {
	    
	    $('#container').highcharts({
	        chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45,
	                beta: 0
	            }
	        },
	        title: {
	            text: '영화별 별점 현황'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                depth: 35,
	                dataLabels: {
	                    enabled: true,
	                    format: '{point.name}'
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: '별점',
	            data: <%= request.getAttribute("value")%>
	        }]
	    });
	 
    
      
  });
   </script>

</head>
<body>
   <center>
      <h3>영화별 전체 현황 시각화</h3>
      <table id="table_content" style="width=900px">
         <tr>
            <td class="tdcenter" width=50%>
                 <div id="columnchart_values" style="width: 450px; height: 350px;"></div>
            </td>
            <td class="tdcentewidth=50%r" width=50%>
                 <div id="piechart_3d" style="width: 450px; height: 350px;"></div>
            </td>
         </tr>
         <tr>
            <td class="tdcenter" colspan=2>
                <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
            </td>
         </tr>
      </table>
   </center>
</body>
</html>







