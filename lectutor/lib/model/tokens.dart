import 'package:json_annotation/json_annotation.dart';
import 'token.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

part 'tokens.g.dart';
@JsonSerializable()
class Tokens with ChangeNotifier, DiagnosticableTreeMixin{
  Token access;
  Token refresh;

  Tokens(this.access, this.refresh);

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
  Map<String, dynamic> toJson() => _$TokensToJson(this);

  void update(Tokens tokens) {
    access = tokens.access;
    refresh = tokens.refresh;
  }

}