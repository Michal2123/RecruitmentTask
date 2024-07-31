import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';

class CheckboxFormField extends FormField<List<bool?>> {
  CheckboxFormField({
    super.key,
    required List<GroupMemberModel> items,
    required Function(bool? value, String id, String firstname) onChange,
    super.onSaved,
    super.validator,
  }) : super(
            initialValue: items.map((e) => e.isCheck).toList(),
            builder: (FormFieldState<List<bool?>> state) {
              return Column(children: [
                Container(
                  decoration: state.hasError
                      ? BoxDecoration(
                          border:
                              Border.all(color: Colors.red.shade700, width: 1),
                          borderRadius: BorderRadius.circular(15))
                      : null,
                  child: Column(
                    children: [
                      for (var item in items)
                        CheckboxListTile(
                          title: Text(
                            item.firstName,
                            style: const TextStyle(fontSize: 18),
                          ),
                          value: item.isCheck,
                          onChanged: (value) {
                            item = GroupMemberModel(
                                id: item.id,
                                firstName: item.firstName,
                                isCheck: value);
                            onChange(value, item.id, item.firstName);
                          },
                        )
                    ],
                  ),
                ),
                if (state.hasError) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Text('Check any person',
                          style: TextStyle(
                              color: Colors.red.shade700, fontSize: 12)),
                    ),
                  ),
                ],
              ]);
            });
}
