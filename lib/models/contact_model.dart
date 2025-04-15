class Contact {
  late int id;
  late String name;
  late String number;

  Contact({
    required this.id,
    required this.name,
    required this.number,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Contact &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              number == other.number;

  @override
  int get hashCode => Object.hash(id, name, number);

  @override
  String toString() {
    return 'User{id: $id, name: $name, number: $number}';
  }

  Contact copyWith({
    int? id,
    String? name,
    String? number,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
    );
  }
}

