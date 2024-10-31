import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
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

              //email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      contentPadding: EdgeInsets.only(left: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              //password Textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      contentPadding: EdgeInsets.only(left: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
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
              const SizedBox(height: 25,),
              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forgot Password? ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  Text("Register Now",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
