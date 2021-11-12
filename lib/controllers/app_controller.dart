import 'dart:convert';

import 'package:json_api_example/models/coment.dart';
import 'package:json_api_example/models/post.dart';
import 'package:http/http.dart' as http;

class AppContrloller {
  static Future<List<Post>> getPosts() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    return List<Post>.from(
        jsonDecode(response.body).map((e) => Post.fromJson(e)));
  }

static int? y;
   static Future sendPosts({required Map<String, dynamic> body }) async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    return http.post(Uri.parse(url), body: jsonEncode(body),
        headers: {"Content-type": "application/json"})
        .then((value){
          final status=value.statusCode;
          if(status<200||status>400){
            print('Error !! Fail To fetch data');
          }
          y=status;
          print(status);
          print('ssssssss');
    });
  }


  static Future<List<Comment>> getComment({required int postId}) async {
    String url = 'https://jsonplaceholder.typicode.com/comments?postId=$postId';
    final res = await http.get(Uri.parse(url));
    return List<Comment>.from(
        jsonDecode(res.body).map((e) => Comment.fromJson(e))
    );
  }


}
