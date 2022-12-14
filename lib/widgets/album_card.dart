import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard(
    this._albumTitle,
    this._albumArtist,
    this._cardColor, {
    Key key,
  }) : super(key: key);
  final String _albumTitle;
  final String _albumArtist;
  final String _cardColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: _cardColor.toColor(),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.album, size: 70),
              title: Text(
                _albumTitle,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              subtitle: Text(
                _albumArtist.toUpperCase(),
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ButtonBarTheme(
              data: const ButtonBarThemeData(),
              child: ButtonBar(
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      'Songs'.toUpperCase(),
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: Text(
                      'Shop'.toUpperCase(),
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
