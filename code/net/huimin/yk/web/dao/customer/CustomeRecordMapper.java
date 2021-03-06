package net.huimin.yk.web.dao.customer;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.huimin.yk.web.model.customer.CustomeRecord;
@Repository
public interface CustomeRecordMapper {
    /**
     * 根据主键删除记录
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 保存记录,不管记录里面的属性是否为空
     */
    int insert(CustomeRecord record);

    /**
     * 保存属性不为空的记录
     */
    int insertSelective(CustomeRecord record);

    /**
     * 根据主键查询记录
     */
    CustomeRecord selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新属性不为空的记录
     */
    int updateByPrimaryKeySelective(CustomeRecord record);

    /**
     * 根据主键更新记录
     */
    int updateByPrimaryKey(CustomeRecord record);
    
    /**
     * 根据客户推荐表Id查询客户的最后跟进记录
     */
    CustomeRecord selectLastFollowRecord(Integer id);
    
    List<CustomeRecord> selectRecords(Integer id);
    
    List<CustomeRecord> selectAgentRecords(Integer id);
    
    int selectNewCount(Integer id);
    
}