import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';

class CheckboxFormField extends FormField<List<bool?>> {
  CheckboxFormField({
    super.key,
    required List<GroupMemberModel> items,
    required Function(GroupMemberModel item) onChange,
    required super.initialValue,
    super.onSaved,
    super.validator,
  }) : super(builder: (FormFieldState<List<bool?>> state) {
          return Column(children: [
            Container(
              decoration: state.hasError
                  ? BoxDecoration(
                      border: Border.all(color: Colors.red.shade700, width: 1),
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
                        item = item.copyWith(isCheck: value);
                        items[items.indexWhere(
                            (element) => element.id == item.id)] = item;
                        state.didChange(items.map((e) => e.isCheck).toList());
                        onChange(item);
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
                      style:
                          TextStyle(color: Colors.red.shade700, fontSize: 12)),
                ),
              ),
            ],
          ]);
        });
}
