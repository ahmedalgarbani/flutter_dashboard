import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_dashboard/core/services/storage_service.dart';

import '../../error/failure.dart';
import 'image_repo.dart';

class ImageRepoImpl extends ImageRepo {
  final StorageService _storageService;

  ImageRepoImpl(this._storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await _storageService.uploadFile(image, "images");
     return Right(url);
    } on Exception catch (_) {
      return Left(ServerFailure(message: "Failed to upload image"));
    }
  }
}
