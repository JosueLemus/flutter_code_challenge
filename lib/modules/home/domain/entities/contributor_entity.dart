import 'package:equatable/equatable.dart';

class ContributorEntity extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String city;
  final String photoUrl;
  final String website;

  const ContributorEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.city,
    required this.photoUrl,
    required this.website,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        phone,
        city,
        photoUrl,
        website,
      ];
}
