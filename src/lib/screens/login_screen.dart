
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_app/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: BlocConsumer<AuthCubit, AuthState>(
				listener: (context, state) {
					if (state is Authenticated) {
						Navigator.of(context).pushReplacementNamed('/home');
					} else if (state is Unauthenticated) {
						ScaffoldMessenger.of(context).showSnackBar(
							SnackBar(
								content: Text('Login failed, please try again'),
							),
						);
					}
				},
				builder: (context, state) {
					if (state is AuthInitial || state is Unauthenticated) {
						return Padding(
							padding: const EdgeInsets.all(16.0),
							child: LoginForm(),
						);
					} else if (state is AuthLoading) {
						return Center(child: CircularProgressIndicator());
					} else {
						return Container();
					}
				},
			),
		);
	}
}
