package com.DAO;

import java.sql.Date;
import java.util.List;
import com.entity.Perfume_Sales;

public interface PerfumeSalesDAO {
	public List<Perfume_Sales> getAllSales();
	public List<Perfume_Sales> getSalesDate(Date startdate, Date endDate);
	public List<Perfume_Sales> getSalesAuthor();
}
