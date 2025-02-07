import 'package:product_app/helpers/helper.dart';




class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  String? _email;

  String? get email => _email;

  void login(String email) {
    _email = email;
    isAuthenticated = true;
    notifyListeners();
  }

}