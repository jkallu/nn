class Neuron {
  float mOutputVal;
  float[] mOutputWeights;
  
  Neuron(int numOutputs) {
    mOutputWeights = new float[numOutputs];
    for (int i = 0; i < mOutputWeights.length; i++) {
      mOutputWeights[i] = random(-1., 1.);
    }
  }
  
  void printWeights() {
    for(int i = 0; i < mOutputWeights.length; i++){
       print(mOutputWeights[i], " ");
    }
     println();
  }
  
  float getWeight(int numWeight) {
    return mOutputWeights[numWeight];
  }
}