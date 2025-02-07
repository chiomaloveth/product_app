import 'package:product_app/helpers/helper.dart';


class AppRouter {
  static Page _pageBuilder(Widget child) {
    return MaterialPage(
      child: child,
    );
  }

  static final GoRouter router = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      navigatorKey: GlobalVariables.mainNavigatorKey,
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => _pageBuilder(
            OnBoardingScreen(),
          ),
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) => _pageBuilder(
            LoginPage(),
          ),
          
        ),
        GoRoute(
          path: '/homePage',
          pageBuilder: (context, state) => _pageBuilder(
            HomePage(),
          ),
          
        ),
        GoRoute(
      path: '/productDetail',
      pageBuilder: (context, state) {
        // Retrieve the product and authProvider from the extra parameter
        final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        final ProductModel product = args['product'];
        final AuthProvider authProvider = args['authProvider'];

        return _pageBuilder(
          ProductPage(
            product: product,
            authProvider: authProvider,
          ),
        );
      },
        )
      ]
  
    );
      
}
