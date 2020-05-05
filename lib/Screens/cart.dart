import 'package:cartflutter/provider/mycart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<MyCart>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('${p.total_price()}'),
          Expanded(
            child: ListView.builder(
                itemCount: p.cartlist.length,
                itemBuilder: (context, ind) {
                  return ListTile(
                    title: Text(p.cartlist[ind].Name),
                    trailing: Text('${p.cartlist[ind].Value}'),
                  );
                }),
          )
        ]
        ,
      ),
    );
  }
}
