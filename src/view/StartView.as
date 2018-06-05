/**Created by the LayaAirIDE*/
package view
{
	import ui.StartViewUI
	import laya.events.Event;

	public class StartView extends StartViewUI
	{
		
		public function StartView() 
		{
			init();
		}

		private function init():void{
			this.btnStart.visible=false;
			this.btnStart.once(Event.CLICK,this,onClickBtnStart);
			EventManager.getInstance().once(Constant.Event_Res_Ready,this,onResReady)
		}

		private function onClickBtnStart(e:Event):void{
			EventManager.getInstance().event(Constant.Event_Start);
		}

		private function onResReady(e:Event):void{
			this.btnStart.visible=true;
		}
		
	}

}