<%@ page language="java" session="false" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
    <c:when test="${log.canComment}">
        <c:choose>
            <c:when test="${init.webSite.changyan_status eq 'on'}">
                <plugin name="changyan" view="widget" param="articleId=${log.logId}"></plugin>
            </c:when>
            <c:otherwise>
                <c:if test="${not empty log.comments}">
                    <h2>${_res.comments}</h2></c:if>
                <c:forEach items="${log.comments}" var="comment">
                    <ul class="comments">
                        <li><p>${comment.userComment}</p>
                            <p class="small"><a rel="nofollow">${comment.userName }</a> ${_res.on} ${comment.commTime }</p>
                        </li></ul>
                </c:forEach>
                <div id="cwrapper">
                    <form action="${rurl }post/addComment" method="post" id="txpCommentInputForm">
                        <div class="comments-wrapper">
                            <div class="reply">
                                <h2 id="comment">${_res.comment}</h2>
                                <p class="comment-write"><label class="hidden" for="message">Message</label><textarea class="txpCommentInputMessage" rows="15" cols="45" name="userComment" id="message"></textarea></p>
                                <div class="input-group">
                                    <p><label for="userName">${_res.name}</label><input type="text" id="name" class="comment_name_input" size="25" name="userName" value=""></p>
                                    <p><label for="userMail">${_res.email}</label><input type="text" id="email" class="comment_email_input" size="50" name="userMail" value=""></p>
                                    <p><label for="webHome">${_res.website}</label><input type="text" id="web" class="comment_web_input" size="50" name="webHome" value=""></p>
                                </div>
                                <div class="button-set">
                                    <span class="submit"><input type="submit" id="txpCommentSubmit" class="btn btn-outline-primary" name="submit" value="Submit"></span>
                                </div>
                            </div>
                            <input type="hidden" name="logId" value="${log.logId }">
                        </div>
                </div>
                </form>
                </div>
            </c:otherwise>
        </c:choose>
    </c:when>
</c:choose>
