<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }
    .title-input{
        width: 100%;
        padding: 20px;
        text-align: center;
    }
    .title-input .articleTitle{
        padding:0 150px 0 20px;
        border: 1px solid #aaa;
        border-radius:10px ;
        height: 80px;
        line-height: 80px;
        font-size: 40px;
        font-weight:bold ;
        font-family: "等线";
        outline: none;
        color:#111;
        width: 100%;
    }
    .title-box{
        position: relative;
        width: 80%;
    }
    #wordnumber{
        position: absolute;
        right:20px;
        top:0;
        height:80px;
        line-height: 80px;
        font-family: "等线";
        color:#aaa;
        color:rgb(215,50,50);
        font-size: 40px;
    }
</style>

<form method="post" id="article-add-form" action="publicArticle">
    <div id="article-kind-layer" style="display: none; padding: 20px">
        <div id="article-kind-form" class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <label class="layui-form-label">文章标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" id="title" class="layui-input" lay-verify="required" maxlength="100">
                </div>
            </div>
            <div class="layui-form-item">

                <label class="layui-form-label">文章类别</label>
                <div class="layui-input-inline">
                    <select name="category" lay-verify="required" lay-search="">
                        <option value="001">选择或搜索</option>
                        <option value="001">Java</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否公开</label>
                <div class="layui-input-block">
                    <input type="radio" name="ispublic" value="true" title="公开" checked>
                    <input type="radio" name="ispublic" value="false" title="私密">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn"  lay-submit id="article-kind-submit-btn"
                            lay-filter="add-article-form-submit" type="submit">确认发布文章</button>
                </div>
            </div>
        </div>
    </div>
    <div class="title-input">
        <div style="display: inline-block;" class="title-box">
            <label id="wordnumber">0/100</label>
            <input type="text" name="titleInput" id="titleInput" placeholder="你的文章标题" maxlength="100" class="articleTitle">

        </div>
        <input type="button" value="发布文章"
               style=" height: 60px;border-radius: 10px;" id="article-kind-btn" class="layui-btn layui-btn-lg">
    </div>
    <div id="test-editor">
    <textarea style="display:none;" name="detail">
        ### 我的博客
        **标题**
    </textarea>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#titleInput").bind({
                copy : function(){
                    $("#title").val($("#titleInput").val());
                    getInputLength();
                },
                paste : function(){
                    $("#title").val($("#titleInput").val());
                    getInputLength();
                },
                cut : function(){
                    $("#title").val($("#titleInput").val());
                    getInputLength();
                }
            });
            $("#titleInput").keyup(function(){
                $("#title").val($("#titleInput").val());
                getInputLength();
            });
            $("#title").bind({
                copy : function(){
                    $("#titleInput").val($("#title").val());
                    getInputLength();
                },
                paste : function(){
                    $("#titleInput").val($("#title").val());
                    getInputLength();
                },
                cut : function(){
                    $("#titleInput").val($("#title").val());
                    getInputLength();
                }
            });
            $("#title").keyup(function(){
                $("#titleInput").val($("#title").val());
                getInputLength();
            });
        });

        function getInputLength(obj)
        {
            if($("#title").val().toString().length==100) $("#title").css("border","1px solid red");
            else $("#title").css("border","1px solid #ccc");;
            if($("#titleInput").val().toString().length==100) $("#titleInput").css("border","1px solid red");
            else $("#titleInput").css("border","1px solid #ccc");
            document.getElementById("wordnumber").innerHTML =$("#title").val().toString().length + "/100";
        }
    </script>
    <script type="text/javascript">

        $(function() {
            var editor = editormd("test-editor", {
                // width  : "100%",
                // height : "100%",
                path   : "editor.md-master/lib/"
            });
        });
        layui.use('table', function() {
            var $1 = layui.$;
            var table = layui.table;
            var layer = layui.layer;
            var form = layui.form;
            // 显示添加用户弹出层

            $1('#article-kind-btn').click(function() {
                // 每次显示前重置表单
                layer.open({
                    type: 1,
                    title: '文章设置',
                    skin: 'layui-layer-molv',
                    area: ['500px'],
                    content: $1('#article-kind-layer')
                });
            });
        })
    </script>
</form>