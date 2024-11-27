import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Correctly initialize the GlobalKey for FormState
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();

  bool _passVisible = false;

  String? _emailvalidator(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    final _emailpattern = r'^[^@]+@[^@]+\.[^@]+';
    final regexp = RegExp(_emailpattern);
    if (!regexp.hasMatch(value)) return "Please enter a valid email address";
    return null;
  }

  String? _passvalidator(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(color: Colors.yellow, fontSize: 40),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: keyForm, // Use the correct key here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('images/logo.PNG', height: 120, width: 120),
              Text('Hello back to the home page'),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  prefixIcon: Icon(Icons.mail, color: Colors.red),
                ),
                validator: _emailvalidator,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passcontroller,
                obscureText: !_passVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.pink),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passVisible = !_passVisible;
                      });
                    },
                    icon: Icon(
                      _passVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _passvalidator,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate the form
                  if (keyForm.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing login')),
                    );
                    Navigator.pushNamed(context, "/home");
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30, color: Colors.deepPurple),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 30, color: Colors.pink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
