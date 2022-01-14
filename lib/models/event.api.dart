import 'dart:convert';
import 'package:http/http.dart' as http;

import 'event.dart';

class EventApi {
  static Future<List<Event>> getEvent() async {
    var uri = Uri.https('http://127.0.0.1', '/event',
        {"limit": "12", "start": "0"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "FESTIVAL_APP",
      "x-rapidapi-host": "http://127.0.0.1:8000/",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['event']) {
      _temp.add(i['artiste']['details']);
    }

    return Event.eventsFromSnapshot(_temp);
  }
}