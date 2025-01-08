import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/modules/home/presenter/screens/contributors_screen.dart';
import 'package:flutter_code_challenge/modules/home/presenter/screens/posts_screen.dart';
import 'package:flutter_code_challenge/modules/home/presenter/widgets/tab_bar_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Blog',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'A reminder of the best moments of the event',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: TabBarDelegate(
                    const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.grid_on),
                          text: 'Posts',
                        ),
                        Tab(
                          icon: Icon(Icons.people),
                          text: 'Contributors',
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: const TabBarView(
              children: [
                PostsScreen(),
                ContributorsScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
