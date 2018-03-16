<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/16 0016
  Time: 上午 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <!--
        SpringMVC处理静态资源:
        解决:在SpringMVC的配置文件中配置一个 mvc:default-servlet-handler
    -->
    <script type="text/javascript" src="scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".delete").click(function(){
                var href = $(this).attr("href");
                $("form").attr("action",href).submit();
                return false;
            });
        })
    </script>
</head>
<body>
        <form action ="" method ="post">
            <input type="hidden" name="_method" value="DELETE"/>
        </form>
        <c:if test="${empty requestScope.employees}">
            没有任何员工信息;
        </c:if>
        <c:if test="${!empty requestScope.employees}">
                <table border="1" cellpadding="10" cellspacing="0">
                    <tr>
                        <th>Id</th>
                        <th>LastName</th>
                        <th>Email</th>
                        <th>Gender</th>
                        <th>Department</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <c:forEach items="${requestScope.employees}" var ="emp">
                        <tr>
                            <td>${emp.id}</td>
                            <td>${emp.lastName}</td>
                            <td>${emp.email}</td>
                            <td>${emp.gender}</td>
                            <td>${emp.department.departmentName}</td>
                            <td><a href="emp/${emp.id}"/>Edit</td>
                            <td><a class="delete" href="/emp/${emp.id}"/>Delete</td>
                        </tr>
                    </c:forEach>
                </table>
        </c:if>
        <br><br>
      <a href="/emp">添加</a>
        <form action ="/emp/1005" method ="post">
        <input type="hidden" name="_method" value="DELETE"/>
        <input type="submit">
        </form>
</body>
</html>
