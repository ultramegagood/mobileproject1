import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';

class NskDropDown extends StatelessWidget {
  const NskDropDown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.label,
    this.hint,
  }) : super(key: key);
  final List<String?> items;
  final String? value;
  final Function(String?)? onChanged;
  final String? label;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonFormField(
        menuMaxHeight: 300,
        hint: Text(hint ?? ''),
        borderRadius: BorderRadius.circular(15),
        isExpanded: true,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          // label: label == null ? null : NskText(label!),
          labelText: label ?? null,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            letterSpacing: 1,
            color: Color.fromRGBO(83, 83, 83, 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: Color.fromRGBO(205, 218, 249, 1), width: 2),
          ),
        ),
        icon: const Icon(
          CupertinoIcons.chevron_down,
          color: Colors.black,
        ),
        value: value,
        items: items
            .map<DropdownMenuItem<String>>(
              (String? value) => DropdownMenuItem(
                value: value,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: NskText(
                    value!,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
