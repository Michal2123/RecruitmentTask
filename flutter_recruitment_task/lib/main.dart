import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/person_list/block/person_block.dart';
import 'package:flutter_recruitment_task/src/repository/repository.dart';
import 'package:flutter_recruitment_task/src/simple_bloc_observer.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());
  final repository = Repository();
  Bloc.observer = SimpleBlocObserver();

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(
        lazy: false,
        create: (_) =>
            PersonBloc(repository: repository)..add(PersonListGet())),
    RepositoryProvider(
      lazy: false,
      create: (_) => GroupBloc(repository: repository)..add(GroupListGet()),
    )
  ], child: MyApp(settingsController: settingsController)));
}
