import 'package:createnotesalex9/core/colors_manager.dart';
import 'package:createnotesalex9/data/note_model.dart';
import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
   NoteWidget({super.key, required this.note});
  NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 80,
      decoration: BoxDecoration(
        color: ColorsManager.lightPurple,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4,
            ),
            Text(note.headline,style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14
            ),),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(note.description,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ),),
                Spacer(),
                Text("${note.time.hour}:${note.time.minute}${note.time.hour >= 12 ? " Pm" : " Am"}".toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
