<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<body>

<div align="center">
    <h2>测试</h2>
    <br/>
    <br/>
    <a href="${RootPath}/admintest">手动跳转</a>
<br/>
    <br/>
    <br/>
还有<span id="timeLeft" style="color:red;font-size: 22px;">3</span>秒跳转至测试页面！</div>
<script>
    var leftt=3;
    window.onload= function(){
        var timer1=setInterval(function(){
            leftt--;
            document.getElementById("timeLeft").innerHTML=leftt;
        },1000)
        setTimeout(function(){
            window.clearInterval(timer1);
            window.location="${RootPath}/admintest";
        },3000)
    }
</script>
</body>
</html>
