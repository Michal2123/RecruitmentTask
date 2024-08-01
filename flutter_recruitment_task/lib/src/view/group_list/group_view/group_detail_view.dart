import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/group_view/group_form_view/group_form_view.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';

class GroupDetailView extends StatelessWidget {
  const GroupDetailView({super.key});

  static const routeName = '/groupDetailView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GroupBloc>().add(GroupFormCreate());
          Navigator.pushNamed(context, GroupFormView.routeName);
        },
        child: const Text(
          'Edit',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Group name',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  state.group?.groupName ?? '',
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Group members',
                    style: TextStyle(fontSize: 24),
                  ),
                  Wrap(
                    spacing: 5,
                    children: [
                      for (var person in state.group?.groupMemberList ??
                          <GroupMemberModel>[])
                        Text(
                          person.firstName,
                          style: const TextStyle(fontSize: 18),
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
