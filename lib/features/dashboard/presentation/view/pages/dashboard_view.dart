import 'package:flutter/material.dart';

import '../widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: DashboardViewBody(),
        ),
      ),
    );
  }
}
