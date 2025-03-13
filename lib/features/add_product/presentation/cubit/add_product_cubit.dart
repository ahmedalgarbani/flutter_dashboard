import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dashboard/core/repo/image_repo/image_repo.dart';
import 'package:flutter_dashboard/core/repo/product_repo/products_repo.dart';
import 'package:flutter_dashboard/features/add_product/domain/entities/product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ProductsRepo _productsRepo;
  final ImageRepo _imageRepo;
  AddProductCubit(this._productsRepo, this._imageRepo)
      : super(AddProductInitial());

  Future<void> addProduct(ProductEntity addProduct) async {
    emit(AddProductLoading());
    var result = await _imageRepo.uploadImage(addProduct.imageFile);
    result.fold((l) {
      emit(AddProductFailure(message: l.message));
    }, (url) async {
      addProduct.imagePath = url;
      var result = await _productsRepo.addProduct(addProduct);
      result.fold((l) {
        AddProductFailure(message: l.message);
      }, (r) {
        emit(AddProductSuccess());
      });
    });
  }
}
