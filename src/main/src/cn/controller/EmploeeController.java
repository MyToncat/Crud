package cn.controller;

import cn.bean.Emploee;
import cn.bean.Msg;
import cn.service.EmploeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmploeeController {

    @Autowired
    EmploeeService emploeeService;


    /**校验是否可以用
     * @param empname
     * @return
     */
    @RequestMapping("/checkuse")
    @ResponseBody
    public Msg checkUse(@RequestParam("empname") String empname){
      //之前前端校验，现在统一，在后端校验
          //格式校验
        String regx="(^[a-z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if (!empname.matches(regx)){
            //用户名，匹配失败
            return Msg.fail().add("va_msg","用户名可以使2-5为中文，或者6-16位英文");
        }

        //这是数据库查询是否存在相同用户名
      boolean flag=  emploeeService.checkUse(empname);
      if (flag){
          return Msg.success();
      }else{
          return Msg.fail().add("va_msg","用户名不可用");
      }
    }

    /**只允许发送post请求
     * 员工保存
     *
     * 后端校验，使用jsr303校验  Hibernate-validator
     * @return
     */
    @RequestMapping(value = "/emp",method = {RequestMethod.POST})
    @ResponseBody
    public Msg saveEmp(@Valid Emploee emploee, BindingResult result){//@Valid 代表这个封装的对象需要进行校验，检验结果返回BindingResult result

        if (result.hasErrors()){
            //有失败
            List<FieldError> list = result.getFieldErrors();
            Map<String,Object>  map=new HashMap<String,Object>();
            for (FieldError error:list){
                System.out.println("错误的字段名："+error.getField());
                System.out.println("错误信息："+error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());
            }

            return Msg.fail().add("errorField",map);
        }else{
            emploeeService.saveEmp(emploee);
            return Msg.success();
        }

    }


    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,5);
        List<Emploee> emps=emploeeService.getAll();
        //使用pageinfo包装，pageinfo包含很多信息，所以只要把这个交给页面即可
        //传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);
//        return page;
        return Msg.success().add("pageinfo",page);
    }


/*
    *//** 查询员工信息
     * @return
     *//*
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

    */
}
