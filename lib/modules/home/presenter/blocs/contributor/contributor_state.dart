part of 'contributor_bloc.dart';

sealed class ContributorState extends Equatable {
  const ContributorState();

  @override
  List<Object> get props => [];
}

final class ContributorInitial extends ContributorState {}

final class ContributorLoading extends ContributorState {}

final class ContributorLoaded extends ContributorState {
  final List<ContributorEntity> contributors;

  const ContributorLoaded(
    this.contributors,
  );

  @override
  List<Object> get props => [
        contributors,
      ];
}

final class ContributorError extends ContributorState {
  final String message;

  const ContributorError({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
