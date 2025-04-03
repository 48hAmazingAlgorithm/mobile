import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sportin",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
            child: Column(
          spacing: MediaQuery.of(context).size.height * 0.1,
          children: [
            Text("Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                )),
            LoginForm(),
            Text("Forgot password ?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.85, 50),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  overlayColor: Color.fromARGB(255, 58, 165, 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                          width: 2, color: Color.fromARGB(255, 58, 165, 8)))),
              onPressed: () async {
                Navigator.pushReplacementNamed(context, '/signin');
              },
              child: Text('Register', style: TextStyle(fontSize: 20)),
            ),
          ],
        )));
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String errorMessage = "";
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                cursorColor: Color.fromARGB(255, 58, 165, 8),
                validator: (formEmail) {
                  if (formEmail == null || formEmail == "") {
                    return 'Please enter a valid email';
                  }
                  email = formEmail;
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 58, 165, 8))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  floatingLabelStyle:
                      TextStyle(color: Color.fromARGB(255, 58, 165, 8)),
                  labelText: "Email address",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: TextFormField(
                cursorColor: Color.fromARGB(255, 58, 165, 8),
                obscureText: _passwordVisible,
                validator: (formPassword) {
                  if (formPassword == null || formPassword == "") {
                    return 'Please enter a password';
                  }
                  password = formPassword;
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 58, 165, 8))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  floatingLabelStyle:
                      TextStyle(color: Color.fromARGB(255, 58, 165, 8)),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () async {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            if (errorMessage.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.85, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 58, 165, 8),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: (){},
              child: Text("Login", style: TextStyle(fontSize: 20)),
            )
          ],
        ));
  }
}
