import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

int[][] graph;
String[] nodes;
void setup(){
  csv2matrix("C:/INFORMACION/UP BONATERRA/CLASES/M Estructura de datos y Algoritmos/Estructura de Datos y Algoritmos III/programas/mapa_aguascalientes.csv");
  print_matrix();
}

void print_matrix(){
  print("\t");
  for(int n=0;n<nodes.length;n++){
    print(nodes[n]);print("\t");
  }
  println();
  for(int i=0;i<nodes.length;i++){
    print(nodes[i]);print("\t");
    for(int j=0;j<nodes.length;j++){
      print(graph[i][j]);print("\t");
    }
    println();
  }
}
void csv2matrix(String filename){
  try {
      String[] nodes_names = {"",""};
      File myObj = new File(filename);
      Scanner myReader = new Scanner(myObj);
      if(myReader.hasNextLine()){
        String nodes_str = myReader.nextLine();
        println(nodes_str);
        nodes_names = nodes_str.split(",");
        nodes = new String[nodes_names.length-1];
        graph = new int[nodes_names.length-1][nodes_names.length-1];
        for(int n=1;n<nodes_names.length;n++){
          nodes[n-1] = nodes_names[n];
        }
        // leer las líneas restantes
        
      }
      myReader.close();
    } catch (FileNotFoundException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
}
