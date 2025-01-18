import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_checkbox.dart';


class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
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
                    text: 'Is Organic Item?',
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
