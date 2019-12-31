import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:supercharged/supercharged.dart';

import 'package:fl_shop/widgets/album_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: '#ebcb8b'.toColor(),
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
              SliverAppBar(
                expandedHeight: 300.0,
                elevation: 16.0,
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
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: '#bf616a'.toColor(),
                    indicatorWeight: 4.0,
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
                ),
                pinned: true,
              ),
            ];
          },
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AlbumCard('Dark & Wild', 'BTS', '#d08770'),
              AlbumCard('Wings', 'BTS', '#a3beac'),
              AlbumCard('Love Yourself: Tear', 'BTS', '#b48ead'),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
