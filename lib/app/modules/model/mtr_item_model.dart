import 'package:biodriver/app/modules/model/mtr_model.dart';
import 'package:biodriver/app/modules/model/sequencia_model.dart';

class MtrItemModel {
  int id;
  Mtr mtr;
  List<Sequencia> sequencia;

  MtrItemModel({this.id, this.mtr, this.sequencia});

  MtrItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mtr = json['mtr'] != null ? new Mtr.fromJson(json['mtr']) : null;
    if (json['sequencia'] != null) {
      sequencia = new List<Sequencia>();
      json['sequencia'].forEach((v) {
        sequencia.add(new Sequencia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.mtr != null) {
      data['mtr'] = this.mtr.toJson();
    }
    if (this.sequencia != null) {
      data['sequencia'] = this.sequencia.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
