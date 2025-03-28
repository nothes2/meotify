import 'package:meowdify/features/user/data/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<bool> execute(String username, String password) {
    return authRepository.login(username, password);
  }
}
