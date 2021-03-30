float[][] multiply(float[][] MxA ,float[][]MxB){  
  float[][] multiplicacion = new float [MxA.length][MxB[0].length];
  for(int i= 0; i < multiplicacion.length;i++){
    for(int j= 0; j< multiplicacion[i].length;j++){
      for(int k = 0; k < MxA[0].length; k++){
        multiplicacion[i][j] +=MxA[i][k] * MxB[k][j];
      }
    }  
  }
  return multiplicacion;
}
//-----------------------------------------------------------------------------------------------------------------
float[][] sumar(float[][] MxA ,float[][]MxB){  
  float[][] suma = new float [MxA.length][MxB[0].length];
  for(int i= 0; i < suma.length;i++){
    for(int j= 0; j< suma[i].length;j++){
      suma[i][j] = MxA[i][j] + MxB[i][j];
    }  
  }
  return suma;
}
//-----------------------------------------------------------------------------------------------------------------
float sigmoid(float x){
  return 1.0/(1.0 + exp(-10.0 * (x - 0.5)));
}
//-----------------------------------------------------------------------------------------------------------------
float[] softmax(float[] input){
  float[] exp_in = new float[input.length];
  float[] Out = new float[input.length];
  float suma = 0;
  
  for(int i = 0; i<input.length; i++){
    exp_in[i] = exp(input[i]);
    suma += exp_in[i];
  }
  for(int i = 0; i<exp_in.length; i++){
    Out[i] = exp_in[i]/suma;
  }
  return Out;
}
//-----------------------------------------------------------------------------------------------------------------
float[][] randomMatrix(int x, int y){
  float[][] Out = new float [x][y];
  for(int i= 0; i < x;i++){
    for(int j= 0; j<y;j++){
      Out[i][j] = random(0,1);
    }  
  }
  return Out;
}
//-----------------------------------------------------------------------------------------------------------------
float[][] mutateMatrix(float[][] InputMatrix,float rate){
  float[][] Out = new float [InputMatrix.length][InputMatrix[0].length];
  for(int i= 0; i < InputMatrix.length;i++){
    for(int j= 0; j<InputMatrix[0].length;j++){
      if(random(1)<0.3){
        Out[i][j] = mut(Out[i][j],rate);
      }
    }  
  }
  return Out;
}

//-----------------------------------------------------------------------------------------------------------------
float mut(float val, float rate){
    if (random(1) < rate){
      return val + randomGaussian() * .1;
    } else{
      return val;
    }
  }
