class User {
  var _id;
  var _name;

  get id => _id;
  get name => _name;

  set setId(id) {
    _id = id;
  }

  set setName(name) {
    _name = name;
  }

  User(this._name);
  User.withId(this._id, this._name);


  toMap() => {
        'id': _id,
        'name': _name,
      };


  User.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
  }
}
