part of 'cats.dart';

Breed _$BreedFromJson(Map<String, dynamic> json) {
  return Breed(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    temperament: json['temperament'] as String,
  );
}

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'temperament': instance.temperament,
};

BreedList _$BreedListFromJson(Map<String, dynamic> json) {
  return BreedList(
    breeds: (json['breeds'])
        ?.map((e) => e == null ? null : Breed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BreedListToJson(BreedList instance) => <String, dynamic>{
  'breeds': instance.breeds,
};

Cat _$CatFromJson(Map<String, dynamic> json) {
  return Cat(
    name: json['name'] as String,
    description: json['description'] as String,
    life_span: json['life_span'] as String,
  );
}

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'life_span': instance.life_span,
};

CatBreed _$CatBreedFromJson(Map<String, dynamic> json) {
  return CatBreed(
    id: json['id'] as String,
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    breeds: (json['breeds'] as List<dynamic>)
        .map((i) => Cat.fromJson(i)).toList()
        .toList(),
  );
}


Map<String, dynamic> _$CatBreedToJson(CatBreed instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'width': instance.width,
  'height': instance.height,
  'breeds': instance.breeds,
};

CatList _$CatListFromJson(Map<String, dynamic> json) {
  return CatList(
    breeds: (json['breeds'] as List<dynamic>)
        .map((i) => CatBreed.fromJson(i)).toList()
        .toList(),
  );
}

Map<String, dynamic> _$CatListToJson(CatList instance) => <String, dynamic>{
  'breeds': instance.breeds,
};