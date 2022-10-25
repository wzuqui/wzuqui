class GlokDate extends Date {
  adicionarMes() {
    this.setMonth(this.getMonth()+1);
  }
  adicionarDia() {
    this.setDate(this.getDate()+1);
  }
  diminiurDia() {
    this.setDate(this.getDate()-1);
  }
  primeiroDiaDoMes() {
    return new Date(this.setDate(1));
  }
  ultimoDiaDoMes() {
    const retorno = new GlokDate(this);
    retorno.primeiroDiaDoMes();
    retorno.adicionarMes();
    retorno.diminiurDia();
    return retorno;
  }
  toString = () : string => {
    return `${this.toISOString()}`;
  }
}

console.clear();
const a = new GlokDate();
console.log(`${a.primeiroDiaDoMes().toISOString()}`)
console.log(`${a.ultimoDiaDoMes()}`)
