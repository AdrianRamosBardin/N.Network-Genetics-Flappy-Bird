void calc_adecuacion(){
  float sum = 0;
  for (Bird b : muertos){
    sum += b.puntuacion;
  }

  for (Bird b : muertos){
    b.adecuacion = b.puntuacion/sum;
  }
}

Bird findBest(){
  //devuelve el mejor pajaro
  //hay que hacer algo que pase de pajaro a material genetico para poder ponerlo en la funcion que crea la nueva generación
  float[] adecuacion_list = new float[muertos.size()];
  int i = 0;
  for(Bird b : muertos){
   adecuacion_list[i] = b.adecuacion;
    i++;
  }
  i=0;
  int largest = 0;
  for(int j = 0;j<adecuacion_list.length;j++){
    if ( adecuacion_list[j] > adecuacion_list[largest] ) largest = j;
  }
  for(int k= 0; adecuacion_list.length<k;k++){
    adecuacion_list = shorten(adecuacion_list);
  }
  //adecuacion_list.clear();
  return muertos.get(largest);
}
