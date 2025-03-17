class NoteModel {
  String headline;
  String description;
  DateTime time;
  String? mediaUrl;

  NoteModel({
    required this.headline,
    required this.description,
    required this.time,
     this.mediaUrl
  });
/// GET
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      headline: json['headline'] as String,
      mediaUrl: json['mediaUrl'] as String,
      description: json['description'] as String,
      time: DateTime.parse(json['time'] as String),
    );
  }
/// SET
  /// Set from ui to toJson() ==> from  toJson() to firebase
  Map<String, dynamic> toJson() {
    return {
      'headline': headline,
      'mediaUrl': mediaUrl,
      'description': description,
      'time': time.toIso8601String(),
    };
  }
}