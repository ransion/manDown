package view
{
	import laya.ui.View;
	import laya.events.Event;
	import comp.GameBGView;
	import ui.GameMapBGUI;
	import comp.GamePlayer;

	/**
	 * ...
	 * @author
	 */
	public class GameView extends View{
		private var _gameBg:GameBGView;
		private var _isPause:Boolean;
		private var _player:GamePlayer;

		public function GameView(){
			init();
		}

		private function init():void{
			EventManager.getInstance().on(Constant.Event_Start,this,onGameStart);
			EventManager.getInstance().on(Constant.Event_Reset,this,onResetGame);
			Laya.stage.on(Event.MOUSE_DOWN,this,onScreenMouseDown);
			Laya.stage.on(Event.MOUSE_UP,this,onScreenMouseUp);


			_gameBg=new GameBGView();
			this.addChild(_gameBg);

			_player=new GamePlayer();
			this.addChild(_player);


			EventManager.getInstance().event(Constant.Event_Reset);
			EventManager.getInstance().event(Constant.Event_Start);
		}

		private function loop():void{
			_gameBg.update();
			_player.update();
		}

		private function onResetGame(e:Event):void{
			Laya.timer.clear(this,loop);
			_gameBg.reset();
			_player.reset();
			_isPause=true;
		}

		private function onGameStart(e:Event):void{
			_isPause=false;
			Laya.timer.frameLoop(1,this,loop);
		}

		private function onScreenMouseDown(e:Event):void{
			if(_isPause) return;
			if(e.stageX<Constant.ScreenW*0.5){
				_player.setForce(Constant.Force_Move,-3,0);
			}else{
				_player.setForce(Constant.Force_Move,3,0);
			}
		}

		private function onScreenMouseUp(e:Event):void{
			_player.removeForce(Constant.Force_Move);
		}
	}

}