class Node {
  int data;
  Node left;
  Node right;
  Node(int data) {
    this.data = data;
  }
  String toString() {
    return String.valueOf(this.data);
  }
}
class BST {
  Node head;
  BST() {
    head = null;
  }
  void insert(int data) {
    Node n = new Node(data);
    if (head==null) {
      head = n;
    } else {
      Node aux = head;
      while (true) {
        if ( data <= aux.data ) { //izquierda
          if (aux.left==null) {
            aux.left = n; break;
          } else {
            aux = aux.left;
          }
        } else { //derecha
          if (aux.right==null) {
            aux.right = n; break;
          } else {
            aux = aux.right;
          }
        }
      }
    }
  }
  String printNode(String sp, Node n){
    String s = sp+ n.data + "\n";
    if(n.left!=null) s+=printNode(sp+" ",n.left);
    if(n.right!=null) s+=printNode(sp+" ",n.right);
    return s;
  }
  
  String toString() {
    if(head==null){
      return "[]";
    }else{
      return printNode("",head);
    }
  }
  
  String inorder(Node n){
    String s = "";
    if(n.left!=null) s+=inorder(n.left);
    s+= n.data +", ";
    if(n.right!=null) s+=inorder(n.right);
    return s;
  }
  String inorder(){
    String s = "inorder: ";
    if(head==null){
      return s;
    }else{
      s+=inorder(head);
      return s;
    }
  }
}

void setup() {
  BST b = new BST();
  b.insert(3);
  b.insert(9);
  b.insert(1);
  b.insert(11);
  println(b);
  println(b.inorder());
}
