import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint, required this.keyboardType,  this.suffixIcon,this.obscureText, this.onSaved,this.maxLines=1});
  final String hint;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: keyboardType,
      maxLines:maxLines ,
      onSaved: onSaved ,
      obscureText: obscureText ?? false,
      validator: (value)
      {
        if(value!.isEmpty||value==null)
        {
          return 'This field is required';
        }
        return null;
      },

      decoration:  InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        disabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        hintText: hint,
        hintStyle: AppTextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        suffixIcon: suffixIcon,


      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(

        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width:1,
          color: Color(0xFFE6E9E9),

        )
      );
  }
}
