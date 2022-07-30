import 'dart:convert';


class User {
  late String name;
  late String age;
  late List? tags;

  User(this.name, this.age,this.tags);
  factory User.fromJson(dynamic json) {




    return User(json['nombre'] as String, json['nombre'] as String,json['datos']);
  }
  @override
  String toString() {
    return '{ ${this.name}, ${this.age}, ${this.tags}  }';
  }
}
class Tutorial {
  String name;
  String description;
  User author;

  Tutorial(this.name, this.description, this.author);
  factory Tutorial.fromJson(dynamic json) {
    return Tutorial(json['modulo']['nombre'] as String, json['modulo']['nombre'] as String, User.fromJson(json['modulo']));

  }
  @override
  String toString() {
    return '{ ${this.name}, ${this.description}, ${this.author} }';
  }
}


class Tag {
  String name;
  String quantity;
  Tag(this.name, this.quantity);
  factory Tag.fromJson(dynamic json) {
    return Tag(json['titulo'] as String, json['titulo'] as String);
  }
  @override
  String toString() {
    return '{ ${this.name}, ${this.quantity} }';
  }
}