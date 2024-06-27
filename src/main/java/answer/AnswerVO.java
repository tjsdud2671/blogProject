package answer;

public class AnswerVO {
	private int idx;
	private String content;
	private String nick;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	@Override
	public String toString() {
		return "AnswerVO [idx=" + idx + ", content=" + content + ", nick=" + nick + "]";
	}
	
	
}
