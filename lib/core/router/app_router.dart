
import 'package:go_router/go_router.dart';

import '../../features/add_product/presentation/view/pages/add_product_view.dart';
import '../../features/dashboard/presentation/view/pages/dashboard_view.dart';

abstract class AppRouter {
  static const KHomePage = "/";
  static const KRoot = "/";
  static const KAddProduct = "/KAddProduct";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: KHomePage, 
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: KAddProduct, 
        builder: (context, state) => const AddProductView(),
      ),
    ],
  );
}
