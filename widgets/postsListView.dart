
import 'package:flutter/material.dart';
import 'package:flutter_estudo_01/classes/Post.dart';
import 'package:flutter_estudo_01/pages/pagePost.dart';
import 'package:flutter_estudo_01/services/postServices.dart';
import 'package:flutter_estudo_01/util/push.dart';
import 'package:transparent_image/transparent_image.dart';

class postsListView extends StatefulWidget {
  final int cat;
  const postsListView(this.cat);

  @override
  _postsListViewState createState() => _postsListViewState();
}

class _postsListViewState extends State<postsListView> with AutomaticKeepAliveClientMixin<postsListView>{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

_body() {

  Future future = PostService.getPosts(widget.cat);

  return Container(

    child: FutureBuilder(
      future: future,
        builder: (context, snapshot) {
        print(snapshot);
          if (snapshot.hasError) {
            return Center(
              child: Text("Nenhum post encontrado",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey
                ),),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {

            return _listView(snapshot.data);
          }
        }

    ),
  );
}

_listView(List<Post> data) {

  return ListView.builder(

      itemCount: data.length,
      itemBuilder: (ctx, idx) {
        final p = data[idx];

        return Column(
            children: <Widget>[
              Card(

                  child: Column(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.all(3.0),
                          child: new ListTile(
                            title: new Padding(padding: EdgeInsets.symmetric(
                                vertical: 3.0
                            ),
                              child: new Text(p.title,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),),
                            ),
                          ),
                        ),
                        new FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,

                            image: p.img == 0
                                ? 'assets/images/preloader.gif'
                                : p.img),
                        new Padding(
                          padding: EdgeInsets.all(1.0),
                          child: new ListTile(
                              title: new Padding(
                                  padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 1.0),
                                  child: new Text(p.resumo)
                              )
                          ),
                        ),
                        ButtonTheme(
                            child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                color: Colors.green[600],
                                textColor: Colors.white,
                                disabledTextColor: Colors.black,
                                padding: EdgeInsets.all(3.0),
                                splashColor: Colors.greenAccent,
                                child: const Text('Leia Mais..',
                                  style: TextStyle(
                                    color: Colors.white,

                                  ),
                                ),

                                onPressed: (){
                                  _onClickPost(ctx, p);
                                },
                              ),
                            ],
                          ),
                        )
                      ]
                  )
              )
            ]
        );
      }
  );
}

void _onClickPost(BuildContext context, Post p) {
  push(context, PostPage(p));
}


}
