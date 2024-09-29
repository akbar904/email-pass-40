
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_app/screens/login_screen.dart';

class MockAuthCubit extends Mock implements AuthCubit {}
class MockAuthState extends Mock implements AuthState {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password fields with login button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(TextField), findsNWidgets(2)); // Assuming there are two TextFields: one for email and one for password
			expect(find.text('Login'), findsOneWidget); // Assuming the Login button has text 'Login'
		});

		testWidgets('should display error message when login fails', (WidgetTester tester) async {
			final mockAuthCubit = MockAuthCubit();

			whenListen(
				mockAuthCubit,
				Stream.fromIterable([Unauthenticated(), Authenticated()]),
				initialState: Unauthenticated(),
			);

			await tester.pumpWidget(MaterialApp(
				home: BlocProvider<AuthCubit>(
					create: (_) => mockAuthCubit,
					child: LoginScreen(),
				),
			));

			expect(find.text('Login failed, please try again'), findsOneWidget);
		});
	});

	group('AuthCubit Tests', () {
		blocTest<AuthCubit, AuthState>(
			'emits [Authenticated] when login is successful',
			build: () => AuthCubit(),
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [Authenticated()],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [Unauthenticated] when login fails',
			build: () => AuthCubit(),
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [Unauthenticated()],
		);
	});
}
