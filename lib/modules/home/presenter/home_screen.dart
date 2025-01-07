import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/modules/home/presenter/widgets/blog_posts_list.dart';
import 'package:flutter_code_challenge/modules/home/presenter/widgets/tab_bar_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.grid_on), text: "Posts"),
                        Tab(icon: Icon(Icons.android), text: "TO-DO"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: const TabBarView(
              children: [
                BlogPostsList(),
                SizedBox(
                  child: Center(
                    child: Text('data'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
