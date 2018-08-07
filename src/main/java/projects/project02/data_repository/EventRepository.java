package projects.project02.data_repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import projects.project02.entyties.Event;
import projects.project02.entyties.EventStatus;

import java.util.Optional;

@Repository
public interface EventRepository extends CrudRepository<Event,Integer> {
    Optional<Event> findEventByStatus(EventStatus status);
}
