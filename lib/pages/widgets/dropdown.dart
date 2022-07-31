import 'package:flutter/material.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';

class DropdownMenu extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? items;
  final String? hintText;
  final String? hint;
  final dynamic value;
  final void Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  const DropdownMenu({
    Key? key,
    this.items,
    this.hintText,
    this.hint,
    this.onChanged,
    this.validator,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, left: 15, right: 15),
      child: DropdownButtonFormField(
          hint: NskText(
            hint!,
            color: Colors.grey,
          ),
          validator: validator,
          decoration: InputDecoration(
              hintText: hintText,
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  letterSpacing: 1,
                  color: Color.fromRGBO(83, 83, 83, 1)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(205, 218, 249, 1), width: 2))),
          onChanged: onChanged,
          value: value,
          items: items),
    );
  }
}
