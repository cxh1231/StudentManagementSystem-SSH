<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2021-04-12 0012
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>后台首页</title>
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/style.css">
    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/jquery.SuperSlide.js"></script>
    <script type="text/javascript" src="../resources/prompt/ymPrompt.js"></script>
    <link rel="stylesheet" id='skin' type="text/css" href="../resources/prompt/skin/qq/ymPrompt.css"/>
    <script type="text/javascript">
        $(function () {
            $(".sideMenu").slide({
                titCell: "h3",
                targetCell: "ul",
                defaultIndex: 0,
                effect: 'slideDown',
                delayTime: '500',
                trigger: 'click',
                triggerTime: '150',
                defaultPlay: true,
                returnDefault: false,
                easing: 'easeInQuint',
                endFun: function () {
                    scrollWW();
                }
            });
            $(window).resize(function () {
                scrollWW();
            });
        });
    </script>
</head>
<body>
<!-- 这是 底部部分 -->
<%@ include file="header.jsp" %>
<!-- 这是 左侧部分 -->
<%@ include file="left.jsp" %>
<!-- 这是 右侧部分 -->
<div class="main">
    <iframe name="rightFrame" id="rightFrame" src="./workbench.html" frameborder="no" scrolling="auto"
            width="100%" height="auto" allowtransparency="true"></iframe>
</div>
<!-- 这是 底部部分 -->
<%@ include file="footer.jsp" %>
</body>
</html>