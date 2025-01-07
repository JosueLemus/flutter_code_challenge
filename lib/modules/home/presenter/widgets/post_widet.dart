import 'package:flutter/material.dart';

class PostWidet extends StatelessWidget {
  const PostWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(
            color: Colors.grey[200] ?? Colors.grey,
          )),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                16,
                16,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Somnio Software at Google I/O 2024: AI, Flutter, and the road ahead for App Development',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  Expanded(
                    child: Text(
                      'Unlock the power of AI with generative media models & enhanced search! Google I/O 2024 unveiled a developer-focused future with Gemini & advancements in Flutter. Unlock the power of AI with generative media models & enhanced search! Google I/O 2024 unveiled a developer-focused future with Gemini & advancements in Flutter.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                  TextButton.icon(
                    iconAlignment: IconAlignment.end,
                    onPressed: () {},
                    label: Text('Read more'),
                    icon: Icon(
                      Icons.arrow_right_alt,
                    ),
                  ),
                ],
              ),
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
