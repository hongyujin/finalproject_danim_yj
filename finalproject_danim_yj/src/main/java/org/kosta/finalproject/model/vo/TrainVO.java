package org.kosta.finalproject.model.vo;

public class TrainVO 
{
	private int train_no;
	private String operation_leadTime;
	private String end_area;
	private StationVO stationVO;
	private int price;
	private String leadTime;
	private String trainType;
	public TrainVO() {
		super();
	}
	public TrainVO(int train_no, String operation_leadTime, String end_area,
			StationVO stationVO, int price, String leadTime, String trainType) {
		super();
		this.train_no = train_no;
		this.operation_leadTime = operation_leadTime;
		this.end_area = end_area;
		this.stationVO = stationVO;
		this.price = price;
		this.leadTime = leadTime;
		this.trainType = trainType;
	}
	public int getTrain_no() {
		return train_no;
	}
	public void setTrain_no(int train_no) {
		this.train_no = train_no;
	}
	public String getOperation_leadTime() {
		return operation_leadTime;
	}
	public void setOperation_leadTime(String operation_leadTime) {
		this.operation_leadTime = operation_leadTime;
	}
	public String getEnd_area() {
		return end_area;
	}
	public void setEnd_area(String end_area) {
		this.end_area = end_area;
	}
	public StationVO getStationVO() {
		return stationVO;
	}
	public void setStationVO(StationVO stationVO) {
		this.stationVO = stationVO;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getleadTime() {
		return leadTime;
	}
	public void setleadTime(String leadTime) {
		this.leadTime = leadTime;
	}
	public String gettrainType() {
		return trainType;
	}
	public void settrainType(String trainType) {
		this.trainType = trainType;
	}
	@Override
	public String toString() {
		return "TrainVO [train_no=" + train_no + ", operation_leadTime="
				+ operation_leadTime + ", end_area=" + end_area + ", stationVO="
				+ stationVO + ", price=" + price + ", leadTime=" + leadTime + ", trainType="
				+ trainType + "]";
	}
	
	
}
