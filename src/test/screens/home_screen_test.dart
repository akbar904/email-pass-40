
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/cubits/auth_cubit.dart';
import 'package:my_app/cubits/auth_state.dart';

// Mocking AuthCubit
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays Logout button', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();
			when(() => mockAuthCubit.state).thenReturn(Authenticated());

			await tester.pumpWidget(MaterialApp(
				home: BlocProvider<AuthCubit>.value(
					value: mockAuthCubit,
					child: HomeScreen(),
				),
			));

			// Act & Assert
			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('calls logout on AuthCubit when Logout button is tapped', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();
			when(() => mockAuthCubit.state).thenReturn(Authenticated());

			await tester.pumpWidget(MaterialApp(
				home: BlocProvider<AuthCubit>.value(
					value: mockAuthCubit,
					child: HomeScreen(),
				),
			));

			// Act
			await tester.tap(find.text('Logout'));
			await tester.pump();

			// Assert
			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
