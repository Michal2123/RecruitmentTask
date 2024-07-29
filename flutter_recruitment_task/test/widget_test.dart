// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_detail_view.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_form_view.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_list_item_view.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_list_view.dart';
import 'package:flutter_recruitment_task/src/person_list/view/persion_list_item_view.dart';
import 'package:flutter_recruitment_task/src/person_list/view/person_detail_view/person_detail_view.dart';
import 'package:flutter_recruitment_task/src/person_list/view/person_form_view.dart';
import 'package:flutter_recruitment_task/src/person_list/view/person_list_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PersonFormView', () {
    testWidgets('Verify add person button present on PersonFormView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PersonFormView(),
      ));
      var fab = find.byType(FloatingActionButton);

      expect(fab, findsOne);
    });
    testWidgets('Verify number of TextFormField present on PersonFormView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PersonFormView(),
      ));
      var textFormField = find.byType(TextFormField);

      expect(textFormField, findsNWidgets(4));
    });
  });
  group('PersonListItem', () {
    testWidgets('Verify if PersonListItem takes title and describe parameters',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PersonListItem(
          title: 'T',
          describe: 'D',
        ),
      ));
      var titleText = find.text('T');
      var describeText = find.text('D');

      expect(titleText, findsOneWidget);
      expect(describeText, findsOneWidget);
    });
    testWidgets('Verify remove person icon present on PersonListItem',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PersonListItem(
          title: 'T',
          describe: 'D',
        ),
      ));
      var icon = find.byIcon(Icons.person_remove);

      expect(icon, findsOneWidget);
    });
    testWidgets('Verify two GestoreDetectors present on PersonListItem',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PersonListItem(
          title: 'T',
          describe: 'D',
        ),
      ));
      var gestureDetector = find.byType(GestureDetector);

      expect(gestureDetector, findsNWidgets(2));
    });
  });

  group('PersonDetailView', () {
    testWidgets('Verify FloatingActionButton present on PersonDetailView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PersonDetailView(),
      ));
      var fab = find.byType(FloatingActionButton);

      expect(fab, findsOne);
    });
    testWidgets(
        'Verify Firstname, Lastname, Birth Date, Adress and Groups present on PersonDetailView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: PersonDetailView(),
      ));
      var firstName = find.text('Firstname');
      var lastname = find.text('Lastname');
      var birthDate = find.text('Birth Date');
      var adress = find.text('Adress');
      var groups = find.text('Groups');

      expect(firstName, findsOneWidget);
      expect(lastname, findsOneWidget);
      expect(birthDate, findsOneWidget);
      expect(adress, findsOneWidget);
      expect(groups, findsOneWidget);
    });
  });

  testWidgets('Verify add person button present on PersonListView',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: PersonListView(),
    ));
    var fab = find.byType(FloatingActionButton);

    expect(fab, findsOne);
  });

  testWidgets('Verify add group button present on GroupListView',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: GroupListView(),
    ));
    var fab = find.byType(FloatingActionButton);

    expect(fab, findsOne);
  });

  group('GroupListItem', () {
    testWidgets('Verify if GroupListItem takes title and describe parameters',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GroupListItem(
          title: 'T',
          describe: 'D',
        ),
      ));
      var titleText = find.text('T');
      var describeText = find.text('D');

      expect(titleText, findsOneWidget);
      expect(describeText, findsOneWidget);
    });
    testWidgets('Verify remove group icon present on GroupListItem',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GroupListItem(
          title: 'T',
          describe: 'D',
        ),
      ));
      var icon = find.byIcon(Icons.group_remove);

      expect(icon, findsOneWidget);
    });
    testWidgets('Verify two GestoreDetectors present on GroupListItem',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GroupListItem(
          title: 'T',
          describe: 'D',
        ),
      ));
      var gestureDetector = find.byType(GestureDetector);

      expect(gestureDetector, findsNWidgets(2));
    });
  });
  group('GroupFormView', () {
    testWidgets('Verify FloatingActionButton present on GroupFormView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GroupFormView(),
      ));
      var gestureDetector = find.byType(FloatingActionButton);

      expect(gestureDetector, findsOneWidget);
    });

    testWidgets('Verify TextFormField present on GroupFormView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GroupFormView(),
      ));
      var textFormField = find.byType(TextFormField);

      expect(textFormField, findsOneWidget);
    });
    testWidgets('Verify CheckboxFormField present on GroupFormView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GroupFormView(),
      ));

      var checkBoxFormField = find.byKey(const ValueKey('checkboxKey'));

      expect(checkBoxFormField, findsOneWidget);
    });
  });
  group('GroupDetailView', () {
    testWidgets(
        'Verify Group name and Group members present on GroupDetailView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GroupDetailView(),
      ));
      var groupName = find.text('Group name');
      var groupMembers = find.text('Group members');

      expect(groupName, findsOneWidget);
      expect(groupMembers, findsOneWidget);
    });

    testWidgets('Verify FloatingActionButton present on GroupDetailView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: GroupFormView(),
      ));
      var gestureDetector = find.byType(FloatingActionButton);

      expect(gestureDetector, findsOneWidget);
    });
  });
}
