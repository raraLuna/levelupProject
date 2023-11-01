package com.gs.levelup.payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;

import com.gs.levelup.payment.model.vo.Payment;

@Repository("paymentDao")
public class PaymentDao {
	@Autowired  
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertPayment(Payment payment) {
		return sqlSessionTemplate.insert("paymentMapper.insertPayment", payment);
	}

	public int updatePayment(Payment payment) {
		return sqlSessionTemplate.update("paymentMapper.updatePayment", payment);
	}
	
	public int deletePayment(String paymentKey) {
		return sqlSessionTemplate.delete("paymentMapper.deletePayment", paymentKey);
	}

	public int selectListCount() {
		return sqlSessionTemplate.selectOne("paymentMapper.selectListCount");
	}

	public int selectSearchPaymentIdCount(String keyword) {
		return sqlSessionTemplate.selectOne("paymentMapper.selectSearchPaymentIdCount", keyword);
	}

	public int selectSearchDateCount(Search search) {
		return sqlSessionTemplate.selectOne("paymentMapper.selectSearchDateCount", search);
	}
	
	public int selectSearchPaymentStatusCount(String keyword) {
		return sqlSessionTemplate.selectOne("paymentMapper.selectSearchPaymentStatusCount", keyword);
	}
	
	public ArrayList<Payment> selectList(Paging paging){
		List<Payment> list = sqlSessionTemplate.selectList("paymentMapper.selectList", paging);
		return (ArrayList<Payment>)list;
	}

	public List<Payment> selectSearchPaymentId(Search search) {
		List<Payment> list = sqlSessionTemplate.selectList("paymentMapper.selectSearchPaymentId", search);
		return (ArrayList<Payment>)list;
	}
	
	public List<Payment> selectSearchDate(Search search) {
		List<Payment> list = sqlSessionTemplate.selectList("paymentMapper.selectSearchDate", search);
		return (ArrayList<Payment>)list;
	}

	public List<Payment> selectSearchStatus(Search search) {
		List<Payment> list = sqlSessionTemplate.selectList("paymentMapper.selectSearchStatus", search);
		return (ArrayList<Payment>)list;
	}

	public int cancelPayment(Search search) {
		return sqlSessionTemplate.insert("paymentMapper.cancelPayment", search);
	}

	public Payment selectPaymentOne(String paymentKey) {
		return sqlSessionTemplate.selectOne("paymentMapper.selectPaymentOne", paymentKey);
	}

	public int updatePaymentState(String paymentKey) {
		return sqlSessionTemplate.update("paymentMapper.updatePaymentState", paymentKey);
	}

	public Payment selectPaymentKey(String paymentKey) {
		return sqlSessionTemplate.selectOne("paymentMapper.selectPaymentKey", paymentKey);
	}

	public ArrayList<Payment> selectPaymentList(int accountId) {
		List<Payment> list = sqlSessionTemplate.selectList("paymentMapper.selectPaymentList", accountId);
		return (ArrayList<Payment>)list;
	}

	public ArrayList<Payment> selectItemList5() {
		List<Payment> list = sqlSessionTemplate.selectList("paymentMapper.selectItemList5");
		return (ArrayList<Payment>)list;
	}

}
