package com.gs.levelup.payment.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.payment.model.dao.PaymentDao;
import com.gs.levelup.payment.model.vo.Payment;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
		@Autowired
		private PaymentDao paymentDao;
	
		@Override
		public int insertPayment(Payment payment) {
			return paymentDao.insertPayment(payment);
		}
		@Override
		public int updatePayment(Payment payment) {
			return paymentDao.updatePayment(payment);
		}
		@Override
		public int deletePayment(String paymentKey) {
			return paymentDao.deletePayment(paymentKey);
		}
		@Override
		public int selectListCount() {		
			return paymentDao.selectListCount();
		}
		@Override
		public int selectSearchPaymentIdCount(String keyword) {
			return paymentDao.selectSearchPaymentIdCount(keyword);
		}
		@Override
		public int selectSearchDateCount(Search search) {
			return paymentDao.selectSearchDateCount(search);
		}
		@Override
		public int selectSearchPaymentStatusCount(String keyword) {
			return paymentDao.selectSearchPaymentStatusCount(keyword);
		}
		@Override
		public ArrayList<Payment> selectList(Paging paging){
			List<Payment> list = paymentDao.selectList(paging);
			return (ArrayList<Payment>) list;
		}
		@Override
		public ArrayList<Payment> selectSearchPaymentId(Search search) {
			List<Payment> list = paymentDao.selectSearchPaymentId(search);
			return (ArrayList<Payment>) list;
		}
		@Override
		public ArrayList<Payment> selectSearchDate(Search search) {		
			List<Payment> list = paymentDao.selectSearchDate(search);
			return (ArrayList<Payment>) list;
		}
		@Override
		public ArrayList<Payment> selectSearchStatus(Search search) {
			List<Payment> list = paymentDao.selectSearchStatus(search);
			return (ArrayList<Payment>) list;
		}
		@Override
		public int cancelPayment(Search search) {
			return paymentDao.cancelPayment(search);
		}
		
		@Override
		public Payment selectPaymentOne(String paymentKey) {
			return paymentDao.selectPaymentOne(paymentKey);
		}
		
		@Override
		public int updatePaymentState(String paymentKey) {
			return paymentDao.updatePaymentState(paymentKey);
		}
		@Override
		public Payment selectPaymentKey(String paymentKey) {
			return paymentDao.selectPaymentKey(paymentKey);
		}
		@Override
		public ArrayList<Payment> selectPaymentList(int accountId) {
			return paymentDao.selectPaymentList(accountId);
		}
		@Override
		public ArrayList<Payment> selectItemList5() {
			return paymentDao.selectItemList5();
		}
}
