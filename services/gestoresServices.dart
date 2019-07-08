import 'dart:async';
import 'dart:convert';
import 'package:flutter_estudo_01/classes/Post.dart';
import 'package:http/http.dart' as http;

class GestoresService {
  static Future<List<Post>> getPosts() async {
    try {
      final url = "https://www.conass.org.br/wp-json/wp/v2/posts?categories=36&per_page=27&filter[orderby]=title&order=asc";

      final response = await http.get(url);

      final mapPosts = json.decode(response.body).cast<Map<String, dynamic>>();

      final posts = mapPosts.map<Post>((json) => Post.fromJson(json)).toList();

      return posts;
    }catch(error, exception) {
      throw Exception('Failed to load post: $error');
    }
  }
}
