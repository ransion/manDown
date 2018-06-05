package {
	import laya.net.Loader;
	import laya.net.ResourceVersion;
	import laya.utils.Handler;
	import laya.wx.mini.MiniAdpter;
	import laya.webgl.WebGL;
	import view.StartView;
	import laya.events.Event;
	import view.GameView;
	import laya.events.EventDispatcher;
	import laya.display.Stage;
	
	public class Main {
		private var startView:StartView;
		private var gameView:GameView;

		public function Main() {
			//初始化微信小游戏
			MiniAdpter.init();

			//初始化引擎
			Laya.init(Constant.ScreenW, Constant.ScreenH,WebGL);
			Laya.stage.alignH = Stage.ALIGN_CENTER;
			Laya.stage.alignV = Stage.ALIGN_MIDDLE;
			Laya.stage.screenMode = Stage.SCREEN_VERTICAL;
			Laya.stage.scaleMode = Stage.SCALE_SHOWALL;

			//激活资源版本控制
            ResourceVersion.enable("version.json", Handler.create(this, beginLoad), ResourceVersion.FILENAME_VERSION);
		}
		
		private function beginLoad():void {
			//加载引擎需要的资源
			var url:Array=new Array();
			url.push("res/atlas/comp.atlas");
			url.push("res/atlas/gameRes.atlas");
			Laya.loader.load(url, Handler.create(this, onLoaded));
		}

		
		private function onLoaded(isComplete:Boolean):void {
			if(isComplete){
				EventManager.getInstance().once(Constant.Event_Start,this,onGameStart);

				//实例UI界面
				startView = new StartView();
				Laya.stage.addChild(startView);
				EventManager.getInstance().event(Constant.Event_Res_Ready);
			}else{
				trace("Load Fail");
			}
		}

		private function onGameStart(e:Event):void{
			Laya.stage.removeChild(startView);
			gameView=new GameView();
			Laya.stage.addChild(gameView);

		}
	}
}