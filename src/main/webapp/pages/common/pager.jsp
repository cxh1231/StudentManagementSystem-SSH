<%@ page contentType="text/html;charset=UTF-8" %>
<pg:pager maxPageItems="10" items="${param.items }" export="curPage=pageNumber" url="${param.url }">

    <c:forEach items="${param.params }" var="p">
        <pg:param name="${p }" value="${p }"/>
    </c:forEach>

    <div class="page mt10">
        <div class="pagination">
            <ul>
                <!-- 页码描述 -->
                <pg:last>
                    <li class="first-child disabled"><span>每页${pager.pageSize}条,  共${param.items }条记录</span></li>
                    <li class="last-child disabled"><span>当前第${curPage }页，共${pageNumber }页</span></li>
                </pg:last>

                <!-- 首页-->
                <pg:first>
                    <c:if test="${curPage eq pageNumber }">
                        <li class="first-child disabled"><span>[首页]</span></li>
                    </c:if>
                    <c:if test="${curPage ne pageNumber }">
                        <li class="first-child"><a href="${pageUrl }">首页</a></li>
                    </c:if>
                </pg:first>

                <!-- 上一页 -->
                <pg:prev>
                    <li><a href="${pageUrl }">上一页</a></li>
                </pg:prev>

                <pg:pages>
                    <!-- 1-2-3-4 -->
                    <c:if test="${curPage eq pageNumber }">
                        <li class="active"><span>[${pageNumber }]</span></li>
                    </c:if>
                    <c:if test="${curPage ne pageNumber }">
                        <li><a href="${pageUrl }">${pageNumber }</a></li>
                    </c:if>
                </pg:pages>

                <!-- 下一页 -->
                <pg:next>
                    <li><a href="${pageUrl }">下一页</a></li>
                </pg:next>

                <!-- 末页-->
                <pg:last>
                    <c:if test="${curPage eq pageNumber || pageNumber eq 0}">
                        <li class="last-child disabled"><span>[末页]</span></li>
                    </c:if>
                    <c:if test="${curPage ne pageNumber && pageNumber ne 0}">
                        <li class="last-child"><a href="${pageUrl }">末页</a></li>
                    </c:if>
                </pg:last>

            </ul>
        </div>
    </div>

</pg:pager>