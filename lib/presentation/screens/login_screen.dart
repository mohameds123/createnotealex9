import 'package:createnotesalex9/core/colors_manager.dart';
import 'package:createnotesalex9/presentation/screens/home_screen.dart';
import 'package:createnotesalex9/presentation/screens/sign_up_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            IconButton(
                onPressed: (){
              context.setLocale(
                context.locale.languageCode == "en" ? const Locale("ar") : Locale("en"),
              );

            }, icon: Icon(Icons.language)),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                "Hi, Welcome Back! ".tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Email".tr(),
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                  fillColor: ColorsManager.lightPurple,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.transparent
                    )
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "password".tr(),
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: isSecure == true ? true : false,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        isSecure = !isSecure;
                        setState(() {});
                      },
                      icon: Icon(
                        isSecure == true
                            ? Icons.visibility_off_rounded
                            : Icons.visibility,
                        color: Colors.white,
                      )),
                  hintText: "Enter Your Password",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                  fillColor: ColorsManager.lightPurple,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)
                  ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.transparent
                    )
                ),
              ),

            ),
            SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));

              },
              child: Center(
                child: Container(
                  width: 312,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    "Login".tr(),
                    style: TextStyle(
                        color: ColorsManager.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account ? ".tr(),
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                    },
                    child: Text(
                      "Sign Up".tr(),
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
