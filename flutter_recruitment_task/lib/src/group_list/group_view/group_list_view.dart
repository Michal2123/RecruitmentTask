import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_form_view.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_list_item_view.dart';

class GroupListView extends StatelessWidget {
  const GroupListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, GroupFormView.routeName),
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      ),
      body: ListView(
        children: const [
          GroupListItem(
            title: 'Group 1',
            describe: 'Describe',
          ),
          GroupListItem(
            title: 'Group 2',
            describe: 'Describe',
          ),
        ],
      ),
    );
  }
}
