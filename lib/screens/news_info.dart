import 'package:finance2_app/const/app_colors.dart';
import 'package:finance2_app/const/app_styles.dart';
import 'package:finance2_app/const/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsInfoWidget extends StatefulWidget {
  News news;
  NewsInfoWidget({super.key, required this.news});

  @override
  State<NewsInfoWidget> createState() => _NewsInfoWidgetState();
}

class _NewsInfoWidgetState extends State<NewsInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.chevron_left, color: Colors.black),
                    Text('Back'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.news.image,
                height: 153,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${widget.news.title}',
              style: onboardstyle.copyWith(color: primary),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 1,
              color: primary.withOpacity(0.22),
            ),
            SizedBox(height: 10),
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    Text(
                      '${widget.news.discription}',
                      style: TextStyle(fontSize: 16, color: Color(0xff24262B)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
