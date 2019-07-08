import 'dart:convert';
import 'package:flutter_estudo_01/classes/Post.dart';
import 'package:http/http.dart' as http;

class PostService{

  static Future<List<Post>> getPosts(int categoria) async{

    try {

      final String apiUrl = "https://www.conass.org.br/wp-json/wp/v2/";
      List retorno;

      var res = await http.get(Uri.encodeFull(apiUrl + "posts?categories=$categoria&per_page=50" ), headers: {"Accept": "application/json"});

      final mapPosts = json.decode(res.body).cast<Map<String, dynamic>>();

      retorno = mapPosts.map<Post>((json) => Post.fromJson(json))
          .toList();

      return retorno;

    }catch(error, exception) {
      throw Exception('Failed to load post: $error');
    }
  }
}