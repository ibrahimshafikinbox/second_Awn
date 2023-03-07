import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/app_local.dart';
import 'package:flutter_application_2/application/loca_network.dart';
import 'package:flutter_application_2/presentation/Home/Home/Cubit/cubit.dart';
import 'package:flutter_application_2/presentation/Home/Home/Cubit/states.dart';
import 'package:flutter_application_2/presentation/Home/Home/Screen/home_view.dart';

import 'package:flutter_application_2/presentation/Resourses/theme_manager.dart';
import 'package:flutter_application_2/application/Local/shared_pref.dart';
import 'package:flutter_application_2/application/dio_helper.dart';
import 'package:flutter_application_2/application/Local/bloc_observer.dart';
import 'package:flutter_application_2/application/Local/constants.dart';
import 'package:flutter_application_2/presentation/USER/Login/login_view.dart';
import 'package:flutter_application_2/presentation/OnBoarding/onboard_view.dart';
import 'package:flutter_application_2/presentation/Splash/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'presentation/Profile/Awn_Support/awn_support_view.dart';

void main() async {
  // CachNetwork.cacheInitialaization();
  await WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  DioHelper.init();
  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  Widget widget;
  if (onBoarding != null) {
    if (token != null) {
      widget = HomeView();
    } else {
      widget = HomeView();
    }
  } else {
    widget = onBoardingScreen();
  }
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FullAppCubit()..getHomeData(),
        child: BlocConsumer<FullAppCubit, FullAppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  title: 'Awn ',
                  debugShowCheckedModeBanner: false,
                  theme: GetApplicatinTheme(),
                  // home: SplashScreen(),
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [
                    Locale('ar', ""),
                    Locale("en", ""),
                    // Locale("fa", ""),
                    Locale("hi", ""),
                  ],
                  locale: Locale("en", ""),
                  // locale: Locale("ar", ""),
                  // localeResolutionCallback: (deviceLocale, supportedLocales) {
                  //   for (var locale in supportedLocales) {
                  //     if (deviceLocale != null &&
                  //         deviceLocale.languageCode == locale.languageCode) {
                  //       return deviceLocale;
                  //     }
                  //   }

                  //   return supportedLocales.first;
                  // },
                  home: startWidget);
            }));
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Localaization/language_constants.dart';
// import 'package:flutter_application_2/components/app_local.dart';
// import 'package:flutter_application_2/presentation/Home/Home/Screen/home_view.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();

//   static void setLocale(BuildContext context, Locale newLocale) {
//     _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
//     state?.setLocale(newLocale);
//   }
// }

// class _MyAppState extends State<MyApp> {
//   Locale? _locale;

//   setLocale(Locale locale) {
//     setState(() {
//       _locale = locale;
//     });
//   }

//   @override
//   void didChangeDependencies() {
//     getLocale().then((locale) => {setLocale(locale)});
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Localization',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
      
//       home: HomeView(),
//       locale: _locale,
//     );
//   }
// }
