/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class StartViewUI extends View {
		public var btnStart:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":400,"height":600},"child":[{"type":"Button","props":{"width":149,"var":"btnStart","skin":"comp/button.png","labelSize":20,"labelFont":"Arial","label":"开始游戏","height":51,"centerY":0,"centerX":0}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}