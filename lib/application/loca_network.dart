// import 'package:shared_preferences/shared_preferences.dart';

// class CachNetwork {
//   static late SharedPreferences sharedpref;
//   static cacheInitialaization() async {
//     sharedpref = await SharedPreferences.getInstance();
//   }

//   //set
//   //get
//   //delete
//   //clear
//   //(key _ value)
//   static Future<bool> InsretToCache(
//       {required String Key, required String Value}) async {
//     return await sharedpref.setString(Key, Value);
//   }

//   static String GetFromCache({required String Key}) {
//     return sharedpref.getString(Key) ?? "";
//   }
// }
