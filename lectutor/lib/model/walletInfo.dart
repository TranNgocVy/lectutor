import 'package:json_annotation/json_annotation.dart';
part 'walletInfo.g.dart';

@JsonSerializable()
class WalletInfo {
  WalletInfo(this.id, this.userId, this.amount, this.isBlocked, this.createdAt,
      this.updatedAt, this.bonus);

  String id;
  String userId;
  String amount;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;
  int bonus;

  factory WalletInfo.fromJson(Map<String, dynamic> json) => _$WalletInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WalletInfoToJson(this);


}