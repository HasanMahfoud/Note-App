
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:course/controller/noteControler.dart';
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/images/notes.jpg", fit: BoxFit.cover),
        ),
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Text(
                      "WELCOME TO NOTE APP ...",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 100,
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        child: Container(
                            child: Text(
                          "Add New Note",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const NotePage(),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => MyNotePage();
}

class MyNotePage extends State<NotePage> {

 NoteControler noteControler = NoteControler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/pen.jpg", fit: BoxFit.fill),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('Lets start typing'),
                          ],
                          isRepeatingAnimation: true,
                        ),
                      ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Form(
                    key: noteControler.formkey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child:  Container(
                            margin: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width/2 - 40,
                          child: TextFormField(
                           controller: noteControler.titleControler,
                            validator: (value) {
                              if (value!.trim().isEmpty)
                                return"This filed is requierd";
                              return null;
                            },
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.blue),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.green),
                                ),
                                hintText: "Title",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),),
                          ),
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: TextFormField(
                            controller: noteControler.noteControler,
                             validator: (value) {
                              if (value!.trim().isEmpty)
                                return "this field is requierd";
                              return null;
                            },
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.blue),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: const Color.fromARGB(255, 100, 175, 102)),
                                ),
                                hintText: "Enter your note",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 3 + 60,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                              if (noteControler.formkey.currentState!.validate()) {
                                print(noteControler.noteControler.text);
                                print(noteControler.titleControler.text);
                             
                              }  
                              },
                              child: Text("Save"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 98, 189, 101),
                                foregroundColor: Colors.black
                              ),
                            ),
                            )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
