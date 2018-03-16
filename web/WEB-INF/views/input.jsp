<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/16 0016
  Time: 下午 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri ="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Title</title>
</head>
        <form:form action ="${pageContext.request.contextPath}/emp" method="post" modelAttribute="employee">
            <c:if test="${employee.id == null}">
                   LastName: <form:input path="lastName"/>
            </c:if>
            <c:if test="${employee.id != null}">
                <form:hidden path="id"/>
                <input type="hidden" name="_method" value="PUT"/>
            </c:if>
            <br/>
            Email:<form:input path="Email"/>
            <br>
            <%
                Map<String,String> genders = new HashMap<String,String>();
                genders.put("1","Male");
                genders.put("0","FeMale");
                request.setAttribute("genders",genders);
                request.setCharacterEncoding("utf-8");
            %>
            gender:
            <br>
            <form:radiobuttons path="gender" items="${genders}" delimiter="<br>"/>
            <br>
            Department:<form:select path="department.id" items="${departments}" itemLabel="departmentName" itemValue="id"/>
            <br>
            <input type="submit" value="submit"/>
        </form:form>

</body>
</html>
