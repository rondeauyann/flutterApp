import 'package:epsi_chat/views/widgets/artist_card.dart';
import 'package:flutter/material.dart';

import 'widgets/event_card.dart';

class ArtistPage extends StatefulWidget {
  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home),
              SizedBox(width: 10),
              Text('Artiste'),
            ],
          ),
        ),
        body: ArtistCard(
          name: 'The Doors',
          description: 'famous group',
          image: 'https://images5.alphacoders.com/646/thumbbig-646565.jpg',
        ));
  }
}