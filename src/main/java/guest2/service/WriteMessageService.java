package guest2.service;

import guest2.model.Message;
import guest2.model.MessageDao;
import guest2.model.MessageException;

public class WriteMessageService {

	private static WriteMessageService instance;
	
	public static WriteMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new WriteMessageService();
		}
		return instance;
	}
	
	private WriteMessageService()
	{
		
	}
	
	public void write( Message rec ) throws MessageException
	{
		MessageDao mDao = MessageDao.getInstance();
		mDao.insert(rec);
	
	}
}
