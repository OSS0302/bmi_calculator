import 'dart:convert';
import 'package:bmi_calculator/main/main_screen.dart';
import 'package:bmi_calculator/model/bmi_calculator_model.dart';
import 'package:bmi_calculator/result/result_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
       // print(state.uri.queryParameters[]);
        // jsonString 으로 넘겨 받는 방식
        final bmiCalculator =
        BmiCalculator.fromJson(jsonDecode(state.uri.queryParameters['bmiCalculator']!));

        return ResultScreen(bmiCalculator: bmiCalculator);
      },
    ),
  ],
);
