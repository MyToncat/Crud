package cn.test;

import cn.bean.Department;
import cn.bean.Emploee;
import cn.dao.DepartmentMapper;
import cn.dao.EmploeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class mapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmploeeMapper emploeeMapper;

    @Autowired
    SqlSession sqlsession;


    @Test
    public void test(){
        //创建springioc容器
//        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
//        DepartmentMapper bean = context.getBean(DepartmentMapper.class);
//        System.out.println(bean);

        System.out.println(departmentMapper);

//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

//        emploeeMapper.insertSelective(new Emploee(1234,"小红"));

        //测试批量插入，这个sqlsession是批量插入的，所以可以批量插入

        EmploeeMapper mapper = sqlsession.getMapper(EmploeeMapper.class);
        for (int i = 0; i <500 ; i++) {
//            Integer empId, String empName, String gender, String email, Integer dId, Department department
            String uuid = UUID.randomUUID().toString().substring(0, 5);
           mapper.insertSelective(new Emploee(null,uuid,"男","@qq.com",1));
        }


    }
}
