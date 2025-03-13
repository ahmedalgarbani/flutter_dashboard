import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dashboard/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/services/supabase_storage_service.dart';
import 'package:flutter_dashboard/firebase_options.dart';

import 'core/helpers/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageService.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
