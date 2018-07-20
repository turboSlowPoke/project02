package projects.project02.data_repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import projects.project02.entyties.User;

@Repository
public interface UserRepository extends CrudRepository<User,Integer> {
}
