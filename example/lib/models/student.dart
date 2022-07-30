class Student {
  final String? id;
  final String? name;
  final String? age;
  final String? datos;

  Student({this.id, this.name, this.age, this.datos});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['modulo']['nombre'],
      name: json['modulo']['nombre'],
      age: json['modulo']['nombre'],
      datos: json['modulo']['nombre'],

    );
  }

  Map<String, dynamic> toJson() => {
    'nombre': name,
    'nombre': age,

  };
}
