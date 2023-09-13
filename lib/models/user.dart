import 'package:facebook/models/post.dart';
import 'package:facebook/models/story.dart';

class User {
  final String name;
  final String avatar;
  bool? verified;
  final String? cover;
  final int? friends;
  final int? likes;
  final int? followers;
  final List<String>? hobbies;
  final List<Story>? stories;
  final List<User>? topFriends;
  final String? hometown;
  List<SocialMedia>? socialMedias;
  final String? bio;
  final String? type;
  final List<Education>? educations;
  final bool? guard;
  final List<Post>? posts;
  final String? pageType;
  final String? address;
  User({
    required this.name,
    required this.avatar,
    this.verified,
    this.cover,
    this.friends,
    this.likes,
    this.followers,
    this.hobbies,
    this.stories,
    this.topFriends,
    this.hometown,
    this.socialMedias,
    this.bio,
    this.type,
    this.educations,
    this.guard,
    this.posts,
    this.pageType,
    this.address,
  });

  User copyWith({
    String? name,
    String? avatar,
    bool? verified,
    String? cover,
    int? friends,
    int? likes,
    int? followers,
    List<String>? hobbies,
    List<Story>? stories,
    List<User>? topFriends,
    String? hometown,
    List<SocialMedia>? socialMedias,
    String? bio,
    String? type,
    List<Education>? educations,
    bool? guard,
    List<Post>? posts,
    String? pageType,
    String? address,
  }) {
    return User(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      verified: verified ?? this.verified,
      cover: cover ?? this.cover,
      friends: friends ?? this.friends,
      likes: likes ?? this.likes,
      followers: followers ?? this.followers,
      hobbies: hobbies ?? this.hobbies,
      stories: stories ?? this.stories,
      topFriends: topFriends ?? this.topFriends,
      hometown: hometown ?? this.hometown,
      socialMedias: socialMedias ?? this.socialMedias,
      bio: bio ?? this.bio,
      type: type ?? this.type,
      educations: educations ?? this.educations,
      guard: guard ?? this.guard,
      posts: posts ?? this.posts,
      pageType: pageType ?? this.pageType,
      address: address ?? this.address,
    );
  }
}

class Education {
  final String majors;
  final String school;
  Education({
    required this.majors,
    required this.school,
  });
}

class SocialMedia {
  final String icon;
  final String name;
  final String link;
  SocialMedia({
    required this.icon,
    required this.name,
    required this.link,
  });
}
