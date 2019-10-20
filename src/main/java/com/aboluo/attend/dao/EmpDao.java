package com.aboluo.attend.dao;

import com.aboluo.attend.pojo.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface EmpDao {

    int insertEmp(Emp emp);

    int deleteEmp(int emp_id);

    int updateEmp(Emp emp);

    /*登录检测*/
    Emp checkEmp(Emp emp);

    /*注册检测*/
    int register(Emp emp);

    /*通过员工编号获取员工信息*/
    Emp selectEmpById(int emp_id);

    /*获取所有员工*/
    List<Emp> selectAllEmp();

    /*获取员工信息总条数*/
    int selectEmpCount();

    /*条件搜索获取员工信息*/
    List<Emp> searchByCondition(@Param("dept") String dept, @Param("gender") String gender, @Param("disable") Integer disable);

    /*条件搜索获取总记录数*/
    int searchEmpCount(@Param("dept") String dept, @Param("gender") String gender, @Param("disable") Integer disable);

    /*分页获取员工信息*/
    List<Emp> selectEmpByPage(Map<String, Integer> index_map);

    /*模糊查询员工信息*/
    List<Emp> searchByContent(@Param("content") String content);

    /*获取模糊查询的总数*/
    int getSearchCount(@Param("content") String content);

    /*检测重复工号*/
    int findEmp_id(Emp emp);

    /*模糊查询获取总数*/
    int getByContentCount(@Param("content") String content);

}
