import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
  String? type;
  String? msg;

  Response({
    this.type,
    this.msg,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        type: json["type"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "msg": msg,
      };
}
