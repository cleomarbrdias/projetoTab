import 'package:flutter/material.dart';
import 'package:flutter_estudo_01/classes/Post.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class PostPage extends StatefulWidget  {
  final Post post;

  const PostPage(this.post);

  @override
  _PostPageState  createState() => _PostPageState();

}

class _PostPageState extends State<PostPage> {

  get p => widget.post;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(

      child: HtmlView(data: p.materia,),

    );
  }
}
