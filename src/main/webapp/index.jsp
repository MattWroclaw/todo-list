<%@ page import="pl.sdacademy.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="pl.sdacademy.Priority" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${empty cookie.lang ? pageContext.response.locale : cookie.lang.value}"/>
<fmt:setBundle basename="message"/>
<fmt:setBundle basename="languages" var="languages"/>
<html>
<head>
    <title><fmt:message key="todo.app.name"/></title>
</head>
<body>
<p>
    <a href="index.jsp?lang=en_GB"><fmt:message key="language.english" bundle="${languages}"/></a> |
    <a href="index.jsp?lang=de_DE"><fmt:message key="language.german" bundle="${languages}"/></a> |
    <a href="index.jsp?lang=pl_PL"><fmt:message key="language.polish" bundle="${languages}"/></a>
</p>
<h1><fmt:message key="todo.app.name"/></h1>
<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasksList");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasksList", tasks);
    }

    String lang = request.getParameter("lang");
    if (lang != null) {
        Cookie cookie = new Cookie("lang", lang);
        response.addCookie(cookie);
        response.sendRedirect("index.jsp");
    }

    String newTaskDescription = request.getParameter("description");
    if (newTaskDescription != null) {
        Task task = new Task();
        task.setDescription(newTaskDescription);

        String date = request.getParameter("finishDate");
        if (date != null && !date.isEmpty()) {
            LocalDateTime finishDate = LocalDateTime.parse(
                    date, DateTimeFormatter.ISO_LOCAL_DATE_TIME
            );
            task.setFinishDate(finishDate);
        }

        String priorityParam = request.getParameter("priority");
        if (priorityParam != null && !priorityParam.isEmpty()) {
            Priority priority = Priority.valueOf(priorityParam.toUpperCase());
            task.setPriority(priority);
        }

        tasks.add(task);
        response.sendRedirect("index.jsp");
    }
%>
<form method="post" action="index.jsp">
    <label for="description"><fmt:message key="todo.task"/></label>
    <input type="text" id="description" name="description">
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
    <c:forEach var="task" items="${tasksList}">
        <tr>
            <td>${task.description}</td>
            <td>${task.finishDate}</td>
            <td>${task.priority}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>