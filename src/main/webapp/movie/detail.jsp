<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css"/>
</head>
<body>
   <center>
      <h3>${vo.title } 상세보기</h3>
      <table id="table_content" style="width:900px">
         <tr>
            <td width=40% class="tdcenter" rowspan=6>
               <img src="${vo.image }">
            </td>
            <th colspan=2>
               ${vo.title }
            </th>
         </tr>
          <tr>
              <td width=20% align=right>예매율</td>
              <td width=40%>${vo.percent }</td>
          </tr>
          <tr>
              <td width=20% align=right>선호(찜)</td>
              <td width=40%>${vo.like }</td>
          </tr>
          <tr>
              <td width=20% align=right>개봉일</td>
              <td width=40%>${vo.regdate }</td>
          </tr>
          <tr>
              <td width=20% align=right>영화순위</td>
              <td width=40%>${vo.no }</td>
          </tr>
          <tr>
              <td width=20% align=right>예매완료</td>
              <td width=40%>${vo.reserve }</td>
          </tr>
      </table>
      <table id="table_content" style="width:900px">
         <tr>
            <th>${vo.title } 감성현황</th>
         </tr>
         <tr>
            <td class="tdcenter">
               <img src="feel.png">
            </td>
         </tr>
      </table>
      <table id="table_content" style="width:900px">
         <tr>
            <td align=right>
               <a href="list.do">목록</a>&nbsp;&nbsp;
               <a href="recommand.do">추천</a>
            </td>
         </tr>
      </table>
   </center>
</body>
</html>









