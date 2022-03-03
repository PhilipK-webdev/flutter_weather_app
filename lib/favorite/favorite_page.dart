import "package:flutter/material.dart";

class Favorite extends StatefulWidget {
  Favorite(
      {Key? key,
      required this.count,
      required this.mapList,
      required this.indexAndBoolean,
      required this.init})
      : super(key: key);
  List<Map<String, dynamic>> mapList;
  final Function init;
  List<Map<dynamic, dynamic>> indexAndBoolean;
  int count;
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color.fromRGBO(211, 223, 230, 1),
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 35.0,
                )
              ],
              title: const Text(
                "ALGORAX",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromRGBO(255, 121, 14, 1),
                    fontWeight: FontWeight.w600),
              ),
            ),
            // body: Fa
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  key: UniqueKey(),
                  height: 600,
                  width: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return FavoriteCard(
                          indexToDelete: widget.indexAndBoolean[index]['index'],
                          init: widget.init,
                          name:
                              widget.indexAndBoolean[index]['name'].toString(),
                          mapMainFavorite: widget.mapList[index]['list']
                              [widget.indexAndBoolean[index]['index']]['main'],
                          mapWeatherFavorite: widget.mapList[index]['list']
                                  [widget.indexAndBoolean[index]['index']]
                              ['weather'][0]);
                    }),
                    itemCount: widget.count,
                  ),
                ),
              ),
            )));
  }
}

class FavoriteCard extends StatelessWidget {
  FavoriteCard(
      {Key? key,
      required this.indexToDelete,
      required this.mapMainFavorite,
      required this.name,
      required this.mapWeatherFavorite,
      required this.init})
      : super(key: key);
  final Map<String, dynamic> mapMainFavorite;
  final Map<String, dynamic> mapWeatherFavorite;
  final String name;
  final int indexToDelete;
  final Function init;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(' ${name.toString()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Temp: ${mapMainFavorite['temp'].toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 20)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Humidity: ${mapMainFavorite['humidity'].toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description: ${mapWeatherFavorite['description'].toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      'http://openweathermap.org/img/wn/${mapWeatherFavorite['icon']}.png')
                ],
              ),
              Positioned(
                top: 135,
                left: 225,
                child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      init(indexToDelete);
                    },
                    color: Colors.blue),
              ),
            ],
          )),
    );
  }
}
