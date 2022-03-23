import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();

  static SharedPref? _instance;

  static SharedPref? get instance {
    _instance ??= SharedPref._();
    return _instance;
  }

  SharedPreferences? sharedPreferences;

  Future<void> getSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}

/*
  * Step 1
  * In the main function
  * await SharedPref.instance.getSharedPreferences();
  * Step 2 in every class
  * SharedPref.instance.sharedPreferences.getString('bearer_token'),
  */
