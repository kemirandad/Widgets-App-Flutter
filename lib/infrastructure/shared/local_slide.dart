import 'package:myapp/domain/entities/slide.dart';

class LocalSlide {
  final String title;
  final String caption;
  final String imageUrl;

  LocalSlide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  factory LocalSlide.fromJson(Map<String, dynamic> json) {
    return LocalSlide(
      title: json['title'],
      caption: json['caption'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'caption': caption,
      'imageUrl': imageUrl,
    };
  }

  Slide toSlideEntity() => Slide(title, caption, imageUrl,
    );
  }
