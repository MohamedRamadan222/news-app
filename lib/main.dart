import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// import 'package:untitled/layout/cubit/cubit.dart';
import 'package:untitled/layout/news_app/news_layout.dart';
import 'package:untitled/shared/bloc_observer.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:untitled/shared/network/local/cach_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
// import 'layout/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final GoogleFont = GoogleFonts.cairo;

    // Colors Dark Mod
    const backgroundDark = '272829';
    const backgroundButtomBarDark = '0E0E0F';
    const primaryDark = 'F5BA43';

    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // Light Mod

            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20.0),
                textTheme: GoogleFonts.cairoTextTheme(textTheme).copyWith(
                  bodyLarge: GoogleFont(
                      textStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  bodyMedium: GoogleFont(
                      textStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  bodySmall:
                      GoogleFont(textStyle: TextStyle(color: Colors.black)),
                )),
            // Dark Mod

            darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor(backgroundDark),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backgroundColor: HexColor(backgroundDark),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor(primaryDark),
                  ),
                  titleTextStyle: TextStyle(
                      color: HexColor(primaryDark),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: HexColor(primaryDark),
                  backgroundColor: HexColor(backgroundButtomBarDark),
                  unselectedItemColor: Colors.grey,
                  elevation: 20,
                ),
                textTheme: GoogleFonts.cairoTextTheme(textTheme).copyWith(
                    bodyLarge:
                        GoogleFont(textStyle: TextStyle(color: Colors.white)),
                    bodyMedium:
                        GoogleFont(textStyle: TextStyle(color: Colors.white)),
                    bodySmall:
                        GoogleFont(textStyle: TextStyle(color: Colors.white)))),
            // Default Mod

            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
                child: NewsLayout(), textDirection: TextDirection.rtl),
          );
        },
      ),
    );
  }
}
