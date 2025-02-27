// class AppRouter {
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case AppRoutes.homeRoute:
//         return MaterialPageRoute(
//             builder: (_) => const CustomBottomNavbar(), settings: settings);
//       case AppRoutes.productDetailsRoute:
//         final String productId = settings.arguments as String;
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider<ProductDetailsCubit>(
//             create: (context) {
//               final cubit = ProductDetailsCubit(context);
//               cubit.getProductDetails(productId);
//               return cubit;
//             },
//             child: PrudactDetailsPage(
//               productId: productId,
//             ),
//           ),
//           settings: settings,
//         );

//       default:
//         return MaterialPageRoute(
//             builder: (_) => Scaffold(
//                   body: Center(
//                     child: Text('No route defined for ${settings.name}'),
//                   ),
//                 ));
//     }
//   }
// }
