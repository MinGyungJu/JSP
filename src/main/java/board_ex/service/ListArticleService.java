package board_ex.service;

import java.util.List;

import board_ex.model.*;
import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

public class ListArticleService {
	
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListArticleService instance;
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	

	
	public List <BoardVO> getArticleList (String pNum) throws BoardException
	{
		// 전체 레코드를 검색해 온다면
		int pageNum = 1;
		if(pNum !=null) pageNum = Integer.parseInt(pNum);
		
		/*		 페이지번호		시작레코드 번호		끝레코드번호
		 * 			1			1				3
		 * 			2			4				6
		 * 			3			7				9
		 * 			4			10				12
		 */
		int startRow = pageNum*countPerPage-2;
		int endRow = pageNum*countPerPage ;

		List <BoardVO> mList = BoardDao.getInstance().selectList(startRow, endRow);			
		return mList;
	}
	public int getTotalPage() throws BoardException
	{
		// 전체레코드 수
		totalRecCount = BoardDao.getInstance().getTotalCount();
		/*
		 * 전체 레코드수		페이지수
		 *    9			 	  3
		 *    10			  4
		 *    11			  4
		 *    12			  4
		 *    13			  5
		 */
		pageTotalCount = (int)Math.ceil(totalRecCount/3.0);
//		pageTotalCount = totalRecCount / countPerPage;
//		if(totalRecCount % countPerPage >0)pageTotalCount++;
		return pageTotalCount; // 페이지 수 리턴
	}
		
}
