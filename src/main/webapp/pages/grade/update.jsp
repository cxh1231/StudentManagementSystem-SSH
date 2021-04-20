<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/main.css">
<script type="text/javascript" src="../../resources/js/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript" src="../../resources/prompt/ymPrompt.js"></script>
<link rel="stylesheet" id='skin' type="text/css" href="../../resources/prompt/skin/qq/ymPrompt.css"/>

<div class="container">
    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center">
                    <form action="/grade/toUpdate" class="jqtransform" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <%--学号--%>
                            <tr>
                                <td class="td_right">学号：</td>
                                <td>
                                    <input hidden name="grade.id" value="<s:property value="#request.grade[0]"/>">
                                    <input hidden name="grade.credit" value="<s:property value="#request.grade[6]"/>">
                                    <input disabled type="text" name="studentId" class="input-text lh30" size="40" maxlength="20"
                                           value="<s:property value="#request.grade[1]"/>">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">姓名：</td>
                                <td>
                                    <input disabled type="text" name="studentName" class="input-text lh30" size="40" maxlength="20"
                                           value="<s:property value="#request.grade[2]"/>"/>
                                </td>
                            </tr>
                            <tr>
                                <td class=" td_right">课程号：</td>
                                <td>
                                    <input disabled type="text" name="courseId" class="input-text lh30" size="40" maxlength="20"
                                           value="<s:property value="#request.grade[3]"/>">
                                </td>
                            </tr>
                            <tr>
                                <td class=" td_right">课程名：</td>
                                <td>
                                    <input disabled type="text" name="courseName" class="input-text lh30" size="40" maxlength="20"
                                           value="<s:property value="#request.grade[4]"/>">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">成绩：</td>
                                <td>
                                    <input type="text" name="grade.score" id="score" class="input-text lh30" size="40" maxlength="20"
                                           value="<s:property value="#request.grade[5]"/>">
                                </td>
                            </tr>

                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" name="button" class="btn btn82 btn_save2" value="保存">
                                    <input type="reset" name="button" class="btn btn82 btn_res" value="重置">
                                    <span id="err" style="color: red;text-align: center;"><s:property value="#request.msg"/></span>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function toVaild() {
        var num1 = $('#score').val().trim();
        if (num1.length === 0) {
            $('#err').text('成绩不能为空');
            return false;
        }
        if (num1 < 0 || num1 > 100) {
            $('#err').text('成绩范围错误');
            return false;
        }
        return true;
    }
</script>