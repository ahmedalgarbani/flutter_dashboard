import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dashboard/features/add_product/presentation/view/widgets/add_product_view_body_bloc.dart';

import '../../../../../core/helpers/get_it.dart';
import '../../../../../core/repo/image_repo/image_repo.dart';
import '../../../../../core/repo/product_repo/products_repo.dart';
import '../../cubit/add_product_cubit.dart';
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
        child: BlocProvider(
      create: (context) => AddProductCubit(
        getIt.get<ProductsRepo>(),
        getIt.get<ImageRepo>()
      ),
      child: AddProductViewBodyBloc(),
    )
      ),
    );
  }
}

