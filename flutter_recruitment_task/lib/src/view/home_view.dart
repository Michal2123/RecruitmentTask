import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/view/group_list/group_view/group_list_view.dart';
import 'package:flutter_recruitment_task/src/view/person_list/view/person_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Recruitment Taks'),
          ),
          body: const TabBarView(children: [PersonListView(), GroupListView()]),
          bottomNavigationBar: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
              text: 'Persons',
            ),
            Tab(
              icon: Icon(Icons.groups_2),
              text: 'Groups',
            ),
          ]),
        ));
  }
}
