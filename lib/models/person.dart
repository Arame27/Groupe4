import 'package:clonenetflix/services/api.dart';

class Person {
  final String name;
  final String characterName;
  final String? imageURL;
  Person({
    required this.name,
    required this.characterName,
    this.imageURL,
  });

  Person copyWith({
    String? name,
    String? characterName,
    String? imageURL,
  }) {
    return Person(
      name: name ?? this.name,
      characterName: characterName ?? this.characterName,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  //Renommer fromMap to FromJson
  factory Person.fromJson(Map<String, dynamic> map) {
    return Person(
      name: map['name'] ?? '',
      characterName: map['character'] ?? '',
      imageURL: map['profile_path'] ,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'character': characterName});
    if (imageURL != null) {
      result.addAll({'profile_path': imageURL});
    }

    return result;
  }

  String posterUrl(){
    Api api= Api();
    return api.baseImageUrl + imageURL!;
  }
}
