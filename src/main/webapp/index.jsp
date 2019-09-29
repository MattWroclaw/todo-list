<%@ page import="pl.sdacademy.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Todo list</title>
</head>
<body>
<h1>Todo list</h1>
<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
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

        String priority = request.getParameter("priority");
        if (priority != null && !priority.isEmpty()) {
            task.setPriority(priority);
        }

        tasks.add(task);
        response.sendRedirect("index.jsp");
    }
%>
<form method="post" action="index.jsp">
    <label for="description">Description</label>
    <input type="text" id="description" name="description">
    <label for="finishDate">Finish date</label>
    <input type="datetime-local" id="finishDate" name="finishDate">
    <label for="priority">Priority</label>
    <input type="text" id="priority" name="priority">
    <input type="submit" value="Add">
</form>

<table>
    <thead>
    <tr>
        <th>description</th>
        <th>date</th>
        <th>priority</th>
    </tr>
    </thead>
    <c:forEach var="task" items="${tasks}">
        <tr>
            <td>${task.description}</td>
            <td>${task.finishDate}</td>
            <td>${task.priority}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
