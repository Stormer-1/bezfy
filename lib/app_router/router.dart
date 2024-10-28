import 'package:bezfy/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:bezfy/features/UI/pages/news_screen/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NewsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => NewsScreenCubit(),
          child: const NewsScreen(),
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (context) => const Text('Invalid route'));
  }
}
