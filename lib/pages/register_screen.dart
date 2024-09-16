import 'package:flutter/material.dart';

import '../styles/const.dart';
import 'home_screen_real_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://engineeringdiscoveries.com/wp-content/uploads/2021/07/Simple-House-Design-Plans-9.m-x9.0m-With-3-Bedroom.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Discover Dream House from SmartPhones",
            textAlign: TextAlign.center,
            style: headlineStyle,
          ),
          const SizedBox(height: 20),
          Text(
            "The NO 1. App for searching and finding \n the most the most suitable house with you.",
            textAlign: TextAlign.center,
            style: headlineStyle2,
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomeScreenRealState()));
            },
            child: Container(
              width: 300,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  "Register",
                  style: buttonText,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account?  ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                ),
                TextSpan(
                  text: "Log In",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
