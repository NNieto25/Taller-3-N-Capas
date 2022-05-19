package com.douglashdezt.library.utils;

import java.io.IOException;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.douglashdezt.library.models.entities.Token;
import com.douglashdezt.library.models.entities.User;
import com.douglashdezt.library.services.UserService;
import com.douglashdezt.library.services.impls.AuthUserDetailsServiceImpl;

import io.jsonwebtoken.ExpiredJwtException;

@Component
public class JwtFilter extends OncePerRequestFilter {

	@Autowired
	private AuthUserDetailsServiceImpl userDetailsService;

	@Autowired
	private TokenManager tokenManager;

	@Autowired
	private UserService userService;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String tokenHeader = request.getHeader("Authorization");
		String username = null;
		String token = null;

		if (tokenHeader != null && tokenHeader.startsWith("Bearer ")) {
			token = tokenHeader.substring(7);

			try {
				username = tokenManager.getUsernameFromToken(token);
			} catch (IllegalArgumentException e) {
				System.out.println("Unable to get JWT Token");
			} catch (ExpiredJwtException e) {
				System.out.println("JWT TOKEN has expired");
			}
		} else {
			System.out.println("Bearer string not found");
		}

		if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
			try {
				UserDetails userDetails = userDetailsService.loadUserByUsername(username);
				User userFound = userService.findOneByIdentifer(username);
				boolean isTokenValid = tokenManager.validateJwtToken(token, userDetails.getUsername());

				if (isTokenValid && userFound != null) {
					List<Token> userTokens = userFound.getTokens();
					final String tokenToCompare = token;

					boolean isTokenRegistered = userTokens.stream().filter((userToken) -> {
						return userToken.getContent().equals(tokenToCompare);
					}).findAny().orElse(null) != null;

					if (isTokenRegistered) {
						UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
								userDetails, null, userDetails.getAuthorities());

						authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
					}
				}

			} catch (Exception e) {
				System.out.println("Error in token verification");
			}
		}

		filterChain.doFilter(request, response);

	}

}