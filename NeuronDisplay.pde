class NeuronDisplay {
  ArrayList[] mLayer;
  NeuronDisplay(ArrayList[] mLa) {
    mLayer = mLa;
  }
  
  void DisplayNet(){
        int dLayerWidth = int (width / mLayer.length);
    //println(mLayer.length);
    for (int i = 0; i < mLayer.length; i++) {
      //println(mLayer[i].size());
      //int numOutputs = (i ==  mLayer.length - 1 ? 0: mLayer[i+1].size() - 1);
      //println(numOutputs);

      PVector weightInitPos;
      PVector weightFinalPos;
      
      int dLayerHeight = int (height / (mLayer[i].size()));
      for (int j = 0; j < mLayer[i].size(); j++) {
        PVector col = new PVector();
          if (j == mLayer[i].size() - 1 && i != mLayer.length - 1) {
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

        if (/*numOutputs > 0*/ i < mLayer.length - 1) {
          
          //println(i);
          weightInitPos = new PVector();
          weightInitPos.x = neuronX;
          weightInitPos.y = neuronY;
          
          int countNeuron = mLayer[i+1].size() - 1;
          if (i == (mLayer.length - 2))
            countNeuron = mLayer[i+1].size();
          else 
            countNeuron = mLayer[i+1].size() - 1 ;
            
           ArrayList<Neuron> aWeight =  mLayer[i];
            Neuron nWeight = aWeight.get(j); 
            //nWeight.printWeights();
            
          for (int k = 0; k < countNeuron; k++) {
            int weight = int(10 * nWeight.getWeight(k));
        
            int dNextLayerHeight = int (height / (mLayer[i+1].size()));
            weightFinalPos = new PVector();
            weightFinalPos.x = dLayerWidth/2 + (i + 1) * dLayerWidth;
            weightFinalPos.y = dNextLayerHeight/2 + k * dNextLayerHeight;
            
            drawWeights(weightInitPos, weightFinalPos, weight);
          }
        }
        drawNeuron (neuronX, neuronY, dLayerHeight/5, col);
      }
    }
  }
  
  void drawNeuron(int x, int y, int size, PVector col) {
    if (size > 40)
      size = 40;
      
    strokeWeight(1);
    stroke(0, 0, 0);
    fill(col.x, col.y, col.z);
    ellipse (x, y, size, size);
  }
  
  
  void drawWeights(PVector init, PVector fin, int weight){
    if(weight < 0)
      stroke(0, 255, 0);
    else if(weight > 0)
     stroke(0, 0, 255);
    else
       stroke(0, 0, 0);
       
     weight = abs(weight);
     
    strokeWeight(weight);
    line(init.x, init.y, fin.x, fin.y);
  }
}