package com.springmvc.crud.handler;
import com.springmvc.crud.dao.DepartmentDao;
import com.springmvc.crud.dao.EmployeeDao;
import com.springmvc.crud.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class EmployeeHandler {

    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private DepartmentDao departmentDao;

    @ModelAttribute
    public void getEmployee(@RequestParam(value = "id",required = false) Integer id,Map map){
        if(id!= null){
            map.put("employee",employeeDao.get(id));
        }
    }

    @RequestMapping(value="/emp",method= RequestMethod.PUT)
    public String update(Employee employee){
        employeeDao.save(employee);
        System.out.println(employee);
        return "redirect:/emps";
    }

    @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
    public String input(@PathVariable("id") Integer id,Map map){
        map.put("employee",employeeDao.get(id));
        map.put("departments",departmentDao.getDepartments());
        return "input";
    }

    @RequestMapping(value="/emps",method = RequestMethod.GET)
    public String list(Map<String,Object> map){
        System.out.println("get");
        map.put("employees",employeeDao.getAll());
        return "list";
    }
    @RequestMapping(value="/emp",method = RequestMethod.GET)
    public String input(Map<String,Object> map){
        map.put("departments",departmentDao.getDepartments());
        map.put("employee",new Employee());
        return "input";
    }
    @RequestMapping(value="/emp",method=RequestMethod.POST)
    public String save(Employee employee){
        System.out.println("employee---->"+ employee);
        employeeDao.save(employee);
        return "redirect:/emps";
    }
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id){
        System.out.println("delete");
        employeeDao.delete(id);
        return "redirect:/emps";
    }

//    @ModelAttribute
//    public void disposeData(@RequestParam Map employee){
//        String lastName = (String) employee.get("lastName");
//        String email= (String) employee.get("email");
//        String gender= (String) employee.get("gender");
//        System.out.println(employee);
//        String idStr = (String) employee.get("department.id");
//        System.out.println(new Department(Integer.parseInt(idStr)));
//        Employee employee1 = new Employee(null,lastName,email,gender,new Department(Integer.parseInt(idStr)));
//        System.out.println("employee1---->" + employee1);
//        employeeDao.save(employee1);
//        employee.put("employee",employee1);
//        System.out.println("disposeData->"+employee1);
//    }

//    @RequestMapping(value = "/emps",method = RequestMethod.POST)
//    public String list(Employee employee,Map map){
//        if (employee.getLastName() != null){
//            map.put("employees",employeeDao.getAll());
//            return "list";
//        }
//        return "edit";
//    }



}
