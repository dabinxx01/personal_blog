<%--
  Created by IntelliJ IDEA.
  User: ZhongBin
  Date: 2020/6/17
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>

    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css">
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js" charset="utf-8"></script>
</head>
<body>
<%--<div class="layui-form-item">--%>
<%--    <div class="layui-input-block">--%>
<%--        <input type="text" name="search" id="search" autocomplete="off" placeholder="输入检索信息" class="layui-input">--%>
<%--    </div>--%>
<%--</div>--%>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
<%--        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>--%>
<%--        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
        <button class="layui-btn layui-btn-sm" lay-event="showAddUser">添加用户</button>
        <button class="layui-btn layui-btn-sm" lay-event="deleteCheck">删除选中</button>

    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="updateUser">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<!-- 添加用户弹出层 -->
<div id="add-user-layer" style="display: none; padding: 20px">
    <form id="add-user-form" class="layui-form layui-form-pane">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">用户ID</label>
            <div class="layui-input-block">
                <input type="text" name="userId" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="userName" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="email" name="email" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" class="layui-input" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">头像</label>
            <div class="layui-input-block">
                <input type="text" name="headpic" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">允许登录</label>
            <div class="layui-input-block">
                <input type="radio" name="permission" value="true" title="允许" checked>
                <input type="radio" name="permission" value="false" title="禁止">
            </div>
        </div>
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">登录次数</label>
            <div class="layui-input-block">
                <input type="number" name="logintimes" value="0" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn"  lay-submit id="#add-user-btn" lay-filter="add-user-form-submit">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<!-- 更新用户弹出层 -->
<div id="update-user-layer" style="display: none; padding: 20px">
    <form id="update-user-form" class="layui-form layui-form-pane" lay-filter="update-user-form">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">用户ID</label>
            <div class="layui-input-block">
                <input type="text" name="userId" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="userName" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="email" name="email" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" class="layui-input" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">头像</label>
            <div class="layui-input-block">
                <input type="text" name="headpic" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">允许登录</label>
            <div class="layui-input-block">
                <input type="radio" id="updper1" name="permission" value=true title="允许">
                <input type="radio" id="updper0" name="permission" value=false title="禁止">
            </div>
        </div>
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">登录次数</label>
            <div class="layui-input-block">
                <input type="text" name="logintimes" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="update-user-form-submit">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
                searchfor();
            },
            paste : function(){
                search=($('#search').val());
                searchfor();
            },
            cut : function(){
                search=($('#search').val());
                searchfor();
            }
        });
        $('#search').keyup(function(){
            search=($('#search').val());
            searchfor();
        });
        function searchfor() {
            table.reload('test');
        }
        table.render({
            elem: '#test'
            ,url:'alluser'
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
                ,{field:'userId', title:'ID', width:150, fixed: 'left', unresize: true, sort: true}
                ,{field:'userName', title:'用户名', width:150, edit: 'text'}
                ,{field:'email', title:'邮箱', width:150, edit: 'text', template: function(res){
                        return '<em>'+ res.email +'</em>'
                    }}
                ,{field:'password', title:'密码', width:150, edit: 'text', sort: true}
                ,{field:'headpic', title:'头像', width:180}
                ,{field:'logintimes', title:'登录次数', width:100}
                ,{field:'permission', title:'允许登录', width:100,templet:function(permission){
                        if(permission.permission == true)
                            return "<font color='green'>允许</font>"
                        if(permission.permission == false)
                            return "<font color='red'>禁止</font>"
                        else
                            return "<font color='blue'>未知</font>"
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
        // 添加用户表单提交
        form.on('submit(add-user-form-submit)', function(data) {
            // ajax方式添加用户
            $.ajax({
                url: "adduser",
                type: "POST",
                data: JSON.stringify(data.field),
                contentType: 'application/json',
                dataType: 'json',
                success: function(data) {
                    if (data.status == 1) {
                        layer.close(layer.index);
                        layer.msg('添加成功');
                        table.reload('test');
                    } else {
                        layer.msg('添加失败');
                    }
                },
                error: function() {
                    console.log("ajax error");
                }
            });
            // 阻止表单跳转
            return false;
        });
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
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
                        title: '添加用户',
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
                        url: "delCheckUser",
                        type: "PUT",
                        data: JSON.stringify(data.field),
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function (data) {
                            if (data.status == 1) {
                                layer.msg('删除成功');
                                table.reload('test');
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
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('确定删除用户'+data.userName+'吗？', function(index){
                    obj.del();
                    $.ajax({
                        url: 'deluser/' + data.userId,
                        type: "DELETE",
                        dataType: 'json',
                        success: function(data) {
                            if (data.status == 1) {
                                layer.msg('删除成功');
                                table.reload('test');
                            } else {
                                layer.msg('用户存在关联，删除失败');
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
            else if (obj.event === 'updateUser') {
                // 每次显示更新用户的表单前自动为表单填写该行的数据

                if (data.permission == false) {
                    $("#updper1").removeAttr("checked");
                    $("#updper0").prop("checked", true);
                } else {
                    $("#updper0").removeAttr("checked");
                    $("#updper1").prop("checked",true);
                }

                form.val('update-user-form', {
                    "userId": data.userId,
                    "userName": data.userName,
                    "password": data.password,
                    "email": data.email,
                    "headpic": data.headpic,
                    "permission": data.permission,
                    "logintimes": data.logintimes
                });
                form.render();
                // 显示更新用户表单的弹出层
                layer.open({
                    type: 1,
                    title: '编辑用户',
                    skin: 'layui-layer-molv',
                    area: ['500px'],
                    content: $('#update-user-layer')
                });
                // 更新用户表单提交
                form.on('submit(update-user-form-submit)', function(data) {
                    // ajax方式更新用户
                    $.ajax({
                        url: "upduser",
                        type: "PUT",
                        data: JSON.stringify(data.field),
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function(data) {
                            if (data.status == 1) {
                                layer.close(layer.index);
                                layer.msg('更新成功');
                                table.reload('test');
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
