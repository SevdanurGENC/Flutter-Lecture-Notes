import 'package:json_annotation/json_annotation.dart';
part 'cats.g.dart';

@JsonSerializable()
class Breed {
  String? id;
  String? name;
  String? description;
  String? temperament;

  Breed({this.id, this.name, this.description, this.temperament});

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  Map<String, dynamic> toJson() => _$BreedToJson(this);

}
@JsonSerializable()
//data starts with the square bracket [ character, meaning a JSON array of breeds
class BreedList {
  List<Breed>? breeds;

  BreedList({this.breeds});

  factory BreedList.fromJson(List<dynamic> json) {
    return BreedList(
        breeds: json
            .map((e) => Breed.fromJson(e as Map<String, dynamic>))
            .toList());
  }

}
@JsonSerializable()
class Cat {
  String? name;
  String? description;
  String? life_span;

  Cat({this.name, this.description, this.life_span});

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);

}
@JsonSerializable()
class CatBreed {
  String? id;
  String? url;
  int? width;
  int? height;
  List<Cat>? breeds;

  CatBreed({this.id, this.url, this.width, this.height, this.breeds});
  factory CatBreed.fromJson(Map<String, dynamic> json) =>
      _$CatBreedFromJson(json);

  Map<String, dynamic> toJson() => _$CatBreedToJson(this);

}
@JsonSerializable()
class CatList {
  List<CatBreed>? breeds;

  CatList({this.breeds});
  factory CatList.fromJson(List<dynamic> json) {
    return CatList(
        breeds: json
            .map((e) => CatBreed.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}