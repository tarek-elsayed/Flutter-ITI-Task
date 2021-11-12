import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_api_example/controllers/app_controller.dart';
import 'package:json_api_example/models/coment.dart';

class CommentScreen extends StatefulWidget {
  final int postId;

  const CommentScreen({required this.postId, Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<Comment> comList = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        var comment = await AppContrloller.getComment(postId: widget.postId);
        setState(() {
          comList = comment;
        });
      } catch (error) {
        print(error);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Comment',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: comList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: comList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(comList[index].email.toString()),
                    subtitle: Text(
                      comList[index].body.toString(),
                    ),
                  );
                }));
  }
}
