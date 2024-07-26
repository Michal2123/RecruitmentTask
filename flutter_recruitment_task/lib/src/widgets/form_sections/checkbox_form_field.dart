import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<List<bool>> {
  CheckboxFormField(
      {super.key,
      required Map<String, bool> items,
      super.onSaved,
      super.validator,
      bool initialValue = false,
      bool autovalidate = false})
      : super(
            initialValue: items.values.toList(),
            builder: (FormFieldState<List<bool>> state) {
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
                      for (var item in items.entries)
                        CheckboxListTile(
                          title: Text(
                            item.key,
                            style: const TextStyle(fontSize: 18),
                          ),
                          value: item.value,
                          onChanged: (value) {},
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
              // CheckboxListTile(
              //   dense: state.hasError,
              //   title: title,
              //   value: state.value,
              //   onChanged: state.didChange,
              //   subtitle: state.value?.any((element) => element) ?? false
              //       ? Builder(
              //           builder: (BuildContext context) => Text(
              //             state.errorText ?? "",
              //             style: TextStyle(
              //                 color: Theme.of(context).colorScheme.error),
              //           ),
              //         )
              //       : null,
              //   controlAffinity: ListTileControlAffinity.leading,
              // );
            });
}
