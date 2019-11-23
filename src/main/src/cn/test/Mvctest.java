package cn.test;

import cn.bean.Emploee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/*
     使用Spring测试模块提供的测试请求功能，测试crud请求的正确性

     在Spring4中测试时没需要servlet3.0 以上的支持

 */
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/springmvc-servlet.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class Mvctest {

    //传入springmvc的ioc  ,自动注入的前提是 加上注解@WebAppConfiguration
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    //使用junit的before，
    @Before
    public void initMokcMvc(){
        System.out.println("我是先执行。。");
     mockMvc=   MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5")).andReturn();
       //请求成功后，请求域中会有pageinfo，我们可以取出pageinfo进行检验
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageinfo = (PageInfo)request.getAttribute("page");
        System.out.println("当前页数："+pageinfo.getPageNum());
        System.out.println("总页数："+pageinfo.getPages());
        System.out.println("总记录数："+pageinfo.getTotal());
        //连续显示的页码
        int[] nums = pageinfo.getNavigatepageNums();
        for(int i:nums){
            System.out.println(" "+i);
        }
        List<Emploee> list=pageinfo.getList();
        for (Emploee emploee:list){

            System.out.println(emploee.getdId());
            System.out.println(emploee.getEmpId());
        }

    }
}
