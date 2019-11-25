package cn.controller;

import cn.bean.Department;
import cn.bean.Msg;
import cn.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/*
       处理部门的逻辑
 */
@Controller
public class DepartmentController {

    @Autowired
   private DepartmentService departmentService;

    /**返回所有的部门信息
     * @return
     */
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> list=departmentService.getDepts();
        return Msg.success().add("dep",list);
    }
}
