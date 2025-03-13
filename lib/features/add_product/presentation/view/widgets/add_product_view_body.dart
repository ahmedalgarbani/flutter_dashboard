import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:flutter_dashboard/features/add_product/presentation/view/widgets/is_organic.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_filed.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/entities/review_entity.dart';
import 'image_filed.dart';
import 'is_featured.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late bool? isFeatured, isOrganic;
  late File? imageFile;
  late num price, expirationMonths, numberOfCalories, unitAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomFormFiled(
                hintText: 'Product Name',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormFiled(
                hintText: 'Product Price',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  price = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormFiled(
                hintText: 'Product code',
                textInputType: TextInputType.text,
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormFiled(
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                line: 5,
                onSaved: (value) {
                  description = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormFiled(
                hintText: 'Expirating Month',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  expirationMonths = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormFiled(
                hintText: 'number Of Calories',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  numberOfCalories = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormFiled(
                hintText: 'unit Amount',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  unitAmount = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              IsOrganic(
                onChange: (value) {
                  isOrganic = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              IsFeatured(
                onChange: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ImageFiled(
                onChange: (value) {
                  imageFile = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Custombutton(
                text: "Save",
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    var product = ProductEntity(
                      reviews: [
                        ReviewEntity(
                            name: 'tharwat',
                            image:
                                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbeautiful%2F&psig=AOvVaw19xjUBre0RXfV2IZ-cEAEV&ust=1726749821993000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPCJ3L_CzIgDFQAAAAAdAAAAABAE',
                            ratting: 5,
                            date: DateTime.now().toIso8601String(),
                            ratingDescription: 'Nice product')
                      ],
                      numberOfCalories: numberOfCalories.toInt(),
                      unitAmount: unitAmount.toInt(),
                      productName: name,
                      expirationMonths: expirationMonths,
                      isOrganic: isOrganic ?? false,
                      productDescription: description,
                      productCode: code,
                      productPrice: price,
                      isFeatured: isFeatured ?? false,
                      imageFile: imageFile!,
                    );
                    context.read<AddProductCubit>().addProduct(product);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please fill all the fields")));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
