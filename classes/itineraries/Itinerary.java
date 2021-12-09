package itineraries;

public class Itinerary {
	
	private int id;
	public String name;
	public double price;
	public String beginning;
	public String station1;
	public String station2;
	public String station3;
	public String station4;
	public String time1;
	public String time2;
	public String time3;
	public String time4;
	public String ending;
	
	
	public Itinerary(int id, String name, double price, String beginning, String station1, String station2, String station3, String station4,String time1, String time2, String time3, String time4, String ending) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.beginning = beginning;
		this.station1 = station1;
		this.station2 = station2;
		this.station3 = station3;
		this.station4 = station4;
		this.time1 = time1;
		this.time2 = time2;
		this.time3 = time3;
		this.time4 = time4;
		this.ending = ending;
	}
	
	
	public int getId(){
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getBeginning() {
		return beginning;
	}
	
	public void setBeginning(String beginning) {
		this.beginning = beginning;
	}
	
	
	public String getStation1(){
		return station1;
	}
	
	public String getStation2(){
		return station2;
	}
	
	public String getStation3(){
		return station3;
	}
	
	public String getStation4(){
		return station4;
	}
	
	public void setStation1(String station1) {
		this.station1 = station1;
	}
	
	public void setStation2(String station2) {
		this.station2 = station2;
	}
	
	public void setStation3(String station3) {
		this.station3 = station3;
	}
	
	public void setStation4(String station4) {
		this.station4 = station4;
	}
	
	public String getEnding() {
		return ending;
	}
	
	public void setEnding(String ending) {
		this.ending = ending;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	
	public void setTime3(String time3) {
		this.time3 = time3;
	}
	
	public void setTime4(String time4) {
		this.time4 = time4;
	}
	
	public String getTime1() {
		return time1;
	}
	
	public String getTime2() {
		return time2;
	}
	
	public String getTime3() {
		return time3;
	}
	
	public String getTime4() {
		return time4;
	}
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	