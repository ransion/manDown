package comp
{
	import laya.display.Sprite;
	import ui.GameMapBGUI;

	/**
	 * ...
	 * @author
	 */
	public class GameBGView extends GameMapBGUI{
		public function GameBGView(){

		}

		public function reset():void{
			this.y=0;
			bg1.y=0;
			bg2.y=Constant.ScreenH;
		}

		public function update():void{
			this.y+=1;
            //如果背景图到了下面不可见，立即调整位置到上方继续循环
            if (bg1.y + this.y >= Constant.ScreenH) 
            { 
                bg1.y -= Constant.ScreenH * 2;
            }
            if (bg2.y + this.y >= Constant.ScreenH) 
            {
                bg2.y -= Constant.ScreenH * 2;
            }
		}
	}
}