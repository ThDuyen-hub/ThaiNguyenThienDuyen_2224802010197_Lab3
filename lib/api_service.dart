import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  final String baseUrl = "https://69e5e79ace4e908a155e9fb6.mockapi.io/login/users";

  Future<bool> login(String email, String password) async {
    try {
      final response = await dio.get(baseUrl);

      for (var user in response.data) {
        if (user['email'] == email &&
            user['password'] == password) {
          return true;
        }
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // SIGN UP
  Future<void> signup(String email, String password) async {
    await dio.post(baseUrl, data: {
      "email": email,
      "password": password,
    });
  }

  // RESET PASSWORD (giả lập)
  Future<void> resetPassword(String email) async {
    print("Reset password for $email");
  }
}
