<%@ page contentType="text/html;charset=UTF-8" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<c:set var="ctx" value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx }/resources/css/common.css">
<link rel="stylesheet" href="${ctx }/resources/css/main.css">
<script type="text/javascript" src="${ctx }/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/common.js"></script>
<script type="text/javascript" src="${ctx }/resources/prompt/ymPrompt.js"></script>
<link rel="stylesheet" id='skin' type="text/css" href="${ctx }/resources/prompt/skin/qq/ymPrompt.css" />
  
<div class="container">
	<div id="forms" class="mt10">
		<div class="box">
			<div class="box_border">
				<div class="box_center">
					<form action="${ctx }/admin/update.html" class="jqtransform" onsubmit="return toVaild()" method="post">
					<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
						<input type="hidden" name="user.id" value="${entity.id }">
						<input type="hidden" name="user.old" value="${entity.username }">
						<tr>
							<td class="td_right">账号：</td>
							<td><input type="text" name="user.username" id="username" class="input-text lh30" size="40" value="${entity.username }" maxlength="20"></td>
						</tr>
						<tr>
							<td class="td_right">密码：</td>
							<td><input type="password" name="user.password" id="password" class="input-text lh30" size="40" value="${entity.password }" maxlength="20"></td>
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
function toVaild(){
	var username = $('#username').val().trim();
	var password = $('#password').val().trim();
	$('#username').val(username);
	$('#password').val(password);
	if (username.length == 0){
		$('#err').text('账号不能为空');
		return false;
	}
	if (password.length == 0){
		$('#err').text('密码不能为空');
		return false;
	}
	return true;
}
</script>