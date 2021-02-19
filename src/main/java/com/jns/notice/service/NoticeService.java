package com.jns.notice.service;

import com.jns.notice.vo.NoticeVO;
import java.util.List;

public interface NoticeService {

	public List<NoticeVO> NoticeSelectPaging(NoticeVO nvo);
	public List<NoticeVO> NoticeSelectAll(NoticeVO nvo);
	public List<NoticeVO> NoticeSelect(NoticeVO nvo);
	
	public int NoticeInsert(NoticeVO nvo);
	public int NoticeUpdate(NoticeVO nvo);
	public int NoticeDelete(NoticeVO nvo);
}