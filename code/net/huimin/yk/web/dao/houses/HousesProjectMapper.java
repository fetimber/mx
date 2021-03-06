package net.huimin.yk.web.dao.houses;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.huimin.yk.web.model.houses.HousesProject;
@Repository
public interface HousesProjectMapper {
    /**
     * 根据主键删除记录
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 保存记录,不管记录里面的属性是否为空
     */
    int insert(HousesProject record);

    /**
     * 保存属性不为空的记录
     */
    int insertSelective(HousesProject record);

    /**
     * 根据主键查询记录
     */
    HousesProject selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新属性不为空的记录
     */
    int updateByPrimaryKeySelective(HousesProject record);

    /**
     * 根据主键更新记录
     */
    int updateByPrimaryKey(HousesProject record);
    
    /**
	 * 查询符合条件数据条数
	 * 
	 * @param parameters
	 * @return
	 */
	Integer queryCountByConditions(Map<String, Object> parameters);

	/**
	 * 分页条件检索楼盘列表
	 * 
	 * @param parameters
	 * @return
	 */
	List<HousesProject> queryHousesByConditions(Map<String, Object> parameters);
	
	/**
	 * 根据条件查询所有楼盘列表
	 * @param project
	 * @return
	 */
	List<HousesProject>selectAllByConditions(HousesProject project);

	int updateDeleteStatus(Integer id);

	int checkHouseProjectName(HousesProject project);
}