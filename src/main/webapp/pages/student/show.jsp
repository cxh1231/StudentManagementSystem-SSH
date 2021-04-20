<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2021-04-15 0015
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/main.css">
<link rel="stylesheet" href="../../resources/css/jHsDate.css">
<link rel="stylesheet" id='skin' type="text/css" href="../../resources/prompt/skin/qq/ymPrompt.css"/>

<script type="text/javascript" src="../../resources/js/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript" src="../../resources/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="../../resources/js/jHsDate.js"></script>

<div class="container">
    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center">
                    <%--<form action="/student/toUpdate" class="jqtransform" enctype="multipart/form-data" onsubmit="return toVaild()" method="post">--%>
                    <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                        <s:set name="student" value="#request.student"/>
                        <tr>
                            <td class="td_right">学号：</td>
                            <td width="320px">
                                <%--学号--%>
                                <input type="text" name="student.id" id="id" class="input-text lh30 disabled"
                                       size="40" maxlength="20" disabled value="<s:property value="#student.id"/>">
                            </td>
                            <td width="200">
                                学生照片：
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">姓名：</td>
                            <td>
                                <%--姓名--%>
                                <input required type="text" name="student.name" id="name" class="input-text lh30" size="40"
                                       maxlength="20" disabled value="<s:property value="#student.name"/>">
                            </td>
                            <%--显示图片--%>
                            <td rowspan="4">
                                <%--照片--%>
                                <img src="../../upload/<s:property value="#student.photo"/>" id="image_show" width="120px" height="160px">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">性别：</td>
                            <td class="">
                                <input type="radio" name="student.gender" value="1" checked="checked" disabled> 男　　
                                <input type="radio" name="student.gender" value="2" disabled> 女　　
                            </td>

                        </tr>
                        <tr>
                            <td class="td_right">生日：</td>
                            <td class="">
                                <%--生日--%>
                                <input disabled required type="text" id="birthday" class="input-text lh30" style="width: 200px;"/>
                                <input type="text" name="student.birthday" id="student_birthday" value="<s:property value="#student.birthday"/>" hidden/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">专业：</td>
                            <td class="">
	                    		<span class="fl">
	                    			<div class="select_border">
	                        		<div class="select_containers ">
				                        <select name="student.majorId" class="select" style="width: 200px;" id="major_id" disabled>
                                             <s:iterator value="#request.majors" id="major">
                                            <option value="<s:property value="#major.id"/>">
                                                <s:property value="#major.name"/>
                                            </option>
                                             </s:iterator>
				                        </select>
	                        		</div>
	                      			</div>
	                    		</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">学分：</td>
                            <td class="">
                                <%--生日--%>
                                <input disabled required type="text"class="input-text lh30" style="width: 200px;" value="<s:property value="#student.credits"/>"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">备注：</td>
                            <td>
                                <%--备注--%>
                                <textarea name="student.remark" id="remark" class="textarea"
                                          style="width: 290px;height: 60px" disabled><s:property value="#student.remark"/></textarea>
                            </td>
                        </tr>
                        <%--<tr>--%>
                        <%--<td class="td_right">&nbsp;</td>--%>
                        <%--<td class="">--%>
                        <%--<input type="submit" name="button" class="btn btn82 btn_save2" value="保存">--%>
                        <%--<input type="reset" name="button" class="btn btn82 btn_res" value="重置">　--%>
                        <%--<s:set name="msg" value="#request.msg"/>--%>
                        <%--<span id="err" style="color: red;text-align: center;"><s:property value="#msg"/></span>--%>
                        <%--</td>--%>
                        <%--</tr>--%>
                    </table>

                    <%--</form>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        // 下拉框
        $('#major_id').val('<s:property value="#student.majorId"/>');
        // 单选
        $(":radio[name='student.gender'][value='<s:property value="#student.gender"/>']").attr("checked", "checked");
    });

    function toVaild() {
        var name = $('#name').val().trim();
        if (name.length === 0) {
            $('#err').text('姓名不能为空');
            return false;
        }
        var num = $('#num').val().trim();
        if (num.length === 0) {
            $('#err').text('学号不能为空');
            return false;
        }
        if ($("#birthday").val().length === 0) {
            $('#err').text('生日不能为空');
            return false;
        }
        return true;
    }

    $(function () {
        // 设置日期
        $('#birthday').jHsDate({
            inputIsRead: true,
            defDate: '<s:property value="#student.birthday"/>',
            defIsShow: true,
            callBack: function () {
                // console.log($("#birthday").val());
                $("#student_birthday").attr("value", $("#birthday").val())
                // alert('我是回掉函数')
            }
        });

        // 选中图片后显示
        $("#photo").change(function () {
            var fileImg = $("#image_show");
            var explorer = navigator.userAgent;
            var imgSrc = $(this)[0].value;
            if (explorer.indexOf('MSIE') >= 0) {
                if (!/\.(jpg|jpeg|png|JPG|PNG|JPEG)$/.test(imgSrc)) {
                    imgSrc = "";
                    fileImg.attr("src", "/img/default.png");
                    return false;
                } else {
                    fileImg.attr("src", imgSrc);
                }
            } else {
                if (!/\.(jpg|jpeg|png|JPG|PNG|JPEG)$/.test(imgSrc)) {
                    imgSrc = "";
                    fileImg.attr("src", "/img/default.png");
                    return false;
                } else {
                    var file = $(this)[0].files[0];
                    var url = URL.createObjectURL(file);
                    fileImg.attr("src", url);
                }
            }
        })
    })
</script>