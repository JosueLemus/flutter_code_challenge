import 'dart:convert';
import 'package:flutter_code_challenge/core/errors/failures.dart';
import 'package:flutter_code_challenge/modules/home/data/models/contributor_model.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/contributor_entity.dart';
import 'package:flutter_code_challenge/modules/home/domain/repository/contributor_repository.dart';
import 'package:http/http.dart' as http;
import 'package:oxidized/oxidized.dart';

class ContributorRepositoryImpl extends ContributorRepository {
  final http.Client client;

  ContributorRepositoryImpl(this.client);

  @override
  Future<Result<List<ContributorEntity>, Failure>> fetchContributors() async {
    try {
      final url = Uri.https('jsonplaceholder.typicode.com', '/users');
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final List data = json.decode(response.body) as List;
        final contributors =
            data.map((json) => ContributorModel.fromJson(json)).toList();
        return Ok(contributors);
      } else {
        return Err(
          Failure(
            'Failed to load contributors',
            code: response.statusCode,
          ),
        );
      }
    } on FormatException catch (e) {
      return Err(Failure('Invalid JSON format: $e'));
    } on http.ClientException catch (e) {
      return Err(Failure('HTTP Client error: $e'));
    } catch (e) {
      return Err(Failure('Unexpected error: $e'));
    }
  }
}
