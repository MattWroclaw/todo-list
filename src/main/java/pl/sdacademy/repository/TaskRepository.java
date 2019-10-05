package pl.sdacademy.repository;

import pl.sdacademy.config.PersistenceUtil;
import pl.sdacademy.entity.Task;

import javax.persistence.EntityManager;
import java.util.List;

public class TaskRepository {

    public List<Task> findAll() {
        EntityManager em = PersistenceUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();

        List<Task> tasks = em.createQuery("select t from Task t", Task.class)
                .getResultList();

        em.getTransaction().commit();
        em.close();

        return tasks;
    }

    public Task findById(Long id) {
        EntityManager em = PersistenceUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();

        Task task = em.find(Task.class, id);

        em.getTransaction().commit();
        em.close();

        return task;
    }

    public void save(Task task) {
        EntityManager em = PersistenceUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();

        em.persist(task);

        em.getTransaction().commit();
        em.close();
    }

    public void deleteById(Long id) {
        EntityManager em = PersistenceUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();

        Task task = em.find(Task.class, id);
        em.remove(task);

        em.getTransaction().commit();
        em.close();
    }
}
