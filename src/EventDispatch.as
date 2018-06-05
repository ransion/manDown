package 
{
	import laya.display.Sprite;

	/**
	 * ...
	 * @author
	 */
	public class EventDispatch extends Sprite{
		private static var _instance:EventDispatch;
		public function EventDispatch(){
			if(_instance==null){
				_instance=new EventDispatch()
			}
		}

		
	}

}