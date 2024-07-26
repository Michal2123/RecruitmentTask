import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/person_list/person_view/persion_list_item_view.dart';
import 'package:flutter_recruitment_task/src/person_list/person_view/person_form_view.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PersonFormView())),
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        children: const [
          PersonListItem(
            title: 'Person 1',
            describe: 'Describe',
          ),
          PersonListItem(
            title: 'Person 2',
            describe: 'Describe',
          ),
        ],
      ),
    );
  }
}
