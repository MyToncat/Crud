package cn.controller;

import cn.bean.Emploee;
import cn.service.EmploeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EmploeeController {

    @Autowired
    EmploeeService emploeeService;

    /** 查询员工信息
     * @return
     */
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value="pn",defaultValue = "1") Integer pn, Model model){
        //传入页码 和 每一页大小
        PageHelper.startPage(pn,5);
        List<Emploee> emps=emploeeService.getAll();
        //使用pageinfo包装，pageinfo包含很多信息，所以只要把这个交给页面即可
        //传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageinfo",page);
        return "list";
    }
}
