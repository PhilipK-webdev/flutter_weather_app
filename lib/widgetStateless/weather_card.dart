import "package:flutter/material.dart";

class WeatherCard extends StatelessWidget {
  WeatherCard({
    Key? key,
    required this.onPressed,
    required this.mapMain,
    required this.mapCity,
    required this.indexList,
    required this.mapWeather,
    required this.favorite,
  }) : super(key: key);
  bool favorite;
  final Map<dynamic, dynamic> mapMain;
  final Map<dynamic, dynamic> mapWeather;
  final Map<dynamic, dynamic> mapCity;
  VoidCallback onPressed;
  int indexList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Temp: ${mapMain['temp'].toString()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Humidity: ${mapMain['humidity'].toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Description: ${mapWeather['description'].toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                        'http://openweathermap.org/img/wn/${mapWeather['icon']}.png')
                  ],
                ),
                Positioned(
                  top: 100,
                  left: 300,
                  child: IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: onPressed,
                      color: favorite ? Colors.yellow : Colors.blueAccent),
                ),
              ],
            )),
      ),
    );
  }
}
