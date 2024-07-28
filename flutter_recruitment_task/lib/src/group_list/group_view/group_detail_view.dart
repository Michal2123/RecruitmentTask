import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_form_view.dart';

class GroupDetailView extends StatelessWidget {
  const GroupDetailView({super.key});

  static const routeName = '/groupDetailView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, GroupFormView.routeName),
        child: const Text(
          'Edit',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: const [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Group name',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Group1',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Group members',
                  style: TextStyle(fontSize: 24),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Preson1', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Preson1', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Preson1', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
