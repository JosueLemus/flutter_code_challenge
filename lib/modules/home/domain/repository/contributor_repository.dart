import 'package:flutter_code_challenge/core/errors/failures.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/contributor_entity.dart';
import 'package:oxidized/oxidized.dart';

abstract class ContributorRepository {
  Future<Result<List<ContributorEntity>, Failure>> fetchContributors();
}
