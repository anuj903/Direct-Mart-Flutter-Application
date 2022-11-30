import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_dm/assistantMethods/cart_methods.dart';



SharedPreferences? sharedPreferences;

final itemsImagesList =
[
  "slider/0.jpg",
  "slider/1.jpg",
  "slider/2.jpg",
  "slider/3.jpg",
  "slider/4.jpg",
  "slider/5.jpg",
  "slider/6.jpg",
  "slider/7.jpg",
  "slider/8.jpg",
  "slider/9.jpg",
  "slider/10.jpg",
  "slider/11.jpg",
  "slider/12.jpg",
  "slider/13.jpg",
];

CartMethods cartMethods = CartMethods();


double countStarsRating = 0.0;
String titleStarsRating = "";

String fcmServerToken = "key=AAAA7RPG-VI:APA91bFaJ0hUWGbAk1-gH3kItsiL-DM10uuTozt0IV7TxxQGAIFWPooFrESKGj3Y_z6TxlNAeJ8DGL9n6FjHrIQ0yViCBqF-hC-Xf0K322_npJHkQTW1aRkq372gzG_UnDyPg-boSYpp";