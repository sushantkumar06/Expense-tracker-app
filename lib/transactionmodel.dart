
class Transactionmodel {
  String? id;
  String? title;
  int? amount;
  String? note;
  String? transactionType;

  Transactionmodel({this.id, this.title, this.amount, this.note, this.transactionType});

  Transactionmodel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["amount"] is int) {
      amount = json["amount"];
    }
    if(json["note"] is String) {
      note = json["note"];
    }
    if(json["transactionType"] is String) {
      transactionType = json["transactionType"];
    }
  }

  static List<Transactionmodel> fromList(List<Map<String, dynamic>> list) {
    return list.map(Transactionmodel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["amount"] = amount;
    _data["note"] = note;
    _data["transactionType"] = transactionType;
    return _data;
  }
}