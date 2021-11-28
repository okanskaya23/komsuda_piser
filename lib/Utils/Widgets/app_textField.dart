import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:komsuda_piser_local/Utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final TextEditingController controller;
  final String Function(String value) validator;
  final bool readOnly;
  final Icon icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> formatterList;
  AppTextField(
      {Key key,
        @required this.text,
        this.width,
        this.height,
        this.controller,
        this.validator,
        this.icon,
        this.readOnly,
        this.keyboardType,
        this.formatterList,
        this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.white,
          errorColor: Appcolors.third,
        ),
        child: TextFormField(
          keyboardType: keyboardType ?? TextInputType.text,
          inputFormatters: formatterList ?? [],
          readOnly: readOnly ?? false,
          validator: validator,
          controller: controller,
          cursorColor: Appcolors.primary,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            prefixIcon: icon,
            filled: readOnly ?? false,
            fillColor: Colors.black12,
            border: OutlineInputBorder(),
            labelText: readOnly ? '' : text,
            hintText: readOnly ? text : '',
          ),
        ),
      ),
    );
  }
}
