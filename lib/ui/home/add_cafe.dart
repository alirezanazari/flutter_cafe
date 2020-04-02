import 'package:flutter/material.dart';
import 'package:fluttercafe/data/cafe.dart';
import 'package:fluttercafe/internal/constants.dart';

class AddCafeForm extends StatefulWidget {
  @override
  _AddCafeFormState createState() => _AddCafeFormState();
}

class _AddCafeFormState extends State<AddCafeForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> locations = [
    'Karaj',
    'Tehran',
    'Isfahan',
    'Shiraz',
    'Hamedan',
    'Ardabil'
  ];

  String _name;

  String _location;

  int _rate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Add new cafe',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Cafe name'),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => _name = val,
          ),
          SizedBox(height: 20),
          DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _location ?? 'Karaj',
              items: locations.map((loc) {
                return DropdownMenuItem(
                  child: Text(loc),
                  value: loc,
                );
              }).toList(),
              onChanged: (val) => setState(()=> _location = val)
          ),
          SizedBox(height: 10),
          Slider(
            value: (_rate ?? 100).toDouble(),
            activeColor: Colors.brown,
            inactiveColor: Colors.brown,
            min: 100.0,
            max: 900.0,
            divisions: 8,
            onChanged: (val) => setState(() => _rate = val.round()),
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Add cafe' , style: TextStyle(color: Colors.white)),
            color: Colors.pink,
            onPressed: () async{
              if(_formKey.currentState.validate()){
                await CafeRepository().addNewCafe(_name, _location, _rate);
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
