<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/login.css">
    <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
    <title>学生成绩管理系统</title>
</head>
<body>
<div id="login_center">
    <div id="login_area">
        <div id="login_form">
            <form action="login" method="post">
                <div id="login_tip">
                    用户登录
                </div>
                <div>
                    <input type="text" name="user.username" class="username" maxlength="20"
                           required="required" placeholder="请输入账号">
                </div>
                <div>
                    <input type="password" name="user.password" class="pwd" maxlength="20"
                           required="required" placeholder="请输入密码">
                </div>
                <div id="btn_area">
                    <input type="submit" name="submit" id="sub_btn" value="登　　录">
                    <s:set name="msg" value="#request.msg"/>
                    <span id="err" style="color: red;text-align: center;"><s:property value="#msg"/></span>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="login_bottom">
    版权所有 Copyright &copy; 2020-现在 Powered by @cxhit.blog.csdn.net
</div>
</body>
</html>

