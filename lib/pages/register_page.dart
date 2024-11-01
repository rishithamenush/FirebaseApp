import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sports_gymnastics,
                  size: 100,
                ),
                //login animation
                Text("Hello Again!",
                  style: GoogleFonts.bebasNeue(
                      fontSize: 54
                  ),),
                const SizedBox(height: 10,),

                const Text("Welcome back, you\'ve been missed!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),

                const SizedBox(height: 50,),

                //email text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
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
                const SizedBox(height: 20,),

                //password Text field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
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

                const SizedBox(height: 15,),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text("Sign In",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Forgot Password? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text("Register Now",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
