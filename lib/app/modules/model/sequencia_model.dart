class Sequencia {
  int numero;
  int mtr;
  int cliente;
  String rua;
  String bairro;
  String municipio;
  String estado;
  String lat;
  String long;

  Sequencia(
      {this.numero,
      this.mtr,
      this.cliente,
      this.rua,
      this.bairro,
      this.municipio,
      this.estado,
      this.lat,
      this.long});

  Sequencia.fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
    mtr = json['mtr'];
    cliente = json['cliente'];
    rua = json['rua'];
    bairro = json['bairro'];
    municipio = json['municipio'];
    estado = json['estado'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numero'] = this.numero;
    data['mtr'] = this.mtr;
    data['cliente'] = this.cliente;
    data['rua'] = this.rua;
    data['bairro'] = this.bairro;
    data['municipio'] = this.municipio;
    data['estado'] = this.estado;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}
