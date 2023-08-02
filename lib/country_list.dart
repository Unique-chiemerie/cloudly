import 'package:flutter/material.dart';

class Countrytileinfo {
  String countryname;
  Image countrypfp;

  Countrytileinfo({required this.countryname, required this.countrypfp});
}

List<Countrytileinfo> countrylist = [
  Countrytileinfo(
    countryname: 'London',
    countrypfp:
        Image.network('https://cdn-icons-png.flaticon.com/128/197/197374.png'),
  ),
  Countrytileinfo(
    countryname: 'Dubai',
    countrypfp: Image.network(
        'https://cdn-icons-png.flaticon.com/128/3054/3054093.png'),
  ),
  Countrytileinfo(
    countryname: 'Germany',
    countrypfp: Image.network(
        'https://cdn-icons-png.flaticon.com/128/4855/4855806.png'),
  ),
  Countrytileinfo(
    countryname: 'Japan',
    countrypfp:
        Image.network('https://cdn-icons-png.flaticon.com/128/323/323308.png'),
  ),
  Countrytileinfo(
    countryname: 'France',
    countrypfp:
        Image.network('https://cdn-icons-png.flaticon.com/128/323/323315.png'),
  ),
];
