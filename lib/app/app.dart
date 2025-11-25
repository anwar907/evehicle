import 'dart:developer';

import 'package:evehicle/app/app_routes.dart';
import 'package:evehicle/app/helpers/navigation.dart';
import 'package:evehicle/app/modules/navigation/view/navigation_view.dart';
import 'package:evehicle/app/modules/navigation/viewmodel/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(); // GlobalKey untuk Navigator

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) {
            return null;
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'eVehicle',
          navigatorKey: navigatorKey,
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.getRoutes(),
          builder: (context, child) {
            log('isinya $child');
            if (child != null) {
              return BlocListener<NavigationCubit, int>(
                listener: (context, state) {
                  log('isi state $state');
                  if (state is NavigationState) {
                    NavigatorHelper.pushReplacementNamed(
                      context,
                      NavigationView.routeName,
                    );
                  }
                },
                child: child,
                listenWhen: (previous, current) => previous != current,
              );
            } else {
              log('masuk sini');
              throw StateError('Widget is null');
            }
          },
        ),
      ),
    );
  }
}
