class Event {
  final String artiste;
  final String image;
  final double hour;
  final String stage;

  Event({required this.artiste, required this.image, required this.hour, required this.stage});

  factory Event.fromJson(dynamic json) {
    return Event(
        artiste: json['artiste'] as String,
        image: json['image'][0]['hostedLargeUrl'] as String,
        hour: json['hour'] as double,
        stage: json['stage'] as String);
  }

  static List<Event> eventsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Event.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {artiste: $artiste, image: $image, hour: $hour, stage: $stage}';
  }
}