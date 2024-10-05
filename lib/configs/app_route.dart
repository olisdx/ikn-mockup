import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/page/forgot_password_page.dart';
import '../features/auth/page/login_page.dart';
import '../features/auth/page/registration_page.dart';
import '../features/home/page/home_page.dart';
import '../features/news/page/news_page.dart';
import '../features/notification/page/notification_page.dart';
import '../features/place_recomended/page/place_recomended_all_page.dart';
import '../features/place_recomended/page/place_recomended_detail_page.dart';
import 'app_strings.dart';

abstract class AppRoute {
  static GoRouter get router => _router;

  static const String _initial = "/";

  static final GoRouter _router = GoRouter(
    initialLocation: _initial,
    debugLogDiagnostics: true,
    routerNeglect: true,
    routes: [
      GoRoute(
        path: _initial,
        name: "/",
        builder: (_, state) => const LoginPage(),
        routes: [
          GoRoute(
            path: "forgot-password",
            name: AppStrings.forgotPasswordRoute,
            pageBuilder: pageTransitionBuilder(const ForgotPasswordPage()),
          ),
          GoRoute(
            path: "registration-account",
            name: AppStrings.registrationAccountRoute,
            pageBuilder: pageTransitionBuilder(const RegistrationPage()),
          ),
        ],
      ),
      GoRoute(
        path: "/home",
        name: AppStrings.homeRoute,
        pageBuilder: pageTransitionBuilder(const HomePage()),
        routes: [
          GoRoute(
            path: "news",
            name: AppStrings.newsRoute,
            pageBuilder: pageTransitionBuilder(const NewsPage()),
          ),
          GoRoute(
            path: "notification",
            name: AppStrings.notificationRoute,
            pageBuilder: pageTransitionBuilder(const NotificationPage()),
          ),
          GoRoute(
            path: "place-all",
            name: AppStrings.placeAllRoute,
            pageBuilder: pageTransitionBuilder(const PlaceRecomendedAllPage()),
          ),
          GoRoute(
            path: "place-detail",
            name: AppStrings.placeDetailRoute,
            pageBuilder:
                pageTransitionBuilder(const PlaceRecomendedDetailPage()),
          ),
        ],
      ),
    ],
  );
}

Page<dynamic> Function(BuildContext, GoRouterState) pageTransitionBuilder<T>(
        Widget child) =>
    (BuildContext context, GoRouterState state) {
      return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ),
      );
    };
