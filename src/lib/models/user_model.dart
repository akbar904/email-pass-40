
import 'dart:convert';

class User {
	final String email;
	final String password;

	User({required this.email, required this.password});

	// Method to convert User instance to JSON
	Map<String, String> toJson() {
		return {
			'email': email,
			'password': password,
		};
	}

	// Factory method to create User instance from JSON
	factory User.fromJson(Map<String, String> json) {
		return User(
			email: json['email']!,
			password: json['password']!,
		);
	}
}
