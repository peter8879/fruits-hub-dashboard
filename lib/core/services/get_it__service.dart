
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_storage.dart';
import 'package:get_it/get_it.dart';

import 'data_base_service.dart';
import 'fire_store_service.dart';


final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<ImagesRepo>(ImageRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<DataBaseService>(FireStoreService());
  getIt.registerSingleton<ProductRepo>(ProductsRepoImpl(getIt.get<DataBaseService>()));
}