import 'package:badges/badges.dart';
import "package:flutter/material.dart";
import 'package:flutter_auto_machine/favorite/favorite_page.dart';
import 'package:flutter_auto_machine/widgetStateful/div_widget.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int count = 0;
  Map<String, dynamic> array = {};
  List<Map<String, dynamic>> dataObject = [];
  List<Map<dynamic, dynamic>> indexAndBool = [];
  late bool setBool = false;
  void setAllData(int index) {
    setState(() {
      count--;
      dataObject.sublist(index);
      indexAndBool.sublist(index);
    });
  }

  void increment(Map object, int indexOfCard, bool tempBool, String strName) {
    Map<String, dynamic> temp = {};
    temp['index'] = indexOfCard;
    temp['bool'] = tempBool;
    temp['name'] = strName;
    setState(() {
      if (array['name'].toString() != strName.toString()) {
        array = {...object};
        array['name'] = strName;
        indexAndBool.add(temp);
        dataObject.add(array);
        count++;
      } else if (array['name'].toString() == strName.toString()) {
        indexAndBool.add(temp);
        dataObject.add(array);
        count++;
      }
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(211, 223, 230, 1),
        appBar: AppBar(
          actions: [
            Badge(
              position: BadgePosition.topStart(top: 0, start: 2),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                '${count}'.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  iconSize: 35.0,
                  onPressed: () {
                    // Navigator.of(context).pushNamed(RouteManager.favorite);
                    if (count > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Favorite(
                                mapList: dataObject,
                                indexAndBoolean: indexAndBool,
                                init: setAllData,
                                count: count);
                          },
                        ),
                      );
                    }
                  }),
            ),
          ],
          title: const Text(
            "ALGORAX",
            style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(255, 121, 14, 1),
                fontWeight: FontWeight.w600),
          ),
        ),
        body: DivWidget(
          decre: decrement,
          buttonHandler: increment,
        ));
  }
}
