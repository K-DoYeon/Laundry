

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import user.UserDAO;


public class LevelUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		UserDAO udao = new UserDAO();
		int level = Integer.parseInt(req.getParameter("level"));
		int num = Integer.parseInt(req.getParameter("num"));
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		
		int rs = udao.update(level, num);
		out.print(rs);

	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

}