package
{
	import com.github.im_saxo.FilterFlashVars;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class filterFlashVarsExample extends Sprite
	{
		private var _text1:TextField;
		private var _text2:TextField;
		
		public function filterFlashVarsExample()
		{
			_text1 = new TextField();
			_text1.width = 300; 
			_text1.height = 500;
			_text1.border = true;
			_text1.borderColor = 0xff9999;
			_text1.text = "FlashVars without filter:";
			addChild(_text1);
			
			_text2 = new TextField();
			_text2.width = 300;
			_text2.height = 500;
			_text2.wordWrap = true;
			_text2.x = 320;
			_text2.border = true;
			_text2.borderColor = 0x99ff99;
			_text2.text = "Filtered flashVars:";
			addChild(_text2);
			
			_printObject(_text1, loaderInfo.parameters);
			_printObject(_text2, FilterFlashVars.filterFlashVars(loaderInfo.parameters, loaderInfo.url));
		}
		
		private function _addLine(tf:TextField, key:String, value:String):void {
			tf.appendText('\n' + key + ": " + (value || "<Empty>"));
		}
		
		private function _printObject (tf:TextField, obj:Object):void {
			for (var key:String in obj) {
				_addLine(tf, key, obj[key]);
			}
		}
		
	}
}
