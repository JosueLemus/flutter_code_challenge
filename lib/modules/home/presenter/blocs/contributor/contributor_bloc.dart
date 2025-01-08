import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/contributor_entity.dart';
import 'package:flutter_code_challenge/modules/home/domain/repository/contributor_repository.dart';

part 'contributor_event.dart';
part 'contributor_state.dart';

class ContributorBloc extends Bloc<ContributorEvent, ContributorState> {
  final ContributorRepository repository;

  ContributorBloc(this.repository) : super(ContributorInitial()) {
    on<FetchContributorsEvent>(_onFetchContributors);
  }

  Future<void> _onFetchContributors(
    FetchContributorsEvent event,
    Emitter<ContributorState> emit,
  ) async {
    emit(ContributorLoading());
    final result = await repository.fetchContributors();

    result.when(
      ok: (contributors) => emit(ContributorLoaded(contributors)),
      err: (failure) => emit(ContributorError(message: failure.message)),
    );
  }
}
