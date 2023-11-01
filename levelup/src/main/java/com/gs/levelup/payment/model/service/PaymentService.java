package com.gs.levelup.payment.model.service;

import java.util.ArrayList;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.payment.model.vo.Payment;

public interface PaymentService {
	
	public ArrayList<Payment> selectList(Paging paging);	
	public int insertPayment(Payment payment);	
	public int updatePayment(Payment payment);	
	public int deletePayment(String paymentKey);	
	public int selectListCount();
	public int selectSearchPaymentIdCount(String keyword);
	public int selectSearchDateCount(Search search);
	public int selectSearchPaymentStatusCount(String trim);
	public ArrayList<Payment> selectSearchPaymentId(Search search);
	public ArrayList<Payment> selectSearchDate(Search search);
	public ArrayList<Payment> selectSearchStatus(Search search);
	public int cancelPayment(Search search);
	public Payment selectPaymentOne(String paymentKey);
	public int updatePaymentState(String paymentKey);
	public Payment selectPaymentKey(String paymentKey);
	public ArrayList<Payment> selectPaymentList(int accountId);
	public ArrayList<Payment> selectItemList5();
}
