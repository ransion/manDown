package comp
{
	import laya.display.Sprite;
	import laya.display.Animation;
	import laya.utils.Dictionary;
	import laya.utils.Handler;
	import laya.events.Event;
	import laya.d3.core.render.IUpdate;

	/**
	 * ...
	 * @author
	 */
	public class GamePlayer extends Sprite{
		private var _anim:Animation;
		private var _forceArr:Array;
		private var _speedX:int;
		private var _speedY:int;
		private var _curActionID:int;


		public function GamePlayer(){
			init();
		}

		private function init():void{
			_forceArr=new Array();
			_anim=new Animation();
			_anim.loadAnimation("GamePlayerAnim.ani",Handler.create(this,onLoadAnim));
			_anim.pos(0,0);
			addChild(_anim);
		}

		public function reset():void{
			_speedX=0;
			_speedY=0;
			this.pos(100,100);
		}

		public function update():void{
			this.x+=_speedX;
			this.y+=_speedY;

			if(this.x<32){
				this.x=32;
			}else if(this.x>Constant.ScreenW-32){
				this.x=Constant.ScreenW-32;
			}
			var actionID:String=Constant.Anim_Player_Idle;
			if(_speedY!=0){
				actionID=Constant.Anim_Player_Fall;
			}else if(_speedX>0){
				actionID=Constant.Anim_Player_RunRight;
			}else if(_speedX<0){
				actionID=Constant.Anim_Player_RunLeft;
			}
			setAction(actionID);
		}

		private function setAction(actionID):void{
			if(actionID==_curActionID) return;
			_curActionID=actionID;
			_anim.play(0,true,actionID);
		}

		public function onLoadAnim(e:Event):void{
			setAction(Constant.Anim_Player_Idle);
		}

		public function setForce(type:int,speedX:int,speedY:int):void{
			_forceArr[type]=[speedX,speedY];
			caculateForce();
		}

		public function removeForce(type:int):void{
			_forceArr[type]=null;
			caculateForce();
		}

		private function caculateForce():void{
			var speedX:int=0;
			var speedY:int=0;
			for each(var dataArr:Array in _forceArr){
				if(dataArr!=null){
					speedX+=dataArr[0];
					speedY+=dataArr[1];
				}
			}
			_speedX=speedX;
			_speedY=speedY;
		}


	}

}