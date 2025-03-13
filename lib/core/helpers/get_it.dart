import 'package:flutter_dashboard/core/repo/image_repo/image_repo.dart';
import 'package:flutter_dashboard/core/repo/product_repo/products_repo.dart';
import 'package:flutter_dashboard/core/repo/product_repo/products_repo_impl.dart';
import 'package:flutter_dashboard/core/services/data_service.dart';
import 'package:flutter_dashboard/core/services/fire_storage.dart';
import 'package:flutter_dashboard/core/services/storage_service.dart';
import 'package:flutter_dashboard/core/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

import '../repo/image_repo/image_repo_impl.dart';
import '../services/firestore_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DataServic>(FirestoreService());

  getIt.registerSingleton<ImageRepo>(
    ImageRepoImpl(
      getIt.get<StorageService>()
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt.get<DataServic>()
    ),
  );
}
