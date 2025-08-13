package com.fawry.Web;

import com.fawry.Repository.ProductRepository;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "productList", value = "/product-servlet")
public class MainServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/add":
                showAddForm(request, response);
                break;
            case "/insert":
                insertProduct(request, response);
                break;
            case "/update":
                showUpdateForm(request, response);
                break;
            case "/edit":
                editProduct(request, response);
                break;
            case "/delete":
                break;
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product-form.jsp").forward(request, response);
    }
    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ProductRepository.getInstance().addProduct(name, price, quantity);
        response.sendRedirect("list");
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("product", ProductRepository.getInstance().getProduct(productId));
        request.getRequestDispatcher("product-form.jsp").forward(request, response);
    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ProductRepository.getInstance().updateProduct(productId, name, price, quantity);
        response.sendRedirect("list");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductRepository.getInstance().deleteProduct(productId);
        response.sendRedirect("list");
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", ProductRepository.getInstance().getProducts());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}