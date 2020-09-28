package com.hs.myapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
	@Autowired
	private FBDao fbDao;

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
	public String insert(String id, String pw, String name, int day, String calendar, String gen, String email1,
			String email2, int tel) {
		// ������ DB�� �ִ� �ڵ� = dao ����
		memberDao.insert(new MemberBean(id, pw, name, day, calendar, gen, email1, email2, tel));
		return "redirect:main";
	}

	@RequestMapping("Ajaxtmpok")
	public void Ajaxtmpok(String id, boolean result, HttpServletResponse res) {
		result = memberDao.idCheck(id);
		PrintWriter out;
		try {
			String str = "����Ҽ� ���� ���̵� �Դϴ�.";
			if (id.length() > 5) {
				if (!result) {
					str = "����� �� �ִ� ���̵� �Դϴ�.";
				}
			} else {
				str = "���̵�� 5�ڸ� �̻����� �ۼ� �ϼž��մϴ�";
			}
			out = res.getWriter();
			JSONObject json = new JSONObject();
			json.put("result", str);
			out.println(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("/memberList")
	public String memberList(@RequestParam(value = "pageNum", required = false, defaultValue = "1") String strNum,
			Model model) {
		int pageNum = Integer.parseInt(strNum);
		// ������ ��ȣ - ���ڷ� �Ѿ���� ������ ���ڷ� �ٲ�

		int memberPerPage = 10; // ��ȭ�鿡 ���� ����Ʈ ��

		int firstList = (pageNum - 1) * memberPerPage; // limit ù ����
		int start = ((pageNum - 1) / memberPerPage) * memberPerPage + 1; // ���� ������
		int prevPage = start / 10 * 10; // ���� ��ư
		int end = start + memberPerPage - 1; // �� ������
		int nextPage = start + 10; // ���� ��ư

		ArrayList<MemberBean> al = memberDao.getList(firstList, memberPerPage);
		int count = memberDao.getCount(); // ��ü ����
		int pageCount = count / memberPerPage; // ������ ����

		// ��ü ������ �� ȭ�鿡 ���� ������ ������
		// �������� �ִٸ� 1�� �� �߰��Ѵ�.
		if (count % memberPerPage > 0) {
			pageCount++;
		}

		// ������ �������� �� ������ �� ���� ũ�� endPage�� pageCount�� �Ҵ�
		if (end > pageCount) {
			end = pageCount;
		}

		model.addAttribute("nextPage", nextPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("count", count);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("list", al);
		return "memberList";
	}

	@RequestMapping("/goLogin")
	public String login() {
		return "login";
	}

	@RequestMapping("/login")
	public String login(String id, String pw, HttpSession session) {
		try {
			memberDao.login(id, pw);
			session.setAttribute("loginid", id);
			System.out.println("�α��οϷ�");
			return "redirect:main";
		} catch (Exception e) {
			System.out.println("����");
			return "redirect:goLogin";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
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
	public String memberDelete(String id, HttpSession session) {
		// ������ �����Ǵ� �ڵ� = dao ����
		memberDao.delete(id);
		session.invalidate();
		return "memberDelete";
	}

	@RequestMapping("/goFreeWrite")
	public String freeInsert() {
		return "freeWrite";
	}

	@RequestMapping("/freeWrite")
	public String freeInsert(String userId, String title, String contents) {
		// ������ DB�� �ִ� �ڵ� = dao ����
		fbDao.insert(new FBBean(userId, title, contents));
		return "redirect:freeBoard";
	}

	@RequestMapping("/freeBoard")
	public String freeList(@RequestParam(value = "pageNum", required = false, defaultValue = "1") String strNum,
			Model model) {
		int pageNum = Integer.parseInt(strNum);
		// ������ ��ȣ - ���ڷ� �Ѿ���� ������ ���ڷ� �ٲ�

		int boardPerPage = 10; // ��ȭ�鿡 ���� ����Ʈ ��

		int firstList = (pageNum - 1) * boardPerPage; // limit ù ����
		int start = ((pageNum - 1) / boardPerPage) * boardPerPage + 1; // ���� ������
		int prevPage = start / 10 * 10; // ���� ��ư
		int end = start + boardPerPage - 1; // �� ������
		int nextPage = start + 10; // ���� ��ư

		ArrayList<FBBean> al = fbDao.getList(firstList, boardPerPage);
		int count = fbDao.getCount(); // ��ü ����
		int pageCount = count / boardPerPage; // ������ ����

		// ��ü ������ �� ȭ�鿡 ���� ������ ������
		// �������� �ִٸ� 1�� �� �߰��Ѵ�.
		if (count % boardPerPage > 0) {
			pageCount++;
		}

		// ������ �������� �� ������ �� ���� ũ�� endPage�� pageCount�� �Ҵ�
		if (end > pageCount) {
			end = pageCount;
		}

		model.addAttribute("nextPage", nextPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("count", count);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("list", al);
		return "freeBoard";
	}

	@RequestMapping("/freeDetail")
	public String freeDetail(int idx, Model model) {
		// ����Ʈ���� ���� Ŭ���ϸ� idx�� �޾Ƽ�
		// ���� ȭ�鿡 �� idx�� �´� ���� �����
		// ���� �ױ��� ������ �� ������������ �Ѱܼ�
		// ������Ʈ �� ���������� ���� �ѱ�� ���ؼ�
		// model �� �ʿ���.
		// dao�����ؼ� ������ ���� model�� ��� �۾� �ʿ�
		model.addAttribute("get", fbDao.get(idx));
		return "freeDetail";
	}

	@RequestMapping("/freeGet")
	public String freeget(int idx, Model model) {
		// ����Ʈ���� ���� Ŭ���ϸ� idx�� �޾Ƽ�
		// ���� ȭ�鿡 �� idx�� �´� ���� �����
		// ���� �ױ��� ������ �� ������������ �Ѱܼ�
		// ������Ʈ �� ���������� ���� �ѱ�� ���ؼ�
		// model �� �ʿ���.
		// dao�����ؼ� ������ ���� model�� ��� �۾� �ʿ�
		model.addAttribute("get", fbDao.get(idx));
		return "freeUpdate";
	}

	@RequestMapping("/freeUpdate")
	public String freeUpdate(FBBean fbBean) {
		fbDao.update(fbBean);
		return "redirect:freeBoard";
	}

	@RequestMapping("/freeDelete")
	public String freeDelete(int idx) {
		// ������ �����Ǵ� �ڵ� = dao ����
		fbDao.delete(idx);
		return "freeDelete";
	}

}
