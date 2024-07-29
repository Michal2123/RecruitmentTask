import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/person_list/view/person_detail_view/person_detail_view_sections/floating_action_button_section.dart';
import 'package:flutter_recruitment_task/src/person_list/view/person_detail_view/person_detail_view_sections/paragraph_section.dart';

class PersonDetailView extends StatelessWidget {
  static const routeName = '/personDetailView';
  const PersonDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: const PersonDetailFloatinActionButton(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: const [
            ParagraphSection(
              elements: [
                Text(
                  'Firstname',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Person 1',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            ParagraphSection(
              elements: [
                Text(
                  'Lastname',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Person 1',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            ParagraphSection(
              elements: [
                Text(
                  'Birth Date',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '01/01/2001',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            ParagraphSection(
              elements: [
                Text(
                  'Adress',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '00-102 Warszawa',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Marszałkowska 14/23',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            ParagraphSection(
              elements: [
                Text(
                  'Groups',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Group 1',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
