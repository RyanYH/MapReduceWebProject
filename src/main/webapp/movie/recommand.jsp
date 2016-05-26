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
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript">
$(function(){
	$('#feel').change(function(){
		$('#frm').submit();
	});
	
	$('#container').highcharts({
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: 'World\'s largest cities per 2014'
	        },
	        subtitle: {
	            text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
	        },
	        xAxis: {
	            type: 'category',
	            labels: {
	                rotation: -45,
	                style: {
	                    fontSize: '13px',
	                    fontFamily: 'Verdana, sans-serif'
	                }
	            }
	        },
	        yAxis: {
	            min: 0,
	            title: {
	                text: 'Population (millions)'
	            }
	        },
	        legend: {
	            enabled: false
	        },
	        tooltip: {
	            pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
	        },
	        series: [{
	            name: 'Population',
	            data: [
	                ['Shanghai', 23.7],
	                ['Lagos', 16.1],
	                ['Istanbul', 14.2],
	                ['Karachi', 14.0],
	                ['Mumbai', 12.5],
	                ['Moscow', 12.1],
	                ['São Paulo', 11.8],
	                ['Beijing', 11.7],
	                ['Guangzhou', 11.1],
	                ['Delhi', 11.1],
	                ['Shenzhen', 10.5],
	                ['Seoul', 10.4],
	                ['Jakarta', 10.0],
	                ['Kinshasa', 9.3],
	                ['Tianjin', 9.3],
	                ['Tokyo', 9.0],
	                ['Cairo', 8.9],
	                ['Dhaka', 8.9],
	                ['Mexico City', 8.9],
	                ['Lima', 8.9]
	            ],
	            dataLabels: {
	                enabled: true,
	                rotation: -90,
	                color: '#FFFFFF',
	                align: 'right',
	                format: '{point.y:.1f}', // one decimal
	                y: 10, // 10 pixels down from the top
	                style: {
	                    fontSize: '13px',
	                    fontFamily: 'Verdana, sans-serif'
	                }
	            }
	        }]
	    });
	});
</script>
</head>
<body>
   <center>
      <h3>추천영화</h3>
      <table id="table_content" style="width:600px">
         <tr>
            <td>추천검색:
                <form action="recommand.do"
                          method="post" id="frm">
                 <select name="feel" id="feel">
                    <c:forEach var="vo" items="${slist }">
                        <c:if test="${vo==feel}">
                         <option selected>${vo }</option>
                        </c:if>
                        <c:if test="${vo!=feel}">
                         <option>${vo }</option>
                        </c:if>
                    </c:forEach>
                 </select>
                </form>
            </td>
         </tr>
      </table>
      <table id="table_content" style="width:600px">
      <tr>
         <c:forEach var="m" items="${mlist }">
          <td class="tdcenter">
           <a href="detail.do?no=${m.no }">
           <img src="${m.image }"></a>
          </td>
         </c:forEach>
      </tr>
      <tr>
         <c:forEach var="m" items="${mlist }">
         <td class="tdcenter">
           ${m.title }
         </td>
         </c:forEach>
      </tr>
      </table>
      <table id="table_content" width="600">
        <tr>
           <td class="tdcenter">
              <div id="container" style="min-width: 300px; height: 400px; margin: 0 auto"></div>
           </td>
        </tr>
      </table>
   </center>
</body>
</html>







