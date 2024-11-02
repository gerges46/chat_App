/* import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
 const CustomTextFormField({this.onChanged, super.key, this.hint,  this.suffixIcon,this.isSeen=false});
  final String? hint;
 final bool isSeen;
final  Function(String)? onChanged;
final Widget ?suffixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
  
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      obscureText: !widget.isSeen,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
} */

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
 CustomTextFormField({
    this.onChanged, 
    this.hint, 
    this.suffixIcon, 
    super.key,
    this.isSeen=false,
  });

  final String? hint;
  bool isSeen ;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      obscureText: widget.isSeen,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffixIcon:widget.suffixIcon,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

