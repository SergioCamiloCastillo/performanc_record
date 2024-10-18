import 'package:go_router/go_router.dart';
import 'package:performance_record/presentation/screens/products_screen.dart';
import 'package:performance_record/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: "supervisor",
          name: SupervisorScreen.name,
          builder: (context, state) {
            return const SupervisorScreen();
          },
        ),
        GoRoute(
          path: "products",
          name: ProductsScreen.name,
          builder: (context, state) {
            return const ProductsScreen();
          },
        ),
         GoRoute(
          path: "activities",
          name: ActivitiesScreen.name,
          builder: (context, state) {
            return const ActivitiesScreen();
          },
        )
      ]),
]);
