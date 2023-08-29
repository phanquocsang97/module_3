package service;

public class CalculatorService implements ICalculatorService {
    @Override
    public double calculate(double firstOperand, double secondOperand, String operator) {
        double result = 0;
        switch (operator) {
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
                if (secondOperand==0){
                    throw new RuntimeException("Không thực hiện được phép chia!!");
                }
                result = firstOperand / secondOperand;
                break;

        }
        return result;
    }

}
