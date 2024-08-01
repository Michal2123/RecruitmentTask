import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/group_view/group_form_view/group_form_view.dart';
import 'package:flutter_recruitment_task/src/view/group_list/group_view/group_list_item_view.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

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
      body: BlocConsumer<GroupBloc, GroupState>(
        listener: (context, state) {
          if (state.status == GroupStatus.error) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something went wrong :(')));
          }
        },
        builder: (context, state) {
          if (state.status == GroupStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              children: [
                for (var group in state.groupList)
                  GroupListItem(
                    group: group,
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}
