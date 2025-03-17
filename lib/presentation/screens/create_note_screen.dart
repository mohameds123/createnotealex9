import 'dart:io';

import 'package:createnotesalex9/core/colors_manager.dart';
import 'package:createnotesalex9/data/note_model.dart';
import 'package:createnotesalex9/logic/create_note/cubit.dart';
import 'package:createnotesalex9/logic/create_note/state.dart';
import 'package:createnotesalex9/presentation/screens/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CreateNoteScreen extends StatefulWidget {
  CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenScreenState();
}

class _CreateNoteScreenScreenState extends State<CreateNoteScreen> {
  TextEditingController headLineController = TextEditingController();
  TextEditingController desController = TextEditingController();
  XFile? selectedImage;

  Future selectImage() async {
    final ImagePicker picker = ImagePicker();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);

                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      setState(() {
                        selectedImage = image;
                      });
                    }
                  },
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Text(
                        "gallery",
                        style: TextStyle(
                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      setState(() {
                        selectedImage = image;
                      });
                    }
                  },
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Text(
                        "Camera",
                        style: TextStyle(
                            color: ColorsManager.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<String?> uploadDate(XFile media) async {
    try {
      //1- upload location
      final x = FirebaseStorage.instance.ref().child("flutteralex9/");
      //2- uploading
      await x.putFile(File(media.path));
      //3- upload url
      return await x.getDownloadURL();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNoteCubit(),
      child: BlocConsumer<CreateNoteCubit, CreateNoteState>(
        listener: (context, state) {
          if (state is CreateNoteSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Your Note was created successfully")));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else if (state is CreateNoteErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please Try Again !! ${state.em}")));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorsManager.primaryColor,
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
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: headLineController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter Note Address",
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
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "description",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 192,
                      decoration: BoxDecoration(
                          color: ColorsManager.lightPurple,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: desController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter Your Description",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                          fillColor: Colors.transparent,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    if (selectedImage != null)
                      Image.file(
                        File(selectedImage!.path),
                        height: 200,
                        width: double.infinity,
                      ),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        selectImage();
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
                            "Select Image",
                            style: TextStyle(
                                color: ColorsManager.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () async{
                        if (selectedImage != null) {
                          final imageUrl = await uploadDate(selectedImage!);
                          context.read<CreateNoteCubit>().createNote(
                                NoteModel(
                                  headline: headLineController.text,
                                  description: desController.text,
                                  time: DateTime.now(),
                                  mediaUrl: imageUrl,
                                ),
                              );
                        }else{
                          context.read<CreateNoteCubit>().createNote(
                            NoteModel(
                              headline: headLineController.text,
                              description: desController.text,
                              time: DateTime.now(),
                            ),
                          );
                        }
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
                            "Create",
                            style: TextStyle(
                                color: ColorsManager.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
