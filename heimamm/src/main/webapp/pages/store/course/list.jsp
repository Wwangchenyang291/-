<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../base.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>黑马面面管理系统</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- 页面meta /-->

</head>
<script>
    function deleteById() {
        let ids = getCheckId()
        if(ids) {
            if(confirm("你确认要删除此条记录吗？")) {
                location.href="${ctx}/store/Course/deleteByIds?ids="+ids;
            }
        }else{
            alert("请勾选待处理的记录，且每次至少勾选一个")
        }
    }
</script>
<body>
<div id="frameContent" class="content-wrapper" style="margin-left:0px;">
<section class="content-header">
    <h1>
        题库管理
        <small>学科管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
    </ol>
</section>
<!-- 内容头部 /-->

<!-- 正文区域 -->
<section class="content">

    <!-- .box-body -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">学科列表</h3>
        </div>

        <div class="box-body">

            <!-- 数据表格 -->
            <div class="table-box">

                <!--工具栏-->
                <div class="pull-left">
                    <div class="form-group form-inline">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default" title="新建" onclick='location.href="${ctx}/pages/store/course/add.jsp"'><i class="fa fa-file-o"></i> 新建</button>
                            <button type="button" class="btn btn-default" title="删除" onclick='deleteById()'><i class="fa fa-trash-o"></i> 删除</button>
                            <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                        </div>
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        <input type="text" class="form-control input-sm" placeholder="搜索">
                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                </div>
                <!--工具栏/-->

                <!--数据列表-->
                <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                    <thead>
                    <tr>
                        <th class="" style="padding-right:0px;">
                            <input type="checkbox" name="selid" onclick="checkAll('id',this)">
                        </th>
                        <th class="sorting">序号</th>
                        <th class="sorting">学科名称</th>
                        <th class="sorting">学科简介</th>
                        <th class="sorting">学科状态</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="course" varStatus="status">
                    <tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'" >
                        <td><input type="checkbox" name="id" value="${course.id}"/></td>
                        <td>${status.index+1}</td>
                        <td>${course.name}</td>
                        <td>${course.remark}</td>
                        <td>${course.state eq "1" ? "<font color='green'>正常</font>" : "<font color='red'>禁用</font>"}</td>
                        <th class="text-center">
                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${ctx}/store/Course/toUpdate?id=${course.id}"'>编辑</button>
                        </th>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="box-footer">
            <jsp:include page="../../common/page.jsp">
                <jsp:param value="${ctx}/store/Course/findAll" name="pageUrl"/>
            </jsp:include>
        </div>
    </div>
</section>
</div>
</body>

</html>