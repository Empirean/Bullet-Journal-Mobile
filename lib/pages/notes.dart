import 'package:bullet_journal/services/journal_drawer.dart';
import 'package:bullet_journal/data/journal_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bullet_journal/services/journal_entrytypes.dart';



class NotesPage extends StatefulWidget {
  @override
  _NotesTaskState createState() => _NotesTaskState();
}

class _NotesTaskState extends State<NotesPage> {

  int _layer = 0;
  int _previousLayer = -1;
  bool _hasDrawer = true;
  String _title = 'Notes';

  Map _data = {};
  Note _currentNote;

  @override
  Widget build(BuildContext context) {

    _data = ModalRoute.of(context).settings.arguments;

    if (_data != null)
    {
      _hasDrawer = _data["hasDrawer"];
      _layer = _data["layer"];
      _currentNote = _data["noteItem"];

      _title = _currentNote.noteDescription;
      _previousLayer = _currentNote.id;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          _title,
          style: TextStyle(
              fontSize: 30.0
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildNoteList(context)),
          // Expanded(child: _buildTrackerList(context)),
        ],
      ),
      drawer: _hasDrawer ? JournalDrawer() : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/notes_data', arguments: {
            'noteItem': _currentNote,
            'layer' : _layer,
            "entryMode" : journal_entryMode.add,
          });
        },
        backgroundColor: Colors.black,
        splashColor: Colors.black54,
        child: Icon(
            Icons.add
        ),
      ),
    );
  }

  StreamBuilder<List<Note>> _buildNoteList(BuildContext context) {
    final database = Provider.of<NotesDao>(context, listen: false);
    return StreamBuilder(
      // stream: database.watchAllNotes(),
      stream: database.watchNotesInLayer(_layer, _previousLayer),
      builder: (context, AsyncSnapshot<List<Note>> snapshot) {
        final notes = snapshot.data ?? List();
        notes.add(new Note(id: -1));
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (_, index) {
            final itemTask = notes[index];
            return _buildNotesListItem(itemTask, database);
          },
        );
      },
    );
  }

  Widget _buildNotesListItem(Note noteItem, NotesDao database) {
    if (noteItem.id == -1)
    {
      return SizedBox(height: 80,);
    }
    return
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/notes', arguments: {
            "noteItem" : noteItem,
            "layer" : _layer + 1,
            "hasDrawer" : false,
          });
        },
        child: Card(
          child:
          Row(
            children: [
              Expanded(
                child:
                Text(
                  noteItem.noteDescription,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),

              PopupMenuButton(
                onSelected: (PopupMenuItemsValue result) {
                  setState(() {

                    if (result == PopupMenuItemsValue.delete)
                    {
                      database.deleteAllNoteId(noteItem);
                    }

                    if (result == PopupMenuItemsValue.edit)
                    {
                      Navigator.pushNamed(context, '/notes_data', arguments: {
                        'noteItem': noteItem,
                        'layer' : _layer,
                        "entryMode" : journal_entryMode.edit,}
                      );
                    }
                  });
                },
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<PopupMenuItemsValue>>
                [
                  const PopupMenuItem(
                      value: PopupMenuItemsValue.edit,
                      child: Text('Edit')),
                  const PopupMenuItem(
                      value: PopupMenuItemsValue.delete,
                      child: Text('Delete'))
                ],
              ),
            ],
          ),
        ),
      );
  }
}
