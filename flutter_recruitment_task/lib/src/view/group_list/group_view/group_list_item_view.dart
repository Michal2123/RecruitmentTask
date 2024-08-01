import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/group_view/group_detail_view.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';
import 'package:flutter_recruitment_task/src/view/person_list/block/person_block.dart';

class GroupListItem extends StatelessWidget {
  const GroupListItem({super.key, required this.group});
  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<GroupBloc>().add(GroupSelect(group: group));
        Navigator.pushNamed(context, GroupDetailView.routeName);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.groupName,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Wrap(spacing: 5, children: [
                      for (var person in group.groupMemberList)
                        Text(
                          person.firstName,
                          style: const TextStyle(fontSize: 18),
                        ),
                    ]),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<GroupBloc>().add(GroupDelete(group: group));
                  context
                      .read<PersonBloc>()
                      .add(PersonGroupDelete(groupId: group.id));
                },
                child: const Icon(
                  Icons.group_remove,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
