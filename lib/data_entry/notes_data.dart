import 'package:bullet_journal/data/journal_database.dart';
import 'package:bullet_journal/services/journal_entrytypes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesData extends StatefulWidget {
  @override
  _NotesDataState createState() => _NotesDataState();
}

class _NotesDataState extends State<NotesData> {

  final _controller = TextEditingController();
  bool _validate = true;
  int _layer = 0;
  int _previousLayer = -1;
  String _title = "New Note";

  Map _data = {};
  Note _currentNote;
  journal_entryMode _mode = journal_entryMode.add;

  @override
  Widget build(BuildContext context) {

    _data = ModalRoute.of(context).settings.arguments;

    if (_data != null)
    {
       _mode = _data["entryMode"];
       _currentNote = _data["noteItem"];

       if (_currentNote != null)
       {
         _layer = _data["layer"];
         _previousLayer =  _currentNote.id;

       }

       if (_mode == journal_entryMode.edit)
       {
          _controller.text = _currentNote.noteDescription;
          _title = "Edit Note";
       }

    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(_title,
          style: TextStyle(
              fontSize: 30.0
          ),),
        backgroundColor: Colors.black,
        actions: [
          IconButton(

              icon: Icon(Icons.save),
              onPressed: () {
                setState(() {
                  _validate = _controller.text.length > 0 ? true : false;
                  if (_validate)
                  {
                    final database = Provider.of<NotesDao>(context, listen: false);

                    if (_mode == journal_entryMode.add)
                    {
                      final note = Note(
                        noteDescription: _controller.text,
                        previousLayerId: _previousLayer,
                        layerId: _layer,
                        dateAdded:DateTime.now(),
                        dateChanged: DateTime.now(),
                      );

                      database.insertNote(note);
                      _controller.clear();
                    }
                    
                    if (_mode == journal_entryMode.edit)
                    {
                      database.updateNote(_currentNote.copyWith(
                        noteDescription: _controller.text,
                        dateChanged: DateTime.now(),
                      ));

                      Navigator.pop(context);
                    }
                  }
                });
              },
              splashColor: Colors.black54,
            ),
        ],
      ),
      body:TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          hintText: 'New future task',
          errorText: _validate ? null : 'Please enter notes' ,
        ),
        maxLines: 5,
        keyboardType: TextInputType.text,
      ),
    );
  }
}

