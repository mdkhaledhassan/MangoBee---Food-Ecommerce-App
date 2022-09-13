import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      this.validator,
      this.controller,
      this.labelText,
      this.pIcon1,
      this.pIcon2,
      this.sIcon1,
      this.sIcon2,
      this.obscureText,
      this.keyboardType,
      this.isSuffix});
  dynamic validator;
  TextEditingController? controller;
  String? labelText;
  IconData? pIcon1, pIcon2, sIcon1, sIcon2;
  bool? obscureText, isSuffix;
  TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText!,
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Color(0xff23AA49), width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Color(0xff23AA49), width: 1)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff23AA49), width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: widget.isSuffix == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !(widget.obscureText!);
                  });
                },
                icon: widget.obscureText == true
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Color(0xff23AA49),
                      ))
            : null,
        label: Text("${widget.labelText}"),
        alignLabelWithHint: true,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
