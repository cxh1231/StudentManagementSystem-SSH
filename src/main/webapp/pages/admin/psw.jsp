<%@ page contentType="text/html;charset=UTF-8" %>

<link rel="stylesheet" href="${ctx }/resources/css/common.css">
<link rel="stylesheet" href="${ctx }/resources/css/main.css">
<script type="text/javascript" src="${ctx }/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/common.js"></script>
<script type="text/javascript" src="${ctx }/resources/prompt/ymPrompt.js"></script>
<link rel="stylesheet" id='skin' type="text/css" href="${ctx }/resources/prompt/skin/qq/ymPrompt.css"/>

<div class="container">
    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center">
                    <form action="${ctx }/updatePsw.html" class="jqtransform" onsubmit="return toVaild()" method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="td_right">旧密码：</td>
                                <td><input type="password" name="user.old" id="old" class="input-text lh30" size="40"
                                           maxlength="20"></td>
                            </tr>
                            <tr>
                                <td class="td_right">新密码：</td>
                                <td><input type="password" name="user.password" id="new_" class="input-text lh30"
                                           size="40" maxlength="20"></td>
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
        var old = $('#old').val().trim();
        var new_ = $('#new_').val().trim();
        $('#old').val(old);
        $('#new_').val(new_);
        if (old.length == 0) {
            $('#err').text('旧密码不能为空');
            return false;
        }
        if (new_.length == 0) {
            $('#err').text('新密码不能为空');
            return false;
        }
        return true;
    }
</script>