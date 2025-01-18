import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_checkbox.dart';


class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
           value: isChecked,
          onChanged: (value) {
             isChecked= value;
             widget.onChanged(isChecked);
             setState(() {

             });

            // ignore: avoid_print
                  },

       ),
        const SizedBox(width: 16,),
       const  Expanded(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Is Featured Item?',
                    style: AppTextStyles.semiBold13,
                  ),

                ],
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),

      ],
    );
  }
}
