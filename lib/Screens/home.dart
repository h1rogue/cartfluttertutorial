import 'package:cartflutter/Screens/secondpage.dart';
import 'package:cartflutter/model/Listitem.dart';
import 'package:cartflutter/provider/mycart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();


}
class _HomeState extends State<Home> {

  final PageStorageBucket  pageStorageBucket = PageStorageBucket() ;
  var _pagelist;
  @override
  void initState() {
    // TODO: implement initState
     _pagelist = [
       HomePage(key:PageStorageKey('Key 1')),
       SecondPage(key: PageStorageKey('Key 2'))];
  }
  @override
  Widget build(BuildContext context) {
    var currind = Provider.of<PageProv>(context);
    return Scaffold(
        floatingActionButton: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          //TODO Implement this
          onTap: (ind) {
            currind.changePage(ind);
          },
          currentIndex: currind.selectedpage,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home Page'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.sms), title: Text('Last Page'))
          ],
        ),

        //TODO change body based on tab
        body: PageStorage(
          bucket: pageStorageBucket,
          child: _pagelist[currind.selectedpage],
        )
    );
  }
}
//Implement Bucket Storage Flutter
class HomePage extends StatelessWidget {
   HomePage({Key key}) : super(key: key);
  List<Listitem> numberlist = [
    Listitem('Hello', 123),
    Listitem('Yello', 233),
    Listitem('SanaAliKhan', 44),
    Listitem('AlifLaila', 143),
    Listitem('Booster', 56),
    Listitem('Girlfriend', 23),
    Listitem('SanaAliKhan', 1),
    Listitem('water melon', 2),
    Listitem('qazxswedr', 4),
    Listitem('gree lotud', 22),
    Listitem('qwerterwe', 89),
    Listitem('ghtyui', 66),
    Listitem('heistwater', 564),
    Listitem('guanamula', 11),
    Listitem('radio heasd', 78),
    Listitem('water waterwe', 12),
  ];

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<MyCart>(context);
    return Center(
      child: ListView.builder(
        itemBuilder: (context, ind) {
          return ListTile(
            title: Text(numberlist[ind].Name),
            subtitle: Text('${numberlist[ind].Value}'),
            trailing: (p.cartlist.contains(numberlist[ind]))
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
            onTap: () {
              if (p.cartlist.contains(numberlist[ind])) {
                p.remove_from_cart(numberlist[ind]);
              } else
                p.add_to_cart(numberlist[ind]);
            },
          );
        },
        itemCount: numberlist.length,
      ),
    );
  }
}
