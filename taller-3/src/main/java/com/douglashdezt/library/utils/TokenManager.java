package com.douglashdezt.library.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class TokenManager {
	@Value("${jwt.secret}")
	private String jwtSecret;
	
	private static final long TOKEN_EXP_TIME_MILLIS = 15 * 24 * 60 * 60 * 1000; // 15 Dias
	
	public String generateJwtToken(String username) {
	    Map<String, Object> claims = new HashMap<>();
	    return Jwts.builder()
	            .setClaims(claims)
	            .setSubject(username)
	            .setIssuedAt(new Date(System.currentTimeMillis()))
	            .setExpiration(new Date(System.currentTimeMillis() + TOKEN_EXP_TIME_MILLIS))
	            .signWith(SignatureAlgorithm.HS512, jwtSecret)
	            .compact();
	}
	
	public String getUsernameFromToken(String token) {
	    final Claims claims = Jwts.parser()
	            .setSigningKey(jwtSecret)
	            .parseClaimsJwt(token)
	            .getBody();
	    return claims.getSubject();
	}
	
	public Boolean validateJwtToken(String token, String givenUsername) {
	    String username = getUsernameFromToken(token);
	    Claims claims = Jwts.parser()
	            .setSigningKey(jwtSecret)
	            .parseClaimsJwt(token)
	            .getBody();
	    
	    Boolean isTokenExpired = claims.getExpiration().before(new Date());
	    
	    return (username.equals(givenUsername) && !isTokenExpired);
	}
	
	
}
