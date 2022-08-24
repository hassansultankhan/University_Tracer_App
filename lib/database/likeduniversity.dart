import 'dart:math';

class likedUniversity{
  int id = 0;
  String name = "";
  String webadress = "";

  likedUniversity(this.name, this.webadress);
  likedUniversity.withId({required this.id, required  this.name});

  Map<String, dynamic> toKeyValue(){
    var map = Map<String, dynamic>();
    map["name"]= name;
    map["webadress"]=webadress;
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