package blog;

public class UserVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private String nick;
	private String gender;
	private String email;
	private String tel;
	private int level;
	private String userDel;
	
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getUserDel() {
		return userDel;
	}
	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}
	
	@Override
	public String toString() {
		return "UserVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", nick=" + nick
				+ ", gender=" + gender + ", email=" + email + ", tel=" + tel + ", level=" + level + ", userDel="
				+ userDel + "]";
	}
	
	
	
	
	
}
