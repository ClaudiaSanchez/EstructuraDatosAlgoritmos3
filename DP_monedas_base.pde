void setup(){
  int cantidad = 12;
  int[] monedas = {1,2,5};
  int[][] nmonedas = new int[monedas.length][cantidad];
  int[][][] dmonedas = new int[monedas.length][cantidad][monedas.length];
  //nmonedas[1][3] = 2;
  //dmonedas[1][3][0] = 0 ; //$1
  //dmonedas[1][3][1] = 2 ; //$2
  //dmonedas[1][3][2] = 0 ; //$5
  dp_monedas(cantidad,monedas,nmonedas,dmonedas);
}
void dp_monedas(int cantidad,int[] monedas,int[][] nmonedas,int[][][] dmonedas){
  // Primer paso: calcular la primera fila
  
  // Segundo paso: calcular las filas restantes
}
