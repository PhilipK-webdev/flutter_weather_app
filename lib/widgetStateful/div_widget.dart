import 'dart:convert';
import "package:flutter/material.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_auto_machine/widgetStateless/handler_submit.dart';
import 'package:flutter_auto_machine/widgetStateless/input.dart';
import 'package:flutter_auto_machine/widgetStateless/title.dart';
import 'package:flutter_auto_machine/widgetStateless/weather_card.dart';
import 'package:http/http.dart';

class DivWidget extends StatefulWidget {
  DivWidget({Key? key, required this.decre, required this.buttonHandler})
      : super(key: key);
  final Function buttonHandler;
  VoidCallback decre;
  @override
  State<DivWidget> createState() => _DivWidgetState();
}

class _DivWidgetState extends State<DivWidget> {
  bool _active = false;
  Map<String, dynamic> _map = {};
  Map<String, dynamic> forecast = {};
  List<dynamic> data = [];
  final String _apiKey = env['API_KEY']!;
  String _name = '';
  String finalName = '';
  String latitude = '';
  String longtitude = '';
  late List<bool> isFav;
  final nameHolder = TextEditingController();
  Future<void> get fetchDataWeather async {
    if (_name != '') {
      final response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=${_name}&units=metric&appid=${_apiKey}'));
      if (response.statusCode == 200) {
        try {
          _map = jsonDecode((response.body));
          isFav = List.filled(_map['list']?.length, false);
          data = _map['list'];
          finalName = _map['city']['name'];
        } catch (e) {
          throw Exception();
        }
      }
    }
  }

  void _handleSearchForCity(bool newValue) async {
    await fetchDataWeather;
    setState(() {
      _active = newValue;
      _name = '';
      nameHolder.clear();
    });
  }

  void _onChange(String strName) {
    setState(() {
      _name = strName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TitleWidget(name: finalName, greeting: 'Welcome'),
            // InputSearchCity(
            //     handleSearch: _onChange, controllerName: nameHolder),
            Input(handleSearch: _onChange, controllerName: nameHolder),
            HandlerSubmit(
              active: _active,
              onPressed: _handleSearchForCity,
              clearName: nameHolder,
            ),
            _map.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: _map['list'].length,
                        itemBuilder: ((context, index) {
                          return WeatherCard(
                              mapCity: _map['city'],
                              mapMain: data[index]['main'],
                              mapWeather: data[index]['weather'][0],
                              indexList: index,
                              favorite: isFav[index],
                              onPressed: () {
                                setState(() {
                                  if (isFav[index] == false) {
                                    isFav[index] = true;
                                    widget.buttonHandler(
                                        _map, index, isFav[index], finalName);
                                  } else {
                                    isFav[index] = false;
                                    widget.decre();
                                  }
                                });
                              });
                        })))
                : Container()
          ],
        ),
      ),
    );
  }
}
