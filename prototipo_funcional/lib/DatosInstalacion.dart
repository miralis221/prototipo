
class Data {
  // ignore: non_constant_identifier_names
  double HSP;
  double kWh;

  double get H_S_P  {
    return this.HSP;
  }

  set H_S_P (double HoraSolarPico) {
    this.HSP = HoraSolarPico;
  }

  double get k_w_h  {
    return this.kWh;
  }

  set k_w_h (double kilovatio) {
    this.kWh = kilovatio;
  }

  Data(this.HSP, this.kWh);
}

class Eolico {
  double consumo;
  int altura;


  double get consumo_in{
    return this.consumo;
  }

  set consumo_in(double Consumo){
    this.consumo = Consumo;
  }

  int get altura_ins{
    return this.altura;
  }

  set altura_ins(int Altura){
    this.altura = Altura;
  }

}