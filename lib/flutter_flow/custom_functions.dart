import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic convertToJSON(String prompt) {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  String formattedDate = formatter.format(now);

  return json.decode(
      '[{"role":"system","content":"Você é uma assistente pessoal que vai ajudar a descobrir uma tarefa a partir de um texto escrito pelo usuário"},{"role":"user","content":"Hoje é dia $formattedDate, $prompt"}]');
}

String convertApiStringToDescription(String response) {
  final decodedResponse = json.decode(response);
  return decodedResponse;
}

DateTime convertApiStringToDate(String response) {
  final decodedResponse = json.decode(response);
  DateFormat format = DateFormat("dd/MM/yyyy");
  DateTime decodedDate = format.parse(decodedResponse["date"]);
  return decodedDate;
}

String convertApiStringToTitle(String response) {
  final decodedResponse = json.decode(response);
  return decodedResponse["name"];
}
