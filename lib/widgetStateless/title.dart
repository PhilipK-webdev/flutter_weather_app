import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({Key? key, required this.name, required this.greeting})
      : super(key: key);
  String name;
  String greeting;
  @override
  Widget build(BuildContext context) {
    String nameForecast = 'Forecast';
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.0, left: 5, right: 5, bottom: 8),
        child: SizedBox(
          height: 50,
          // width: 200,
          child: Center(
            child: name != ''
                ? Text(
                    '${nameForecast} ${name}',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(54, 78, 101, 1)),
                  )
                : Text(
                    '${greeting}',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(54, 78, 101, 1)),
                  ),
          ),
        ),
      ),
    );
  }
}
