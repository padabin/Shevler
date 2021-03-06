/*=======================
   TipArticleDAO
=======================*/

package com.test.mvc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class TipArticleDAO implements IArticleDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public int getArticleMaxNum() throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT NVL(MAX(BNO),0) AS MAXIMUM FROM ARTICLE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("MAXIMUM");
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int articleAdd(ArticleDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "INSERT INTO ARTICLE(BNO, ARTICLE_CODE, BOARD_TYPE_CODE, MEMBER_CODE"
				+ ", ARTICLE_TITLE, ARTICLE_DATE, ARTICLE_LIKE, ARTICLE_CONTENT"
				+ ", ARTICLE_HIT, ARTICLE_NOTICE)"
				+ " VALUES(TIPSEQ.NEXTVAL,'A' || ARTICLE_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?, 0, 1)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getBoardTypeCode());
		pstmt.setString(2, dto.getMemberCode());
		pstmt.setString(3, dto.getArticleTitle());
		pstmt.setString(4, dto.getArticleContent());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int getDataCount() throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM TIPARTICLEVIEW";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public ArrayList<ArticleDTO> Lists(int start, int end) throws SQLException
	{
		ArrayList<ArticleDTO> result = new ArrayList<ArticleDTO>();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT BNO,ARTICLECODE, MEMBERID, ARTICLETITLE"
				+ ", ARTICLEDATE, ARTICLEHIT, ARTICLELIKE, ARTICLENOTICE"
				+ " FROM"
				+ " ("
				+ " SELECT ROWNUM RNUM, DATA.*"
				+ " FROM"
				+ " ("
				+ " SELECT BNO, ARTICLECODE, MEMBERID, MEMBERNAME"
				+ ", ARTICLETITLE, ARTICLECONTENT, ARTICLEDATE, ARTICLEHIT"
				+ ", ARTICLELIKE, ARTICLENOTICE"
				+ " FROM TIPARTICLEVIEW"
				+ " ORDER BY BNO DESC"
				+ " ) DATA"
				+ " ) WHERE RNUM >= ? AND RNUM <= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			ArticleDTO dto = new ArticleDTO();
			
			dto.setBno(rs.getInt("BNO"));
			dto.setArticleCode(rs.getString("ARTICLECODE"));
			dto.setMemberId(rs.getString("MEMBERID"));
			dto.setArticleTitle(rs.getString("ARTICLETITLE"));
			dto.setArticleDate(rs.getString("ARTICLEDATE"));
			dto.setArticleHit(rs.getInt("ARTICLEHIT"));
			dto.setArticleLike(rs.getInt("ARTICLELIKE"));
			dto.setArticleNotice(rs.getString("ARTICLENOTICE"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int updateHitCount(String articleCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE ARTICLE"
				+ " SET ARTICLE_HIT = ARTICLE_HIT + 1"
				+ " WHERE ARTICLE_CODE= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCode);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public ArticleDTO getReadDate(int bno) throws SQLException
	{
		ArticleDTO result = new ArticleDTO();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT BNO, ARTICLECODE"
				+ ", MEMBERID, MEMBERNAME, ARTICLETITLE, ARTICLECONTENT"
				+ ", ARTICLEHIT, ARTICLELIKE, ARTICLEDATE"
				+ " FROM TIPARTICLEVIEW"
				+ " WHERE BNO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setBno(rs.getInt("BNO"));
			result.setMemberId(rs.getString("MEMBERID"));
			result.setMemberName(rs.getString("MEMBERNAME"));
			result.setArticleTitle(rs.getString("ARTICLETITLE"));
			result.setArticleContent(rs.getString("ARTICLECONTENT"));
			result.setArticleHit(rs.getInt("ARTICLEHIT"));
			result.setArticleLike(rs.getInt("ARTICLELIKE"));
			result.setArticleDate(rs.getString("ARTICLEDATE"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int deleteData(String articleCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "DELETE FROM ARTICLE WHERE ARTICLE_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCode);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int updateData(ArticleDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE ARTICLE"
				+ " SET ARTICLE_TITLE=?, ARTICLE_CONTENT=?"
				+ " WHERE ARTICLE_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getArticleTitle());
		pstmt.setString(2, dto.getArticleContent());
		pstmt.setString(3, dto.getArticleCode());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int getNextNum(int num) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT NVL(MIN(BNO),-1) AS NEXTNUM"
				+ " FROM TIPARTICLEVIEW"
				+ " WHERE BNO>?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
			result = rs.getInt("NEXTNUM");
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int getBeforeNum(int num) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT NVL(MAX(BNO),-1) AS BEFORENUM"
				+ " FROM TIPARTICLEVIEW"
				+ " WHERE BNO<?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("BEFORENUM");
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// ?????? ?????? ??????
	@Override
	public ArrayList<ArticleDTO> searchList(int start, int end, String searchKey, String searchValue) throws SQLException
	{
		ArrayList<ArticleDTO> result = new ArrayList<ArticleDTO>();
		
		searchValue = "%" + searchValue + "%";
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT BNO,ARTICLECODE, MEMBERID, ARTICLETITLE"
				+ ", ARTICLEDATE, ARTICLEHIT, ARTICLELIKE, ARTICLENOTICE"
				+ " FROM"
				+ " ("
				+ " SELECT ROWNUM RNUM, DATA.*"
				+ " FROM"
				+ " ("
				+ " SELECT BNO, ARTICLECODE, MEMBERID, MEMBERNAME, ARTICLETITLE"
				+ ", ARTICLECONTENT, ARTICLEDATE, ARTICLEHIT, ARTICLELIKE, ARTICLENOTICE"
				+ " FROM TIPARTICLEVIEW"
				+ " WHERE " + searchKey + " LIKE ?"
				+ " ORDER BY BNO DESC"
				+ " ) DATA"
				+ " ) WHERE RNUM >= ? AND RNUM <= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			ArticleDTO dto = new ArticleDTO();
			
			dto.setBno(rs.getInt("BNO"));
			dto.setArticleCode(rs.getString("ARTICLECODE"));
			dto.setMemberId(rs.getString("MEMBERID"));
			dto.setArticleTitle(rs.getString("ARTICLETITLE"));
			dto.setArticleDate(rs.getString("ARTICLEDATE"));
			dto.setArticleHit(rs.getInt("ARTICLEHIT"));
			dto.setArticleLike(rs.getInt("ARTICLELIKE"));
			dto.setArticleNotice(rs.getString("ARTICLENOTICE"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// ?????? ??? ???????????? ?????? ?????????
	@Override
	public int getSearchDataCount(String searchKey, String searchValue) throws SQLException
	{
		int result = 0;
		
		searchValue = "%" + searchValue + "%";
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM TIPARTICLEVIEW"
				+ " WHERE " + searchKey + " LIKE ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ??? ?????? + article_likes ???????????? ????????? ??????
	@Override
	public int updateAddLikeCount(String articleCode, String memberCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "call PRC_LIKE_INSERT(?, ?)";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, memberCode);
		cstmt.setString(2, articleCode);
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		conn.close();
		
		return result;
	}
	
	// ????????? ??????
	@Override
	public int getLikeCount(String articleCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT ARTICLELIKE"
				+ " FROM TIPARTICLEVIEW"
				+ " WHERE ARTICLECODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCode);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("ARTICLELIKE");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ???????????? ????????? ?????? ????????? CHECK?????? ?????????
	@Override
	public int getLikedBeforeCount(String articleCode, String memberCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM ARTICLE_LIKES"
				+ " WHERE ARTICLE_CODE = ?'"
				+ " AND MEMBER_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCode);
		pstmt.setString(2, memberCode);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ??????
	@Override
	public ArrayList<ArticleDTO> commentLists(String articleCode) throws SQLException
	{
		ArrayList<ArticleDTO> result = new ArrayList<ArticleDTO>();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT ARTICLECOMMENTCODE, ARTICLECODE, COMMENTMEMBERCODE"
				+ ", MEMBERID, ARTICLECOMMENTCONTENT, ARTICLECOMMENTDATE"
				+ " FROM"
				+ " ("
				+ " SELECT ROWNUM RNUM, DATA.*"
				+ " FROM"
				+ " ("
				+ " SELECT ARTICLECOMMENTCODE, ARTICLECODE, COMMENTMEMBERCODE"
				+ ", MEMBERID, ARTICLECOMMENTCONTENT, ARTICLECOMMENTDATE"
				+ " FROM TIPCOMMENTVIEW"
				+ " WHERE ARTICLECODE = ?"
				+ " ORDER BY ARTICLECOMMENTDATE DESC"
				+ " ) DATA"
				+ " )";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCode);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			ArticleDTO dto = new ArticleDTO();
			
			dto.setArticleCommentCode(rs.getString("ARTICLECOMMENTCODE"));
			dto.setArticleCode(rs.getString("ARTICLECODE"));
			dto.setCommentMemberCode(rs.getString("COMMENTMEMBERCODE"));
			dto.setMemberId(rs.getString("MEMBERID"));
			dto.setArticleCommentContent(rs.getString("ARTICLECOMMENTCONTENT"));
			dto.setArticleCommentDate(rs.getString("ARTICLECOMMENTDATE"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ???????????? ?????? ??? ??????
	@Override
	public int getCommentCount(String articleCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM TIPCOMMENTVIEW"
				+ " WHERE ARTICLECODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCode);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ????????? ?????? ??????
	@Override
	public int writeComment(ArticleDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "INSERT INTO ARTICLE_COMMENT(ARTICLE_COMMENT_CODE, ARTICLE_CODE"
				+ ", MEMBER_CODE, ARTICLE_COMMENT_CONTENT, ARTICLE_COMMENT_DATE)"
				+ " VALUES( 'AC' || ARTICLE_COMMENT_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getArticleCode());
		pstmt.setString(2, dto.getCommentMemberCode());
		pstmt.setString(3, dto.getArticleCommentContent());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ???????????? ?????? ??????
	@Override
	public int updateComment(ArticleDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE ARTICLE_COMMENT"
				+ " SET ARTICLE_COMMENT_CONTENT = ?"
				+ " WHERE ARTICLE_COMMENT_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getArticleCommentContent());
		pstmt.setString(2, dto.getArticleCommentCode());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// ?????? ???????????? ?????? ??????
	@Override
	public int deleteComment(String articleCommentCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "DELETE FROM ARTICLE_COMMENT"
				+ " WHERE ARTICLE_COMMENT_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCommentCode);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ?????? ????????? ??????
	@Override
	public ArrayList<ArticleDTO> memberArticleLists(int start, int end, String memberId) throws SQLException
	{
		ArrayList<ArticleDTO> result = new ArrayList<ArticleDTO>();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT BNO,ARTICLECODE, MEMBERID, BOARDTYPEDETAIL, ARTICLETITLE"
				+ ", ARTICLEDATE, ARTICLEHIT, ARTICLELIKE, ARTICLENOTICE"
				+ " FROM"
				+ " ("
				+ " SELECT ROWNUM RNUM, DATA.*"
				+ " FROM"
				+ " ("
				+ " SELECT BNO, ARTICLECODE, MEMBERID, MEMBERNAME, BOARDTYPEDETAIL"
				+ ", ARTICLETITLE, ARTICLECONTENT, ARTICLEDATE, ARTICLEHIT, ARTICLELIKE, ARTICLENOTICE"
				+ " FROM ARTICLEVIEW"
				+ " WHERE MEMBERID = ?"
				+ " ORDER BY BNO DESC"
				+ " ) DATA"
				+ " ) WHERE RNUM >=? AND RNUM <= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberId);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			ArticleDTO dto = new ArticleDTO();
			
			dto.setBno(rs.getInt("BNO"));
			dto.setArticleCode(rs.getString("ARTICLECODE"));
			dto.setMemberId(rs.getString("MEMBERID"));
			dto.setBoardTypeDetail(rs.getString("BOARDTYPEDETAIL"));
			dto.setArticleTitle(rs.getString("ARTICLETITLE"));
			dto.setArticleDate(rs.getString("ARTICLEDATE"));
			dto.setArticleHit(rs.getInt("ARTICLEHIT"));
			dto.setArticleLike(rs.getInt("ARTICLELIKE"));
			dto.setArticleNotice(rs.getString("ARTICLENOTICE"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ????????? ????????? ??? ??????
	@Override
	public int getMemberDataCount(String memberId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM ARTICLEVIEW"
				+ " WHERE MEMBERID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberId);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ????????? ?????? ???????????? ????????? ???????????? ????????? ??????
	@Override
	public ArticleDTO getMemberReadDate(String articleCode) throws SQLException
	{
		ArticleDTO result = new ArticleDTO();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT ARTICLECODE, MEMBERID, MEMBERNAME, ARTICLETITLE"
				+ ", ARTICLECONTENT, ARTICLEHIT, ARTICLELIKE, ARTICLEDATE"
				+ " FROM ARTICLEVIEW"
				+ " WHERE ARTICLECODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCode);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setArticleCode(rs.getString("ARTICLECODE"));
			result.setMemberId(rs.getString("MEMBERID"));
			result.setMemberName(rs.getString("MEMBERNAME"));
			result.setArticleTitle(rs.getString("ARTICLETITLE"));
			result.setArticleContent(rs.getString("ARTICLECONTENT"));
			result.setArticleHit(rs.getInt("ARTICLEHIT"));
			result.setArticleLike(rs.getInt("ARTICLELIKE"));
			result.setArticleDate(rs.getString("ARTICLEDATE"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}	
	
	// ?????? ????????? ?????? ???????????? ????????? ???????????? ???????????? ?????????
	@Override
	public int getMemberLikeCount(String articleCode, String memberCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM ARTICLE_LIKES"
				+ " WHERE ARTICLE_CODE = ?"
				+ " AND MEMBER_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCode);
		pstmt.setString(2, memberCode);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ????????? ?????? ????????????
	@Override
	public String getNextArticleCode(String articleCode) throws SQLException
	{
		String result = "";
		
		articleCode = articleCode.substring(1); 
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT 'A' || NVL(MIN(SUBSTR(ARTICLECODE, 2)),-1) AS NEXTCODE"
				+ " FROM TIPARTICLEVIEW"
				+ " WHERE SUBSTR(ARTICLECODE,2)>?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,  articleCode);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getString("NEXTCODE");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// ?????? ????????? ?????? ????????????
	@Override
	public String getBeforeArticleCode(String articleCode) throws SQLException
	{
		String result = "";
		
		articleCode = articleCode.substring(1); 
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT 'A' || NVL(MAX(SUBSTR(ARTICLECODE, 2)),-1) AS BEFORECODE"
				+ " FROM TIPARTICLEVIEW"
				+ " WHERE SUBSTR(ARTICLECODE,2)<?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,  articleCode);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getString("BEFORECODE");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ????????? ?????? ?????? ?????????(??????)
	@Override
	public int reportArticle(ArticleDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "INSERT INTO ARTICLE_REP_IN(ARTICLE_REP_IN_CODE, ARTICLE_CODE, MEMBER_CODE"
				+ ", REP_TYPE_CODE, ARTICLE_REP_IN_CONTENT, ARTICLE_REP_IN_DATE)"
				+ " VALUES( 'AR' || ARTICLE_REP_IN_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getArticleCode());
		pstmt.setString(2, dto.getMemberCode());
		pstmt.setString(3, dto.getRep_type_code());
		pstmt.setString(4, dto.getArticle_rep_in_content());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// ?????? ????????? ?????? ???????????? ??????????????? ?????? ??????
	@Override
	public int getMemberReportCount(String articleCode, String memberCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM ARTICLE_REP_IN"
				+ " WHERE ARTICLE_CODE = ?"
				+ " AND MEMBER_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCode);
		pstmt.setString(2, memberCode);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return result;
	}

	@Override
	public ArrayList<ArticleDTO> memberCommentLists(int start, int end, String memberId) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getMemberCommentDataCount(String memberId) throws SQLException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ArticleDTO> memberLikeLists(int start, int end, String memberId) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getMemberLikeDataCount(String memberId) throws SQLException
	{
		// TODO Auto-generated method stub
		return 0;
	}
	
	// ?????? ?????? ?????? ??? ???????????? ?????? ????????? ????????? ??????
	@Override
	public ArticleDTO getCommentData(String articleCommentCode) throws SQLException
	{
		ArticleDTO result = new ArticleDTO();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT ARTICLE_COMMENT_CODE, MEMBER_ID, MEMBER_CODE, ARTICLE_COMMENT_CONTENT"
				   + " FROM VIEW_REPORT_COMMENT"
				   + " WHERE ARTICLE_COMMENT_CODE = ?";
	
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleCommentCode);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setArticleCommentCode(rs.getString("ARTICLE_COMMENT_CODE"));
			result.setMemberId(rs.getString("MEMBER_ID"));
			result.setMemberCode(rs.getString("MEMBER_CODE"));
			result.setArticleCommentContent(rs.getString("ARTICLE_COMMENT_CONTENT"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();		
		
		return result;
	}	
	
	
	// ?????? ?????? ?????? ??????
	@Override
	public ArrayList<ArticleDTO> repTypeList() throws SQLException
	{
		ArrayList<ArticleDTO> result = new ArrayList<ArticleDTO>();

		Connection conn = dataSource.getConnection();
		String sql = "SELECT REP_TYPE_CODE, REP_TYPE_DETAIL FROM REP_TYPE";
	
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			ArticleDTO dto = new ArticleDTO();
			
			dto.setRep_type_code(rs.getString("REP_TYPE_CODE"));
			dto.setRep_type_detail(rs.getString("REP_TYPE_DETAIL"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();	
		

		return result;
	}
	
	// ?????? ?????? ?????? ?????????, ?????? ??????
	@Override
	public int inArticleCommentReport(ArticleDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "INSERT INTO ARTICLE_COMMENT_REP_IN"
				   + " VALUES('AC' || ARTICLE_COMMENT_REP_IN_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getArticleCommentCode());
		pstmt.setString(2, dto.getMemberCode());
		pstmt.setString(3, dto.getRep_type_code());
		pstmt.setString(4, dto.getArticle_rep_in_content());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// ?????? ????????? ?????? ????????? ??????????????? ?????? ??????
	@Override
	public int getMemberCommentCount(String articleCommentCode, String memberCode) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT" 
				+ " FROM ARTICLE_COMMENT_REP_IN" 
				+ " WHERE MEMBER_CODE=?" 
				+ " AND ARTICLE_COMMENT_CODE=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberCode);
		pstmt.setString(2, articleCommentCode);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}	
}
