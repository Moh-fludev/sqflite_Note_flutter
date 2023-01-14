import 'package:app03/models/db_connect.dart';
import 'package:app03/widgets/card__note.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final Function insertitem;
  final Function deleteitem;

  var db = Databaseconnect();
  TodoList({required this.insertitem, required this.deleteitem, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: db.gettodo(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            var data = snapshot.data;
            var lengthdata = data!.length;
            return lengthdata == 0
                ? const Center(child: Text('No data'))
                : ListView.builder(
                    itemCount: lengthdata,
                    itemBuilder: (context, index) {
                      return CardNote(
                        id: data[index].id,
                        title: data[index].title,
                        creationdate: data[index].creationdate,
                        ischecked: data[index].ischecked,
                        insertnote: insertitem,
                        deletenote: deleteitem,
                      );
                    },
                  );
          }),
    );
  }
}
