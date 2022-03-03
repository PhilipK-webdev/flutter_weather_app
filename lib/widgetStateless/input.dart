import 'package:flutter/material.dart';
import 'package:flutter_auto_machine/mainpage/data.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Input extends StatelessWidget {
  Input({Key? key, required this.handleSearch, required this.controllerName})
      : super(key: key);
  final String _apiKey = env['API_KEY']!;
  final ValueChanged<String> handleSearch;
  TextEditingController controllerName = TextEditingController();
  void _onSearch(value) {
    handleSearch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controllerName,
              onChanged: _onSearch,
              keyboardType: TextInputType.text,
              autofocus: true,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter City'),
            ),
            suggestionsCallback: (pattern) async {
              return await BackendService.getSuggestions(pattern, _apiKey);
            },
            itemBuilder: (context, Map<String, dynamic> suggestion) {
              return ListTile(
                title: Text(suggestion['name']!),
              );
            },
            onSuggestionSelected: (Map<String, dynamic> suggestion) {
              // your implementation here
            },
          ),
        ],
      ),
    );
  }
}
