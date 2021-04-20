<%@ page contentType="text/html;charset=UTF-8" %>


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
                    <form action="/course/toAdd" class="jqtransform" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="td_right">课程名：</td>
                                <td><input type="text" name="course.name" id="name" class="input-text lh30" size="40" maxlength="20"></td>
                            </tr>
                            <tr>
                                <td class="td_right">开课学期：</td>
                                <td><input type="text" name="course.term" id="term" class="input-text lh30" size="40" maxlength="20"></td>
                            </tr>
                            <tr>
                                <td class="td_right">学时：</td>
                                <td><input type="text" name="course.period" id="period" class="input-text lh30" size="40" maxlength="20"></td>
                            </tr>
                            <tr>
                                <td class="td_right">学分：</td>
                                <td><input type="text" name="course.credit" id="credit" class="input-text lh30" size="40" maxlength="20"></td>
                            </tr>
                            <tr>
                                <td class="td_right">备注：</td>
                                <td><input type="text" name="course.remark" id="remark" class="input-text lh30" size="40" maxlength="20"></td>
                            </tr>

                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" name="button" class="btn btn82 btn_save2" value="保存">
                                    <input type="reset" name="button" class="btn btn82 btn_res" value="重置">
                                    <span id="err" style="color: red;text-align: center;">${msg }</span>
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
        var num1 = $('#name').val().trim();
        if (num1.length === 0) {
            $('#err').text('课程名不能为空');
            return false;
        }
        var num2 = $('#term').val().trim();
        if (num2.length === 0) {
            $('#err').text('开课学期不能为空');
            return false;
        }
        var num3 = $('#period').val().trim();
        if (num3.length === 0) {
            $('#err').text('学时不能为空');
            return false;
        }
        var num4 = $('#credit').val().trim();
        if (num4.length === 0) {
            $('#err').text('学分不能为空');
            return false;
        }
        return true;
    }
</script>