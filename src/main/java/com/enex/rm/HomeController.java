package com.enex.rm;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.enex.rm.com.service.ComService;
import com.enex.rm.modal.model.TRM10;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Resource
	private ComService comservice;
	
	@RequestMapping("/")
	public ModelAndView startdView(ModelAndView mv) throws Exception{
		mv.setViewName("login");
		return mv;
	}
	
	
	@RequestMapping("loginPage.do")
	public ModelAndView loginPage(ModelAndView mv) throws Exception{
		mv.setViewName("login");
		return mv;
	} 
	
	@RequestMapping("adminMain.do")
	public ModelAndView DashBoardView(ModelAndView mv) throws Exception{
		mv.setViewName("main/main001.tiles");
		return mv;
	}
	
	@RequestMapping("hwm001.do")
	public ModelAndView hwResourceRegister(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm001.tiles");
		return mv;
	} 
	
	@RequestMapping("hwm002.do")
	public ModelAndView hwMoveHistoryRegister(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm002.tiles");
		return mv;
	} 
	
	@RequestMapping("hwm003.do")
	public ModelAndView manageAgencyRegister(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm003.tiles");
		return mv;
	} 
	
	@RequestMapping("hwm004.do")
	public ModelAndView discardHwRegister(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm004.tiles");
		return mv;
	}
	
	@RequestMapping("hwm005.do")
	public ModelAndView orgMovingHW(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm005.tiles");
		return mv;
	}
	
	@RequestMapping("com001.do")
	public ModelAndView codeManagement(ModelAndView mv) throws Exception{
		mv.setViewName("com/com001.tiles");
		return mv;
	}
	
	@RequestMapping("com002.do")
	public ModelAndView agencyManagement(ModelAndView mv) throws Exception{
		mv.setViewName("com/com002.tiles");
		return mv;
	}
	
	@RequestMapping("com003.do")
	public ModelAndView orgManagement(ModelAndView mv) throws Exception{
		mv.setViewName("com/com003.tiles");
		return mv;
	}
	
	@RequestMapping("hwm101.do")
	public ModelAndView searchHWList(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm101.tiles");
		return mv;
	} 
	
	@RequestMapping("hwm102.do")
	public ModelAndView searchHwMoveingList(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm102.tiles");
		return mv;
	} 
	
	@RequestMapping("hwm103.do")
	public ModelAndView searchTagetList(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm103.tiles");
		return mv;
	} 
	
	@RequestMapping("hwm104.do")
	public ModelAndView searchHwDiscardList(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm104.tiles");
		return mv;
	}
	
	@RequestMapping("hwm105.do")
	public ModelAndView HwDiscardListDetail(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm105.tiles");
		return mv;
	}
	
	@RequestMapping("hwm106.do")
	public ModelAndView searchDepartmentalAssets(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm106.tiles");
		return mv;
	} 
	
	@RequestMapping("hwm107.do")
	public ModelAndView searchAnnualAssets(ModelAndView mv) throws Exception{
		mv.setViewName("hwm/hwm107.tiles");
		return mv;
	} 
	
	@RequestMapping("login.do")
	public String loginAccount(ModelAndView mv ,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		TRM10 trm10 = new TRM10();
		String ID = request.getParameter("loginID");
		String PW = request.getParameter("loginPasswd");
		
		if(ID.equals(PW)) {
			trm10 = comservice.loginAccount(ID);
			if(trm10 != null) {
				HttpSession session = request.getSession();
				session.setAttribute("usrID", trm10.getEmpCode());
				session.setAttribute("usrName", trm10.getEmpName());
				session.setAttribute("usrDepCode", trm10.getDepCode1());
				session.setAttribute("usrDepName", trm10.getDepName1());
				
				if(("50000059").equals(trm10.getDepCode1())) {
					return "redirect:adminMain.do";
				}else {
					return "redirect:main.do";
				}
				
			}else {
				return "redirect:loginPage.do";
			}
		}else {
			return "redirect:loginPage.do";
		}

	} 
	
	@RequestMapping("logout.do")
	public ModelAndView logout(ModelAndView mv,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		mv.setViewName("login");
		return mv;
	} 

	@RequestMapping("swm001.do")
	public ModelAndView purchaseSwLicence(ModelAndView mv) throws Exception{
		mv.setViewName("swm/swm001.tiles");
		return mv;
	}
	
	@RequestMapping("swm002.do")
	public ModelAndView swResourceRegister(ModelAndView mv) throws Exception{
		mv.setViewName("swm/swm002.tiles");
		return mv;
	}
	
	@RequestMapping("swm003.do")
	public ModelAndView swResourceRegisterEtc(ModelAndView mv) throws Exception{
		mv.setViewName("swm/swm003.tiles");
		return mv;
	}
	
	@RequestMapping("swm004.do")
	public ModelAndView swResourceRegisterHW(ModelAndView mv) throws Exception{
		mv.setViewName("swm/swm004.tiles");
		return mv;
	}
	
	@RequestMapping("swm101.do")
	public ModelAndView swPurchaseHistory(ModelAndView mv) throws Exception{
		mv.setViewName("swm/swm101.tiles");
		return mv;
	}
	
	@RequestMapping("swm102.do")
	public ModelAndView swActiveCountList(ModelAndView mv) throws Exception{
		mv.setViewName("swm/swm102.tiles");
		return mv;
	}

	@RequestMapping("swm103.do")
	public ModelAndView swManagementRegister(ModelAndView mv) throws Exception{
		mv.setViewName("swm/swm103.tiles");
		return mv;
	}
	
	@RequestMapping("swm104.do")
	public ModelAndView swDepMemberList(ModelAndView mv) throws Exception{
		mv.setViewName("swm/swm104.tiles");
		return mv;
	}
	
	@RequestMapping("swm105.do")
	public ModelAndView swDistributionStatus(ModelAndView mv) throws Exception{
		mv.setViewName("swm/swm105.tiles");
		return mv;
	}
	
	@RequestMapping("tot101.do")
	public ModelAndView totUsrDistributionStatus(ModelAndView mv) throws Exception{
		mv.setViewName("tot/tot101.tiles");
		return mv;
	}
	
	@RequestMapping("tot102.do")
	public ModelAndView retiredEmpManagement(ModelAndView mv) throws Exception{
		mv.setViewName("tot/tot102.tiles");
		return mv;
	}
	
	@RequestMapping("tot103.do")
	public ModelAndView resourceRecovery(ModelAndView mv) throws Exception{
		mv.setViewName("tot/tot103.tiles");
		return mv;
	}
	
	@RequestMapping("main.do")
	public ModelAndView usrMainView(ModelAndView mv) throws Exception{
		mv.setViewName("main/main002.tiles");
		return mv;
	}
	
	@RequestMapping("usr001.do")
	public ModelAndView usrDepHwInfo(ModelAndView mv) throws Exception{
		mv.setViewName("usr/usr001.tiles");
		return mv;
	} 
	
	@RequestMapping("usr002.do")
	public ModelAndView usrDepSwInfo(ModelAndView mv) throws Exception{
		mv.setViewName("usr/usr002.tiles");
		return mv;
	} 
}
