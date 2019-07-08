class tipoCategoria {
  static const int noticia = 6;
  static const int conassInforma = 5;
}


class Post{

  final String title;
  final String resumo;
  final String materia;
  final String img;

  Post({this.title, this.resumo, this.materia, this.img});

  factory Post.fromJson(Map<String, dynamic> json) {

    final String res = json["excerpt"]["rendered"].replaceAll(new RegExp(r'<[^>]*>'), '')
        .replaceAll('Leia Mais..', '')
        .replaceAll('&nbsp; ', '');

    return Post(
      title: json["title"]["rendered"] as String,
      resumo: res,
      materia: json["content"]["rendered"] as String,
      img: json["jetpack_featured_media_url"] as String
    );
  }
}