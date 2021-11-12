class Comment{
  final int? id;
  final String? name;
  final String? email;
  final String? body;
  final int? postId;


  Comment({
    this.id,
    this.name,
    this.body,
    this.email,
    this.postId,
});

  factory Comment.fromJson(Map<String,dynamic>json){
    return Comment(
      body: json['body'],
      email: json['email'],
     name: json['name'],
      id: json['id'],
      postId: json['postId'],

    );
  }
  Map<String,dynamic> toMap(){
    var map =<String,dynamic>{};
    map['id']=id;
    map['postId']=postId;
    map['name']=name;
    map['email']=email;
    map['body']=body;
    return map;
  }
}