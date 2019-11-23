package cn.dao;

import cn.bean.Emploee;
import cn.bean.EmploeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmploeeMapper {
    long countByExample(EmploeeExample example);

    int deleteByExample(EmploeeExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Emploee record);

    int insertSelective(Emploee record);

    List<Emploee> selectByExample(EmploeeExample example);

    Emploee selectByPrimaryKey(Integer empId);

    List<Emploee> selectByExampleWithDepartment(EmploeeExample example);

    Emploee selectByPrimaryKeyWithDepartrment(Integer empId);

    int updateByExampleSelective(@Param("record") Emploee record, @Param("example") EmploeeExample example);

    int updateByExample(@Param("record") Emploee record, @Param("example") EmploeeExample example);

    int updateByPrimaryKeySelective(Emploee record);

    int updateByPrimaryKey(Emploee record);
}