/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloBean;

import Config.Conexion;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import java.sql.Date;

/**
 *
 * @author David Sean
 */
public class LoginBean {

    Usuario usuario;
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    DirContext connection;
    String url;
    Properties env;

    public LoginBean() {

        this.env = new Properties();
        this.url = "das02.cimex.com.cu";
        String user = "adminsitios@cimex.com.cu";
        String password = "Narutob8o9h";

        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        env.put(Context.PROVIDER_URL, "ldap://" + url);
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        env.put(Context.SECURITY_PRINCIPAL, user);
        env.put(Context.SECURITY_CREDENTIALS, password);

    }

    public boolean login(String user, String clave) {
        String sql = "select * from usuarioapp where username='" + user + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String clavebd = rs.getString("contra");
                if (clavebd.equals(clave)) {
                    return true;
                }

            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean authuser(String username, String password) {
        try {
            Properties env = new Properties();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
            env.put(Context.PROVIDER_URL, "ldap://" + url);
            env.put(Context.SECURITY_AUTHENTICATION, "simple");
            String user = searchuserPrincipalName(username);

            //Reviso si el usuario existe.
            if (user.equals("")) {
                return false;

            }
            env.put(Context.SECURITY_PRINCIPAL, user);
            env.put(Context.SECURITY_CREDENTIALS, password);
            DirContext con = new InitialDirContext(env);
            con.close();
            UsuarioBean aux = new UsuarioBean();
            aux.add(usuario);
            aux.update(usuario, username);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private String searchuserPrincipalName(String username) throws NamingException {
        String userPrincipalName = "";
        connection = new InitialDirContext(env);
        String searchFilter = "(sAMAccountName=" + username + ")";
        String[] reqAtt = {"userPrincipalName", "distinguishedName"};
        SearchControls controls = new SearchControls();
        controls.setSearchScope(SearchControls.SUBTREE_SCOPE);
        controls.setReturningAttributes(reqAtt);

        NamingEnumeration users = connection.search("OU=Domain Users,DC=cimex,DC=com,DC=cu", searchFilter, controls);

        SearchResult result = null;
        if (users.hasMore()) {
            result = (SearchResult) users.next();
            Attributes attr = result.getAttributes();
            String aux = attr.get("userPrincipalName").toString();
            userPrincipalName = aux.substring(19, aux.length());

            String prefix = "";
            String distinguishedName = attr.get("distinguishedName").toString();

            for (int i = 0; i < distinguishedName.length(); i++) {
                char c = distinguishedName.charAt(i);
                if (c == ',') {
                    prefix = distinguishedName.substring(i + 4, i + 6);
                    break;
                }
            }

            long millis = System.currentTimeMillis();
            Date date = new java.sql.Date(millis);

            usuario = new Usuario(username, new EntidadBean().searchprefix(prefix), "1", date.toString(), date.toString());

        }

        connection.close();
        return userPrincipalName;
    }

    private void registeruser(String username) {
        String sql = "select * from usuarioapp where username='" + username + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                sql = "UPDATE usuarioapp SET `last_date`='" + username + "'" + "WHERE username='" + username + "'";
            }
        } catch (Exception e) {
        }
    }

}
