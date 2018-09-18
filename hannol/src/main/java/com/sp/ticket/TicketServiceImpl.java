package com.sp.ticket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("ticket.ticketService")
public class TicketServiceImpl implements TicketService {

	@Autowired
	private CommonDAO dao;	

}
