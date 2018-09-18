package com.sp.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("ticket.ticketService")
public class TicketServiceImpl implements TicketService {

	@Autowired
	private CommonDAO dao;

	@Override
	public List<Ticket> listTicket() throws Exception {
		List<Ticket> list = null;
		try {
			list = dao.selectList("ticket.listTicket");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}	

}
