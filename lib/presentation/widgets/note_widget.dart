import 'package:createnotesalex9/core/colors_manager.dart';
import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

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
            Text("Meeting",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14
            ),),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text("Apple,Orange,Banana,Guava.",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ),),
                Spacer(),
                Text("9:00pm",style: TextStyle(
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
