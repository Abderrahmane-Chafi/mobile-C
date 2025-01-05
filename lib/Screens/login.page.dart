import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  // Correctly initialize the GlobalKey for FormState
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  final TextEditingController emailcontroller  = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _passVariable  = false;

  // String? _emailvalidator(String? value) {
  //   if (value == null || value.isEmpty) return 'Please enter your email';
  //   final _emailpattern = r'^[^@]+@[^@]+\.[^@]+';
  //   final regexp = RegExp(_emailpattern);
  //   if (!regexp.hasMatch(value)) return "Please enter a valid email address";
  //   return null;
  // }
  //
  // String? _passvalidator(String? value) {
  //   if (value == null || value.isEmpty) return 'Please enter your password';
  //   if (value.length < 6) return 'Password must be at least 6 characters';
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home Page",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white, // Définir le fond noir ici
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("images/img1.PNG", height: 100, width: 100),
                  SizedBox(height: 20),
                  Text("Hello Back to the home Page",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, color: Colors.blueAccent)),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        labelText: "email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.deepOrange,
                        )),
                    keyboardType: TextInputType.emailAddress,
                    //validator: emailValidator,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passcontroller,
                    obscureText:
                    !_passVariable, //on veut que ca soit true par defaut
                    decoration: InputDecoration(
                        labelText: "password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.deepOrange,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passVariable = !_passVariable;
                              });
                            },
                            icon: Icon(_passVariable
                                ? Icons.visibility
                                : Icons.visibility_off))),

                    keyboardType: TextInputType.emailAddress,
                    //validator: passValidator,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (keyForm.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passcontroller.text,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login successful!')),
                            );
                            Navigator.pushNamed(context, "/home");

                          } on FirebaseAuthException catch (e) {
                            // Handle specific Firebase Auth errors
                            String errorMessage = 'An error occurred';

                            if (e.code == 'user-not-found') {
                              errorMessage = 'No user found for that email.';
                            } else if (e.code == 'wrong-password') {
                              errorMessage = 'Wrong password provided.';
                            } else if (e.code == 'invalid-email') {
                              errorMessage = 'The email address is badly formatted.';
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage)),
                            );

                          } catch (e) {
                            // Handle any other errors
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login failed: Something went wrong')),
                            );
                          }
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                      )
                  ),
                  SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: Text("Don't have an account ?",
                          style: TextStyle(
                              fontSize: 30, color: Colors.deepOrange)))
                ],
              ),
            )));
  }
}
