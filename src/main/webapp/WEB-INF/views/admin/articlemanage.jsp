<%--
  Created by IntelliJ IDEA.
  User: ZhongBin
  Date: 2020/6/18
  Time: 8:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>文章管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css">
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="/static/editor.md/css/editormd.css" />
    <script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/editor.md/editormd.js"></script>
    <script src="/static/js/paste-upload-img.js" type="text/javascript"></script>
</head>
<body>
<%--<div class="layui-form-item">--%>
<%--    <div class="layui-input-block">--%>
<%--        <input type="text" name="search" id="search" autocomplete="off" placeholder="输入检索信息" class="layui-input">--%>
<%--    </div>--%>
<%--</div>--%>
<table class="layui-hide" id="dataTable" lay-filter="dataTable"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <%--        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>--%>
        <%--        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
        <button class="layui-btn layui-btn-sm" lay-event="deleteCheck">删除选中</button>

    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="updateItem">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="recycle">回收站</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<!-- 添加用户弹出层 -->


<!-- 更新用户弹出层 -->
<div id="update-item-layer" style="display: none; padding: 20px">
    <form id="update-item-form" class="layui-form layui-form-pane" lay-filter="update-item-form">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">文章ID</label>
            <div class="layui-input-block">
                <input type="text" name="id" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" maxlength="100" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <div id="test-editor">
                <textarea class="layui-textarea" style="display:none;" name="detail"
                          lay-verify="required" id="display_detail"></textarea>

                <script>
                    $(function() {
                        var editor = editormd("test-editor", {
                            path   : "/static/editor.md/lib/",
                            theme : "dark",
                            imageUpload : true,
                            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                            imageUploadURL : "uploadArticleImage",
                            toolbarAutoFixed : false,
                            previewTheme: "dark",
                            editorTheme: "pastel-on-dark",
                            saveHTMLToTextarea: true,
                            searchReplace : true,
                            placeholder:'在此编写您的博客文章。。。',
                            markdown: "",
                            onload : function() {
                                initPasteDragImg(this); //必须
                            }
                        });
                        $('#hide_detail').bind('input propertychange', function(){
                            $(".editormd-markdown-textarea").val($("#hide_detail").val());
                            $("#display_detail").val($("#hide_detail").val());

                        });
                    });
                </script>
            </div>
            <input type="hidden" name="detailget" id="hide_detail">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章类别</label>
            <div class="layui-input-inline">
                <select name="categoryid" id="categoryid" lay-verify="required" lay-search="">
                    <option value="">选择或搜索</option>
                    <c:forEach items="${categories}" var="category">
                        <option value='<c:out value="${category.id}"></c:out>'><c:out value="${category.name}"></c:out></option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章所属</label>
            <div class="layui-input-inline">
                <select name="adminid" id="adminid" lay-verify="required" lay-search="">
                    <option value="">选择或搜索</option>
                    <c:forEach items="${admins}" var="admin">
                        <option value='<c:out value="${admin.id}"></c:out>'><c:out value="${admin.name}"></c:out></option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否公开</label>
            <div class="layui-input-block">
                <input type="radio" id="updper1" name="ispublic" value=true title="公开">
                <input type="radio" id="updper0" name="ispublic" value=false title="私密">
            </div>
        </div>
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">发布时间</label>
            <div class="layui-input-block">
                <input type="text" name="creattime" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">浏览量</label>
            <div class="layui-input-block">
                <input type="text" name="looktimes" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">是否加入回收站</label>
            <div class="layui-input-block">
                <input type="text" name="isdel" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="update-item-form-submit">保存修改</button>
            </div>
        </div>
    </form>
</div>



<script>
    var search="";

    layui.use('table', function(){
        var $ = layui.$;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        $('#search').bind({
            copy : function(){
                search=($('#search').val());
                searchfor(search);
            },
            paste : function(){
                search=($('#search').val());
                searchfor(search);
            },
            cut : function(){
                search=($('#search').val());
                searchfor(search);
            }
        });
        $('#search').keyup(function(){
            search=($('#search').val());
            searchfor(search);
        });
        function searchfor(likeInput) {
            $.ajax({
                url: "search?search="+likeInput,
                type: "GET",
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    if (data.status == 1) {
                        //layer.close(layer.index);
                        //layer.msg('成功');
                        //table.reload('dataTable');
                    } else {
                        //layer.msg('添加失败');
                    }
                },
                error: function () {
                    console.log("ajax error");
                }
            });
        }
        table.render({
            elem: '#dataTable'
            ,url:'allarticle'
            ,method: 'get'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'文章ID', width:200, fixed: 'left', unresize: true, sort: true,templet:function(id){
                        return '<a href="articledetail?id='+id.id+'">'+id.id+'</a>';
                    }}
                ,{field:'title', title:'文章标题', width:200}
                ,{field:'creattime', title:'发布时间', width:160, sort: true}
                ,{field:'looktimes', title:'浏览量', width:100}
                ,{field:'adminid', title:'文章所属', width:200}
                ,{field:'ispublic', title:'是否公开', width:120,templet:function(ispublic){
                        if(ispublic.ispublic == true)
                            return "<font color='green'>公开</font>"
                        if(ispublic.ispublic == false)
                            return "<font color='blue'>私密</font>"
                        else
                            return "<font color='red'>未知</font>"
                    }
                }
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
            ]]
            ,page: true
            ,request: {
                pageName: 'curr' //页码的参数名称，默认：page
                ,limitName: 'nums' //每页数据量的参数名，默认：limit
            }
        });
        // 显示添加用户弹出层
        // $('#add-user-btn').click(function() {
        //     // 每次显示前重置表单
        //     $('#add-user-form')[0].reset();
        //     layer.open({
        //         type: 1,
        //         title: '添加用户',
        //         skin: 'layui-layer-molv',
        //         area: ['500px'],
        //         content: $('#add-user-layer')
        //     });
        // });

        //头工具栏事件
        table.on('toolbar(dataTable)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
                case 'showAddUser':
                    // 每次显示前重置表单
                    $('#add-user-form')[0].reset();
                    layer.open({
                        type: 1,
                        title: '添加',
                        skin: 'layui-layer-molv',
                        area: ['500px'],
                        content: $('#add-user-layer')
                    });
                    break;
                case 'deleteCheck':
                    var data = checkStatus.data;
                    if(data.length==0)
                    {
                        layer.msg('未选中任何项！');
                        break;
                    }
                    // ajax方式更新用户
                    $.ajax({
                        url: "delCheck",
                        type: "PUT",
                        data: JSON.stringify(data.field),
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function (data) {
                            if (data.status == 1) {
                                layer.close(layer.index);
                                layer.msg('删除成功');
                                table.reload('dataTable');
                            } else {
                                layer.msg('删除失败');
                            }
                        },
                        error: function () {
                            console.log("ajax error");
                        }
                    });
                    break;
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('你可以添加自定义功能');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(dataTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('确定删除文章'+data.title+'吗？', function(index){
                    obj.del();
                    $.ajax({
                        url: 'delarticle/' + data.id,
                        type: "DELETE",
                        dataType: 'json',
                        success: function(data) {
                            if (data.status == 1) {
                                layer.msg('删除成功');
                                table.reload('dataTable');
                            } else {
                                layer.msg('删除失败');
                            }
                        },
                        error: function() {
                            console.log("ajax error");
                        }
                    });
                    layer.close(index);
                });

            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
            // 更新用户事件
            else if (obj.event === 'updateItem') {
                // 每次显示更新用户的表单前自动为表单填写该行的数据

                if(data.ispublic == false)
                {
                    $("#updper1").removeAttr("checked");
                    $("#updper0").prop("checked", true);
                } else {
                    $("#updper0").removeAttr("checked");
                    $("#updper1").prop("checked", true);
                }

                form.val('update-item-form', {
                    "id": data.id,
                    "title": data.title,
                    "categoryid": data.categoryid,
                    "detailget": data.detail,
                    "creattime": data.creattime,
                    "ispublic": data.ispublic,
                    "looktimes": data.looktimes,
                    "adminid":data.adminid,
                    "isdel":data.isdel,
                });
                $("#display_detail").val($("#hide_detail").val());
                $("#display_detail").html($("#hide_detail").val());
                $("#test-editor").html($("#test-editor").html());
                var categoryidval=data.categoryid;
                $("#categoryid option[value='']").removeAttr("selected");
                $("#categoryid option[value='"+categoryidval+"']").attr("selected","selected");
                var adminidval=data.adminid;
                $("#adminid option[value='']").removeAttr("selected");
                $("#adminid option[value='"+adminidval+"']").attr("selected","selected");
                form.render();
                // 显示更新表单的弹出层
                layer.open({
                    type: 1,
                    title: '编辑文章',
                    skin: 'layui-layer-molv',
                    area: ['100%','100%'],
                    content: $('#update-item-layer')
                });
                // 更新表单提交
                form.on('submit(update-item-form-submit)', function(data) {
                    // ajax方式更新
                    $.ajax({
                        url: "updarticle",
                        type: "PUT",
                        data: JSON.stringify(data.field),
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function(data) {
                            if (data.status == 1) {
                                layer.close(layer.index);
                                layer.msg('更新成功');
                                table.reload('dataTable');
                            } else {
                                layer.msg('更新失败');
                            }
                        },
                        error: function() {
                            console.log("ajax error");
                        }
                    });
                    // 阻止表单跳转
                    return false;
                });
            }
        });
    });
</script>
</body>
</html>
