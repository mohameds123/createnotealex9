import 'package:createnotesalex9/core/colors_manager.dart';
import 'package:createnotesalex9/logic/sign_up/cubit.dart';
import 'package:createnotesalex9/logic/sign_up/state.dart';
import 'package:createnotesalex9/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSecure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> SignUpCubit(FirebaseAuth.instance),
      child: BlocConsumer<SignUpCubit,SignUpStates>(
        listener:(context,state){

          if(state is SignUpSuccessState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Your account was created successfully"))
            );
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }
          else if (state is SignUpErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.em))
            );
          }
        } ,
        builder: (context,state) {
          return Scaffold(
            backgroundColor:ColorsManager.primaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Text(
                      "Create New Account ",
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
                    "Email",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  /// email TextFormField
                  TextFormField(
                    controller: emailController ,
                    style: TextStyle(
                      color: Colors.white,
                    ),

                    decoration: InputDecoration(
                      hintText: "example@gmail.com",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                      fillColor: ColorsManager.lightPurple,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.transparent
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.transparent
                          )
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
                    height: 16,
                  ),
                  Text(
                    "password",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  /// pass TextFormField
                  TextFormField(
                    controller: passController,
                    obscureText:isSecure == true ? true : false,
                    style: TextStyle(
                      color: Colors.white,
                    ),

                    decoration: InputDecoration(

                      suffixIcon: IconButton(
                          onPressed: (){
                            isSecure = !isSecure;
                            setState(() {

                            });
                          },
                          icon:Icon(isSecure == true?Icons.visibility_off_rounded : Icons.visibility,color: Colors.white,)
                      ),
                      hintText: "Enter Your Password",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                      fillColor: ColorsManager.lightPurple,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.transparent
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.transparent
                          )
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
                      context.read<SignUpCubit>().userSignUp(emailController.text,passController.text);

                    },
                    child: Center(
                      child: Container(
                        width: 312,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,

                        ),
                        child: Center(child: Text("Sign up",style: TextStyle(

                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),)),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
