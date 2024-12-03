List<int> obtenerNumerosEnIntervalo(int num1, int num2) {
  List<int> numeros = [];

  if (num1 > num2) {
    for (int i = num1; i >= num2; i--) {
      numeros.add(i);
    }
  } else if (num2 > num1) {
    for (int i = num1; i <= num2; i++) {
      numeros.add(i);
    }
  } else {
    numeros.add(num1); 
  }

  return numeros;
}
