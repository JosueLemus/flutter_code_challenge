import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/modules/home/domain/entities/contributor_entity.dart';

class ContributorDetailsSheet extends StatelessWidget {
  final ContributorEntity user;

  const ContributorDetailsSheet({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(user.photoUrl),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '@${user.username}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.blue),
                  title: Text(user.phone),
                  subtitle: const Text('Mobile'),
                ),
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.red),
                  title: Text(user.email),
                  subtitle: const Text('Personal'),
                ),
                ListTile(
                  leading: const Icon(Icons.location_city, color: Colors.green),
                  title: Text(user.city),
                  subtitle: const Text('City'),
                ),
                ListTile(
                  leading: const Icon(Icons.language, color: Colors.purple),
                  title: Text(user.website),
                  subtitle: const Text('Website'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
