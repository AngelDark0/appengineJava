/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
public class Controlador extends HttpServlet {
    String inicio="inicio.jsp";
    String agregar="agregar.jsp";
    String editar="editar.jsp";
    String index="index.jsp";
    
    Cliente cliente= new Cliente();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion= request.getParameter("accion");
       

        if (accion.equals("usuario")){
            String nombre = request.getParameter("nombre");
            String clave = request.getParameter("clave");
           
            RequestBody requestBody = new FormBody.Builder()
                    .add("user", nombre)
                    .add("pass", clave)
                    .build();

            JSONObject datos = cliente.postJSON("http://34.133.153.173/pruebaservicios/models/login.php", requestBody);
            boolean verificar = datos.getBoolean("OK");
                if (verificar) {
                request.getRequestDispatcher(inicio).forward(request, response);
                } else{
                    request.getRequestDispatcher(index).forward(request, response);
               
                }
        }else if(accion.equals("agregar")){
            request.getRequestDispatcher(agregar).forward(request, response);
            
        }else if(accion.equals("Guardar")){
            String cedula= request.getParameter("cedula");
            String nombre= request.getParameter("nombre");
            String apellido= request.getParameter("apellido");
            String telefono= request.getParameter("telefono");
            String direccion= request.getParameter("direccion");
            RequestBody requestBody= new FormBody.Builder()
                    .add("est_cedula", cedula)
                    .add("est_nombre", nombre)
                    .add("est_apellido", apellido)
                    .add("est_telefono", telefono)
                    .add("est_direccion", direccion).build()
                    ;
            
            
            cliente.postJSON("http://34.133.153.173/pruebaservicios/models/guardar.php", requestBody);
            request.getRequestDispatcher(inicio).forward(request, response);
        }else if(accion.equals("editar")){
            String cedula1=request.getParameter("cedula");
            
            request.setAttribute("cedula", cedula1);
            
            request.getRequestDispatcher(editar).forward(request, response);
            
        }else if (accion.equals("Actualizar")) {
            
            RequestBody requestBody= new FormBody.Builder()
                    .add("est_cedula", request.getParameter("cedula"))
                    .add("est_nombre", request.getParameter("nombre"))
                    .add("est_apellido", request.getParameter("apellido"))
                    .add("est_telefono", request.getParameter("telefono"))
                    .add("est_direccion", request.getParameter("direccion")).build()
                    ;
            cliente.postJSON("http://34.133.153.173/pruebaservicios/models/editar.php", requestBody);
            request.getRequestDispatcher(inicio).forward(request, response);
        }else if(accion.equals("eliminar")){
            String cedula =request.getParameter("cedula");
            RequestBody requestBody = new FormBody.Builder()
                .add("est_cedula", cedula).build();

        cliente.postJSON("http://34.133.153.173/pruebaservicios/models/eliminar.php", requestBody);
            
            request.getRequestDispatcher(inicio).forward(request, response);
        }else if(accion.equals("cerrar"))
            request.getRequestDispatcher(index).forward(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
