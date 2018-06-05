/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class GameMapBGUI extends View {
		public var bg1:Image;
		public var bg2:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":400,"height":1200},"child":[{"type":"Image","props":{"y":0,"x":0,"width":400,"var":"bg1","skin":"background.png","height":600}},{"type":"Image","props":{"y":600,"x":0,"width":400,"var":"bg2","skin":"background.png","height":600}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}