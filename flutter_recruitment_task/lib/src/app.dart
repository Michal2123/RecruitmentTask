import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/view/group_list/group_view/group_detail_view.dart';
import 'package:flutter_recruitment_task/src/view/group_list/group_view/group_form_view/group_form_view.dart';
import 'package:flutter_recruitment_task/src/view/home_view.dart';
import 'package:flutter_recruitment_task/src/view/person_list/view/person_detail_view/person_detail_view.dart';
import 'package:flutter_recruitment_task/src/view/person_list/view/person_form_view/person_form_view.dart';
import 'package:flutter_recruitment_task/src/utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemeData.createTheme().theme,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case HomeView.routeName:
                return const HomeView();
              case GroupFormView.routeName:
                return const GroupFormView();
              case GroupDetailView.routeName:
                return const GroupDetailView();
              case PersonFormView.routeName:
                return const PersonFormView();
              case PersonDetailView.routeName:
              default:
                return const PersonDetailView();
            }
          },
        );
      },
    );
  }
}
