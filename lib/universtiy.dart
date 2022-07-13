class university {
  String name;
  //  webad, state;

  university(
    this.name,
    // this.webad, this.state
  );

  static List<university> getuniveritydata(Map<String, dynamic> data) {
    List<university> universities = [];
    for (final uni in data['domains']) {
      String name = uni[0];
      // String webad = uni['']['web_pages'];
      // String state = uni['']['state-province'];

      // university U = university(name
      // webad, state

      // universities.add(U);
    }
    return universities;
  }
}
