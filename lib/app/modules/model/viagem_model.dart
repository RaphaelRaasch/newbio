class ViagemModel {
  int id;
  String lat;
  String lng;
  int motorista;
  int cliente;

  ViagemModel({this.id, this.lat, this.lng, this.motorista, this.cliente});

  ViagemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    motorista = json['motorista'];
    cliente = json['cliente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['motorista'] = this.motorista;
    data['cliente'] = this.cliente;
    return data;
  }
}
