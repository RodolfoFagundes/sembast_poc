import 'dart:convert';

class Order {
  int id;
  String description;
  String contactName;
  DateTime date;
  String photoPath;
  Order({
    required this.id,
    required this.description,
    required this.contactName,
    required this.date,
    required this.photoPath,
  });

  Order copyWith({
    int? id,
    String? description,
    String? contactName,
    DateTime? date,
    String? photoPath,
  }) {
    return Order(
      id: id ?? this.id,
      description: description ?? this.description,
      contactName: contactName ?? this.contactName,
      date: date ?? this.date,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'contactName': contactName,
      'date': date.millisecondsSinceEpoch,
      'photoPath': photoPath,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      description: map['description'],
      contactName: map['contactName'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      photoPath: map['photoPath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(id: $id, description: $description, contactName: $contactName, date: $date, photoPath: $photoPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.id == id &&
        other.description == description &&
        other.contactName == contactName &&
        other.date == date &&
        other.photoPath == photoPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        contactName.hashCode ^
        date.hashCode ^
        photoPath.hashCode;
  }
}
