import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:createnotesalex9/data/note_model.dart';
import 'package:createnotesalex9/logic/create_note/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  CreateNoteCubit() : super(CreateNoteInitialState());

  /// function to create note , take data from ui to set this data in firebase firestore

  Future createNote(NoteModel x) async {
    emit(CreateNoteLoadingState());
    try {
   await FirebaseFirestore.instance.collection("notes").add(x.toJson());
   emit(CreateNoteSuccessState());
      
    } catch (e) {
      emit(CreateNoteErrorState(e.toString()));
    }
  }
}
