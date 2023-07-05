import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    if (email == 'admin.01@gmail.com' && password == '12345') {
      await UserInfo().setToken("admin");
      await UserInfo().setUserID("1");
      await UserInfo().setEmail("admin");
      isLogin = true;
    }
    return isLogin;
  }
}
