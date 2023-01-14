import 'package:app03/models/todo_model.dart';
import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final Function insertfun;
  final textcontroller = TextEditingController();
  UserInput({required this.insertfun, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: textcontroller,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Add new Tasks'),
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              var mytodo = Todo(
                  title: textcontroller.text,
                  creationdate: DateTime.now(),
                  ischecked: false);
              var x = 0;
              for (var i = 0; i < textcontroller.text.length; i++) {
                if (textcontroller.text[i] == ' ') {
                  x = 1;
                }
              }
              if (textcontroller.text.isNotEmpty && x != 1) {
                insertfun(mytodo);
              }
            },
            child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(15)),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: const Text('Add')),
          )
        ],
      ),
    );
  }
}
