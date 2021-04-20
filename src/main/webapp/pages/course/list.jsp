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
    <div id="search_bar" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center pt10 pb10">
                    <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td><input type="button" name="button" class="btn btn82 btn_add add_" value="新增"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div id="table" class="mt10">
        <div class="box span10 oh">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
                    <th width="5%">序号</th>
                    <th>课程ID</th>
                    <th width="20%">课程名</th>
                    <th>开课学期</th>
                    <th>学时</th>
                    <th>学分</th>
                    <th>备注</th>
                    <th width="20%">操作</th>
                </tr>
                <s:iterator value="#request.courses" id="course" status="row">
                    <tr class="tr">
                            <%--序号--%>
                        <td class="td_center"><s:property value="#row.index+1"/></td>
                            <%--课程ID--%>
                        <td class="td_center"><s:property value="#course.id"/></td>
                            <%--课程名--%>
                        <td class="td_center"><s:property value="#course.name"/></td>
                            <%--开课学期--%>
                        <td class="td_center"><s:property value="#course.term"/></td>
                            <%--学时--%>
                        <td class="td_center"><s:property value="#course.period"/></td>
                            <%--学分--%>
                        <td class="td_center"><s:property value="#course.credit"/></td>
                            <%--备注--%>
                        <td class="td_left"><s:property value="#course.remark"/></td>
                            <%--操作--%>
                        <td class="td_center">
                            <input type="button" data="<s:property value="#student.id"/>"
                                   class="ext_btn ext_btn_success edit_" value="编辑">　
                                <%--<input type="button" data="<s:property value="#student.id"/>"--%>
                                <%--class="ext_btn ext_btn_success show_" value="详细信息">　--%>
                            <input type="button" data="<s:property value="#student.id"/>"
                                   class="ext_btn ext_btn_error delete_" value="删除">　

                        </td>
                    </tr>
                </s:iterator>

            </table>
        </div>
    </div>

</div>
<script type="text/javascript">
    var delete_id;
    $(function () {
        $(".add_").click(function () {
            ymPrompt.win({
                title: '添加课程',
                height: '330',
                width: '500',
                dragOut: false,
                iframe: true,
                message: '/course/toAdd',
                handler: reload
            });
        });

        $(".edit_").click(function () {
            var id = $(this).attr("data");
            ymPrompt.win({
                title: '编辑课程',
                height: '330',
                width: '500',
                dragOut: false,
                iframe: true,
                message: '/course/toUpdate?course.id=' + id,
                handler: reload
            });
        });

        $(".delete_").click(function () {
            delete_id = $(this).attr("data");
            ymPrompt.confirmInfo({message: '您确定删除此信息？', handler: handlerDel});
        })
    });

    function handlerDel(tp) {
        if (tp == 'ok') {
            $.ajax({
                type: "GET",
                url: 'course/toDelete?course.id=' + delete_id,
                dataType: "text",
                success: function (result) {
                    reload();
                }
            });
        }
    }

    // 刷新页面
    function refresh() {
        self.location.href = "/course/list";
    }

    // 重载页面
    function reload() {
        window.location.reload();
    }

</script>
</body>
</html>