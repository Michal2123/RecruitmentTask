import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/model/person_model.dart';
import 'package:flutter_recruitment_task/src/person_list/block/person_block.dart';
import 'package:flutter_recruitment_task/src/person_list/view/person_detail_view/person_detail_view.dart';

class PersonListItem extends StatefulWidget {
  const PersonListItem({super.key, required this.person});
  final PersonModel person;

  @override
  State<PersonListItem> createState() => _PersonListItemState();
}

class _PersonListItemState extends State<PersonListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PersonBloc>().add(PersonSelect(person: widget.person));
        Navigator.of(context).pushNamed(PersonDetailView.routeName);
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
                    SizedBox(
                      child: Row(
                        children: [
                          Text(
                            widget.person.firstName,
                            style: const TextStyle(
                                fontSize: 24, overflow: TextOverflow.fade),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            widget.person.lastName,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.person.street},',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          widget.person.city,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context
                      .read<PersonBloc>()
                      .add(PersonDelete(person: widget.person));
                  context
                      .read<GroupBloc>()
                      .add(GroupEditPersonDelete(personId: widget.person.id));
                },
                child: const Icon(
                  Icons.person_remove,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
