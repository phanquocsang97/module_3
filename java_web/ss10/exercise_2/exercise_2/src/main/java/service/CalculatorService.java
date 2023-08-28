package service;
public class CalculatorService implements ICalculatorService {
    @Override
    public double calculate(double firstOperand, double secondOperand,String operator) {
        double result = 0;
        switch (operator){
            case "+":
                result = firstOperand + secondOperand;
                break;
            case "-":
                result = firstOperand - secondOperand;
                break;
            case "*":
                result = firstOperand * secondOperand;
                break;
            case "/":
                result = firstOperand / secondOperand;
                break;
        }
        return result;
    }

}
