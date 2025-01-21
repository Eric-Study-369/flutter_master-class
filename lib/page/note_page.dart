import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/drawer.dart';
import 'package:flutter_tutorial/models/note.dart';
import 'package:flutter_tutorial/models/note_database.dart';
import 'package:flutter_tutorial/models/note_tile.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class Notespage extends StatefulWidget {
  const Notespage({super.key});

  @override
  State<Notespage> createState() => _NotespageState();
}

class _NotespageState extends State<Notespage> {
  // text controller to acess that the user type
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // on app statret up, fetch exite note
    readNote();
  }

  //create note
  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              content: TextField(
                controller: textController,
              ),
              actions: [
                //create button
                MaterialButton(
                  onPressed: () {
                    //add to database
                    context.read<NoteDatabase>().addNote(textController.text);

                    // clear controller
                    textController.clear();

                    //pop dialog box
                    Navigator.pop(context);
                  },
                  child: const Text("Create"),
                ),
              ],
            ));
  }

  //read note
  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update note
  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: const Text("Update Note"),
              content: TextField(controller: textController),
              actions: [
                MaterialButton(
                  onPressed: () {
                    //update note in db
                    context
                        .read<NoteDatabase>()
                        .updateNote(note.id, textController.text);
                    textController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                )
              ],
            ));
  }

  // delete note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    //note database
    final noteDatabase = context.watch<NoteDatabase>();

    //current note
    List<Note> currentNote = noteDatabase.currentNote;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //HEADING
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          // LIST OF NOTES
          Expanded(
            child: ListView.builder(
                itemCount: currentNote.length,
                itemBuilder: (context, index) {
                  // get individual note
                  final note = currentNote[index];

                  // list tile ui
                  return NoteTile(
                    text: note.text,
                    onEditPressed: () => updateNote(note),
                    onDeletePressed: () => deleteNote(note.id),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
