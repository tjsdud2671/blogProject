package board;

public class BoardVO {
	private int idx;
	private String mid;
	private String nick;
	private String title;
	private String content;
	private String fName;
	private String fSName;
	private int readNum;
	private String openSW;
	private String wDate;
	private int good;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public int getReadNum() {
		return readNum;
	}
	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}
	public String getOpenSW() {
		return openSW;
	}
	public void setOpenSW(String openSW) {
		this.openSW = openSW;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", mid=" + mid + ", nick=" + nick + ", title=" + title + ", content=" + content
				+ ", fName=" + fName + ", fSName=" + fSName + ", readNum=" + readNum + ", openSW=" + openSW + ", wDate="
				+ wDate + ", good=" + good + "]";
	}
	
	
	
	
	
	
}
