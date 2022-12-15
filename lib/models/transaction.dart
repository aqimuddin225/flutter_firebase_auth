import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Money {
  final int amount;
  final String id;
  final String title;
  final bool isBuy;

  const Money({
    required this.amount,
    required this.id,
    required this.title,
    required this.isBuy
  });

  factory Money.fromJson(Map<String, dynamic> json) {
    return Money(
      amount: json['amount'],
      id: json['id'],
      title: json['title'],
      isBuy: json['isBuy']
    );
  }
}

