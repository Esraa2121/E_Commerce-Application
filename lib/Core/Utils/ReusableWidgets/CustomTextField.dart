import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String title;
  String hintTitle;
  TextEditingController controller;
  TextInputType? inputType;
  String? Function(String?)? validator;
  bool isObscure;
  Color? titleColor;
  Color textFieldColor;

  CustomTextField(
      {super.key,
      required this.titleColor,
      required this.textFieldColor,
      required this.title,
      required this.hintTitle,
      required this.controller,
      required this.validator,
      this.isObscure = false,
      this.inputType = TextInputType.text});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.title,
            style: TextStyle(color: widget.titleColor, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: widget.hintTitle,
                hintStyle: TextStyle(color: widget.titleColor),
                suffixIcon: widget.title == 'Password'
                    ? IconButton(
                        icon: Icon(
                          widget.isObscure == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: MyColors.honeydew,
                        ),
                        onPressed: () {
                          widget.isObscure = !widget.isObscure;
                          setState(() {});
                        },
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(width: 2, color: widget.textFieldColor)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(width: 2, color: MyColors.salmon)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(width: 2, color: widget.textFieldColor))),
            style: const TextStyle(color: MyColors.honeydew),
            onTap: () {},
            controller: widget.controller,
            keyboardType: widget.inputType,
            validator: widget.validator,
            obscureText: widget.isObscure,
          ),
        ),
      ],
    );
  }
}
