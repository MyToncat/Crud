package cn.service;

import cn.bean.Emploee;
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
}
