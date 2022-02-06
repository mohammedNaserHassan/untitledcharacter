class Character{
  int charID;
  String nickName;
  String name;
  String image;
  List<dynamic> jobs;
  String statusIfDeadOrLive;
  List<dynamic> appearanceOfSeasons;
  String actorName;
  String categoryForTwoSeries;
  List<dynamic> betterCallSaulAppearance;
  Character.fromJson(Map<String,dynamic> json){
    charID = json['char_id'];
    name = json['name'];
    nickName = json['nickname'];
    image = json['img'];
    jobs = json['occupation'];
    statusIfDeadOrLive = json['status'];
    appearanceOfSeasons = json['appearance'];
    actorName = json['portrayed'];
    categoryForTwoSeries = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}