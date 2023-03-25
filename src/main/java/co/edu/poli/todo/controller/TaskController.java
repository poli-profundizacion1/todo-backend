package co.edu.poli.todo.controller;

import co.edu.poli.todo.persistence.entity.Task;
import co.edu.poli.todo.services.TaskService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tasks")
@RequiredArgsConstructor
public class TaskController {

    private final TaskService taskService;

    @PostMapping
    public Task save(@RequestBody Task task) {
        System.out.println("Prueba New");
        return this.taskService.save(task);
    }

    @GetMapping
    public List<Task> findAll() {
        return this.taskService.findAll();
    }

}
