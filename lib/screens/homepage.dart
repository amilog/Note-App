import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note2f/screens/note_editor.dart';
import 'package:note2f/screens/note_reader.dart';
import 'package:note2f/widget/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
            title: Stack(
              children: [
                Text(
                  'Note 2 F',
                  style: TextStyle(
                      fontFamily: 'RubikVinly',
                      fontSize: 33,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3),
                ),
                Text(
                  'Note 2 F',
                  style: TextStyle(fontFamily: 'RubikVinly', fontSize: 33, color: Colors.yellow[800]),
                ),
              ],
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
                Stack(
                  children: [
                    Text(
                      'Your Notes',
                      style: GoogleFonts.roboto(
                          fontSize: 28,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3),
                    ),
                    Text(
                      'Your Notes',
                      style: GoogleFonts.roboto(
                        color: Colors.yellow[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return GridView(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteEditorScreen()));
            },
            backgroundColor: Colors.yellow[800],
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
