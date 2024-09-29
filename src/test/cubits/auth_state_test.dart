
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_app/cubits/auth_state.dart';

void main() {
	group('AuthState', () {
		test('should have an initial state of AuthInitial', () {
			final state = AuthInitial();
			expect(state, isA<AuthInitial>());
		});

		test('should transition to Authenticated state', () {
			final state = Authenticated();
			expect(state, isA<Authenticated>());
		});

		test('should transition to Unauthenticated state', () {
			final state = Unauthenticated();
			expect(state, isA<Unauthenticated>());
		});
	});
}
