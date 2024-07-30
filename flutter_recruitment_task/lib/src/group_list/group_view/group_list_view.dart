import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_form_view/group_form_view.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_list_item_view.dart';

class GroupListView extends StatelessWidget {
  const GroupListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GroupBloc>().add(GroupSelectClear());
          Navigator.pushNamed(context, GroupFormView.routeName);
        },
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      ),
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) => ListView(
          children: [
            for (var group in state.groupList)
              GroupListItem(
                group: group,
              ),
          ],
        ),
      ),
    );
  }
}
