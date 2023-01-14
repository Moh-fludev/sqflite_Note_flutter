import 'package:app03/models/todo_model.dart';
import 'package:flutter/material.dart';

class CardNote extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationdate;
  bool ischecked;
  final Function insertnote;
  final Function deletenote;

  CardNote(
      {required this.id,
      required this.title,
      required this.creationdate,
      required this.ischecked,
      required this.insertnote,
      required this.deletenote,
      super.key});

  @override
  State<CardNote> createState() => _CardNoteState();
}

class _CardNoteState extends State<CardNote> {
  @override
  Widget build(BuildContext context) {
    var anothertodo = Todo(
        id: widget.id,
        title: widget.title,
        creationdate: widget.creationdate,
        ischecked: widget.ischecked);
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Checkbox(
              value: widget.ischecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.ischecked = value!;
                });
                anothertodo.ischecked = value!;
              },
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.creationdate.toString().substring(0, 19),
                style: const TextStyle(fontSize: 17),
              ),
            ],
          )),
          IconButton(
              onPressed: () {
                widget.deletenote(anothertodo);
              },
              icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
