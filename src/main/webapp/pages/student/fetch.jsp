<%@ page contentType="text/html;charset=UTF-8" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<c:set var="ctx"
       value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
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
                    <form action="${ctx }/student/update.html" class="jqtransform" onsubmit="return toVaild()"
                          method="post">
                        <input type="hidden" name="student.id" value="${entity.id }">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="td_right">姓名：</td>
                                <td><input type="text" name="student.name" id="name" class="input-text lh30" size="40"
                                           maxlength="20" value="${entity.name }"></td>
                            </tr>
                            <tr>
                                <td class="td_right">学号：</td>
                                <td><input type="text" name="student.num" id="num" class="input-text lh30" size="40"
                                           maxlength="20" value="${entity.num }"></td>
                            </tr>
                            <tr>
                                <td class="td_right">性别：</td>
                                <td class="">
                                    <input type="radio" name="student.sex" value="1" checked="checked"> 男神
                                    <input type="radio" name="student.sex" value="2"> 女神
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">班级：</td>
                                <td class="">
	                    		<span class="fl">
	                    			<div class="select_border"> 
	                        		<div class="select_containers "> 
				                        <select name="student.cid" class="select" id="cid_"> 
				                        <c:forEach var="item" items="${s_class }">
                                            <option value="${item.id }">${item.name }</option>
                                        </c:forEach>
				                        </select> 
	                        		</div> 
	                      			</div> 
	                    		</span>
                                </td>
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
    $(function () {
        // 下拉框
        $('#cid_').val('${entity.cid}');
        // 单选
        $(":radio[name='student.sex'][value='${entity.sex}']").attr("checked", "checked");
    });

    function toVaild() {
        var name = $('#name').val().trim();
        if (name.length == 0) {
            $('#err').text('姓名不能为空');
            return false;
        }
        var num = $('#num').val().trim();
        if (num.length == 0) {
            $('#err').text('学号不能为空');
            return false;
        }
        return true;
    }
</script>