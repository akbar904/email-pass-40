
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/auth_cubit.dart';
import 'package:my_app/cubits/auth_state.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Home'),
			),
			body: Center(
				child: ElevatedButton(
					onPressed: () {
						context.read<AuthCubit>().logout();
					},
					child: const Text('Logout'),
				),
			),
		);
	}
}
