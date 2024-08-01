import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/api/group_api.dart';
import 'package:flutter_recruitment_task/src/api/person_api.dart';
import 'package:flutter_recruitment_task/src/database/database_client.dart';
import 'package:flutter_recruitment_task/src/view/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/view/person_list/block/person_block.dart';
import 'package:flutter_recruitment_task/src/repository/repository.dart';
import 'package:flutter_recruitment_task/src/helpers/simple_bloc_observer.dart';

import 'src/app.dart';

void main() async {
  final dbClient = DatabaseClient.instance;

  final repository = Repository(
      personApi: PersonApi(dbClient: dbClient),
      groupApi: GroupApi(dbClient: dbClient));
  Bloc.observer = SimpleBlocObserver();

  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(
        lazy: false,
        create: (_) =>
            PersonBloc(repository: repository)..add(PersonListGet())),
    RepositoryProvider(
      lazy: false,
      create: (_) => GroupBloc(repository: repository)..add(GroupListGet()),
    )
  ], child: const MyApp()));
}
