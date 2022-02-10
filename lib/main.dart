import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:subs_vendor/api/SignUpapi.dart';
import 'package:subs_vendor/screens/CustomerScreens/AddSubScreen.dart';
import 'package:subs_vendor/screens/CommonScreens.dart/AlertsScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/BankDetailsScreen.dart';
import 'package:subs_vendor/screens/BlankTargetScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/ChooseTypeScreen.dart';
import 'package:subs_vendor/screens/CustomerScreens/CustomSubscription.dart';
import 'package:subs_vendor/screens/CustomerScreens/HomeScreen.dart';
import 'package:subs_vendor/screens/VendorScreens/MyCustomers.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpOtpScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/LoginScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/SignUpScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/UserInfoScreen.dart';
import 'package:subs_vendor/screens/VendorScreens/OverviewScreen.dart';
import 'package:subs_vendor/screens/OnboardingScreens/WelcomeScreen.dart';
import 'package:subs_vendor/shared_preferences/login_preferences.dart';
import 'package:subs_vendor/shared_preferences/token_preferences.dart';
import 'package:subs_vendor/shared_preferences/token_profile.dart';
import 'package:subs_vendor/shared_preferences/type_preference.dart';

import 'Utils/Routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isType;
  var type;
  @override
  void initState() {
    //initstate() is used to initialize the contents of an already existing object.
    loginPreference = LoginPreference();
    tokenPreference = TokenPreference();
    getUserData();
    super.initState();
  }

  bool isLoggedIn = false;
  getType() async {
    isType = await typePreference!.getTypeStatus();
    print("IS TYPE : $isType");
    type = isType ? 'Vendor' : "Customer";
  }

  getUserData() async {
    if (await loginPreference!.getLoginStatus()) {
      print(await loginPreference!.getLoginStatus());
      tokenProfile =
          TokenProfile.fromJson(await tokenPreference.getTokenPreferenceData());
      //  print(constant.api);
      return tokenProfile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserData(),
        builder: (context, AsyncSnapshot<dynamic> token) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Museo',
              primarySwatch: Colors.grey,
            ),
            // home: (token.hasData && token.data != null)
            //     ? type == 'Customer'
            //         ? HomeScreen()
            //         : MyCustomerScreen()
            //     : WelcomeScreen(),
            home:  OverviewScreen(),
            routes: routes,
          );
        });
  }
}
