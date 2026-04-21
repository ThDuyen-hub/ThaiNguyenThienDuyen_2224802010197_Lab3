import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  final String baseUrl = "https://69e6f79268208c1debe81753.mockapi.io/users";

  Future<bool> login(String email, String password) async {
    try {
      print("CALL API...");

      final response = await dio.get(baseUrl);

      print("API RESPONSE:");
      print(response.data);

      for (var user in response.data) {
        print("CHECK USER: $user");

        if (user['email'] == email &&
            user['password'] == password) {
          print("MATCH FOUND");
          return true;
        }
      }

      print("NO MATCH");
      return false;

    } catch (e) {
      print("API ERROR: $e");
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
