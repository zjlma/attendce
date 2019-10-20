<%@ page import="com.aboluo.attend.pojo.Emp" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/11
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
    Emp emp = (Emp) session.getAttribute("session_emp");
    String s = null;
    if(emp.getLevel()==3){
        s = "超级管理员";
    }
    if(emp.getLevel()==2){
        s = "管理员";
    }
    if(emp.getLevel()==1){
        s = "职员";
    }
    response.setHeader("Pragma","No-Cache");
    response.setHeader("Cache-Control","No-Cache");
    response.setDateHeader("Expires", 0);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>员工考勤管理系统</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />

    <style>
        #jump_page_input{
            width: 35px;
            height:20px;
            border-radius: 5%;
            text-align: center;
            font-family: '黑体';
        }
        #emp_table tr{
            height: 39px;
        }
    </style>

    <!-- 引入js文件 -->
    <!-- jQuery -->
    <script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=basePath%>js/metisMenu.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
    <script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="<%=basePath%>js/sb-admin-2.js"></script>
    <script src="<%=basePath%>js/myPage.js"></script>

</head>
<body>
<script type="application/javascript">

    $(document).ready(function(e) {
        var counter = 0;
        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                window.history.pushState('forward', null, '#');
                window.history.forward(1);
                //alert("不可回退");
            });
        }

        window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
        window.history.forward(1);
    });


    //退出按钮
    function tuichu() {
        sessionStorage.clear();
        window.location.replace("${pageContext.request.contextPath }/#");
    }

</script>

<nav class="navbar navbar-default navbar-static-top" role="navigation"
     style="margin-bottom: 0">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">员工考勤管理系统</a>
    </div>
    <div style="float:right;margin: 12px 80px 0 0;"><span style="font-size: 14px;">欢迎使用!&nbsp;<%=s%>,<%=emp.getEmp_name()%>&nbsp;</span><img src="<%=basePath%>imgs/tuichu.png" alt="" onclick="tuichu()" style="cursor: pointer;height: 25px; width: 25px;">
    </div>
    <!-- 左侧显示列表部分 start-->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <div class="row">
                        <div class="col-md-12">
                            <h3 style="color: #337ab7;margin:20px 15px;">员工管理</h3>
                        </div>

                        <!-- /.col-lg-12 -->
                    </div>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/manager/empList" >
                        <span class="glyphicon glyphicon-user" aria-hidden="true" style="padding: 3px 0 3px 0;"></span> 员工信息
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/manager/empCharts" >
                        <span class="glyphicon glyphicon-signal" aria-hidden="true" style="padding: 3px 0 3px 0;"></span> 统计图表
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/attend/atdList" >
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="padding: 3px 0 3px 0;"></span> 考勤记录
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/manager/adminInfo">
                        <span class="glyphicon glyphicon-user" aria-hidden="true" style="padding: 3px 0 3px 0;"></span> 个人信息
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧显示列表部分 end-->
</nav>

<!-- 员工列表查询部分  start-->
<div id="page-wrapper">

    <%--搜索部分 start--%>
    <div class="row">

        <div style="width: 15%;float: left;margin: 5px 0px 5px 20px">
            <h3><b>搜索查询</b></h3>
        </div>

        <div style="margin: 20px 5px 15px;float: left;">
            <form class="form-inline" method="get" action="${pageContext.request.contextPath }/#">
                <div class="form-group">
                    <label for="search_dept">所属部门</label>
                    <select	class="form-control" id="search_dept" name="dept">
                        <option value="">--请选择--</option>
                        <option value="智能物联">智能物联</option>
                        <option value="java大数据">java大数据</option>
                    </select>
                </div>
                <div class="form-group" style="margin:0px 20px">
                    <label for="search_gender">性别</label>
                    <select	class="form-control" id="search_gender" name="gender">
                        <option value="">--请选择--</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="search_disable">禁用状态</label>
                    <select	class="form-control" id="search_disable" name="disable">
                        <option value="">--请选择--</option>
                        <option value="0">非禁用</option>
                        <option value="1">已禁用</option>
                    </select>
                </div>
            </form>
        </div>

        <div style="float: left;margin: 20px 5px 15px;">
            <button class="btn btn-primary" style="margin: 0 10px 0 20px" id="condition_srch">搜索</button>
            <button class="btn btn-primary" id="reset">重置</button>
        </div>
        <hr width="100%"/>
    </div>
    <%--搜索部分 end--%>

    <%--员工信息表格 start--%>
        <a href="#" class="btn btn-primary" data-toggle="modal"
           data-target="#newEmpDialog" onclick="clearEmpInfo()">新建</a>
        <div class="btn-group">
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#importModal"><span
                    class="glyphicon glyphicon-import"></span> 导入
            </button>
            <button type="button" class="btn btn-default" onclick="outputEmpInfo()"><span class="glyphicon glyphicon-export"></span> 导出</button>
        </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">员工信息列表

                    <div class="input-group custom-search-form" style="width: 25%;float: right;margin: -7px 10px 0px 0px;">
                        <input type="text" class="form-control"  placeholder="查询内容..." id="search_input">
                        <span class="input-group-btn">
							<button class="btn btn-default" type="button" id="mh_srch">
                                <!--搜索图标-->
                                <span class="glyphicon glyphicon-search" aria-hidden="true" style="padding: 3px 0 3px 0;"></span>
                            </button>
						</span>
                    </div>
                </div>
                <%--数据表格 start--%>
                <table class="table table-bordered table-striped" id="emp_table" style="text-align: center;font-size: 14px;">
                    <thead>
                    <tr>
                        <th width="69px" height="39px">编号</th>
                        <th width="184px">部门</th>
                        <th width="94px">姓名</th>
                        <th width="164px">学号</th>
                        <th width="71px">性别</th>
                        <th width="165px">电话</th>
                        <th width="87px">地址</th>
                        <th width="102px">密码</th>
                        <th width="116px">禁用状态</th>
                        <th width="149px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.emps}" var="row">
                        <tr>
                            <td>${row.emp_id}</td>
                            <td>${row.dept}</td>
                            <td>${row.emp_name}</td>
                            <td>${row.stu_id}</td>
                            <td>${row.gender}</td>
                            <td>${row.tel}</td>
                            <td>${row.address}</td>
                            <td>${row.password}</td>
                            <c:choose>
                                <c:when test="${row.disable == 0}">
                                    <td><button type="button" class="btn btn-info btn-xs">非禁用</button></td>
                                </c:when>
                                <c:otherwise>

                                    <td><button type="button" class="btn btn-danger btn-xs">已禁用</button></td>
                                </c:otherwise>
                            </c:choose>
                            <td>
                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editEmpDialog" id="edit_emp" onclick= "editEmpInfo(this, ${row.emp_id})">修改</a>
                                <a href="#" class="btn btn-danger btn-xs" id="delete_emp" onclick="deleteEmpInfo(this, ${row.emp_id})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- 数据表格 end -->

            </div>
            <!-- /.panel -->
            <!--分页-->
            <div style="height: 50px;">
                <div class="col-lg-8" style="margin-top: -10px;font-size: 15px;">
                    <span >
                        总共有 <label id="emp_total">${page.total}</label> 条记录,当前为 <label id="now_page"> ${page.now_page} </label> 页,&nbsp&nbsp 跳转至
                        <input type="text"  id="jump_page_input"/> 页
                        <button type="button" class="btn btn-primary btn-xs" style="height: 20px;width: auto" onclick="get_jump_page()">跳转</button>
                    </span>
                </div>
                <!-- /.col-lg-12 -->
                <nav aria-label="Page navigation" style="margin-top: -35px;position: absolute;right:15px;">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous" id="pre" onclick="jump_page(this)">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#"  id="li_1" onclick="jump_page(this)">1</a></li>
                        <li><a href="#" id="more_1" hidden="hidden">...</a></li>
                        <li><a href="#" id="li_2" hidden="hidden" onclick="jump_page(this)">2</a></li>
                        <li><a href="#" id="li_3" hidden="hidden" onclick="jump_page(this)">3</a></li>
                        <li><a href="#" id="li_4" hidden="hidden" onclick="jump_page(this)">4</a></li>
                        <li><a href="#" id="li_5" hidden="hidden" onclick="jump_page(this)">5</a></li>
                        <li><a href="#" id="more_2" hidden="hidden">...</a></li>
                        <li><a href="#" id="li_end" hidden="hidden" onclick="jump_page(this)"></a></li>
                        <li>
                            <a href="#" aria-label="Next" id="next" onclick="jump_page(this)">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
</div>
<!-- 员工表格部分  end-->

<%--分页 start--%>
<script type="application/javascript">

    var emp_total = parseInt($("#emp_total").text());
    var now_page_index = parseInt($("#now_page").text());
    var page_size = 7;
    var page_total = emp_total % page_size == 0 ? emp_total/page_size : parseInt(emp_total/page_size) + 1;
    var search_state = 1;

    /*初始化分页ui*/

    $(function(){
        init_page();
    })



    //遍历员工数据，将数据添置表格中
    function each_emps(emps) {
        var table = document.getElementById("emp_table");
        for (var i=0; i<emps.length; i++){
            var cells = table.rows[i+1].cells;
            table.rows[i+1].cells[0].innerText = emps[i]["emp_id"] == undefined ? "" : emps[i]["emp_id"];
            table.rows[i+1].cells[1].innerText = emps[i]["dept"] == undefined ? "" : emps[i]["dept"];
            table.rows[i+1].cells[2].innerText = emps[i]["emp_name"] == undefined ? "" : emps[i]["emp_name"] ;
            table.rows[i+1].cells[3].innerText = emps[i]["stu_id"] == undefined ? "" : emps[i]["stu_id"];
            table.rows[i+1].cells[4].innerText = emps[i]["gender"] == undefined ? "" : emps[i]["gender"];
            table.rows[i+1].cells[5].innerText = emps[i]["tel"] == undefined ? "" : emps[i]["tel"];
            table.rows[i+1].cells[6].innerText = emps[i]["address"] == undefined ? "" : emps[i]["address"];
            table.rows[i+1].cells[7].innerText = emps[i]["password"] == undefined ? "" : emps[i]["password"];
            if(emps[i]["disable"] == "0"){
                table.rows[i+1].cells[8].innerHTML = "<button type='button' class='btn btn-info btn-xs'>非禁用</button>";
            }else if(emps[i]["disable"] == "1"){
                table.rows[i+1].cells[8].innerHTML = "<button type='button' class='btn btn-danger btn-xs'>已禁用</button>";
            }
            table.rows[i+1].cells[9].innerHTML = " <a href='#' class='btn btn-primary btn-xs' data-toggle='modal' data-target='#editEmpDialog' id='edit_emp_" + i + "' onclick='editEmpInfo(this)'>修改</a>" +
                "   <a href='#' class='btn btn-danger btn-xs' id='delete_emp_" + i + "'onclick='deleteEmpInfo(this)'>删除</a>";

        }
    }

    //根据页数获取员工数据
    function getEmpByPage(page) {
        var page_url;
        var data;
        var dept = $("#search_dept").val();
        var gender = $("#search_gender").val();
        var disable = $("#search_disable").val();
        var srch_content = $("#search_input").val()
        if(dept.indexOf("大数据") != -1){
            dept = "大数据";
        }else{
            if (dept != ""){
                dept = "智能物联";
            }
        }
        if (search_state == 1){
            page_url = "${pageContext.request.contextPath }/manager/empList/" + page;
            data = {};
        }else if(search_state == 2){
            page_url = "${pageContext.request.contextPath }/manager/srch_result";
            data = eval("(" + "{dept:'" + dept+ "',gender:'" + gender + "',disable:'"+ disable +"',start_index:'" + page + "'}" +")")
        }else{
            page_url = "${pageContext.request.contextPath }/manager/mh_srch";
            data = eval("(" + "{srch_content:'" + srch_content+ "',page:'" + page + "'}" +")")
        }
        $.ajax({
            url:page_url,
            type:"get",
            data:data,
            dataType:"json",
            success:function (data) {
                $("#emp_total").text(data.total);
                emp_total = data.total;
                page_total = emp_total % page_size == 0 ? emp_total/page_size : parseInt(emp_total/page_size) + 1;
                $("#now_page").text(data.now_page);
                if (page_total == page){
                    clear_table()
                }
                each_emps(data.emps);
            }
        })

    }

</script>
<%--分页 end--%>

<%--搜索查询 start--%>
<script type="application/javascript">

    //重置
    function reset(){
        $("#search_dept").val("");
        $("#search_gender").val("");
        $("#search_disable").val("");
        search_state = 1;
        window.location.reload()
    }

    //重置事件
    $(function () {
        $("#reset").click(function () {
            reset();
        })
    })

    //条件查询
    $(function () {
        $("#condition_srch").click(function () {
            var dept = $("#search_dept").val();
            var gender = $("#search_gender").val();
            var disable = $("#search_disable").val();
            if(dept.indexOf("大数据") != -1){
                dept = "大数据";
            }else{
                if (dept != ""){
                    dept = "智能物联";
                }
            }
            clear_table();

            $.ajax({
                url:"${pageContext.request.contextPath}/manager/tj_srch",
                type:"get",
                data:{dept:dept, gender:gender, disable:disable, start_index:1},
                dataType:"json",
                success:function (data) {
                    $("#emp_total").text(data.total);
                    emp_total = data.total;
                    page_total = emp_total % page_size == 0 ? emp_total/page_size : parseInt(emp_total/page_size) + 1;
                    $("#now_page").text(data.now_page);
                    hide_page();
                    init_page();
                    search_state = 2;
                    each_emps(data.emps);
                }
            })
        })
    })

    //模糊查询
    $(function () {
        $("#mh_srch").click(function () {
            var search_content = $("#search_input").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/manager/mh_srch",
                data:{srch_content:search_content},
                type:"get",
                dataType:"json",
                success:function (data) {
                    $("#emp_total").text(data.total);
                    emp_total = data.total;
                    page_total = emp_total % page_size == 0 ? emp_total/page_size : parseInt(emp_total/page_size) + 1;
                    $("#now_page").text(data.now_page);
                    hide_page();
                    init_page();
                    search_state = 3;
                    clear_table();
                    each_emps(data.emps);
                }
            })
        })
    })

</script>
<%--搜索查询 end--%>

<%--导入导出--%>
<script type="application/javascript">
    function imputEmpInfo() {
        var form = new FormData($("#file_form")[0]);
        $.ajax({
            url:"${pageContext.request.contextPath}/manager/upload",
            type:"post",
            data:form,
            //必须false才会避开jQuery对 formdata 的默认处理
            //XMLHttpRequest会对 formdata 进行正确的处理
            processData:false,
            //必须false才会自动加上正确的Content-Type
            contentType:false,
            scriptCharset: 'UTF-8',
            success:function (data) {
                if (data == "ok"){
                    alert("上传成功")
                }else{
                    alert("上传时失败")
                }
            }
        })
    }

    function outputEmpInfo() {
        window.location.href = "${pageContext.request.contextPath}/manager/downloadEmp";
    }

</script>

<!-- 导入员工信息的模态窗口 start-->
<div class="modal fade" id="importModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">导入员工信息</h4>
            </div>
            <div class="modal-body" style="height: 350px;">
                <div style="position: relative;top: 20px; left: 50px;">
                    请选择要上传的文件：<small style="color: gray;">[仅支持.xls或.xlsx格式]</small>
                </div>
                <div style="position: relative;top: 40px; left: 50px;">
                    <form id="file_form" enctype="multipart/form-data;charset=utf-8">
                        <input type="file" name="import_file" accept="application/vnd.ms-excel">
                    </form>
                </div>
                <div style="position: relative; width: 400px; height: 320px; left: 45% ; top: -40px;" >
                    <h3>重要提示</h3>
                    <ul>
                        <li>请确认您的文件大小不超过5MB。</li>
                        <li>从XLS/XLSX文件中导入全部重复记录都会被忽略。</li>
                        <li>日期值必须为MM/dd/yyyy格式。任何其它格式的日期都将被忽略。</li>
                        <li>日期时间必须符合MM/dd/yyyy hh:mm:ss的格式，其它格式的日期时间将被忽略。</li>
                        <li>默认情况下，字符编码是UTF-8 (统一码)，请确保您导入的文件使用的是正确的字符编码方式。</li>
                        <li>建议您在导入真实数据之前用测试文件测试文件导入功能。</li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="imputEmpInfo()">导入</button>
            </div>
        </div>
    </div>
</div>
<!-- 导入员工信息的模态窗口 end-->

<!-- 创建员工模态框 start-->
<div class="modal fade" id="newEmpDialog" tabindex="-1" role="dialog"
     aria-labelledby="create_ModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="create_ModalLabel">新建员工信息</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="new_emp_form">
                    <div class="form-group">
                        <label for="new_emp_id" class="col-sm-2 control-label">
                            员工编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_emp_id" placeholder="员工编号" name="emp_id" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_dept" style="float:left;padding:7px 15px 0 27px;">所属部门</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_dept"  name="dept">
                                <option value="">--请选择--</option>
                                <option value="智能物联">智能物联</option>
                                <option value="java大数据">java大数据</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_gender" style="float:left;padding:7px 15px 0 55px;">性别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_gender"  name="gender">
                                <option value="">--请选择--</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="new_emp_name" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_emp_name" placeholder="员工姓名" name="emp_name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_stu_id" class="col-sm-2 control-label">学号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_stu_id" placeholder="学号" name="stu_id" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_tel" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_tel" placeholder="移动电话" name="tel" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_address" class="col-sm-2 control-label">居住地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_address" placeholder="居住地址" name="address" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createEmp()">创建员工</button>
            </div>
        </div>
    </div>
</div>
<%--创建新建员工信息模态框 end--%>


<%--修改员工信息模态框 start--%>
<div class="modal fade" id="editEmpDialog" tabindex="-1" role="dialog"
     aria-labelledby="edit_modalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="edit_modalLabel">修改员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_emp_form">
                    <div class="form-group">
                        <label for="edit_emp_id" class="col-sm-2 control-label">
                            员工编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_emp_id" placeholder="员工编号" name="emp_id"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_dept" style="float:left;padding:7px 15px 0 27px;">所属部门</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_dept"  name="dept">
                                <option value="">--请选择--</option>
                                <option value="智能物联">智能物联</option>
                                <option value="java大数据">java大数据</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_gender" style="float:left;padding:7px 15px 0 55px;">性别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_gender"  name="gender">
                                <option value="">--请选择--</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="edit_emp_name" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_emp_name" placeholder="员工姓名" name="emp_name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_stu_id" class="col-sm-2 control-label">学号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_stu_id" placeholder="学号" name="stu_id" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_tel" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_tel" placeholder="移动电话" name="tel" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">居住地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_address" placeholder="居住地址" name="address" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_password" placeholder="密码" name="password" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_disable" style="float:left;padding:7px 15px 0 27px;">禁用状态</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_disable"  name="disable">
                                <option value="">--请选择--</option>
                                <option value="0">非禁用</option>
                                <option value="1">禁用</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updateEmpInfo()">修改员工</button>
            </div>
        </div>
    </div>
</div>
<%--修改模态框 end--%>


<%--对数据进行增删改查--%>
<script type="application/javascript">

    //存储按钮的id
    var temp_id;

    //清空新建客户窗口中的数据
    function clearEmpInfo() {
        $("#new_emp_id").val("");
        $("#new_dept").val("");
        $("#new_emp_name").val("");
        $("#new_gender").val("");
        $("#new_tel").val("");
        $("#new_address").val("");
        $("#new_stu_id").val("");
    }

    //清空修改框的信息
    function clearEditInfo() {
        //清除输入框中的内容
        $("#edit_emp_id").val("");
        $("#edit_emp_name").val("");
        $("#edit_gender").val("");
        $("#edit_stu_id").val("");
        $("#edit_tel").val("");
        $("#edit_address").val("");
        $("#edit_dept").val("");
        $("#edit_password").val("");
        $("#edit_disable").val("");
    }

    //添加员工信息
    /*
    * ajax以序列化表单的形式向后台提交数据时，序列化的数据不是json格式，
    * 所以不用写contentType : "application/json;charset=utf-8"和dataType : 'json'。
    * 否则后台解析不出来，无法注入bean
    *
    * */
    function createEmp() {
        $.ajax({
            url:"${pageContext.request.contextPath}/manager/create",
            type:"post",
            data:$("#new_emp_form").serialize(),
           /* contentType : "application/json;charset=utf-8",
            dataType : 'json',*/
            success:function(result){
                if (result == "successful") {
                    alert("添加成功！");
                    window.location.reload();
                }else{
                    alert("客户创建失败！");
                    //window.location.reload();
                }
            },
            error : function(result) {
                alert("系统异常");
            }

        })

    }

    //通过id获取员工信息，并将信息显示到模态框
    function editEmpInfo(obj, id) {
        clearEditInfo();
        var emp_id;
        if (id == undefined){
            var tr = $("#" + obj.id).parent().parent();
            emp_id = tr.children("td").eq(0).text();
            temp_id = emp_id;
        }else{
            emp_id = id;
            temp_id = emp_id;
        }

        $.ajax({
            url:"${pageContext.request.contextPath}/manager/selectEmpById",
            type:"get",
            data:{"emp_id":emp_id},
            contentType :"application/json;charset=utf-8",
            dataType:"json",
            success:function (result) {

                $("#edit_emp_id").val(result.emp_id);
                if (result.dept.indexOf("大数据") != -1){
                    $("#edit_dept").val("java大数据");
                }else{
                    $("#edit_dept").val("智能物联");
                }
                $("#edit_emp_name").val(result.emp_name);
                $("#edit_gender").val(result.gender);
                $("#edit_stu_id").val(result.stu_id);
                $("#edit_tel").val(result.tel);
                $("#edit_address").val(result.address);
                $("#edit_password").val(result.password);
                $("#edit_disable").val(result.disable);
            },
            error:function (e) {
                alert("系统异常!")
            }

        })
    }

    //更新员工信息
    function updateEmpInfo(){
        var now_page = $("#now_page").text();
        var table = document.getElementById("emp_table");
        $.post("${pageContext.request.contextPath}/manager/updateEmp", $("#edit_emp_form").serialize(),function (data) {
            if (data == "ok"){
                if (table.rows[2].cells[0].innerText == ""){
                    now_page = parseInt(now_page) - 1;
                    getEmpByPage(now_page);
                    window.location.reload();
                }else{
                    clear_table()
                    getEmpByPage(now_page);
                }
            }else{
                alert("修改失败")
                //window.location.reload();
            }
        })
    }

    //删除员工信息
    function deleteEmpInfo(obj, id) {
        var emp_id;
        if (id == undefined){
            var tr = $("#" + obj.id).parent().parent();
            emp_id = tr.children("td").eq(0).text();
        }else{
            emp_id = id;
        }

        var now_page = $("#now_page").text();
        var table = document.getElementById("emp_table");
        if(confirm("你确定要删除该员工吗？")){
            $.post("${pageContext.request.contextPath}/super/delete",
                {"emp_id": emp_id},
                function (data) {
                    if (data == "ok"){
                        if (table.rows[2].cells[0].innerText == ""){
                            now_page = parseInt(now_page) - 1;
                            getEmpByPage(now_page);
                            window.location.reload();
                        }else{
                            clear_table();
                            getEmpByPage(now_page);
                        }

                    }else{
                        alert("删除失败")
                    }
                }
            )
        }

    }

</script>
<%--对数据进行增删改查 end--%>

</body>
</html>
