<%--
  Created by IntelliJ IDEA.
  User: ZhongBin
  Date: 2020/6/19
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文章分类名称管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css">
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="layui-form-item">
    <div class="layui-input-block">
        <input type="text" name="search" id="search" autocomplete="off" placeholder="输入检索信息" class="layui-input">
    </div>
</div>
<table class="layui-hide" id="categorytable" lay-filter="categorytable"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <%--        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>--%>
        <%--        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
        <button class="layui-btn layui-btn-sm" lay-event="showAddCategory">添加类别</button>
        <button class="layui-btn layui-btn-sm" lay-event="deleteCheck">删除选中</button>

    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="updateCategory">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<!-- 添加用户弹出层 -->
<div id="add-category-layer" style="display: none; padding: 20px">
    <form id="add-category-form" class="layui-form layui-form-pane">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">类别名ID</label>
            <div class="layui-input-block">
                <input type="text" name="id" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">类别名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">展示给用户</label>
            <div class="layui-input-block">
                <input type="radio" name="isdel" value=true title="不展示">
                <input type="radio" name="isdel" value=false title="展示">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn"  lay-submit id="#add-category-btn" lay-filter="add-category-form-submit">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<!-- 更新用户弹出层 -->
<div id="update-category-layer" style="display: none; padding: 20px">
    <form id="update-category-form" class="layui-form layui-form-pane" lay-filter="update-category-form">
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">类别名ID</label>
            <div class="layui-input-block">
                <input type="text" name="id" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">类别名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">展示给用户</label>
            <div class="layui-input-block">
                <input type="radio" id="updisdel1" name="isdel" value=true title="不展示">
                <input type="radio" id="updisdel0" name="isdel" value=false title="展示" checked>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="update-category-form-submit">提交</button>
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
                        //table.reload('test');
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
            elem: '#categorytable'
            ,url:'/category/allcategory'
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
                ,{field:'id', title:'分类名称ID', width:300, fixed: 'left', unresize: true, sort: true}
                ,{field:'name', title:'分类名', width:350, edit: 'text'}
                ,{field:'isdel', title:'是否展示给用户', width:300,templet:function(isdel){
                        if(isdel.isdel == true)
                            return "<font color='red'>不展示</font>"
                        if(isdel.isdel == false)
                            return "<font color='green'>展示</font>"
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
                ,search:search
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
        form.on('submit(add-category-form-submit)', function(data) {
            // ajax方式添加用户
            $.ajax({
                url: "/category/addcategory",
                type: "POST",
                data: JSON.stringify(data.field),
                contentType: 'application/json',
                dataType: 'json',
                success: function(data) {
                    if (data.status == 1) {
                        layer.close(layer.index);
                        layer.msg('添加成功');
                        table.reload('categorytable');
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
        table.on('toolbar(categorytable)', function(obj){
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
                case 'showAddCategory':
                    // 每次显示前重置表单
                    $('#add-category-form')[0].reset();
                    layer.open({
                        type: 1,
                        title: '添加类别名',
                        skin: 'layui-layer-molv',
                        area: ['500px'],
                        content: $('#add-category-layer')
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
                        url: "/category/delCheckCategory",
                        type: "PUT",
                        data: JSON.stringify(data.field),
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function (data) {
                            if (data.status == 1) {
                                layer.msg('删除成功');
                                table.reload('categorytable');
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
        table.on('tool(categorytable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('确定删除类别名'+data.name+'吗？', function(index){
                    obj.del();
                    $.ajax({
                        url: 'delcategory/' + data.id,
                        type: "DELETE",
                        dataType: 'json',
                        success: function(data) {
                            if (data.status == 1) {
                                layer.msg('删除成功');
                                table.reload('categorytable');
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

            }
            // 更新事件
            else if (obj.event === 'updateCategory') {
                // 每次显示更新用户的表单前自动为表单填写该行的数据
                form.val('update-category-form', {
                    "id": data.id,
                    "name": data.name,
                    "isdel": data.isdel,
                });
                if(data.isdel == false)
                {;
                    $("#updisdel1").removeAttr("checked");
                    $("#updisdel0").prop("checked",true);
                } else {
                    $("#updisdel0").removeAttr("checked");
                    $("#updisdel1").prop("checked",true);
                }

                form.render();
                // 显示更新用户表单的弹出层
                //$('#update-category-layer').html($('#update-category-layer').html());
                layer.open({
                    type: 1,
                    title: '编辑类别名',
                    skin: 'layui-layer-molv',
                    area: ['500px'],
                    content: $('#update-category-layer')
                });
                // 更新用户表单提交
                form.on('submit(update-category-form-submit)', function(data) {
                    // ajax方式更新用户
                    $.ajax({
                        url: "/category/updcategory",
                        type: "PUT",
                        data: JSON.stringify(data.field),
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function(data) {
                            if (data.status == 1) {
                                layer.close(layer.index);
                                layer.msg('更新成功');
                                table.reload('categorytable');
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
