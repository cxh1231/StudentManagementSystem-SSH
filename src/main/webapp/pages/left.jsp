<%@ page contentType="text/html;charset=UTF-8" %>
<div class="side">
    <div class="sideMenu" style="margin:0 auto">
        <%--<div class="sideMenu" style="">--%>

        <h3>后台首页</h3>
        <ul>
            <li><a href="/pages/workbench.jsp" target="rightFrame">后台首页</a></li>
        </ul>

        <h3>学生管理</h3>
        <ul>
            <li><a href="/student/list" target="rightFrame">学生列表</a></li>
            <li><a href="http://www.baidu.com" target="rightFrame">其他功能</a></li>
        </ul>


        <h3>成绩管理</h3>
        <ul>
            <li><a href="/grade/list" target="rightFrame">成绩列表</a></li>
            <li><a href="http://www.baidu.com" target="rightFrame">其他功能</a></li>
        </ul>

        <h3>基本信息管理</h3>
        <ul>
            <li><a href="/course/list" target="rightFrame">课程管理</a></li>
            <li><a href="/major/list" target="rightFrame">专业管理</a></li>
            <li><a href="http://www.baidu.com" target="rightFrame">其他功能</a></li>
        </ul>


        <h3>系统设置</h3>
        <ul>
            <li><a href="#" target="rightFrame">个人信息</a></li>
            <li><a href="#"
                   onclick="ymPrompt.win({title:'修改密码',height:'230',width:'500',dragOut:false,iframe:true,message:'${ctx }/toPsw.html'});">密码修改</a>
            </li>
        </ul>

    </div>
</div>