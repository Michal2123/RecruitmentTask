import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/person_list/block/person_block.dart';
import 'package:flutter_recruitment_task/src/person_list/view/persion_list_item_view.dart';
import 'package:flutter_recruitment_task/src/person_list/view/person_form_view/person_form_view.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

class PersonListView extends StatefulWidget {
  const PersonListView({super.key});

  @override
  State<PersonListView> createState() => _PersonListViewState();
}

class _PersonListViewState extends State<PersonListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PersonBloc>().add(PersonSelectClear());
          Navigator.pushNamed(context, PersonFormView.routeName);
        },
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      ),
      body: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) {
          if (state.status == PersonStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 80),
              children: [
                for (var person in state.personList)
                  PersonListItem(
                    person: person,
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}
