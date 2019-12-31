import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:supercharged/supercharged.dart';

import 'package:fl_shop/widgets/album_card.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: '#fffcfa'.toColor(),
    ),
  );
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: '#fffcfa'.toColor(),
            textTheme: TextTheme(
              body1: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0)),
            )),
        home: NewsApp());
  }
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    expandedHeight: 300.0,
                    elevation: 0.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text("Let's shop",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                              color: '#2e3440'.toColor(),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ))),
                        background: Image.asset(
                          'assets/undraw_add_to_cart_vkjp.png',
                          fit: BoxFit.cover,
                        )),
                  )),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: '#bf616a'.toColor(),
                    indicatorWeight: 5.0,
                    indicatorPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                    labelColor: '#2e3440'.toColor(),
                    labelStyle: GoogleFonts.cabin(
                        textStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                    unselectedLabelColor: '#4c566a'.toColor(),
                    unselectedLabelStyle: GoogleFonts.cabin(
                        textStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w400)),
                    tabs: [
                      Tab(icon: Icon(Icons.shop), text: 'Shop'),
                      Tab(icon: Icon(Icons.shopping_cart), text: 'Cart'),
                    ],
                  ),
                  '#fffcfa'.toColor().withOpacity(0.97),
                ),
                pinned: true,
                floating: false,
              ),
            ];
          },
          body: ListView(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(4.0, 72.0, 4.0, 0.0)),
                AlbumCard('Dark & Wild', 'BTS', '#d08770'),
                Padding(padding: EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 0.0)),
                AlbumCard('Wings', 'BTS', '#a3beac'),
                Padding(padding: EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 0.0)),
                AlbumCard('Love Yourself: Tear', 'BTS', '#b48ead'),
                Padding(padding: EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 0.0)),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar, this._color);

  final TabBar _tabBar;
  final Color _color;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: _color,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
