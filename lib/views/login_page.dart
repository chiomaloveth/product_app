import 'package:product_app/helpers/helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double _deviceHeight, _deviceWidth;
  String? _email;
  String? _password;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.02,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(238, 87, 28, 0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [1.0, 0.3]),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backArrow(),
                const SizedBox(
                  height: 40,
                ),
                _textTitle(),
                _subText(),
                _loginForm(),
                _buttonsBelow(),
                const SizedBox(
                  height: 50,
                ),
                _loginButton(),
              ],
            ),
          ),
        ));
  }

  Widget _backArrow() {
    return ElevatedButton.icon(
      onPressed: () => context.go("/"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        minimumSize: Size(50, 50),
      ),
      label: Icon(
        Icons.arrow_back,
        size: 25,
      ),
    );
  }

  Widget _textTitle() {
    return Container(
      child: Text(
        "Welcome Back",
        style: TextStyle(
          color: Color.fromRGBO(238, 87, 28, 1),
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: "fredoka",
        ),
      ),
    );
  }

  Widget _subText() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        "Enter your login details to access your \nshoptreo account.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontFamily: "fredoka",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      height: _deviceHeight * 0.25,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _emailTextField(),
            const SizedBox(
              height: 40,
            ),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter your Email',
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
        ),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: const Icon(
          Icons.email_outlined,
        ),
      ),
      style: const TextStyle(color: Colors.grey),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (value) {
        bool result = value!.contains(
          RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$'),
        );
        if (result == true) {
          return null;
        } else {
          return "Please Enter a Valid Email";
        }
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Enter your Password',
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ), // Border when enabled
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ), // Border when focused
          ),
          contentPadding: const EdgeInsets.all(16),
          suffixIcon: const Icon(
            Icons.visibility_off,
          ), // Padding inside the box
        ),
        style: const TextStyle(
          color: Colors.grey,
        ),
        onSaved: (value) {
          setState(() {
            _password = value;
          });
        },
        validator: (value) {
          if (value!.length > 6) {
            return null;
          } else {
            return "Please Enter a Password Greater Than 6 Characters";
          }
        });
  }

  Widget _buttonsBelow() {
    return Row(
      children: [
        _createAccount(),
        const SizedBox(
          width: 50,
        ),
        _forgetPassword()
      ],
    );
  }

  Widget _createAccount() {
    return ElevatedButton(
      onPressed: () => context.go("/register"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        "Create Account",
        style: TextStyle(
            color: Color.fromRGBO(
              238,
              87,
              28,
              1,
            ),
            fontFamily: "fredoka",
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _forgetPassword() {
    return ElevatedButton(
      onPressed: () => context.go("/forgotPassword"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        "Forgot Password?",
        style: TextStyle(
            color: Colors.black,
            fontFamily: "fredoka",
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      //height: _deviceHeight * 0.2,
      decoration: BoxDecoration(
        color: Color.fromRGBO(238, 87, 28, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: _loginUser,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: Size(
            _deviceWidth * 0.95,
            _deviceHeight * 0.07,
          ),
        ),
        child: const Text(
          "Continue",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  void _loginUser() {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();

      if (_email == null || _email!.isEmpty) {
        print("Error: Email is null or empty");
        return; // Stop execution if email is null
      }
      Provider.of<AuthProvider>(context, listen: false).login(_email!);

      context.push("/homePage");
    }
  }
}
