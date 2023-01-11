import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note2f/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {super.key});
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppStyle.cardsColor[color_id],
        actions: [
          IconButton(
              onPressed: () {
                FirebaseFirestore.instance.collection("Notes").doc(widget.doc["note_title"]).delete();
                Navigator.pop(context);
              },
              icon: Icon(Icons.highlight_remove_rounded))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStyle.dateTitle,
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                widget.doc["note_content"],
                style: AppStyle.mainContent,
              ),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add({
            "note_title": "note_title",
            "creation_date": "creation_date",
            "note_content": "note_content",
            "color_id": "color_id",
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("$error nömrəli xətaya görə notunuz əlavə oluna bilmədi!"));
        },
        child: Icon(Icons.save),
      ),*/
    );
  }
}
