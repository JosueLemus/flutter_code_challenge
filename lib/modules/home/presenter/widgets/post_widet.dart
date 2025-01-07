import 'package:flutter/material.dart';

class PostWidet extends StatelessWidget {
  const PostWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Title'),
          Text(
            'Subtitle',
          ),
          TextButton.icon(
            onPressed: () {},
            label: Text('Read more'),
            icon: Icon(
              Icons.arrow_right_alt,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(
              12,
            ),
            child: Image.network(
              'https://media.licdn.com/dms/image/sync/v2/D5627AQHOeJgAN1G5ug/articleshare-shrink_800/articleshare-shrink_800/0/1716231185301?e=2147483647&v=beta&t=UfwYfWWn_J5nmJ7o5-xPnliKVM5-6SuKawz7J5GveJY',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
