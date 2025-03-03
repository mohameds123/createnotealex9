import 'package:createnotesalex9/core/colors_manager.dart';
import 'package:createnotesalex9/presentation/screens/create_note_screen.dart';
import 'package:createnotesalex9/presentation/widgets/note_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onTap: (){},
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

            NoteWidget(),
          ],
        ),
      ),
    );
  }
}
