package pl.javastart.equipy.components.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    @Query("Select u from User u where lower(u.lastName) like lower(concat('%', :lastName,'%'))")
    List<User> findAllByLastNameContainingIgnoreCase(String lastName);
}