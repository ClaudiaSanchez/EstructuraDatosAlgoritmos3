int cantidad = 12;
int[] monedas = {2, 3, 5};

int inf = 9999;

int[][] nmonedas = new int[monedas.length][cantidad];
int[][][] dmonedas = new int[monedas.length][cantidad][monedas.length];

void setup() {
  dp_monedas(cantidad, monedas.length-1);
  print_solucion();
}
void dp_monedas(int cant, int m) {
  if ( nmonedas[m][cant-1]!=0 ) return;

  if ( m==0 ) {
    if ( cant%monedas[0]==0 ) {
      nmonedas[0][cant-1] = cant/monedas[0];
      dmonedas[0][cant-1][0] = cant/monedas[0];
    } else {
      nmonedas[0][cant-1] = inf;
    }
    return;
  }

  if ( monedas[m] > cant ) {
    dp_monedas(cant, m-1);
    nmonedas[m][cant-1] = nmonedas[m-1][cant-1];
    for (int mm=0; mm<monedas.length; mm++) 
      dmonedas[m][cant-1][mm] = dmonedas[m-1][cant-1][mm];
  } else {
    // Verificar que ya estén las celdas que se necesitan
    dp_monedas(cant, m-1);
    int cant_rest = cant-monedas[m];
    if (cant_rest > 0) dp_monedas(cant_rest, m);
    // Construir solución con 1 moneda de moneda[m]
    nmonedas[m][cant-1] = 1;
    dmonedas[m][cant-1][m] = 1;
    if (cant_rest>0) {
      nmonedas[m][cant-1] += nmonedas[m][cant_rest-1];
      for (int mm=0; mm<monedas.length; mm++) 
        dmonedas[m][cant-1][mm] += dmonedas[m][cant_rest-1][mm];
    }
    // ¿Me conviene poner la moneda de la denominación actual?
    if ( nmonedas[m][cant-1] > nmonedas[m-1][cant-1] ) {
      nmonedas[m][cant-1] = nmonedas[m-1][cant-1];
      for (int mm=0; mm<monedas.length; mm++) 
        dmonedas[m][cant-1][mm] = dmonedas[m-1][cant-1][mm];
    }
  }
}
void print_solucion() {
  print('\t');
  for (int c=1; c<=cantidad; c++) {
    print(c);
    print('\t');
  }
  println();
  for (int m=0; m<monedas.length; m++) {
    print("$");
    print(monedas[m]);
    print('\t');
    for (int c=1; c<=cantidad; c++) {
      print(nmonedas[m][c-1]);
      print('\t');
    }
    println();
    print('\t');
    for (int c=1; c<=cantidad; c++) {
      print("(");
      for (int mm=0; mm<monedas.length; mm++) {
        print(dmonedas[m][c-1][mm]);
      }
      print(")");
      print('\t');
    }
    println();
  }
}
