import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/person_list/person_view/person_detail_view/person_detail_view.dart';

class PersonListItem extends StatelessWidget {
  const PersonListItem(
      {super.key, required this.title, required this.describe});
  final String title;
  final String describe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(PersonDetailView.routeName),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      describe,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => {},
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
