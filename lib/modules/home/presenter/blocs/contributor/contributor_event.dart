part of 'contributor_bloc.dart';

sealed class ContributorEvent extends Equatable {
  const ContributorEvent();

  @override
  List<Object> get props => [];
}

final class FetchContributorsEvent extends ContributorEvent {}
