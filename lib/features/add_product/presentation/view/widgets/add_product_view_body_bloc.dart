import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dashboard/core/helpers/snackbar_helpers.dart';

import '../../cubit/add_product_cubit.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBloc extends StatelessWidget {
  const AddProductViewBodyBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        if (state is AddProductLoading) {
          return CircularProgressIndicator();
        }
        return AddProductViewBody();
      },
      listener: (context, state) {
        if (state is AddProductSuccess) {
          return buildSnackbar(context, "added successfully",
              color: Colors.green);
        } else if (state is AddProductFailure) {
          return buildSnackbar(context, state.message);
        }
      },
    );
  }
}
