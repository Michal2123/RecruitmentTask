import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/person_list/person_view/person_form_view.dart';

class PersonDetailFloatinActionButton extends StatelessWidget {
  const PersonDetailFloatinActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, PersonFormView.routeName),
      child: const Text(
        'Edit',
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
