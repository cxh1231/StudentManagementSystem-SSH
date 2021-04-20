<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2021-04-15 0015
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../../resources/css/common.css">
    <link rel="stylesheet" href="../../resources/css/main.css">
    <script type="text/javascript" src="../../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../resources/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="../../resources/js/common.js"></script>
    <script type="text/javascript" src="../../resources/prompt/ymPrompt.js"></script>
    <link rel="stylesheet" id='skin' type="text/css" href="../../resources/prompt/skin/qq/ymPrompt.css"/>
</head>
<body>
<div class="container">
    <%--搜索栏  含新增按钮--%>
    <div id="search_bar" class="mt10">
        <div class="box">
            <div class="box_border">
                <%--搜索模块--%>
                <div class="box_top"><b class="pl15">搜索</b></div>
                <div class="box_center pt10 pb10">
                    <form action="/student/list" method="post">
                        <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                            <s:set name="student2" value="#request.student"/>
                            <tr>
                                <td>姓名</td>
                                <td>
                                    <input type="text" name="student.name" class="input-text lh25" size="20" value="<s:property value="#student2.name"/>">
                                </td>
                                <td>学号</td>
                                <td>
                                    <input type="text" name="student.id" class="input-text lh25" size="20" value="<s:property value="#student2.id"/>">
                                </td>
                                <td>
                                    <input type="radio" name="student.gender" value="0"> 全部　
                                    <input type="radio" name="student.gender" value="1"> 男　
                                    <input type="radio" name="student.gender" value="2"> 女　
                                </td>
                                <td>
                                    <span class="fl">
                                        <div class="select_border">
                                        <div class="select_containers ">
                                            <select name="student.majorId" class="select" id="_cid">
                                            <option value="0">--全部专业--</option>
                                                <s:iterator value="#request.majors" id="major">
                                                    <option value="<s:property value="#major.id"/>"><s:property value="#major.name"/></option>
                                                </s:iterator>

                                            </select>
                                        </div>
                                        </div>
                                    </span>
                                </td>
                                <td><input type="submit" name="button" class="btn btn82 btn_search" value="查询"></td>
                                <td><input type="button" name="button" class="btn btn82 btn_res all_" value="清除"></td>
                                <td><input type="button" name="button" class="btn btn82 btn_add add_" value="新增"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%--学生列表--%>
    <div id="table" class="mt10">
        <div class="box span10 oh">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
                    <th width="4%">序号</th>
                    <th width="10%">学号</th>
                    <th width="10%">姓名</th>
                    <th width="8%">性别</th>
                    <th width="10%">生日</th>
                    <th width="10%">专业</th>
                    <th width="8%">总学分</th>
                    <th>备注</th>
                    <th width="20%">操作</th>
                </tr>
                <%--暂无记录显示--%>
                <s:if test="#request.pager.totalRecord == 0">
                    <tr>
                        <td colspan="9" align="center">暂无记录</td>
                    </tr>
                </s:if>
                <s:iterator value="#request.pager.data" id="student" status="row">
                    <tr class="tr">
                            <%--序号--%>
                        <td class="td_center"><s:property value="#row.index+1"/></td>
                            <%--学号--%>
                        <td class="td_center"><s:property value="#student.id"/></td>
                            <%--姓名--%>
                        <td class="td_center"><s:property value="#student.name"/></td>
                            <%--性别--%>
                        <td class="td_center"><s:property value="#student.gender==1?'男':'女'"/></td>
                            <%--生日--%>
                        <td class="td_center"><s:property value="#student.birthday"/></td>
                            <%--专业--%>
                        <td class="td_center">
                            <s:iterator value="#request.majors" id="major">
                                <s:if test="#major.id==#student.majorId">
                                    <s:property value="#major.name"/>
                                </s:if>
                            </s:iterator>
                        </td>
                            <%--总学分--%>
                        <td class="td_center"><s:property value="#student.credits"/></td>
                            <%--备注--%>
                        <td class="td_left"><s:property value="#student.remark"/></td>
                            <%--操作--%>
                        <td class="td_center">
                            <input type="button" data="<s:property value="#student.id"/>"
                                   class="ext_btn ext_btn_success edit_" value="编辑">　
                            <input type="button" data="<s:property value="#student.id"/>"
                                   class="ext_btn ext_btn_success show_" value="详细信息">　
                            <input type="button" data="<s:property value="#student.id"/>"
                                   class="ext_btn ext_btn_error delete_" value="删除">　

                        </td>
                    </tr>
                </s:iterator>

            </table>

            <%--分页模块--%>
            <div class="page mt10">
                <div class="pagination">
                    <ul>
                        <s:set name="page" value="#request.pager"/>
                        <!-- 页码描述 -->
                        <li class="first-child disabled">
                            <span>每页<s:property value="#page.pageSize"/>条，共<s:property
                                    value="#page.totalRecord"/>条记录</span>
                        </li>
                        <li class="last-child disabled"><span>当前第<s:property value="#page.pageNow"/>页，共<s:property
                                value="#page.pageNum"/>页</span></li>

                        <!-- 首页-->
                        <s:if test="#page.pageNow==1">
                            <%--当前就是首页--%>
                            <li class="first-child disabled"><span>[首页]</span></li>
                        </s:if>
                        <s:else>
                            <%--当前不是首页--%>
                            <li class="first-child">
                                <a href="/student/list?page=1">首页</a>
                            </li>
                            <!-- 上一页 -->
                            <li>
                                <a href="/student/list?page=<s:property value="#page.pageNow-1"/>">上一页</a>
                            </li>
                        </s:else>

                        <!-- 1-2-3-4 -->
                        <s:iterator var="counter"
                                    begin="#page.pageNow-2<1 ? 1 : #page.pageNow-2"
                                    end="#page.pageNow+2>#page.pageNum ? #page.pageNum : #page.pageNow+2">
                            <%--如果前面还有页面--%>
                            <s:if test="(#page.pageNow-2<1 ? 1 : #page.pageNow-2) > 1 && top == (#page.pageNow-2<1 ? 1 : #page.pageNow-2)">
                                <li class="active"><span> … </span></li>
                            </s:if>
                            <%--当前页不可点击，激活状态--%>
                            <s:if test="#page.pageNow == top">
                                <li class="active"><span>[<s:property value="top"/>]</span></li>
                            </s:if>
                            <s:else>
                                <li><a href="/student/list?page=<s:property value="top"/>"> <s:property
                                        value="top"/> </a></li>
                            </s:else>
                            <%--如果后面还有页面--%>
                            <s:if test="(#page.pageNow+2>#page.pageNum ? #page.pageNum : #page.pageNow+2) < #page.pageNum && top == (#page.pageNow+2>#page.pageNum ? #page.pageNum : #page.pageNow+2)">
                                <li class="active"><span> … </span></li>
                            </s:if>
                        </s:iterator>

                        <!-- 末页-->
                        <s:if test="#page.pageNow==#page.pageNum">
                            <li class="last-child disabled"><span>[末页]</span></li>
                        </s:if>
                        <s:else>
                            <li>
                                <a href="/student/list?page=<s:property value="#page.pageNow+1"/>">下一页</a>
                            </li>
                            <li class="last-child"><a
                                    href="/student/list?page=<s:property value="#page.pageNum"/>">末页</a></li>
                        </s:else>

                    </ul>
                </div>
            </div>

        </div>
    </div>

</div>
<script type="text/javascript">
    $(function () {
        // 下拉框
        $('#_cid').val('<s:property value="#student2.majorId"/>');
        // 性别单选
        $(":radio[name='student.gender'][value='<s:property value="#student2.gender"/>']").attr("checked", "checked");
    });

    var delete_id;
    $(function () {
        // 添加学生
        $(".all_").click(function () {
            refresh();
        });

        // 添加学生
        $(".add_").click(function () {
            ymPrompt.win({
                title: '添加学生',
                height: '400',
                width: '700',
                dragOut: false,
                iframe: true,
                message: '/student/toAdd',
                handler: reload
            });
        });

        // 编辑学习
        $(".edit_").click(function () {
            var id = $(this).attr("data");
            ymPrompt.win({
                title: '编辑信息',
                height: '400',
                width: '700',
                dragOut: false,
                iframe: true,
                message: '/student/toUpdate?student.id=' + id,
                handler: reload
            });
        });

        // 查看学生
        $(".show_").click(function () {
            var id = $(this).attr("data");
            ymPrompt.win({
                title: '查看信息',
                height: '410',
                width: '700',
                dragOut: false,
                iframe: true,
                message: '/student/toShow?student.id=' + id
            });
        });

        //删除学习
        $(".delete_").click(function () {
            delete_id = $(this).attr("data");
            ymPrompt.confirmInfo({
                title: '删除确认【1/2】',
                message: '您确定删除此信息？',
                handler: function () {
                    ymPrompt.confirmInfo({
                        title: '删除确认【2/2】',
                        message: '请再次确认：您真的要删除此信息吗？删除后不可恢复！',
                        handler: handlerDel
                    })
                }
                // handler: handlerDel
            });
        })
    });

    // 进行删除
    function handlerDel(tp) {
        if (tp === 'ok') {
            $.ajax({
                type: "GET",
                url: '/student/toDelete?student.id=' + delete_id,
                dataType: "text",
                success: function (result) {
                    reload();
                }
            });
        }
    }

    // 刷新页面
    function refresh() {
        self.location.href = "/student/list";
    }

    // 重载页面
    function reload() {
        window.location.reload();
    }


</script>
</body>
</html>