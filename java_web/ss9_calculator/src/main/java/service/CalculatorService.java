package service;

public class CalculatorService {
    public static double calculateAmount(double price,double discount){
        double result;
        result = price * discount * 0.01;
        return result;
    }
}
