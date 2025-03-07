import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/app_router.dart';
import '../../../../../core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Custombutton(
          text: "Add Data",
          onPressed: () {
            GoRouter.of(context).push(AppRouter.KAddProduct);
          },
        )
      ],
    );
  }
}
