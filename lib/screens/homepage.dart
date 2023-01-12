import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note2f/screens/note_editor.dart';
import 'package:note2f/screens/note_reader.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note2f/widget/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return /*Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomRight, colors: [
        Color.fromARGB(255, 4, 11, 88),
        Color.fromARGB(255, 104, 5, 99),
        Color.fromARGB(255, 79, 4, 46),
        Color.fromARGB(255, 102, 13, 6),
        Color.fromARGB(255, 113, 85, 28),
        Color.fromARGB(255, 132, 121, 18),
        Color.fromARGB(255, 5, 153, 173)
      ])),
      child:*/

        Stack(
      children: <Widget>[
        Image.asset(
          "assets/backgraund.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Note 2 F',
              style: TextStyle(fontFamily: 'RubikVinly', fontSize: 28, color: Colors.yellow[800]),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Notes',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return GridView(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          children: snapshot.data!.docs
                              .map((note) => noteCard(() {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => NoteReaderScreen(note)));
                                  }, note))
                              .toList(),
                        );
                      }
                      return Text(
                        'Heç bir Notunuz Yoxdur!',
                        style: GoogleFonts.nunito(color: Colors.white),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditorScreen()));
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.yellow[800],
          ),
        ),
      ],
    );
  }
}
