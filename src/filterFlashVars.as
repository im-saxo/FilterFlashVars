package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class filterFlashVars extends Sprite
	{
		private var _text1:TextField;
		private var _text2:TextField;
		
		public function filterFlashVars()
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
			_printObject(_text2, _filterFlashVars(loaderInfo.parameters, loaderInfo.url));
			
		}
		
		/**
		 * Remove parameters from url query and return only parameters from flashVars.
		 * @param flashVars - loaderInfo.parameters
		 * @param url loaderInfo.url
		 * @return Object filtered flashVars
		 * 
		 */		
		private function _filterFlashVars (flashVars:Object, url:String):Object {
			var result:Object = {},
				query:Object = _getQuery(url);
			
			for (var key:String in flashVars) {
				if (!query.hasOwnProperty(key) || flashVars[key] != decodeURI(query[key]) ) {
					// there isn't this parameter in query or its value isn't the same as query's one.
					result[key] = flashVars[key];
				}
			}
			
			return result;
		}
		
		private function _getQuery (url:String):Object {
			var query:Object = {},
				queryIndex:int = url.indexOf('?');
			
			if (queryIndex > -1) {
				var queryString:String = url.substring(queryIndex + 1),
					params:Array = queryString.split("&"),
					paramParts:Array;
				params.forEach(function (param:String, index:int, array:Array):void {
					if (param.length) {
						paramParts = param.split("=");
						query[paramParts[0]] = paramParts.length == 2 ? paramParts[1] : null;
					}
				});
			}
			
			return query;
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