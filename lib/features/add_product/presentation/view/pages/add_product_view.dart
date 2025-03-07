import 'package:flutter/material.dart';

import '../widgets/add_product_view_body.dart';
import '../widgets/buildappbar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: "Add Product"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: AddProductViewBody(),
      ),
    );
  }
}
