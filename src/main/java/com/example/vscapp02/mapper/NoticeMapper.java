package com.example.vscapp02.mapper;


import com.example.vscapp02.dto.Notice;
import com.example.vscapp02.dto.PagerInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface NoticeMapper {

	public int selectNoticeTotalCount(@Param("notice") Notice notice);

	public List<Notice> selectNotices(@Param("notice") Notice notice, @Param("pagerInfo") PagerInfo pagerInfo);

	public List<Notice> selectHeaderNotices(@Param("notice") Notice notice);

	public Notice selectNotice(@Param("notice") Notice notice);

	public int insertNotice(@Param("notice") Notice notice);

	public int updateNotice(@Param("notice") Notice notice);

	public int deleteNotice(@Param("notice") Notice notice);

}
