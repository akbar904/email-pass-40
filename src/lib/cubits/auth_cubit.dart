
import 'package:bloc/bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) {
		// Here you would normally have the logic for authenticating the user.
		// For simplicity, we will assume any login is successful.
		emit(Authenticated());
	}

	void logout() {
		emit(Unauthenticated());
	}
}
