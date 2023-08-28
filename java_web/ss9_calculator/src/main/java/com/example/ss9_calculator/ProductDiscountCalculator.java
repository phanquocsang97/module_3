package com.example.ss9_calculator;

import service.CalculatorService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculator", value = "/product-discount-calculator")
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double discountAmount = CalculatorService.calculateAmount(discount, price);
        request.setAttribute("description", description);
        request.setAttribute("discountAmount", discountAmount);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/calculator.jsp");
        requestDispatcher.forward(request, response);

    }
}