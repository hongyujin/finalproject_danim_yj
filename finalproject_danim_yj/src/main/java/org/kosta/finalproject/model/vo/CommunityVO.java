package org.kosta.finalproject.model.vo;

public class CommunityVO {
	private int comm_no;
	private String timePosted;
	private String content;
	private int likePosted;
	private MemberVO memberVO;
	public CommunityVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommunityVO(int comm_no, String timePosted, String content,
			int likePosted, MemberVO memberVO) {
		super();
		this.comm_no = comm_no;
		this.timePosted = timePosted;
		this.content = content;
		this.likePosted = likePosted;
		this.memberVO = memberVO;
	}
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public String gettimePosted() {
		return timePosted;
	}
	public void settimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikePosted() {
		return likePosted;
	}
	public void setLikePosted(int likePosted) {
		this.likePosted = likePosted;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "CummunityVO [comm_no=" + comm_no + ", timePosted=" + timePosted
				+ ", content=" + content + ", likePosted=" + likePosted
				+ ", memberVO=" + memberVO + "]";
	}
	
}
