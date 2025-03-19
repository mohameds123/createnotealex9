import 'package:createnotesalex9/logic/sign_up/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit <SignUpStates>{
  FirebaseAuth firebaseAuth;
  SignUpCubit(this.firebaseAuth): super(SignUpInitialState());

  /// create function to take email,pass from user and sign up

 Future userSignUp (String userEmail, String userPass)async{
   emit(SignUpLoadingState());
   try{
    await firebaseAuth.createUserWithEmailAndPassword(email: userEmail, password: userPass);
     emit(SignUpSuccessState());
   }catch (e){
     emit(SignUpErrorState(e.toString()));
   }
 }
 // sign up with google
Future googleSignUp()async{
   emit(SignUpLoadingState());
   try{

     final googleProvider = GoogleAuthProvider();
     await firebaseAuth.signInWithProvider(googleProvider);
     emit(SignUpSuccessState());

   }catch(e){
     print("GoogleError>>>>>>$e");
     emit(SignUpErrorState(e.toString()));

   }
}
}