import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color.dart';

class IsOrganic extends StatefulWidget {
  const IsOrganic({Key? key, required this.onChange}) : super(key: key);

  final ValueChanged<bool> onChange;

  @override
  State<IsOrganic> createState() => _IsOrganicState();
}

class _IsOrganicState extends State<IsOrganic> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Is it Organic?"),
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
            widget.onChange(isChecked);
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: isChecked ? AppColors.primary : Colors.white,
              border: Border.all(color: Colors.black, width: 2),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: isChecked
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    )
                  : const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
