import 'package:facebook/constants/global_variables.dart';
import 'package:facebook/models/story.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 250,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            story.image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: GlobalVariables.secondaryColor,
                width: 4,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  story.user.avatar,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 10,
            ),
            child: Text(
              story.user.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
