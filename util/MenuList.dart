import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 300,
        color: Colors.green[800],



        child: ListView(

          children: <Widget>[
            DrawerHeader(
                child:  Image.asset('images/logo.png'),
                  decoration: BoxDecoration(color: Colors.white,
                  ),
            ),

              ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/quem_somos');

              },
              title: Text("INSTITUCIONAL", style: TextStyle(
                color: Colors.white,
              ),),
              leading: Icon(Icons.stars, color: Colors.white,),

            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/gestores');
              },
              title: Text("GESTORES ESTADUAIS", style: TextStyle(
                color: Colors.white,
              ),),
              leading: Icon(Icons.stars, color: Colors.white,),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/noticias');
              },
              title: Text("NOTICIAS",style: TextStyle(
                color: Colors.white,
              ),),
              leading: Icon(Icons.stars, color: Colors.white,),
            ),
            ListTile(
              onTap: () {

              },
              title: Text("BIBLIOTECA DIGITAL",style: TextStyle(
                color: Colors.white,
              ),),
              leading: Icon(Icons.stars, color: Colors.white,),
            ),
          ],

        ),
      ),
    );
  }

}
