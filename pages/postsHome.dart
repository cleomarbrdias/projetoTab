import 'package:flutter_estudo_01/classes/Post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estudo_01/util/MenuList.dart';
import 'package:flutter_estudo_01/util/prefs.dart';
import 'package:flutter_estudo_01/widgets/postsListView.dart';
import 'package:flutter_estudo_01/widgets/postsListViewConassInforma.dart';

class postsHome extends StatefulWidget {

  _postsHomeState createState() => _postsHomeState();
}

class _postsHomeState extends State<postsHome>
    with SingleTickerProviderStateMixin<postsHome> {

  _postsHomeState();

  TabController tabController;

initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 2, vsync: this);

    Prefs.getInt("tabIndex").then((idx){
      tabController.index = idx;
    });

    tabController.addListener(() async{
      int idx = tabController.index;
      Prefs.setInt("tabIndex", idx);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "CONASS"
        ),
      bottom: TabBar(
        controller: tabController,
          tabs:[
           Tab(text: "NOTICIAS"),
           Tab(text: "CONASS INFORMA",)
        ],
        indicatorColor: Colors.white,
      ),
      ),
      body: TabBarView(
          controller: tabController,
          children: [
            postsListView(tipoCategoria.noticia),
            postsListCinforma(tipoCategoria.conassInforma)

      ]),
      drawer: MenuList(),
    );
  }
}

