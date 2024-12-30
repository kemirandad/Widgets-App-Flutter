import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/data/shared/slide_info.dart';
import 'package:myapp/domain/entities/slide.dart';
import 'package:myapp/infrastructure/shared/local_slide.dart';

final List<Slide> slidesInfo =
    slides.map((slide) => LocalSlide.fromJson(slide).toSlideEntity()).toList();

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final currentScroll = pageViewController.page ?? 0;

      if (!endReached && currentScroll >= (slidesInfo.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slidesInfo
                  .map((slide) => _SlideView(
                        title: slide.title,
                        caption: slide.caption,
                        imageUrl: slide.imageUrl,
                      ))
                  .toList()),
          Positioned(
            right: 20,
            top: 40,
            child: TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Saltar')),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar')),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _SlideView extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _SlideView(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
              fit: BoxFit.contain,
              width: size.width * 0.8,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
