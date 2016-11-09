class Net {
  ArrayList[] mLayer;
  
  Net(int[] top) {
    mLayer = new ArrayList[top.length];
    for (int i = 0; i < top.length; i++) {
       mLayer[i] = new ArrayList(); // create layer
       int numOutputs = (i ==  mLayer.length - 1 ? 0: top[i+1]);
       println(numOutputs);
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
     //mLayer[top.length - 1].add(new Neuron(0)); // create neurons in the layer
  }
  
  void displayNet() {
    int dLayerWidth = int (width / mLayer.length);
    //println(mLayer.length);
    for (int i = 0; i < mLayer.length; i++) {
      //println(mLayer[i].size());
      int numOutputs = (i ==  mLayer.length - 1 ? 0: mLayer[i+1].size() - 1);
      println(numOutputs);
      
      PVector weightInitPos;
      PVector weightFinalPos;
      if (numOutputs > 0) {
        //weightInitPos = new PVector[mLayer[i].size()];
        //weightFinalPos = new PVector[mLayer[i+1].size()];
      }
      else {
         //weightInitPos = new PVector[0];
         //weightFinalPos = new PVector[0];
      }
      
      int dLayerHeight = int (height / (mLayer[i].size()));
      for (int j = 0; j < mLayer[i].size(); j++) {
        PVector col = new PVector();
        if (j == mLayer[i].size() - 1 && numOutputs > 0) {
          col.x = 150;
          col.y = 0;
          col.z = 0;
        }
        else {
          col.x = 255;
          col.y = 255;
          col.z = 255;
        }
        int neuronX = dLayerWidth/2 + i * dLayerWidth;
        int neuronY = dLayerHeight/2 + j * dLayerHeight;
        
        if (numOutputs > 0) {
          weightInitPos = new PVector();
          weightInitPos.x = neuronX;
          weightInitPos.y = neuronY;
          
          int countNeuron = mLayer[i+1].size() - 1;
          if (i == mLayer.length - 1)
            countNeuron = mLayer[i+1].size()-1;
          else 
            countNeuron = mLayer[i+1].size() ;
          for (int k = 0; k < countNeuron; k++) {
            int dNextLayerHeight = int (height / (mLayer[i+1].size()));
            weightFinalPos = new PVector();
            weightFinalPos.x = dLayerWidth/2 + (i + 1) * dLayerWidth;
            weightFinalPos.y = dNextLayerHeight/2 + k * dNextLayerHeight;
            
            drawWeights(weightInitPos, weightFinalPos);
          }
        }
        drawNeuron (neuronX, neuronY, dLayerHeight/5, col);
      }
    }
  }
  
  void drawNeuron(int x, int y, int size, PVector col) {
    fill(col.x, col.y, col.z);
    ellipse (x, y, size, size);
  }
  
  void drawWeights(PVector init, PVector fin){
    line(init.x, init.y, fin.x, fin.y);
  }
}