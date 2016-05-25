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
<script type="text/javascript">
$(function(){
	$('#feel').change(function(){
		$('#frm').submit();
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
   </center>
</body>
</html>







