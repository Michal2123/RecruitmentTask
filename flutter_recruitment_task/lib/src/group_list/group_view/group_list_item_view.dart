import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_detail_view.dart';

class GroupListItem extends StatelessWidget {
  const GroupListItem({super.key, required this.title, required this.describe});
  final String title;
  final String describe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, GroupDetailView.routeName),
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
                  Icons.group_remove,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
