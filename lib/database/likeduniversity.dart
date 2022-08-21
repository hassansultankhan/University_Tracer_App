import 'dart:math';

class likedUniversity{
  int id = 0;
  String name = "";

  likedUniversity({required this.id, required this.name});
  likedUniversity.withId({required this.id, required  this.name});

  Map<String, dynamic> toKeyValue(){
    var map = Map<String, dynamic>();
    map["name"]= name;
    if (id != null){
      map["id"]= Random().nextInt(10000);  
    }
    return map;
  }

  likedUniversity.fromKeyValue(dynamic uni){
    this.id = int.parse(uni["id"].toString());
    this.name = uni["name"];
  }
}