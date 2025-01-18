import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo,required this.productRepo}) : super(AddProductInitial());
  static AddProductCubit get(context)=> BlocProvider.of(context);
  final ProductRepo productRepo;
  final ImagesRepo imagesRepo;
  Future<void> addProduct(AddProductInputEntity addProductInputEntity)async
  {
    emit(AddProductLoading());
    var result=await imagesRepo.uploadImage(image: addProductInputEntity.image);
    result.fold(
        (l){
          emit(AddProductFailure(error: l.message));
        },
          (url) async{
          addProductInputEntity.imageUrl=url;
          var result= await productRepo.addProduct(addProductInputEntity);
          result.fold(
              (l){
                emit(AddProductFailure(error: l.message));
              },
              (r)
              {
                emit(AddProductSuccess());
              }
          );

              }
    );
  }
}
