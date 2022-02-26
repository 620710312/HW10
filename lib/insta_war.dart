class Instawar {
  final String imUser;
  final String impost;
  final String caption;
  final String Userpost;
  final List<Comments> ments;
  Instawar({
    required this.imUser,
    required this.impost,
    required this.caption,
    required this.Userpost,
    required this.ments,
  });
}
class Comments{
  final String user;
  final String comment;
  Comments({
    required this.user,
    required this.comment,
  });
}