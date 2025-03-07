import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/utils/responsive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageFiled extends StatefulWidget {
  ImageFiled({Key? key, this.onChange}) : super(key: key);

  final ValueChanged<File?>? onChange;

  @override
  State<ImageFiled> createState() => _ImageFiledState();
}

class _ImageFiledState extends State<ImageFiled> {
  XFile? pickedImage;
  bool isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          await buildPickImage();
        },
        child: Stack(
          children: [
            Container(
              height: 200.v,
              width: 300.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: fileImage == null
                  ? Icon(
                      Icons.image,
                      size: 150.adaptSize,
                      color: Colors.grey,
                    )
                  : Image.file(
                      fileImage!,
                      fit: BoxFit.cover,
                    ),
            ),
            if (fileImage != null)
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: () {
                    fileImage = null;
                    widget.onChange?.call(null); 
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> buildPickImage() async {
    try {
      isLoading = true;
      setState(() {});

      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        fileImage = File(image.path);
        widget.onChange?.call(fileImage!);
      }

      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = false;
      setState(() {});
      debugPrint("Error picking image: $e");
    }
  }
}
