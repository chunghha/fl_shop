import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:supercharged/supercharged.dart';

class AlbumCard extends StatelessWidget {
  final String _albumTitle;
  final String _albumArtist;
  final String _cardColor;

  AlbumCard(this._albumTitle, this._albumArtist, this._cardColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: _cardColor.toColor(),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album, size: 70.0),
              title: Text(_albumTitle,
                  style: GoogleFonts.poppins(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic)),
              subtitle: Text(_albumArtist.toUpperCase(),
                  style: GoogleFonts.raleway(
                      fontSize: 16.0, fontWeight: FontWeight.w700)),
            ),
            ButtonBarTheme(
              data: ButtonBarThemeData(),
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    textColor: '#d8dee9'.toColor(),
                    child: Text('Songs'.toUpperCase(),
                        style: GoogleFonts.raleway(
                            fontSize: 16.0, fontWeight: FontWeight.w700)),
                    onPressed: () {},
                  ),
                  FlatButton(
                    textColor: '#eceff4'.toColor(),
                    child: Text('Shop'.toUpperCase(),
                        style: GoogleFonts.raleway(
                            fontSize: 16.0, fontWeight: FontWeight.w700)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
