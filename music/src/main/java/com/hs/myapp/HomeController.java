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
	public String insert(String id, String pw, String name) {
		// 실제로 DB에 넣는 코드 = dao 실행
		memberDao.insert(new MemberBean(id, pw, name));
		return "redirect:main";
	}

	@RequestMapping("/memberList")
	public String memberList(@RequestParam(value = "pageNum", required = false, defaultValue = "1") String strNum,
			Model model) {
		int pageNum = Integer.parseInt(strNum);
		// 페이지 번호 - 문자로 넘어오기 때문에 숫자로 바꿈

		int memberPerPage = 10; // 한화면에 나올 리스트 수

		int firstList = (pageNum - 1) * memberPerPage; // limit 첫 숫자
		int start = ((pageNum - 1) / memberPerPage) * memberPerPage + 1; // 시작 페이지
		int prevPage = start / 10 * 10; // 이전 버튼
		int end = start + memberPerPage - 1; // 끝 페이지
		int nextPage = start + 10; // 이전 버튼

		ArrayList<MemberBean> al = memberDao.getList(firstList, memberPerPage);
		int count = memberDao.getCount(); // 전체 개수
		int pageCount = count / memberPerPage; // 페이지 개수

		// 전체 개수를 한 화면에 나올 갯수로 나눠서
		// 나머지가 있다면 1을 더 추가한다.
		if (count % memberPerPage > 0) {
			pageCount++;
		}

		// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
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
		System.out.println(count);
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
			System.out.println("로그인완료");
			return "redirect:main";
		} catch (Exception e) {
			System.out.println("실패");
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
		// 실제로 삭제되는 코드 = dao 실행
		memberDao.delete(id);
		return "memberDelete";
	}

	@RequestMapping("/goFreeWrite")
	public String freeInsert() {
		return "freeWrite";
	}

	@RequestMapping("/freeWrite")
	public String freeInsert(String userId, String title, String contents) {
		// 실제로 DB에 넣는 코드 = dao 실행
		fbDao.insert(new FBBean(userId, title, contents));
		return "redirect:freeBoard";
	}
	
	@RequestMapping("/freeBoard")
	public String freeList(@RequestParam(value = "pageNum", required = false, defaultValue = "1") String strNum,
			Model model) {
		int pageNum = Integer.parseInt(strNum);
		// 페이지 번호 - 문자로 넘어오기 때문에 숫자로 바꿈

		int boardPerPage = 10; // 한화면에 나올 리스트 수

		int firstList = (pageNum - 1) * boardPerPage; // limit 첫 숫자
		int start = ((pageNum - 1) / boardPerPage) * boardPerPage + 1; // 시작 페이지
		int prevPage = start / 10 * 10; // 이전 버튼
		int end = start + boardPerPage - 1; // 끝 페이지
		int nextPage = start + 10; // 이전 버튼

		ArrayList<FBBean> al = fbDao.getList(firstList, boardPerPage);
		int count = fbDao.getCount(); // 전체 개수
		int pageCount = count / boardPerPage; // 페이지 개수

		// 전체 개수를 한 화면에 나올 갯수로 나눠서
		// 나머지가 있다면 1을 더 추가한다.
		if (count % boardPerPage > 0) {
			pageCount++;
		}

		// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
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
	public String freeget(int idx, Model model) {
		// 리스트에서 글을 클릭하면 idx를 받아서
		// 실제 화면에 그 idx에 맞는 글을 출력함
		// 이후 그글을 수정한 후 다음페이지로 넘겨서
		// 업데이트 할 예정임으로 값을 넘기기 위해서
		// model 이 필요함.
		// dao실행해서 가져온 값을 model에 담는 작업 필요
		model.addAttribute("get", fbDao.get(idx));
		return "freeDetail";
	}

}
