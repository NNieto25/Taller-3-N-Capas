package com.douglashdezt.library.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.douglashdezt.library.models.entities.User;

public interface UserRepository extends JpaRepository<User, Long>{
	User findOneByUsernameOrEmail(String username, String email);
}
