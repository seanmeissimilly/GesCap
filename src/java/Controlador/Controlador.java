package Controlador;

import org.json.simple.JSONObject;
import Modelo.Accion;
import Modelo.Coordinador;
import Modelo.Cursista;
import Modelo.Entidad;
import Modelo.Organizacion;
import Modelo.Persona;
import Modelo.Profesor;
import Modelo.Usuario;
import ModeloBean.AccionBean;
import ModeloBean.EntidadBean;
import ModeloBean.OrganizacionBean;
import ModeloBean.PersonaBean;
import ModeloBean.UsuarioBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controlador extends HttpServlet {

    //Referencias a las paginas
    String persona_list = "persona_list.jsp";
    String persona_add = "persona_add.jsp";
    String persona_edit = "persona_edit.jsp";
    String usuario_edit = "usuario_edit.jsp";
    String usuario_list = "usuario_list.jsp";
    String organizacion_list = "organizacion_list.jsp";
    String entidad_list = "entidad_list.jsp";
    String organizacion_edit = "organizacion_edit.jsp";
    String entidad_edit = "entidad_edit.jsp";
    String login = "login.jsp";
    String panel = "./dashboard";
    String accion_add = "./accion_add";
    String accion_edit = "./accion_edit";
    String urol_edit = "rol_edit.jsp";
    String urol_list = "rol_list.jsp";
    String reporte_accion_1 = "reporte_accion_1.jsp";
    String reporte_accion_2 = "reporte_accion_2.jsp";

    Persona persona = new Persona();
    Usuario user = new Usuario();
    Profesor profe = new Profesor();
    Coordinador coordinador = new Coordinador();
    Cursista cursista = new Cursista();
    Organizacion organizacion = new Organizacion();
    Entidad entidad = new Entidad();
    Accion accion = new Accion();

    PersonaBean dao = new PersonaBean();
    UsuarioBean userdao = new UsuarioBean();
    OrganizacionBean orgdao = new OrganizacionBean();
    EntidadBean entdao = new EntidadBean();
    AccionBean acciondao = new AccionBean();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");

        switch (action) {

            case "entidad_page": {

                request.setAttribute("page", request.getParameter("page"));
                acceso = entidad_list;
                break;

            }
            case "rol_page": {

                request.setAttribute("page", request.getParameter("page"));
                acceso = urol_list;
                break;

            }
            case "accion_page": {

                request.setAttribute("page", request.getParameter("page"));
                acceso = accion_add;
                break;

            }
            case "persona_list": {

                acceso = persona_list;

                break;

            }

            case "organizacion_edit": {

                request.setAttribute("id", request.getParameter("id"));
                acceso = organizacion_edit;

                break;

            }
            case "entidad_edit": {

                request.setAttribute("id_entidad", request.getParameter("id_entidad"));
                request.setAttribute("page", request.getParameter("page"));
                acceso = entidad_edit;

                break;

            }

            case "persona_add": {

                acceso = persona_add;

                break;

            }
            case "edit_accion": {

                userdao = new UsuarioBean();
                user = userdao.list(request.getParameter("user"));
                if (!user.getRol().equals("1")) {

                    //Recibo el parametro del id de la accion.
                    String id = request.getParameter("number_accion");

                    //Busco esa accion en la base de datos.
                    acciondao = new AccionBean();
                    Accion ac = acciondao.list(id).get(0);

                    //Reviso si el usuario que quiere editar la accion es de la misma entidad que la accion.
                    if (ac.getEntidad().equals(user.getEntidad())) {

                        //Empiezo a asignarle los valores.
                        accion.setNombre(request.getParameter("nombre_accion"));
                        accion.setFecha_inicial(request.getParameter("fechainicial_accion"));
                        accion.setFecha_final(request.getParameter("fechafinal_accion"));
                        accion.setId_clasificacion(request.getParameter("clasificacion_accion"));
                        accion.setId_formaorganizativa(request.getParameter("forganizativa_accion"));
                        accion.setId_area(request.getParameter("area_accion"));
                        accion.setId_entidadejecutora(request.getParameter("entidad_accion"));
                        accion.setId_entidad(request.getParameter("entidad_p"));
                        accion.setId_modalidad(request.getParameter("modalidad_accion"));
                        accion.setExtraplan(request.getParameter("extraplan_accion") != null);

                        //Reviso si el parametro de creditos esta vacio.
                        if (request.getParameter("creditos_accion").equals("")) {
                            accion.setCreditos("0");
                        } else {
                            accion.setCreditos(request.getParameter("creditos_accion"));
                        }

                        accion.setId_evaluacionfinal(request.getParameter("evaluacion_accion"));
                        accion.setObservaciones(request.getParameter("observaciones_accion"));
                        acciondao.edit(accion, id);

                    }
                }
                request.setAttribute("page", request.getParameter("page"));
                acceso = accion_add;
                break;

            }
            case "edit_userapp": {
                String username = request.getParameter("txtusername");
                String name = request.getParameter("txtname");
                String id_rol = request.getParameter("id_rol");
                String entidad = request.getParameter("entidad_p");
                userdao = new UsuarioBean();
                user = new Usuario();
                user.setNombre(name);
                user.setUsername(username);
                user.setRol(id_rol);
                user.setEntidad(entidad);
                userdao.edit(user, username);
                acceso = urol_list;

                break;

            }
            case "login": {

                acceso = panel;

                break;

            }
            case "accion_delete": {

                userdao = new UsuarioBean();
                Usuario user = userdao.list(request.getParameter("user"));

                //Reviso si el usuario solo tiene rol de consultor.
                if (!user.getRol().equals("1")) {
                    //Recibo el parametro del id de la accion.
                    String id = request.getParameter("id");

                    //Busco esa accion en la base de datos.
                    acciondao = new AccionBean();
                    Accion ac = acciondao.list(id).get(0);

                    //Reviso si el usuario que quiere eliminar la accion es de la misma entidad que la accion.
                    if (ac.getEntidad().equals(user.getEntidad()) || user.getRol().equals("3")) {
                        //Borro la accion.
                        acciondao.eliminar(id);
                    }

                }
                request.setAttribute("page", request.getParameter("page"));
                acceso = accion_add;
                break;

            }
            case "accion_edit": {

                userdao = new UsuarioBean();
                user = userdao.list(request.getParameter("user"));
                if (!user.getRol().equals("1")) {

                    //Recibo el parametro del id de la accion.
                    String id = request.getParameter("id");

                    //Busco esa accion en la base de datos.
                    acciondao = new AccionBean();
                    Accion ac = acciondao.list(id).get(0);

                    //Reviso si el usuario que quiere editar la accion es de la misma entidad que la accion.
                    if (ac.getEntidad().equals(user.getEntidad()) || user.getRol().equals("3")) {

                        request.setAttribute("id", id);
                        request.setAttribute("user", user.getUsername());
                        request.setAttribute("page", request.getParameter("page"));
                        acceso = accion_edit;
                        break;
                    }
                }
                acceso = accion_add;
                break;

            }
            case "urol_edit": {

                request.setAttribute("id", request.getParameter("id"));
                request.setAttribute("page", request.getParameter("page"));
                acceso = urol_edit;
                break;

            }
            case "urol_delete": {

                String username = request.getParameter("id");
                userdao.eliminar(username);
                request.setAttribute("page", request.getParameter("page"));
                acceso = urol_list;
                break;

            }

            case "add_person": {

                String ci = request.getParameter("txtCi");
                //Para no entrar espacios vacios
                if (ci.equals("")) {
                    acceso = persona_list;
                    break;
                }
                String nombre = request.getParameter("txtNombre");
                String primerapellido = request.getParameter("txtPrimerApellido");
                String segundoapellido = request.getParameter("txtSegundoApellido");
                persona.setCi(ci);
                persona.setNombre(nombre);
                persona.setPrimerApellido(primerapellido);
                persona.setSegundoApellido(segundoapellido);
                dao.add(persona);
                acceso = persona_list;

                break;

            }
            case "persona_edit": {

                request.setAttribute("ci", request.getParameter("ci"));
                acceso = persona_edit;

                break;

            }
            case "usuario_edit": {

                request.setAttribute("username", request.getParameter("username"));
                acceso = usuario_edit;

                break;

            }
            case "edit_organizacion": {

                String numero_org = request.getParameter("txtnumero_organizacion");
                String nombre = request.getParameter("txtnombre_organizacionnew");
                organizacion.setNumero(numero_org);
                organizacion.setNombre(nombre);
                orgdao.edit(organizacion, numero_org);
                acceso = organizacion_list;

                break;

            }
            case "edit_entidad": {
                String id_entidad = request.getParameter("txtnumero_entidad");
                String nombre = request.getParameter("txtnombre_entidadnew");
                String prefix = request.getParameter("prefix_entidadnew");
                entidad.setid_entidad(id_entidad);
                entidad.setNombre(nombre);
                entidad.setPrefix(prefix);
                entdao.edit(entidad, id_entidad);

                request.setAttribute("page", request.getParameter("page"));

                acceso = entidad_list;

                break;

            }
            case "Actualizar": {

                String cinuevo = request.getParameter("txtCinuevo");
                String ci = request.getParameter("txtCi");
                String nombre = request.getParameter("txtNombre");
                String primerapellido = request.getParameter("txtPrimerApellido");
                String segundoapellido = request.getParameter("txtSegundoApellido");
                persona.setCi(ci);
                persona.setNombre(nombre);
                persona.setPrimerApellido(primerapellido);
                persona.setSegundoApellido(segundoapellido);
                dao.edit(persona, cinuevo);
                acceso = persona_list;

                break;

            }
            case "usuario_delete": {

                String username = request.getParameter("username");
                userdao.eliminar(username);
                acceso = usuario_list;

                break;

            }
            case "persona_delete": {

                String ci = request.getParameter("ci");
                dao.eliminar(ci);
                acceso = persona_list;

                break;

            }
            case "organizacion_delete": {

                String numero = request.getParameter("numero");
                orgdao.eliminar(numero);
                acceso = organizacion_list;

                break;

            }
            case "entidad_delete": {

                String numero = request.getParameter("numero");
                entdao.eliminar(numero);
                request.setAttribute("page", request.getParameter("page"));
                acceso = entidad_list;

                break;

            }
            case "add_organizacion": {
                String nombre = request.getParameter("txtnombre_organizacion");
                organizacion.setNombre(nombre);
                orgdao.add(organizacion);
                acceso = organizacion_list;
                break;

            }
            case "add_entidad": {

                String nombre = request.getParameter("txtnombre_entidad");
                String numero_org = request.getParameter("txtnumero_organizacion");
                String prefix = request.getParameter("txtprefix_entidad");
                entidad = new Entidad();
                entidad.setNombre(nombre);
                entidad.setid_org(numero_org);
                entidad.setPrefix(prefix);
                entdao.add(entidad);

                request.setAttribute("page", request.getParameter("page"));
                acceso = entidad_list;
                break;

            }
            case "add_accion": {

                userdao = new UsuarioBean();
                Usuario user = userdao.list(request.getParameter("user"));

                //Reviso si el usuario solo tiene rol de consultor.
                if (user.getRol().equals("1")) {
                    acceso = accion_add;
                    request.setAttribute("page", request.getParameter("page"));
                    break;

                } else {

                    //creo una nueva accion.
                    accion = new Accion();
                    //Empiezo a asignarle los valores.
                    accion.setNombre(request.getParameter("nombre_accion"));
                    accion.setFecha_inicial(request.getParameter("fechainicial_accion"));
                    accion.setFecha_final(request.getParameter("fechafinal_accion"));
                    accion.setId_clasificacion(request.getParameter("clasificacion_accion"));
                    accion.setId_formaorganizativa(request.getParameter("forganizativa_accion"));
                    accion.setId_area(request.getParameter("area_accion"));
                    accion.setId_entidadejecutora(request.getParameter("entidad_accion"));
                    accion.setId_entidad(request.getParameter("entidad_p"));
                    accion.setId_modalidad(request.getParameter("modalidad_accion"));
                    accion.setExtraplan(request.getParameter("extraplan_accion") != null);

                    //Reviso si el parametro de creditos esta vacio.
                    if (request.getParameter("creditos_accion").equals("")) {
                        accion.setCreditos("0");
                    } else {
                        accion.setCreditos(request.getParameter("creditos_accion"));
                    }

                    accion.setId_evaluacionfinal(request.getParameter("evaluacion_accion"));
                    accion.setObservaciones(request.getParameter("observaciones_accion"));
                    accion.setFicha(request.getParameter("descripcion_accion"));

                    //Reviso si el usuario tiene rol de editor y si esta en su entidad.
                    if (user.getRol().equals("2") && user.getEntidad().equals(accion.getId_entidad()) || user.getRol().equals("3")) {
                        acciondao.add(accion);
                        request.setAttribute("page", request.getParameter("page"));
                        acceso = accion_add;
                        break;

                    }
                    acceso = accion_add;
                    break;
                }

            }

        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);

        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String acceso = "";
        String action = request.getParameter("accion");

        switch (action) {
            case "add_accion": {

                userdao = new UsuarioBean();
                Usuario user = userdao.list(request.getParameter("user"));

                //Reviso si el usuario solo tiene rol de consultor.
                if (user.getRol().equals("1")) {
                    acceso = accion_add;
                    request.setAttribute("page", request.getParameter("page"));
                    break;

                } else {

                    //creo una nueva accion.
                    accion = new Accion();
                    //Empiezo a asignarle los valores.
                    accion.setNombre(request.getParameter("nombre_accion"));
                    accion.setFecha_inicial(request.getParameter("fechainicial_accion"));
                    accion.setFecha_final(request.getParameter("fechafinal_accion"));
                    accion.setId_clasificacion(request.getParameter("clasificacion_accion"));
                    accion.setId_formaorganizativa(request.getParameter("forganizativa_accion"));
                    accion.setId_area(request.getParameter("area_accion"));
                    accion.setId_entidadejecutora(request.getParameter("entidad_accion"));
                    accion.setId_entidad(request.getParameter("entidad_p"));
                    accion.setId_modalidad(request.getParameter("modalidad_accion"));
                    accion.setExtraplan(request.getParameter("extraplan_accion") != null);

                    //Reviso si el parametro de creditos esta vacio.
                    if (request.getParameter("creditos_accion").equals("")) {
                        accion.setCreditos("0");
                    } else {
                        accion.setCreditos(request.getParameter("creditos_accion"));
                    }

                    accion.setId_evaluacionfinal(request.getParameter("evaluacion_accion"));
                    accion.setObservaciones(request.getParameter("observaciones_accion"));
                    accion.setFicha(request.getParameter("descripcion_accion"));

                    //Reviso si el usuario tiene rol de editor y si esta en su entidad.
                    if (user.getRol().equals("2") && user.getEntidad().equals(accion.getId_entidad()) || user.getRol().equals("3")) {
                        acciondao.add(accion);
                        request.setAttribute("page", request.getParameter("page"));
                        acceso = accion_add;
                        break;

                    }
                    acceso = accion_add;
                    break;
                }

            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
