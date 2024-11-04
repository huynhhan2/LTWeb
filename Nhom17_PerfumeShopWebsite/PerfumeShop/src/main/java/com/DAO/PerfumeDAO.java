package com.DAO;
import java.util.List;

import com.entity.PerfumeDtls;
public interface PerfumeDAO {
	public boolean addPerfumes(PerfumeDtls b);
	public List<PerfumeDtls> getAllPerfumes();
	public PerfumeDtls getPerfumeById(int id);
	public boolean updateEditPerfumes(PerfumeDtls b);
	public boolean deletePerfumes(int id);
	public List<PerfumeDtls> getNewPerfume();
	public List<PerfumeDtls> getRecentPerfumes();
	public List<PerfumeDtls> getOldPerfumes();
	public List<PerfumeDtls> getAllRencentPerfume();
	public List<PerfumeDtls> getAllNewPerfume();
	public List<PerfumeDtls> getAllOldPerfume();
	public List<PerfumeDtls> getPerfumeByOld(String email, String cate);
	public boolean oldPerfumeDelete(String email, String cat, int id);
	public List<PerfumeDtls> getPerfumeBySearch(String ch);
}
