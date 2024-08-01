import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/helpers/form_field_validation_mixin.dart';
import 'package:flutter_recruitment_task/src/view/person_list/block/person_block.dart';
import 'package:flutter_recruitment_task/src/view/person_list/view/person_form_view/person_form_view_section/floating_action_button_section.dart';
import 'package:flutter_recruitment_task/src/view/widgets/form_field_section.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

class PersonFormView extends StatefulWidget {
  const PersonFormView({super.key});
  static const routeName = '/personFormView';
  @override
  State<PersonFormView> createState() => _PersonFormViewState();
}

class _PersonFormViewState extends State<PersonFormView>
    with FormFielValidation {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PersonFloatinActionButtonFormSection(
        formKey: formKey,
      ),
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 65),
          child: BlocBuilder<PersonBloc, PersonState>(
              builder: (context, state) => Form(
                    key: formKey,
                    child: Column(
                      children: [
                        FormFieldSection(
                          title: 'First Name',
                          hintText: 'Enter Name',
                          initialValue: state.person?.firstName ?? '',
                          onSave: (value) => context
                              .read<PersonBloc>()
                              .saveFormData(
                                  {PersonFieldName.firstName.name: value}),
                          validator: (value) => simpleFieldValidation(value),
                        ),
                        FormFieldSection(
                          title: 'Last Name',
                          hintText: 'Enter Last Name',
                          initialValue: state.person?.lastName ?? '',
                          onSave: (value) => context
                              .read<PersonBloc>()
                              .saveFormData(
                                  {PersonFieldName.lastName.name: value}),
                          validator: (value) => simpleFieldValidation(value),
                        ),
                        FormFieldSection(
                          title: 'Birth Date',
                          hintText: 'dd/mm/yyyy',
                          initialValue: state.person?.birthDate ?? '',
                          inputFormat: InputFormatters.birthDate,
                          onSave: (value) => context
                              .read<PersonBloc>()
                              .saveFormData(
                                  {PersonFieldName.birthDate.name: value}),
                          validator: (value) => birthDateFieldValidation(value),
                        ),
                        FormFieldSection(
                          title: 'Zip code',
                          hintText: '00-000',
                          initialValue: state.person?.zipCode ?? '',
                          inputFormat: InputFormatters.zipCode,
                          onSave: (value) => context
                              .read<PersonBloc>()
                              .saveFormData(
                                  {PersonFieldName.zipCode.name: value}),
                          validator: (value) => zipCodeFieldValidation(value),
                        ),
                        FormFieldSection(
                          title: 'City',
                          hintText: 'Enter City',
                          initialValue: state.person?.city ?? '',
                          onSave: (value) => context
                              .read<PersonBloc>()
                              .saveFormData({PersonFieldName.city.name: value}),
                          validator: (value) => simpleFieldValidation(value),
                        ),
                        FormFieldSection(
                          title: 'Street',
                          hintText: 'Enter Street',
                          initialValue: state.person?.street ?? '',
                          onSave: (value) => context
                              .read<PersonBloc>()
                              .saveFormData(
                                  {PersonFieldName.street.name: value}),
                          validator: (value) => simpleFieldValidation(value),
                        ),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
