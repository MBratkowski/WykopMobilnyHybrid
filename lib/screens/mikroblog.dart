import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';

class MikroblogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            leading: InkWell(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: new Container(
                  width: 1,
                  height: 1,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://www.wykop.pl/cdn/c3397992/avatar_def,q80.png")))),
            )),
            titleSpacing: 0.0,
            centerTitle: true,
            elevation: 1.5,
            title: Text('Mikroblog'),
            actions: <Widget>[
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_search),
                onPressed: () {},
                tooltip: "Szukaj",
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_refresh),
                onPressed: () {},
                tooltip: "Odśwież",
              )
            ],
            bottom: TabBar(
              tabs: [
                Tab(child: Text('Nowe')),
                Tab(
                    child: Text(
                  'Aktywne',
                  textScaleFactor: 0.9,
                )),
                Tab(text: '6h'),
                Tab(text: '12h'),
                Tab(text: '24h'),
              ],
            )),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            EntryList(),
            EntryList(),
            EntryList(),
            EntryList(),
            EntryList(),
          ],
        ),
      ),
    );
  }
}