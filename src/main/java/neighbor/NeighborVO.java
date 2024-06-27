package neighbor;

public class NeighborVO {
	private String myNick;
	private String friendNick;
	public String getMyNick() {
		return myNick;
	}
	public void setMyNick(String myNick) {
		this.myNick = myNick;
	}
	public String getFriendNick() {
		return friendNick;
	}
	public void setFriendNick(String friendNick) {
		this.friendNick = friendNick;
	}
	@Override
	public String toString() {
		return "NeighborVO [myNick=" + myNick + ", friendNick=" + friendNick + "]";
	}

	
	


	
}
