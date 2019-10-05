<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value="${empty cookie.lang ? pageContext.response.locale : cookie.lang.value}"/>
<fmt:setBundle basename="message"/>
<fmt:setBundle basename="languages" var="languages"/>
<html>
<head>
    <title><fmt:message key="todo.app.name"/></title>
</head>
<body>
<p>
    <a href="tasks?lang=en_GB"><fmt:message key="language.english" bundle="${languages}"/></a> |
    <a href="tasks?lang=de_DE"><fmt:message key="language.german" bundle="${languages}"/></a> |
    <a href="tasks?lang=pl_PL"><fmt:message key="language.polish" bundle="${languages}"/></a>
</p>
<h1><fmt:message key="todo.app.name"/></h1>

<form method="post" action="tasks">
    <label for="description"><fmt:message key="todo.task"/></label>
    <input type="text" id="description" name="description" autocomplete="off">
    <label for="finishDate"><fmt:message key="todo.date.finish"/></label>
    <input type="datetime-local" id="finishDate" name="finishDate">
    <label for="priority"><fmt:message key="todo.priority"/></label>
    <select id="priority" name="priority">
        <option value="HIGH"><fmt:message key="priority.high"/></option>
        <option value="NORMAL" selected><fmt:message key="priority.normal"/></option>
        <option value="LOW"><fmt:message key="priority.low"/></option>
    </select>
    <input type="submit" value="<fmt:message key="todo.save"/>">
</form>
<table>
    <thead>
    <tr>
        <th><fmt:message key="todo.task"/></th>
        <th><fmt:message key="todo.date.finish"/></th>
        <th><fmt:message key="todo.priority"/></th>
    </tr>
    </thead>
    <c:forEach var="task" items="${requestScope.taskList}">
        <tr>
            <td>${task.description}</td>
            <td>${task.finishDate}</td>
            <td><fmt:message key="priority.${fn:toLowerCase(task.priority)}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>