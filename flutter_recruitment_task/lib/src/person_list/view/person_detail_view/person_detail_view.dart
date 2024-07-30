import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/person_list/block/person_block.dart';
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
        child: BlocBuilder<PersonBloc, PersonState>(
          builder: (context, state) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              ParagraphSection(
                elements: [
                  const Text(
                    'Firstname',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    state.person?.firstName ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              ParagraphSection(
                elements: [
                  const Text(
                    'Lastname',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    state.person?.lastName ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              ParagraphSection(
                elements: [
                  const Text(
                    'Birth Date',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    state.person?.birthDate ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              ParagraphSection(
                elements: [
                  const Text(
                    'Adress',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    '${state.person?.zipCode ?? ''}, ${state.person?.city ?? ''}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    state.person?.street ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              ParagraphSection(
                elements: [
                  const Text(
                    'Groups',
                    style: TextStyle(fontSize: 24),
                  ),
                  Wrap(
                    spacing: 5,
                    children: [
                      for (var group in state.person?.groups ?? [])
                        Text(
                          group.toString(),
                          style: const TextStyle(fontSize: 18),
                        )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
