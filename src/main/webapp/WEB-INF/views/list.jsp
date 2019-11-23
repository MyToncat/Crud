
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>员工页面</title>
    <script src="static/js/jquery.min.js" type="text/javascript"></script>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <%--    标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary">新增</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--    表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <tr>
                    <th>序列号</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>

                <c:forEach items="${pageinfo.list }" var="emp">
                    <tr>
                        <td>${emp.empId }</td>
                        <td>${emp.empName }</td>
                        <td>${emp.gender}</td>
                        <td>${emp.email }</td>
                        <td>${emp.department.deptName }</td>
                        <td>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--    分页信息--%>
    <div class="row">
        <div class="col-md-6">
            当前${pageinfo.pageNum}页,总${pageinfo.pages}页，总${pageinfo.total}记录
        </div>

<%--        分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="/emps?pn=1">首页</a>
                    </li>
                    <li>
                        <c:if test="${pageinfo.hasPreviousPage}">
                            <%--  如果有上一页，显示 <   --%>
                            <a href="/emps?pn=${pageinfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>

                    </li>
                    <c:forEach var="page_num" items="${pageinfo.navigatepageNums}">
                        <c:if test="${page_num==pageinfo.pageNum}">
                            <li class="active"><a href="#">${page_num}</a> </li>
                        </c:if>
                        <c:if test="${page_num!=pageinfo.pageNum}">
                            <li ><a href="/emps?pn=${page_num}">${page_num}</a> </li>
                        </c:if>

                    </c:forEach>

                    <li>
                        <c:if test="${pageinfo.hasNextPage}">
                            <a href="/emps?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <a href="/emps?pn=${pageinfo.pages}"> 尾页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
