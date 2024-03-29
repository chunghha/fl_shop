import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenburns/kenburns.dart';
import 'package:supercharged/supercharged.dart';

import 'widgets/album_card.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: '#fffcfa'.toColor(),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.brown[600],
        useMaterial3: true,
      ),
      home: const NewsApp(),
    );
  }
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  expandedHeight: 300,
                  elevation: 0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Let's shop",
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          color: '#2e3440'.toColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    background: KenBurns(
                      child: Image.asset(
                        'assets/undraw_add_to_cart_vkjp.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: '#bf616a'.toColor(),
                    indicatorWeight: 5,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 16),
                    labelColor: '#2e3440'.toColor(),
                    labelStyle: GoogleFonts.cabin(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    unselectedLabelColor: '#4c566a'.toColor(),
                    unselectedLabelStyle: GoogleFonts.cabin(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    tabs: const [
                      Tab(icon: Icon(Icons.shop), text: 'Shop'),
                      Tab(icon: Icon(Icons.shopping_cart), text: 'Cart'),
                    ],
                  ),
                  '#fffcfa'.toColor().withOpacity(0.97),
                ),
                pinned: true,
              ),
            ];
          },
          body: ListView(
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(4, 72, 4, 0)),
                  AlbumCard('Dark & Wild', 'BTS', '#d08770'),
                  Padding(padding: EdgeInsets.fromLTRB(4, 12, 4, 0)),
                  AlbumCard('Wings', 'BTS', '#a3beac'),
                  Padding(padding: EdgeInsets.fromLTRB(4, 12, 4, 0)),
                  AlbumCard('Love Yourself: Tear', 'BTS', '#b48ead'),
                  Padding(padding: EdgeInsets.fromLTRB(4, 12, 4, 0)),
                ],
              )
            ],
          ),
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
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: _color,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
