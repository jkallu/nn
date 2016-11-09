Net nn;

int[] topology = {3, 2, 1};

void setup() {
 size(800, 700); 

 nn = new Net(topology);
 nn.displayNet();
}

void draw() {
  
}