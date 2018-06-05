package 
{
	import laya.display.Sprite;

	/**
	 * ...
	 * @author
	 */
	public class EventManager extends Sprite{
		private static var _instance:EventManager;
		public function EventManager(){
			
		}

		public static function getInstance():EventManager{
			if(_instance==null){
				_instance=new EventManager();
			}
			return _instance;
		}
	}

}