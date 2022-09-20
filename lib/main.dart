import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Local/CashHelper.dart';
import 'package:news_app/Network/dioHelper.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/screens/home_layout.dart';

import 'cubit/bloc-observer.dart';
import 'cubit/state.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(() {}, blocObserver: SimpleBlocObserver());
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CasheHelper.init();
  //NewsCubit().getBusiness();
  bool? isDark = CasheHelper.getBool(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  bool? isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getSports()
            ..getBusiness()
            ..getScince()
            
        ),
        BlocProvider(
          create: (context) => ThemeCubit()
            ..changeMode(
              fromShared: isDark,
            ),
            
        ),
        
      ],
      child: BlocConsumer<ThemeCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
// backwardsCompatibility: true,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarBrightness: Brightness.light),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  actionsIconTheme: IconThemeData(color: Colors.black87),
                  iconTheme: IconThemeData(color:Colors.black12 )
                  ),
                  
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black54,
                  unselectedIconTheme: IconThemeData(color: Colors.grey)),
              primarySwatch: Colors.blue,
              textTheme: const TextTheme(
                headline1: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                headline6: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.black54,
                appBarTheme: const AppBarTheme(
// backwardsCompatibility: true,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarBrightness: Brightness.dark),
                    backgroundColor: Colors.black54,
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                        iconTheme: IconThemeData(color:Colors.white )
                        ),
                textTheme: const TextTheme(
                  headline1: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  headline6: TextStyle(color: Colors.white, fontSize: 15),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.black54,
                    unselectedIconTheme: IconThemeData(color: Colors.grey),
                    showUnselectedLabels: true,
                    unselectedLabelStyle: TextStyle(color: Colors.white))),
            themeMode: ThemeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const HomeLayout(),
          );
        },
      ),
    );
  }
}
