package com.douglashdezt.library.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.douglashdezt.library.models.entities.Token;

public interface TokenRepository extends JpaRepository<Token, Long>{

}