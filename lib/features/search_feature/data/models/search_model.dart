import 'package:equatable/equatable.dart';

class SearchResultModel extends Equatable {
  final String name;
  final String country;
  final num lat;
  final num lon;

  @override
  List<Object> get props => [name, country, lat, lon];

  const SearchResultModel(
      {required this.name,
      required this.country,

      required this.lat,
      required this.lon});

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
        lon: json['lon'],
        lat: json['lat'],
        country: json['country'],
        name: json['name'],
       );
  }
}
