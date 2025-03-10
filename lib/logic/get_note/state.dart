import 'package:createnotesalex9/data/note_model.dart';

class GetNotesState{}

class GetNotesInitialState extends GetNotesState{}

class GetNotesLoadingState extends GetNotesState{}

class GetNotesSuccessState extends GetNotesState{
  List <NoteModel> noteModelData;
  GetNotesSuccessState(this.noteModelData);
}

class GetNotesErrorState extends GetNotesState{
  final String em;
  GetNotesErrorState(this.em);
}