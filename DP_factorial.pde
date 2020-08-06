int[] vfactorial = new int[10];
int[] vfibonacci = new int[10];

void setup(){
  inicializar_vectores();
  
  int n = factorial(5);
  println(n);
  print_array(vfactorial);
  
  n = factorial(8);
  println(n);
  print_array(vfactorial);
  
  n = factorial(7);
  println(n);
  print_array(vfactorial);
}
void print_array(int[] array){
  print("[");
  for(int i=0;i<array.length;i++){
     print(array[i]);print(",");
  }
  println("]");
}
void inicializar_vectores(){
  for(int i=0;i<vfactorial.length;i++)
    vfactorial[i]=-1;
  for(int i=0;i<vfibonacci.length;i++)
    vfibonacci[i]=-1;
}
int factorial(int n){
  // factorial(4) = 4*3*2*1
  // factorial(3) = 3*2*1;
  // factorial(2) = 2*1;
  // factorial(1) = 1
  println("    factorial:",n);
  if( vfactorial[n] != -1){
    return vfactorial[n];
  }
  
  if (n<=1) {
    if( vfactorial[n]==-1 )
      vfactorial[n] = n;
    return n;
  }
  
  int fact = n*factorial(n-1); 
  if( vfactorial[n]==-1 )
      vfactorial[n] = fact;
  return fact;
}

int fibonacci(int n){
  if(n==0) return 0;
  if(n==1) return 1;
  return fibonacci(n-1)+fibonacci(n-2);
}
