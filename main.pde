class NNetwork{
  boolean check_train = true; //Si esta en true estas probando la funcion guess
  
  NNetwork(int input_t,int hiden_t,int output_t){
    int n_input = input_t;
    int n_hiden = hiden_t;
    int n_output = output_t;
  }
  float[][] guess(float[][] Inp,float[][] WInp,float[][] BInp,float[][] WHdn,float[][] BHdn){
    if(check_train == false){
      println("No se ha entrenado aun");
      return(null);
    }
    else{
      //Hacemos la operaciones con las matrices
      float[][] Out1_t1 = multiply(Inp,WInp);
      float[][] Out1_t = sumar(Out1_t1,BInp);
      float[][] Out1 = new float [Out1_t.length][Out1_t[0].length];
      
      for(int i= 0; i < Out1_t.length;i++){
        for(int j= 0; j< Out1_t[i].length;j++){
          Out1[i][j] = sigmoid(Out1_t[i][j]);
        }  
      }
      
      float[][] Out2_t1 = multiply(Out1,WHdn);
      float[][] Out2_t = sumar(Out2_t1,BHdn);
      float[][] Out2 = new float [Out2_t.length][Out1_t[0].length];
      
      Out2[0] = softmax(Out2_t[0]);
      return(Out2); 
    }
  }
  
  float[][][] resoultMatrix(float[][] test_inp,float[][] test_out){
    // tiene que devolver las siguientes matrices: Pesos1,Bias1,Pesos2,Bias2
     return null;
  }
  
  
  
  
  
}
