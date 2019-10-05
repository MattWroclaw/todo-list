package pl.sdacademy.controller;

import lombok.extern.slf4j.Slf4j;
import pl.sdacademy.entity.Priority;
import pl.sdacademy.entity.Task;
import pl.sdacademy.repository.TaskRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@WebServlet("/tasks")
public class TaskController extends HttpServlet {

    private TaskRepository taskRepository;

    @Override
    public void init() throws ServletException {
        taskRepository = new TaskRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lang = request.getParameter("lang");
        if (lang != null) {
            Cookie cookie = new Cookie("lang", lang);
            response.addCookie(cookie);
            response.sendRedirect("tasks");

            log.debug("Language cookie set with value {}", lang);
            return;
        }

        List<Task> tasks = taskRepository.findAll();
        request.setAttribute("taskList", tasks);

        request.getRequestDispatcher("tasks.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String newTaskDescription = request.getParameter("description");
        if (newTaskDescription == null) {
            response.sendRedirect("tasks");
            log.info("POST without any data");
            return;
        }

        Task task = new Task();
        task.setDescription(newTaskDescription);

        String date = request.getParameter("finishDate");
        if (date != null && !date.isEmpty()) {
            LocalDateTime finishDate = LocalDateTime.parse(
                    date, DateTimeFormatter.ISO_LOCAL_DATE_TIME
            );
            task.setFinishDate(finishDate);
        }

        log.debug("Creating new task {} with finish date {}", newTaskDescription, date);

        String priorityParam = request.getParameter("priority");
        if (priorityParam != null && !priorityParam.isEmpty()) {
            Priority priority = Priority.valueOf(priorityParam.toUpperCase());
            task.setPriority(priority);
        }

        taskRepository.save(task);
        response.sendRedirect("tasks");
    }
}
