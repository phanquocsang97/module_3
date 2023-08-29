package com.example.exercise_2;

import service.CalculatorService;
import service.ICalculatorService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Calculator", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    ICalculatorService calculatorService = new CalculatorService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
        String operator = request.getParameter("operator");
        double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));
        String warning = "";
        try {
            double result = calculatorService.calculate(firstOperand, secondOperand, operator);
            request.setAttribute("firstOperand", firstOperand);
            request.setAttribute("operator", operator);
            request.setAttribute("secondOperand", secondOperand);
            request.setAttribute("result", result);
            request.getRequestDispatcher("/calculator.jsp").forward(request, response);
        }catch (Exception e) {
            warning = e.getMessage();
            request.setAttribute("warning",warning);
            request.getRequestDispatcher("/calculator.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    }
}