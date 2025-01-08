import 'package:flutter_code_challenge/modules/home/domain/entities/contributor_entity.dart';

class ContributorModel extends ContributorEntity {
  const ContributorModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.phone,
    required super.city,
    required super.photoUrl,
    required super.website,
  });

  factory ContributorModel.fromJson(Map<String, dynamic> json) {
    return ContributorModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      city: json['address']['city'],
      website: json['website'],
      photoUrl: 'https://i.pravatar.cc/150?img=${json['id']}',
    );
  }
}
