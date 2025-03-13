import 'dart:developer';
import 'dart:io';

import 'package:flutter_dashboard/core/constant/app_string.dart';
import 'package:flutter_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService extends StorageService {
  static late Supabase _supabase;

  static initialize() async {
    _supabase = await Supabase.initialize(
      url: AppString.supabaseUrl,
      anonKey: AppString.supabaseToken,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    try {
      String fileName = b.basename(file.path);
      String extensionName = b.extension(file.path);
      final String fullPath = await _supabase.client.storage
          .from('images')
          .upload(
            '$path/$fileName',
            file,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );
      print(fullPath);
      log(fullPath);
      return fullPath;
    } on Exception catch (e) {
      log(e.toString());
    }
    return '';
  }
}
