class university {
  String name;
  List<dynamic> webad =[]; 
  dynamic state;

  university(
    this.name,this.webad, this.state
  );

  static List<university> getuniveritydata(List<dynamic> data) {
    List<university> universities = [];
    for (final uni in data) {
      String name1 = uni['name'];
      List<dynamic> webad1 = uni['web_pages'];
      dynamic state1 = uni['state-province'];

      university U = university(name1, webad1, state1 );

      universities.add(U);
    }
    return universities;
  }
}
