import 'dart:convert';

class Organization {
  final String id;
  final String creatorId;
  final String name;
  final List<String> addresses;
  final List<String> emails;
  final List<String> phones;
  final List<String> responsibles;
  final DateTime createdAt;
  final DateTime updatedAt;

  Organization({
    required this.id,
    required this.creatorId,
    required this.name,
    required this.addresses,
    required this.emails,
    required this.phones,
    required this.responsibles,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'],
      creatorId: json['creatorId'],
      name: json['name'],
      addresses: List<String>.from(json['addresses']),
      emails: List<String>.from(json['emails']),
      phones: List<String>.from(json['phones']),
      responsibles: List<String>.from(json['responsibles']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'name': name,
      'addresses': addresses,
      'emails': emails,
      'phones': phones,
      'responsibles': responsibles,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Organization.fromString(String jsonString) {
    return Organization.fromJson(json.decode(jsonString));
  }

  Organization copyWith({
    String? id,
    String? creatorId,
    String? name,
    List<String>? addresses,
    List<String>? emails,
    List<String>? phones,
    List<String>? responsibles,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Organization(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      name: name ?? this.name,
      addresses: addresses ?? this.addresses,
      emails: emails ?? this.emails,
      phones: phones ?? this.phones,
      responsibles: responsibles ?? this.responsibles,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
