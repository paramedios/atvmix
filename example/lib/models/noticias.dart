class Noticias {
  final String? id;
  final String? name;
  final String? age;

  Noticias({this.id, this.name, this.age});

  factory Noticias.fromJson(Map<String, dynamic> json) {
    return Noticias(
      id: json['nombre'],
      name: json['nombre'],
      age: json['imagen'],
    );
  }

  Map<String, dynamic> toJson() => {
    'nombre': name,
    'imagen': age,
  };
}
