import 'dart:convert';

class Deal {
  final String? id;
  final String? creatorId;
  final String? funnelId;
  final String? statusId;
  final String? executorId;
  final String? organizationId;
  final String? contactId;
  final String? title;
  final String? description;
  final int? amount;
  final String? winStatus;

  Deal({
    this.id,
    this.creatorId,
    this.funnelId,
    this.statusId,
    this.executorId,
    this.organizationId,
    this.contactId,
    this.title,
    this.description,
    this.amount,
    this.winStatus,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      id: json['id'],
      creatorId: json['creatorId'],
      funnelId: json['funnelId'],
      statusId: json['statusId'],
      executorId: json['executorId'],
      organizationId: json['organizationId'],
      contactId: json['contactId'],
      title: json['title'],
      description: json['description'],
      amount: json['amount'],
      winStatus: json['winStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'funnelId': funnelId,
      'statusId': statusId,
      'executorId': executorId,
      'organizationId': organizationId,
      'contactId': contactId,
      'title': title,
      'description': description,
      'amount': amount,
      'winStatus': winStatus,
    };
  }

  factory Deal.fromString(String jsonString) {
    return Deal.fromJson(json.decode(jsonString));
  }

  @override
  String toString() {
    return json.encode(toJson());
  }

  Deal copyWith({
    String? id,
    String? creatorId,
    String? funnelId,
    String? statusId,
    String? executorId,
    String? organizationId,
    String? contactId,
    String? title,
    String? description,
    int? amount,
    String? winStatus,
  }) {
    return Deal(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      funnelId: funnelId ?? this.funnelId,
      statusId: statusId ?? this.statusId,
      executorId: executorId ?? this.executorId,
      organizationId: organizationId ?? this.organizationId,
      contactId: contactId ?? this.contactId,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      winStatus: winStatus ?? this.winStatus,
    );
  }
}
