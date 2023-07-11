import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class FormWidget {
  static Widget inputText(
      {required String label,
      required bool obscureText,
      required bool enableSuggestions,
      required bool autocorrect,
      Function(String? value)? onChangedCallback,
      String? hint,
      bool? enabled = true,
      bool readOnly = false,
      int? minLines = 1,
      int? maxLines = 1,
      TextInputType? keyboardType = TextInputType.text,
      Widget? prefixIcon,
      Widget? suffixIcon,
      TextEditingController? controller}) {
    return TextField(
      onChanged: onChangedCallback,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      minLines: minLines,
      maxLines: maxLines,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: false,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      controller: controller,
    );
  }

  static Widget dropdownButtonFormField({
    required List<Tuple2<dynamic, String>> items,
    isExpanded = false,
    String? hint,
    String? label,
    dynamic value,
    Function(dynamic value)? onChangedCallback,
  }) {
    List<DropdownMenuItem<dynamic>> itemAll = [];

    for (Tuple2<dynamic, String> item in items) {
      DropdownMenuItem<dynamic> itemWidget = DropdownMenuItem(value: item.item1, child: Text(item.item2));

      itemAll.add(itemWidget);
    }

    return DropdownButtonFormField<dynamic>(
      onChanged: onChangedCallback,
      value: value != '' ? value : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        isDense: true,
      ),
      isDense: false,
      items: itemAll,
      isExpanded: isExpanded,
    );
  }

  static Widget datePicker(
      {required BuildContext context,
      required Function(DateTime? value) onChangedCallback,
      Widget? label,
      String? hint,
      bool? readOnly,
      TextEditingController? controller}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              label: label,
              hintText: hint,
            ),
            controller: controller,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              onPressed: () async {
                if (readOnly == true) {
                  return;
                }

                DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 5),
                  lastDate: DateTime(DateTime.now().year + 5),
                );

                onChangedCallback(dateTime);
              },
              child: const Icon(FontAwesomeIcons.calendarDays),
            ),
          ),
        ),
      ],
    );
  }

  // static Widget autoCompleteInputText({
  //   required Future<Iterable> Function(String value) suggestionsCallback,
  //   required Widget Function(BuildContext context) noItemsFoundBuilder,
  //   required Widget Function(BuildContext context, dynamic suggestion)
  //       itemBuilder,
  //   required Function(dynamic suggestion) onSuggestionSelected,
  //   required bool enabled,
  //   String? label,
  //   String? hint,
  //   Widget? suffixIcon,
  //   TextEditingController? controller,
  // }) {
  //   return TypeAheadField(
  //     textFieldConfiguration: TextFieldConfiguration(
  //       autofocus: false,
  //       enabled: enabled,
  //       controller: controller,
  //       decoration: InputDecoration(
  //         labelText: label,
  //         hintText: hint,
  //         suffixIcon: suffixIcon,
  //       ),
  //     ),
  //     suggestionsCallback: suggestionsCallback,
  //     noItemsFoundBuilder: noItemsFoundBuilder,
  //     itemBuilder: itemBuilder,
  //     onSuggestionSelected: onSuggestionSelected,
  //   );
  // }

  static Widget header({
    required String title,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 2),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Get.theme.primaryColor,
          ),
        ),
      ),
      child: Text(
        title,
      ),
    );
  }
}
