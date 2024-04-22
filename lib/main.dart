import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movies/core/config/routes/routes_config.dart';
import 'package:tmdb_movies/core/config/theme/theme.dart';
import 'package:tmdb_movies/core/dependency_injection/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

    await initGi();
    Bloc.observer = TalkerBlocObserver();
    EasyLoading.init();
    
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TMDB Movies',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesConfig.router,
      builder: EasyLoading.init(),
    );
  }
}

