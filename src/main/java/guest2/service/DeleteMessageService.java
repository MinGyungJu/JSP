package guest2.service;

import guest2.model.Message;
import guest2.model.MessageDao;
import guest2.model.MessageException;

public class DeleteMessageService {

	private static DeleteMessageService instance;
	
	public static DeleteMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new DeleteMessageService();
		}
		return instance;
	}
	
	private DeleteMessageService()
	{
		
	}
	
	public int delete( String messageId, String password ) throws MessageException
	{
		int mId = 0;
		if( messageId != null) mId = Integer.parseInt(messageId);
		MessageDao mDao = MessageDao.getInstance();
		return mDao.delete(mId, password);
		
	}
}
