<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2021-04-15 0015
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/main.css">
<link rel="stylesheet" href="../../resources/css/jHsDate.css">
<link rel="stylesheet" id='skin' type="text/css" href="../../resources/prompt/skin/qq/ymPrompt.css"/>

<script type="text/javascript" src="../../resources/js/jquery.min.js"></script>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript" src="../../resources/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="../../resources/js/jHsDate.js"></script>

<%--窗口主体--%>
<div class="container">
    <div id="forms" class="mt10">
        <div class="box">
            <div class="box_border">
                <div class="box_center">
                    <form action="/student/toAdd" enctype="multipart/form-data" class="jqtransform" onsubmit="return toVaild()"
                          method="post">
                        <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:set name="id" value="#request.id"/>
                            <tr>
                                <td class="td_right">学号：</td>
                                <td width="320px">
                                    <input type="text" name="student.id" id="id" class="input-text lh30 disabled"
                                           size="40" maxlength="20" disabled value="<s:property value="#id"/>">
                                </td>
                                <td width="200">
                                    选择照片：
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">姓名：</td>
                                <td>
                                    <input required type="text" name="student.name" id="name" class="input-text lh30" size="40"
                                           maxlength="20">
                                </td>
                                <td>
                                    <input required type="file" name="photo" id="photo" class="input-text lh30" accept="image/*" style="width: 180px;"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">性别：</td>
                                <td class="">
                                    <input type="radio" name="student.gender" value="1" checked="checked"> 男　　
                                    <input type="radio" name="student.gender" value="2"> 女　　
                                </td>
                                <%--显示图片--%>
                                <td rowspan="4">
                                    <img src="" id="image_show" width="120px" height="160px">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">生日：</td>
                                <td class="">
                                    <input required type="text" id="birthday" class="input-text lh30" style="width: 200px;"/>
                                    <input type="text" name="student.birthday" id="student_birthday" hidden/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">专业：</td>
                                <td class="">
	                    		<span class="fl">
	                    			<div class="select_border"> 
	                        		<div class="select_containers "> 
				                        <select name="student.majorId" class="select" style="width: 200px;">
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
                                <td class="td_right">备注：</td>
                                <td>
                                    <textarea name="student.remark" id="remark" class="textarea" style="width: 290px;height: 60px"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_right">&nbsp;</td>
                                <td class="">
                                    <input type="submit" name="button" class="btn btn82 btn_save2" value="添加">
                                    <input type="reset" name="button" class="btn btn82 btn_res" value="重置">　
                                    <s:set name="msg" value="#request.msg"/>
                                    <span id="err" style="color: red;text-align: center;"><s:property value="#msg"/></span>
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

    // 参数验证
    function toVaild() {
        var name = $('#name').val().trim();
        if (name.length === 0) {
            $('#err').text('姓名不能为空');
            return false;
        }
        var num = $('#id').val().trim();
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