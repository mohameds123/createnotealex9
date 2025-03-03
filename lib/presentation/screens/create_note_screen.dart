import 'package:createnotesalex9/core/colors_manager.dart';
import 'package:flutter/material.dart';

class CreateNoteScreen extends StatefulWidget {
  CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenScreenState();
}

class _CreateNoteScreenScreenState extends State<CreateNoteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorsManager.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                "Create New Note ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Headline",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
        
                decoration: InputDecoration(
                    hintText: "Enter Note Address",
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
                "description",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 192,
                decoration: BoxDecoration(
                  color: ColorsManager.lightPurple,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
        
                  decoration: InputDecoration(
        
        
                      hintText: "Enter Your Description",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                      fillColor: Colors.transparent,
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
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Container(
                  width: 312,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
        
                  ),
                  child: Center(child: Text("Create",style: TextStyle(
        
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),)),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
