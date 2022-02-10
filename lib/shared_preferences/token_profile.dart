//import 'dart:convert';

import 'dart:convert';
import 'package:subs_vendor/shared_preferences/token_preferences.dart';

TokenProfile? tokenProfile;

class TokenProfile {
  var token;

  TokenProfile.values({
    this.token,
  });

  TokenProfile.fromJson(String value) {
    token = value;
    print('${token}');

    tokenPreference.setTokenPreferenceData(json.encode(value));
  }
}
