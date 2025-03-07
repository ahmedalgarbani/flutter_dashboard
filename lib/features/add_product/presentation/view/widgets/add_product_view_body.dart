import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_filed.dart';
import '../../../domain/entities/product_entity.dart';
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
  late bool isFeatured;
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
                      productNmae: name,
                      productDescription: description,
                      productCode: code,
                      productPrice: price,
                      isFeatured: isFeatured,
                      imageFile: imageFile!,
                    );
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
