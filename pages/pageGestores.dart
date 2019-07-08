
import 'package:flutter/material.dart';
import 'package:flutter_estudo_01/classes/Post.dart';
import 'package:flutter_estudo_01/pages/pagePost.dart';
import 'package:flutter_estudo_01/services/gestoresServices.dart';
import 'package:flutter_estudo_01/util/MenuList.dart';
import 'package:flutter_estudo_01/util/push.dart';
import 'package:transparent_image/transparent_image.dart';


class GestoresPage extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: Text("Gestores Estaduais",
          style: TextStyle(
            color: Colors.white,

          ),
        ),
      ),
      drawer: MenuList(),

      body: _body(),
    );
  }


  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: FutureBuilder<List<Post>>(

          future: GestoresService.getPosts(),

          builder: (context, snapshot){

            if(snapshot.hasError){
              return Center(child: Text(
                "Nenhum post disponivel",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                ),
              ));
            }else if(! snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }else{
              return _listView(snapshot.data);
            }
          }),
    );
  }

  _listView(List<Post> posts) {

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: posts.length,
        itemBuilder: (ctx, idx) {
          final p = posts[idx];

          return Container(
            //height: 50,
            child: InkWell(
              onTap: () {
                _onClickPost(ctx, p);

              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new FadeInImage.memoryNetwork(placeholder: kTransparentImage,
                        // ignore: unrelated_type_equality_checks
                        image: p.img == 0
                            ? 'assets/images/placeholder.gif'
                            : p.img),
                    // Image.network(
                    //    p.img
                    //),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        color: Colors.black45,
                        child: Text(
                          p.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.white,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          );
        });

  }



  void _onClickPost(BuildContext context, Post p) {
    push(context, PostPage(p));
  }

}