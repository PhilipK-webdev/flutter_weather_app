import 'package:flutter/material.dart';
import 'package:flutter_auto_machine/pages/page_manager.dart';
import 'package:flutter_auto_machine/widgetStateful/main_container.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainContainer(),
        initialRoute: RouteManager.homePage,
        onGenerateRoute: RouteManager.generateRoute);
  }
}


























// class InputSearchCity extends StatelessWidget {
//   InputSearchCity(
//       {Key? key, required this.handleSearch, required this.controllerName})
//       : super(key: key);
//   final ValueChanged<String> handleSearch;
//   TextEditingController controllerName = TextEditingController();
//   void _onSearch(value) {
//     handleSearch(value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: TextField(
//         controller: controllerName,
//         onChanged: _onSearch,
//         keyboardType: TextInputType.text,
//         textAlign: TextAlign.left,
//         style: const TextStyle(color: Color.fromRGBO(54, 78, 101, 1)),
//         decoration: const InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color.fromRGBO(54, 78, 101, 1)),
//             ),
//             border: OutlineInputBorder(),
//             labelStyle: TextStyle(
//               color: Colors.blue,
//             )),
//       ),
//     );
//   }
// }


