part of 'add_product_cubit.dart';

abstract class AddProductState  {
  const AddProductState();

  @override
  List<Object> get props => [];
}

class AddProductInitial extends AddProductState {}
class AddProductLoading extends AddProductState {}
class AddProductSuccess extends AddProductState {}
class AddProductFailure extends AddProductState {
  final String message;

  AddProductFailure({required this.message});

}
