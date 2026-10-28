import 'package:course/code/data_Note.dart';
import 'package:course/model/note.dart';
import 'package:flutter/material.dart';


class NoteControler{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController titleControler = TextEditingController();
  TextEditingController noteControler = TextEditingController();
   NotesDatabase datanote = NotesDatabase();

  addData (){
  Note note = Note(title: titleControler.text, noteText: noteControler.text);
  datanote.insert(note);
  
  }
}