import '../../flutter_flow/flutter_flow_util.dart';

class Event {
  String name;
  String description;
  String from;
  String to;
  String location;
  List<String> tags;

  Event({
    required this.name,
    required this.description,
    required this.from,
    required this.to,
    required this.location,
    required this.tags,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    DateTime fromDate = DateTime.parse(json['from']);
    String formattedFromString = DateFormat.Hm().format(fromDate);

    DateTime toDate = DateTime.parse(json['to']);
    String formattedToString = DateFormat.Hm().format(toDate);

    return Event(
      name: json['name'],
      description: json['description'],
      from: formattedFromString,
      to: formattedToString,
      location: json['location'],
      tags: List<String>.from(json['tag']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'from': from,
      'to': to,
      'location': location,
      'tag': tags,
    };
  }
}

class Events {
  List<Event> items;

  Events({required this.items});

  factory Events.fromJson(Map<String, dynamic> json) {
    List<Event> items = List<Event>.from(json['items'].map((item) => Event.fromJson(item)));
    return Events(items: items);
  }

  static List<Event> filterByTags(List<Event> events, List<String> desiredTags) {
    return events.where((event) => event.tags.any((tag) => desiredTags.contains(tag))).toList();
  }

}

class Response {
  Events record;
  String id;

  Response({
    required this.record,
    required this.id
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      id: json['id'],
      record: Events.fromJson(json['record']),
    );
  }
}
