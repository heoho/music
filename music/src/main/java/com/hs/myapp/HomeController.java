package com.hs.myapp;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberDao memberDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "main";
	}

	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	@RequestMapping("/goMember")
	public String insert() {
		return "member";
	}

	@RequestMapping("/member")
	public String insert(String id, String pw, String name) {
		// ������ DB�� �ִ� �ڵ� = dao ����
		memberDao.insert(new MemberBean(id, pw, name));
		return "redirect:main";
	}

	@RequestMapping("/memberList")
	public String memberList(@RequestParam(value = "pageNum", required = false, defaultValue = "1") String strNum, Model model) {
		int pageNum = Integer.parseInt(strNum);
		// ������ ��ȣ - ���ڷ� �Ѿ���� ������ ���ڷ� �ٲ�

		int memberPerPage = 10; // ��ȭ�鿡 ���� ����Ʈ ��

		int start = ((pageNum - 1)/memberPerPage)*memberPerPage+1; // ���� ������
		int prevPage = start/10*10; // ���� ��ư
		int end = start + memberPerPage - 1; // �� ������
		int nextPage = start+10; // ���� ��ư

		ArrayList<MemberBean> al = memberDao.getList(start, memberPerPage);
		int count = memberDao.getCount(); // ��ü ����
		int pageCount = count / memberPerPage; // ������ ����

		// ��ü ������ �� ȭ�鿡 ���� ������ ������
		// �������� �ִٸ� 1�� �� �߰��Ѵ�.
		if (count % memberPerPage > 0) {	
			pageCount++;
		}

		// ������ �������� �� ������ �� ���� ũ�� endPage�� pageCount�� �Ҵ�
		if(end > pageCount){
			end = pageCount;
		}
		
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("count", count);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageNum", pageNum);
		System.out.println(count);
		model.addAttribute("list", al);
		return "memberList";
	}

	@RequestMapping("/goLogin")
	public String login() {
		return "login";
	}

	@RequestMapping("/login")
	public String login(String id, String pw, Model model, HttpServletRequest request) {
		try {
			model.addAttribute("login", memberDao.login(id, pw));
			HttpSession session = request.getSession();

			session.setAttribute("loginid", id);
			System.out.println("�α��οϷ�");
			return "redirect:main";
		} catch (Exception e) {
			System.out.println("����");
			return "redirect:goLogin";
		}
	}

	@RequestMapping("/logout")
	public String logout() {
		return "logout";
	}

	@RequestMapping("/getMember")
	public String get(String id, Model model) {
		model.addAttribute("get", memberDao.get(id));
		return "memberUpdate";
	}

	@RequestMapping("/memberUpdate")
	public String memberUpdate(MemberBean memberBean) {
		memberDao.update(memberBean);
		return "redirect:main";
	}
	
	@RequestMapping("/memberDelete")
	public String memberDelete(String id) {
		// ������ �����Ǵ� �ڵ� = dao ����
		memberDao.delete(id);
		return "memberDelete";
	}

}
