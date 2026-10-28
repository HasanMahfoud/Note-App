

class Note {
  int? id;
  String? title;
  String? noteText;

  Note({this.id,this.title,this.noteText});

  factory Note.fromJson(json){
    return Note(
     id: json["id"],
     title: json["title"],
     noteText: json["noteText"]
     );
  }
   toJson (){
    return {
      "title" : this.title,
      "noteText" : this.noteText
    };
   }
}

