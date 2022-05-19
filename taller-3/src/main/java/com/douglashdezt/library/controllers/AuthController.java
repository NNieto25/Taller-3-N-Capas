package com.douglashdezt.library.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.douglashdezt.library.models.dtos.LoginDTO;
import com.douglashdezt.library.models.dtos.MessageDTO;
import com.douglashdezt.library.models.dtos.TokenDTO;
import com.douglashdezt.library.models.dtos.UserInfo;
import com.douglashdezt.library.models.entities.User;
import com.douglashdezt.library.services.UserService;
import com.douglashdezt.library.utils.TokenManager;

@RestController
@RequestMapping("/auth")
//TODO: la ruta es en request mapping y no en rest controller
public class AuthController {

	@Autowired
	UserService userService;

	@Autowired
	TokenManager tokenManager;

	@PostMapping("/signup")
	public ResponseEntity<MessageDTO> registerUser(@Valid UserInfo userInfo, BindingResult result) {
		try {
			if (result.hasErrors()) {
				String errors = result.getAllErrors().toString();

				return new ResponseEntity<>(new MessageDTO("Hay errores: " + errors), HttpStatus.BAD_REQUEST);
			}

			User foundUser = userService.findOneByUsernameAndEmail(userInfo.getUsername(), userInfo.getEmail());

			if (foundUser != null) {
				return new ResponseEntity<>(new MessageDTO("Este usuario ya existe"), HttpStatus.BAD_REQUEST);
			}

			userService.register(userInfo);

			return new ResponseEntity<>(new MessageDTO("Usuario Registrado"), HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(new MessageDTO("Error interno"), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("/signin")
	private ResponseEntity<TokenDTO> login(@Valid LoginDTO loginInfo, BindingResult result) {
		try {

			if (result.hasErrors()) {
				return new ResponseEntity<>(new TokenDTO(), HttpStatus.BAD_REQUEST);
			}

			User user = userService.findOneByIdentifer(loginInfo.getIdentifier());

			if (!userService.comparePassword(user, loginInfo.getPassword())) {
				return new ResponseEntity<>(new TokenDTO(), HttpStatus.UNAUTHORIZED);
			}

			final String token = tokenManager.generateJwtToken(user.getUsername());

			userService.insertToken(user, token);

			return new ResponseEntity<>(new TokenDTO(token), HttpStatus.CREATED);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ResponseEntity<>(new TokenDTO(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
