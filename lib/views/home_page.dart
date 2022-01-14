import 'package:epsi_chat/models/event.api.dart';
import 'package:epsi_chat/models/event.dart';
import 'package:flutter/material.dart';

import 'widgets/event_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Event> _events;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  Future<void> getEvents() async {
    _events = await EventApi.getEvent();
    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home),
              SizedBox(width: 10),
              Text('Festival App'),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _events.length,
          itemBuilder: (context, index) {
            return EventCard(
                artiste: _events[index].artiste,
                hour: _events[index].hour.toString(),
                stage: _events[index].stage.toString(),
                image: _events[index].image);
          },
        ));
  }
}