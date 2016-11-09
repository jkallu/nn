class Net {
  ArrayList[] mLayer;
  
  Net(int[] top) {
    mLayer = new ArrayList[top.length];
    for (int i = 0; i < top.length; i++) {
       mLayer[i] = new ArrayList<Neuron>(); // create layer
       int numOutputs = (i ==  mLayer.length - 1 ? 0: top[i+1]);
       //println(numOutputs);
       if (numOutputs > 0){
         for (int j = 0; j <= top[i]; j++) {
           mLayer[i].add(new Neuron(numOutputs)); // create neurons in the layer
         }
       }
       else {
         for (int j = 0; j < top[i]; j++) {
           mLayer[i].add(new Neuron(numOutputs)); // create neurons in the layer
         }
       }
    }
  }
  
  void displayNet() {
    NeuronDisplay nDisplay = new NeuronDisplay(mLayer);
    nDisplay.DisplayNet();
  }
}