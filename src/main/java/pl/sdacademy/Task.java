package pl.sdacademy;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Task {

    private String description;
    private LocalDateTime finishDate;
    private Priority priority;
}