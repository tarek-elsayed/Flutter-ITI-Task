import 'package:flutter/material.dart';
import 'package:json_api_example/controllers/app_controller.dart';
import 'package:json_api_example/models/post.dart';

class PostScreen extends StatelessWidget {
  final title = TextEditingController();
  final body = TextEditingController();
  int? x=AppContrloller.y;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                labelText: 'Post Title',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: body,
              decoration: const InputDecoration(
                labelText: 'Post Body',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () async{
                var post = Post(
                  userId: 5,
                  id: 4,
                  title: title.text,
                  body: body.text,
                );
                await AppContrloller.sendPosts(body:post.toJson());
              },
              child: Text("Send"),
            ),


            Text(x==null?'':"$x")
          ],
        ),
      ),
    );
  }
}
