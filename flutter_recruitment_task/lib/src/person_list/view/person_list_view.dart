import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/person_list/block/person_block.dart';
import 'package:flutter_recruitment_task/src/person_list/view/persion_list_item_view.dart';
import 'package:flutter_recruitment_task/src/person_list/view/person_form_view.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, PersonFormView.routeName),
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      ),
      body: BlocListener<PersonBlock, PersonState>(
        listener: (context, state) {
          if (state.status == PersonStatus.error) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  const SnackBar(content: Text('Something went wrong :(')));
          }
        },
        child: BlocBuilder<PersonBlock, PersonState>(
          builder: (context, state) {
            if (state.status == PersonStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                children: [
                  for (var person in state.personList)
                    PersonListItem(
                      title: person.firstName,
                      describe: person.lastName,
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
