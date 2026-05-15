

class AuthService {
  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      // final response = await ApiClient.instance.post('/auth/login', data: {
      //   'email': email,
      //   'password': password,
      // });
      // return response.data;

      // Simulating login
      await Future.delayed(const Duration(seconds: 1));
      if (email == 'test@example.com' && password == 'password') {
        return {
          'token': 'mock_token_123',
          'user': {
            'id': '1',
            'name': 'Test User',
            'email': email,
          }
        };
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      // await ApiClient.instance.post('/auth/signup', data: {
      //   'name': name,
      //   'email': email,
      //   'password': password,
      // });
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    // await ApiClient.instance.post('/auth/logout');
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
