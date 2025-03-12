import 'package:createnotesalex9/core/colors_manager.dart';
import 'package:createnotesalex9/logic/get_note/cubit.dart';
import 'package:createnotesalex9/logic/get_note/state.dart';
import 'package:createnotesalex9/presentation/screens/create_note_screen.dart';
import 'package:createnotesalex9/presentation/screens/login_screen.dart';
import 'package:createnotesalex9/presentation/widgets/note_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> GetNoteCubit()..getNotes(),
      child: Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNoteScreen()));
                      },
                      child: Container(
                        width: 164,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          "Add Note",
                          style: TextStyle(
                              color: ColorsManager.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

                      },
                      child: Container(
                        width: 164,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                              "Log out",
                              style: TextStyle(
                                  color: ColorsManager.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 32,
              ),

              BlocBuilder<GetNoteCubit,GetNotesState>(
                builder: (context, state){
                  if (state is GetNotesLoadingState){
                    return Center(child: CircularProgressIndicator());
                  }else if (state is GetNotesSuccessState){
                    final x = state.noteModelData;
                    return  SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: x.length,
                          itemBuilder:(context, index){
                          final y = x[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: NoteWidget(note: y,),
                          );
                          }
                      ),
                    );
                  }else if (state is GetNotesErrorState){
                    return Center(child: Text(state.em));
                  }else {
                    return SizedBox();
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
