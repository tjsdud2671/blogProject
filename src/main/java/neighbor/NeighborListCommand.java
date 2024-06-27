package neighbor;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NeighborListCommand implements NeighborInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NeighborDAO dao = new NeighborDAO();
		ArrayList<NeighborVO> vos = dao.getNeighborList();
		
		request.setAttribute("nVos", vos);
	}

}
