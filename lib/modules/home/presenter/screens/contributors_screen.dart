import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/contributor_entity.dart';
import 'package:flutter_code_challenge/core/di/dependencies.dart';
import 'package:flutter_code_challenge/modules/home/domain/repository/contributor_repository.dart';
import 'package:flutter_code_challenge/modules/home/presenter/blocs/contributor/contributor_bloc.dart';
import 'package:flutter_code_challenge/modules/home/presenter/widgets/contributor_details_sheet.dart';

class ContributorsScreen extends StatelessWidget {
  const ContributorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contributorRepository = getIt<ContributorRepository>();

    return BlocProvider(
      create: (_) =>
          ContributorBloc(contributorRepository)..add(FetchContributorsEvent()),
      child: const ContributorsContent(),
    );
  }
}

class ContributorsContent extends StatelessWidget {
  const ContributorsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContributorBloc, ContributorState>(
      builder: (context, state) {
        if (state is ContributorLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ContributorError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Error: ${state.message}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ContributorBloc>()
                        .add(FetchContributorsEvent());
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else if (state is ContributorLoaded) {
          final contributors = state.contributors;
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ContributorBloc>().add(
                    FetchContributorsEvent(),
                  );
            },
            child: ListView.builder(
              itemCount: contributors.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                final user = contributors[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.photoUrl),
                    ),
                    title: Text(user.name),
                    subtitle: Text('@${user.username}'),
                    onTap: () => _showUserDetails(context, user),
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  void _showUserDetails(BuildContext context, ContributorEntity user) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return ContributorDetailsSheet(user: user);
      },
    );
  }
}
