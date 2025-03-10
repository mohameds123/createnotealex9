import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:createnotesalex9/logic/get_note/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/note_model.dart';

class GetNoteCubit extends Cubit<GetNotesState>{

  GetNoteCubit ():super(GetNotesInitialState());

  /// Function to get notes data from firebase


  Future getNotes ()async{
    emit(GetNotesLoadingState());
    try {
      final getData = await FirebaseFirestore.instance.collection("notes").get();

      final notes = getData.docs
          .map((doc) => NoteModel.fromJson(doc.data())).toList();

      emit(GetNotesSuccessState(notes));

    }catch (e){
      emit(GetNotesErrorState(e.toString()));
    }
  }
}