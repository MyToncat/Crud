<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Index</title>
    <script src="static/js/jquery.min.js" type="text/javascript"></script>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <%--
          不以 / 开头的的路径 找资源，以当前的资源路径为准，经常出问题
          以 / 开始的相对路径 找资源，以服务器的路径为标准
    --%>
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
            <table class="table table-striped" id="emp_table">
                <thead>
                    <tr>
                        <th>序列号</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>

            </table>
        </div>
    </div>
    <%--    分页信息--%>
    <div class="row" >
        <div class="col-md-6" id="page_info_area">

        </div>

        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>

<script type="text/javascript">
    //在页面加载完成后，发送ajax请求，得到分页信息
    $(function () {
        //把方法抽取出来
        to_page(1);
    });

    function to_page(pns){
        $.ajax({
            url:"/emps",
            data:"pn="+pns,
            type:"GET",
            success:function (result) {
                //返回的数据
                //步骤：1 .解析并显示员工信息  2.解析并显示分页信息
                 built_emps_tables(result);
                 build_page_info(result);
                 buit_page_nav(result);
            }
        });
    };
    // 定义两个处理方法,
      //解析员工信息和显示
    function built_emps_tables(result) {
        /*
               因为要实现点击页码来分页，但是又因为是ajax，是无刷新，所以原来的数据还在没所以会
               重复，既是要清空分页前的数据。
         */
        $("#emp_table tbody").empty();


        //取出所有的员工数据， 参照json返回数据的格式来获取
        var emps=result.extend.pageinfo.list;
        $.each(emps,function (index,item) {
            //注意，下面值不能为空，否则会出错
            var empIdTd=$("<td></td>").append(item.empId);
            var empNameTd=$("<td></td>").append(item.empName);
            var genderTd=$("<td></td>").append(item.gender);
            var emailTd=$("<td></td>").append(item.email);
            var departmentTd=$("<td></td>").append(item.department.deptName);
            //按钮
            var editBtn=$("<buttton></button>").addClass("btn btn-primary btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑"));
            var delBtn=$("<buttton></button>").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");


            //append方法执行完成后，返回还是原来的元素，所以可以这样不断追加元素
              $("<tr></tr>").append(empIdTd)
                  .append(empNameTd)
                  .append(genderTd)
                  .append(emailTd)
                  .append(departmentTd)
                  .append(editBtn)
                  .append(delBtn)
                  .appendTo("#emp_table tbody");
        })

    }

    //解析 页数和记录数 并显示
    function build_page_info(result) {
        $("#page_info_area").empty();

        $("#page_info_area").append("当前为"+result.extend.pageinfo.pageNum+"页,总"+result.extend.pageinfo.pages+" 页，总共"+result.extend.pageinfo.total+" 记录");
    }

    //分页条
    function buit_page_nav(result) {

        $("#page_nav_area").empty();


        var  ul=$("<ul></ul>").addClass("pagination");

        //构建  上面一页 和 第一页按钮
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));

        //没有前面一列 ，显示不可按
        if (result.extend.pageinfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //  按钮都禁用了，所以无需再绑定事件了

            //添加onclick事件‘
            firstPageLi.click(function () {
                to_page(1)
            });
            prePageLi.click(function () {
                to_page(result.extend.pageinfo.pageNum-1);
            });

        }



        //构建  下一页 和 最后一页按钮
        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));

        //没有下一页
        if (result.extend.pageinfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            //为按钮添加事件
            nextPageLi.click(function () {
                to_page(result.extend.pageinfo.pageNum+1)
            });

            lastPageLi.click(function(){
                to_page(result.extend.pageinfo.pages);
            });
        }

        //先在ul中添加首页，前一页 ，
        ul.append(firstPageLi)
            .append(prePageLi);

        //取出页码数， 再ul中添加页码数，
        $.each(result.extend.pageinfo.navigatepageNums,function (index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
           //
            if (result.extend.pageinfo.pageNum==item){
                numLi.addClass("active");
            }

            //给页数添加单击事件
            numLi.click(function () {
                console.log(item);
                to_page(item);
            });

            ul.append(numLi);
        });
        //最后再ul添加下一页和最后一页
        ul.append(nextPageLi)
            .append(lastPageLi);

        //把ul加入nav
        var navEle=$("<nav></nav>").append(ul);

        //把nav添加到页面的page_nav_area
        navEle.appendTo("#page_nav_area");
    }

</script>

</body>
</html>
