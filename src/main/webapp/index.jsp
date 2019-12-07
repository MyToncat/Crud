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

<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empname_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                           <%-- <input type="text" class="form-control" id="empname_update_input" placeholder="员工姓名"
                                   name="empName">--%>
                            <p id="empname_update_input" class="form-control-static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email_update_input" placeholder="电子邮箱"
                                   name="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="男" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="女">女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                                <%-- 部门id--%>

                            </select>
                        </div>
                    </div>


                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>




<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empname_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empname_add_input" placeholder="员工姓名"
                                   name="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email_add_input" placeholder="电子邮箱"
                                   name="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="女"> 女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                                <%-- 部门id--%>

                            </select>
                        </div>
                    </div>


                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<%----------------------------------------------------------------------------------------%>

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
            <button type="button" class="btn btn-primary" id="emp_add_model_btn">新增</button>
            <button type="button" class="btn btn-danger" id="delete_emp">删除</button>
        </div>
    </div>
    <%--    表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped" id="emp_table">
                <thead>
                <tr>
                    <th><input type="checkbox" class="check_all"></th>
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
    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>

        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>

<script type="text/javascript">

    //设置一个变量，便于添加一个新员工时，能够跳到添加后的最后一页
    var totalRecord;
    //保存当前页，便于修改员工数据后，跳转当前页，相当于页不发生变化
    var currentPage;


    //在页面加载完成后，发送ajax请求，得到分页信息
    $(function () {
        //把方法抽取出来
        to_page(1);
    });

    function to_page(pns) {
        $.ajax({
            url: "/emps",
            data: "pn=" + pns,
            type: "GET",
            success: function (result) {
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
        var emps = result.extend.pageinfo.list;
        $.each(emps, function (index, item) {
            //注意，下面值不能为空，否则会出错
            var checkbox=$("<td></td>").append("<input class='checkbox' type='checkbox' />")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender);
            var emailTd = $("<td></td>").append(item.email);
            var departmentTd = $("<td></td>").append(item.department.deptName);
            //按钮
            var editBtn = $("<buttton></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑"));
            //为每一个 编辑按钮 添加一个属性，置为id
            editBtn.attr("emp_id",item.empId);
            var delBtn = $("<buttton></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");


            //为当前删除按钮添加要删除的员工id
            delBtn.attr("del_id",item.empId);


            //append方法执行完成后，返回还是原来的元素，所以可以这样不断追加元素
            $("<tr></tr>").append(checkbox)
                .append(empIdTd)
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

        $("#page_info_area").append("当前为" + result.extend.pageinfo.pageNum + "页,总" + result.extend.pageinfo.pages + " 页，总共" + result.extend.pageinfo.total + " 记录");

        //记录添加员工后的记录数，便于下面使用来 跳转到 最后一页
        totalRecord = result.extend.pageinfo.total;

        currentPage=result.extend.pageinfo.pageNum;
    }

    //分页条
    function buit_page_nav(result) {

        $("#page_nav_area").empty();


        var ul = $("<ul></ul>").addClass("pagination");

        //构建  上面一页 和 第一页按钮
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

        //没有前面一列 ，显示不可按
        if (result.extend.pageinfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //  按钮都禁用了，所以无需再绑定事件了

            //添加onclick事件‘
            firstPageLi.click(function () {
                to_page(1)
            });
            prePageLi.click(function () {
                to_page(result.extend.pageinfo.pageNum - 1);
            });

        }


        //构建  下一页 和 最后一页按钮
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

        //没有下一页
        if (result.extend.pageinfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            //为按钮添加事件
            nextPageLi.click(function () {
                to_page(result.extend.pageinfo.pageNum + 1)
            });

            lastPageLi.click(function () {
                to_page(result.extend.pageinfo.pages);
            });
        }

        //先在ul中添加首页，前一页 ，
        ul.append(firstPageLi)
            .append(prePageLi);

        //取出页码数， 再ul中添加页码数，
        $.each(result.extend.pageinfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            //
            if (result.extend.pageinfo.pageNum == item) {
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
        var navEle = $("<nav></nav>").append(ul);

        //把nav添加到页面的page_nav_area
        navEle.appendTo("#page_nav_area");
    }

    //------------------------------------------------------------------

    function empty(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");//清空提示框的文本
    }

    //点击添加按钮，弹出模态框
    $("#emp_add_model_btn").click(function () {
        //清楚表单(jquery没有这个方法  dom才有)
/*        $("#empAddModel form")[0].reset();
        $("#empAddModel form").find("*").removeClass("has-success has-error");
        $("#empAddModel form").find(".help-block").text("");//清空提示框的文本*/

        empty("#empAddModel form");

        //在弹出之前，发送ajax，查询部门信息
        getDepts("#empAddModel select");

        $("#empAddModel").modal({
            backdrop: "static"
        });
    });

    //ajax 查询部门信息
    function getDepts(ele) {

        //显示前清空原来的部门信息
        $(ele).empty();

        $.ajax({
            url: "/depts",
            type: "get",
            success: function (result) {
                //  console.log(result);
                //返回的是ajax
                $.each(result.extend.dep, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    };

    //校验表单信息----优化，把这个放到后端，统一
    function validate_add_form() {
        //1.拿到数据,并进行校验
        //校验用户名
        var empName = $("#empname_add_input").val();
        var regName = /(^[a-z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            //alert("用户名可以使2-5为中文，或者6-16位英文");
            /*$("#empname_add_input").parent().addClass("has-error");
            $("#empname_add_input").next("span").text("用户名可以使2-5为中文，或者6-16位英文");*/

            show_validate_msg("#empname_add_input", "error", "用户名可以使2-5为中文，或者5-16位英文");

            return false;
        } else {
            /*$("#empname_add_input").parent().addClass("has-success");
            $("#empname_add_input").next("span").text("");*/
            show_validate_msg("#empname_add_input", "success", "")

        }

        //校验邮箱
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            // alert("邮箱格式不正确");
            /*  $("#email_add_input").parent().addClass("has-error");
               $("#email_add_input").next("span").text("邮箱格式不正确");*/

            show_validate_msg("#email_add_input", "error", "邮箱格式不正确");

            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
            /*  $("#email_add_input").parent().addClass("has-success");
              $("#email_add_input").next("span").text("");*/

            //上面都为true，返回true
            return true;
        }

    }

    //把上面信息抽取提示信息抽取出来
    function show_validate_msg(ele, status, msg) {
        //清除原来的状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");


        if ("success" == status) {
            //成功
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);

        } else if ("error" == status) {
            //失败
            $(ele).parent().addClass("has-error");
            $(ele).next().text(msg);

        }
    }

    //当文本内容发生改变的时候，向数据库发送ajax请求，查询是否成功，注意
    //因为是无刷新技术，所以在点击新增按钮时，需要把表单数据清空，避免下次提交时，会保存上次数据，
    // 直接提交上次数据，文本框没有变化，不会触发ajax校验。所以需要除去上次提交的数据
    $("#empname_add_input").change(function () {
        var empName = this.value; //当前文本框的值
        //发送ajx去查询数据库
        $.ajax({
            url: "/checkuse",
            data: "empname=" + empName,
            success: function (result) {
                if (result.code == "100") {
                    show_validate_msg("#empname_add_input", "success", "用户名可用");
                    $("#emp_save_btn").attr("ajax-flag", "success");
                } else {
                    show_validate_msg("#empname_add_input", "error", result.extend.va_msg);//格式错误或者检验失败
                    $("#emp_save_btn").attr("ajax-flag", "false");
                }
            }
        })
    });

    $("#email_add_input").change(function () {
        validate_add_form();

    });

    //点击保存
    $("#emp_save_btn").click(function () {

        //前端  校验输入数据的合法性
        if (!validate_add_form()) {
            return false;
        }
        //若添加的用户名不存
        if ($(this).attr("ajax-flag") == "success") {
            //发送ajx信息保存emp
            $.ajax({
                url: "/emp",
                type: "POST",
                data: $("#empAddModel form").serialize(),
                success: function (result) {
                    if (result.code == 100) {
                        //成功

                        //添加成功后，执行下面两步
                        //关闭模态框
                        $("#empAddModel").modal('hide');
                        //跳转到最后一页
                        to_page(totalRecord);

                    } else {
                        //失败
                        // console.log(result);
                        if (undefined!=result.extend.errorField.email){
                            //既是有email错误
                            show_validate_msg("#empname_add_input", "success", "用户名可用");
                        }
                        if (undefined!=result.extend.errorField.empName){
                            //empname
                            show_validate_msg("#empname_add_input", "error", result.extend.va_msg);
                        }
                    }
                }
            });
        } else {
            return false;
        }
    });


    //绑定点击事件,由于是创建按钮时后创建，事件的先绑定，所以绑定不上，需要使用下面的方法
    //link方法，但是1.7版本后该方法被删除了，使用on 代替
  /*  $(".edit_btn").link(function () {
        alert("saas");
    })*/
    $(document).on("click",".edit_btn",function () {

        //查询部门信息
        getDepts("#empUpdateModel select");

        //显示员工信息
        getEmp($(this).attr("emp_id"));

        //点击编辑时，为每一个修改按钮添加一个属性，值为 员工id，方便下面操作能够获取到员工id值
        $("#emp_update_btn").attr("emp_id",$(this).attr("emp_id"));

        //弹出模态框
        $("#empUpdateModel").modal({
            backdrop: "static"
        });



    });
     function getEmp(id){
         $.ajax({
             url:"/emp/"+id,
             type:"get",
             success:function (result) {
                 /*console.log(result);*/
                 var empDate=result.extend.emp;
                 $("#empname_update_input").text(empDate.empName);
                 $("#email_update_input").val(empDate.email);
                 $("#empUpdateModel input[name=gender]").val([empDate.gender]);
                 $("#empUpdateModel select").val([empDate.dId]);
             }

         });
     }

     //点击更新
    $("#emp_update_btn").click(function () {
        var email=$("#email_update_input").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)){
            show_validate_msg("#email_update_input","error","邮箱错误");
            return false;
        }else{
            show_validate_msg("#email_update_input","success","");
        }
        //发送ajax请求
        //发方式一：在发送数据后面添加&_method=PUT ，既是会post请求转成put请求，因为在web.xml过滤器中配置了HiddenHttpMethodFilter
        // $.ajax({
        //     url:"/emp/"+$(this).attr("emp_id"),
        //     type:"get",
        //     data:$("#empUpdateModel form").serialize()+"&_method=PUT",
        //     success:function (result) {
        //         alert(result.msg);
        //     }
        // });

        /*
        直接发put请求，需要在web.xml配置org.springframework.web.filter.HttpPutFormContentFilter过滤器。
        它的作用：将请求体中的数据解析包装成一个map，request被重新包装，request。getParameter()
        被重写。数据会重自己的封装的map中取数据
              方法二：ajax支持直接发送put请求。但是tomcat默认不会对put请求进行封装，
         */
        $.ajax({
            url:"/emp/"+$(this).attr("emp_id"),
            type:"put",
            data:$("#empUpdateModel form").serialize(),
            success:function (result) {
              //  alert(result.msg);

                //关闭模态框
                $("#empUpdateModel").modal('hide');
                //回到当前页
                to_page(currentPage);
            }
        });
    });


     //删除员工
    $(document).on("click",".delete_btn",function(){
        //
       var empName=($(this).parents('tr').find("td").eq(2).text());
       var id=$(this).attr("del_id");
       console.log(id);
        if(confirm("确认删除【"+empName+"】?")){
            $.ajax({
                url:"/emp/"+id,
                type:"DELETE",
                success:function (result) {
                   // alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    })

    //点击全选
    $(".check_all").click(function () {
        //原生dom的属性，使用prop来获取和修改，attr（）用来获取自定义的属性
      //  alert($(this).prop("checked"))
        $(".checkbox").prop("checked",$(this).prop("checked"));
    });

    //点击单个,由于这个是后面创建的，所以使用on
    $(document).on("click",".checkbox",function(){
      //  alert($(".checkbox:checked").length);
        if($(".checkbox:checked").length===5){
            $(".check_all").prop("checked",true)
        }else{
            $(".check_all").prop("checked",false)
        }
    });

    //对于被选中的，进行删除
    $("#delete_emp").click(function(){
        var ids="";

        //遍历每一个被选中的
        $.each($(".checkbox:checked"),function(){
         // console.log($(this).parents('tr').find("td:eq(2)").text())
            ids+=$(this).parents('tr').find("td:eq(1)").text()+"-";
        })
       //console.log(ids);
       ids=ids.substring(0,ids.length-1);
        console.log(ids);
        $.ajax({
            url:"/emp/"+ids,
            type:"delete",
            success:function (result) {
               // console.log(result);
                if (result.code==100){
                    console.log("成功")
                }else{
                    console.log("失败")
                }

                to_page(currentPage);
            }
        });

    });
</script>


</body>
</html>
