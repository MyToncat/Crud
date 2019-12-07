package cn.service;

import cn.bean.Emploee;
import cn.bean.EmploeeExample;
import cn.dao.EmploeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class EmploeeService {
    @Autowired
    EmploeeMapper emploeeMapper;

    /**查询所有员工（分页查询）
     * @return
     */
    public List<Emploee> getAll() {
      /*  引入PageHelper框架  用于分页*/
        return emploeeMapper.selectByExampleWithDepartment(null);
    }

    //员工保存
    public void saveEmp(Emploee emploee) {
        emploeeMapper.insertSelective(emploee);
    }

    /**
     * @param empname
     * @return
     * true  表示可用
     * false   不可用
     */
    //查询是否存在该员工
    public boolean checkUse(String empname) {
        EmploeeExample example=new EmploeeExample();
       EmploeeExample.Criteria criteria = example.createCriteria();
       criteria.andEmpNameEqualTo(empname);
        long count = emploeeMapper.countByExample(example);
        return  count==0;
    }


    /**按照id查询员工
     * @param id
     * @return
     */
    public Emploee getEmp(Integer id) {
        Emploee emploee=emploeeMapper.selectByPrimaryKey(id);
        return emploee;
    }

    //员工更新
    public void updateEmp(Emploee emploee) {
        emploeeMapper.updateByPrimaryKeySelective(emploee);
    }

    //删除员工
    public void deletEmp(Integer id) {
        emploeeMapper.deleteByPrimaryKey(id);

    }
}
