import 'package:appgain_task/providers/movie_details_title.dart';
import 'package:appgain_task/utils/colors.dart';
import 'package:appgain_task/view/home.dart';
import 'package:appgain_task/view/movie_details.dart';
import 'package:appgain_task/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:response/response.dart';

import 'Locale/appLocalization.dart';
import 'Locale/localizationProvider.dart';
import 'others/notification_service.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: LocalProvider()),
      ChangeNotifierProvider.value(value: MovieDetailsTitleProvider()),
    ],
    child: MyMaterial(),
  ));
}

class MyMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locProvider = Provider.of<LocalProvider>(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locProvider.appLocal,
      theme: ThemeData(primaryColor: CustomColors.PRIMARY_BLUE),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Response(child: Splash()),
    );
  }
}
