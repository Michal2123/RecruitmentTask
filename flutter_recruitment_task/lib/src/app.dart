import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_detail_view.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_form_view.dart';
import 'package:flutter_recruitment_task/src/home_view.dart';
import 'package:flutter_recruitment_task/src/person_list/person_view/person_detail_view/person_detail_view.dart';
import 'package:flutter_recruitment_task/src/person_list/person_view/person_form_view.dart';

import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(
            tabBarTheme: TabBarTheme(
                labelColor: Colors.blue,
                overlayColor: MaterialStatePropertyAll(Colors.blue.shade100),
                indicatorColor: Colors.blue),
            appBarTheme:
                const AppBarTheme(iconTheme: IconThemeData(color: Colors.blue)),
            iconTheme: const IconThemeData(color: Colors.blue),
            primarySwatch: Colors.blue,
            textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Colors.blue,
                selectionHandleColor: Colors.blue,
                selectionColor: Colors.blue),
            elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(3),
                  alignment: Alignment.center,
                  overlayColor: MaterialStatePropertyAll(
                      Color.fromRGBO(237, 248, 255, 1)),
                  surfaceTintColor: MaterialStatePropertyAll(
                      Color.fromRGBO(251, 253, 255, 1)),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(251, 253, 255, 1)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))))),
            ),
            cardTheme: const CardTheme(
              elevation: 8,
              color: Color.fromRGBO(251, 253, 255, 1),
              surfaceTintColor: Color.fromRGBO(251, 253, 255, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
            inputDecorationTheme: InputDecorationTheme(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                fillColor: const Color.fromRGBO(255, 255, 255, 1),
                filled: true),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                elevation: 3,
                shape: CircleBorder(eccentricity: 1),
                foregroundColor: Colors.blue,
                //foregroundColor: Color.fromRGBO(251, 253, 255, 1),
                backgroundColor: Color.fromRGBO(251, 253, 255, 1),
                splashColor: Color.fromRGBO(237, 248, 255, 1)),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
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
      },
    );
  }
}
