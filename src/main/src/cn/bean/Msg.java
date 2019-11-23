package cn.bean;

import java.util.HashMap;
import java.util.Map;

/*
      定义一个通用的处理结果的类
 */
public class Msg {
    //状态码 100 成功   200 失败
   private int code;
   private String msg;

   //用户返回给浏览器的数据
   private Map<String,Object> extend=new HashMap<String,Object>();


   public  static Msg success(){
       Msg result=new Msg();
       result.setCode(100);
       result.setMsg("处理成功");
       return result;
   }

   public static Msg fail(){
       Msg msg=new Msg();
       msg.setCode(200);
       msg.setMsg("处理失败");
       return msg;
   }

   public Msg add(String key,Object value){
       this.getExtend().put(key,value);
       return this;
   }



    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
