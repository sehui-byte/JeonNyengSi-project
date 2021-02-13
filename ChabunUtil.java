package com.jns.common;

public abstract class ChabunUtil {

	public static final String BIZ_GUBUN_M 	= "M"; // ȸ�� : MEMBER

	public static final String BIZ_GUBUN_B 	= "B"; // �ϹݰԽ��� : BOARD

	public static final String BIZ_GUBUN_N 	= "N"; // �������� : NOTICE BOARD
	public static final String BIZ_GUBUN_Q = "Q"; // Q&A �Խ��� 

	public static final String BIZ_GUBUN_CB	= "CB"; // ���� �Խ��� 
	public static final String BIZ_GUBUN_CO = "CO"; // �Ű�Խ��� 
	public static final String BIZ_GUBUN_F	= "F"; // ���ã��
	
	
	public static final String BIZ_GUBUN_SI	= "SI"; // ������ȣ
	public static final String BIZ_GUBUN_I	= "I"; // ������ȣ
	public static final String BIZ_GUBUN_O	= "O"; // ���ų��� ��ȣ
	public static final String BIZ_GUBUN_CA	= "CA"; // ��ٱ��� ��ȣ
	
//	public static final String BIZ_GUBUN_RB = "RB"; // �Խ��� ���: REPLY 
//	public static final String BIZ_GUBUN_BUY = "P"; // ���ŰԽ���
	


	
	
	// type : D : 20210001, M : YYYYMM, Y : YYYY, N :  ȸ����ȣ
	public static String numPad(String t, String c){
	
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	// �Խ��� 
	public static String numPad2(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	//��������
	public static String numPad3(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	//����
	public static String numPad4(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	//����
	public static String numPad5(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	// ���ã��
	public static String numPad6(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	//�Ű�
	public static String numPad7(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	//������ȣ 
	public static String numPad8(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	//������ȣ 
	public static String numPad9(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	//���ų�����ȣ
	public static String numPad10(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	
	
	// ȸ�� ��ȣ 
	public static String getMemChabun(String type, String memNum) {
		
		return BIZ_GUBUN_M.concat(ChabunUtil.numPad(type, memNum));
	}
	
	// �ϹݰԽ��� �� ��ȣ  
	public static String getBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_B.concat(ChabunUtil.numPad2(type, memNum));
	}
/**	
	// �Խ��� ��� �� ��ȣ  
	public static String getRboardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_RB.concat(ChabunUtil.numPad(type, memNum));
	}
**/	
	// ��������  ��ȣ  
	public static String getNoticeChabun(String type, String memNum) {
		
		return BIZ_GUBUN_N.concat(ChabunUtil.numPad3(type, memNum));
	}
	
	
	// Q&A  ��ȣ  
	public static String getQnaBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_Q.concat(ChabunUtil.numPad4(type, memNum));
	}
	
	// �����Խ���  ��ȣ  
	public static String getChiefBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_CB.concat(ChabunUtil.numPad5(type, memNum));
	}
	
	// ���ŰԽ���  ��ȣ  
//	public static String getProductChabun(String type, String memNum) {
		
//		return BIZ_GUBUN_P.concat(ChabunUtil.numPad(type, memNum));
//	}

	// ���ã�� ��ȣ
	public static String getFavoriteChabun(String type, String memNum) {
		
		return BIZ_GUBUN_F.concat(ChabunUtil.numPad6(type, memNum));
	}
	
	// �Ű� �Խ���  ��ȣ  
	public static String getComplBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_CB.concat(ChabunUtil.numPad7(type, memNum));
	}
	
	// ���� ��ȣ  
	public static String getSubinfoChabun(String type, String memNum) {
		
		return BIZ_GUBUN_SI.concat(ChabunUtil.numPad8(type, memNum));
	}
	
	// ���� ��ȣ  
	public static String getChefChabun(String type, String memNum) {
		
		return BIZ_GUBUN_I.concat(ChabunUtil.numPad9(type, memNum));
	}
	
	// ���ų���  ��ȣ  
	public static String getOrderChabun(String type, String memNum) {
		
		return BIZ_GUBUN_O.concat(ChabunUtil.numPad10(type, memNum));
	}
	

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String c = "1";
		System.out.println("ȸ����ȣ >>> : " + ChabunUtil.getMemChabun("D", c));
		System.out.println("�Ϲݷ����ǰԽ���>>> : " + ChabunUtil.getBoardChabun("D", c));
		//System.out.println(">>> : " + ChabunUtil.getRboardChabun("N", c));
		System.out.println("��������>>> : " + ChabunUtil.getNoticeChabun("D", c));
		System.out.println("�����Խ���>>> : " + ChabunUtil.getQnaBoardChabun("D", c));
		System.out.println("�����Խ��� >>> : " + ChabunUtil.getChiefBoardChabun("D", c));
//		System.out.println("���ŰԽ���>>> : " + ChabunUtil.getProductBoardChabun("P", c));
		System.out.println("���ã�� >>> : " + ChabunUtil.getFavoriteChabun("D", c));
		System.out.println("�Ű�Խ��� >>> : " + ChabunUtil.getComplBoardChabun("D", c));
		System.out.println("������ȣ >>> : " + ChabunUtil.getSubinfoChabun("D", c));
		System.out.println("�Ű�Խ��� >>> : " + ChabunUtil.getChefChabun("D", c));
		System.out.println("���ų��� >>> : " + ChabunUtil.getOrderChabun("D", c));
		
	}
}
