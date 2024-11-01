import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/error_box.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSigningUp = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    if (_formKey.currentState!.validate() && !_isSigningUp) {
      setState(() {
        _isSigningUp = true;
      });
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        showErrorDialog(
          context,
          "Registration Failed",
          e.message ?? "An unknown error occurred",
        );
      } finally {
        setState(() {
          _isSigningUp = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shield_moon_outlined,
                        size: 100,
                      ),
                      Text(
                        "Hello There!",
                        style: GoogleFonts.bebasNeue(fontSize: 54),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Register Below with your Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 50),

                      // Email TextFormField with Validator
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: "Email",
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password TextFormField with Validator
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: "Password",
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Confirm Password TextFormField with Validator
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password";
                            } else if (value != _passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: "Confirm Password",
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Sign-Up Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                          onTap: _isSigningUp ? null : signUp,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: _isSigningUp ? Colors.grey : Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Already a member? Login now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "I am a Member ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.showLoginPage,
                            child: const Text(
                              "Login Now",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isSigningUp)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 34),
          child: ErrorBox(
            title: title,
            message: message,
          ),
        );
      },
    );
  }
}
