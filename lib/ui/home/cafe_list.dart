import 'package:flutter/material.dart';
import 'package:fluttercafe/data/entity/cafe.dart';
import 'package:provider/provider.dart';

class CafeList extends StatefulWidget {
  @override
  _CafeListState createState() => _CafeListState();
}

class _CafeListState extends State<CafeList> {
  @override
  Widget build(BuildContext context) {

    final cafes = Provider.of<List<Cafe>>(context) ?? [];

    return ListView.builder(
      itemCount: cafes.length,
      itemBuilder: (context , index){
        return CafeTile(cafe: cafes[index]);
      },

    );
  }
}

class CafeTile extends StatelessWidget {

  final Cafe cafe;
  CafeTile({this.cafe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          title: Text(cafe.name),
          subtitle: Text(cafe.location),
          leading: Icon(
            Icons.star ,
            color: Colors.yellow[cafe.rate == 0 ? 100 : cafe.rate],
            size: 50,
          ),
        ),
      ),
    );
  }
}
