

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import reservation.ReservationDAO;


public class ConditionUpdate extends HttpServlet {

   protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      
      ReservationDAO rdao = new ReservationDAO();
      int condition = Integer.parseInt(req.getParameter("condition"));
      int num = Integer.parseInt(req.getParameter("num"));
      
      res.setContentType("text/html;charset=UTF-8");
      PrintWriter out = res.getWriter();
      req.setCharacterEncoding("UTF-8");
      
      int rs = rdao.update(condition, num);
      out.print(rs);

   }


   protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

      doGet(req, res);
   }

}