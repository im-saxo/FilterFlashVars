package com.github.im_saxo
{
	public final class FilterFlashVars
	{
		
		/**
		 * Remove parameters from url query and return only non-empty parameters from flashVars.
		 * @param flashVars Object - loaderInfo.parameters
		 * @param url String - loaderInfo.url
		 * @return Object filtered flashVars
		 * 
		 */
		public static function filterFlashVars (flashVars:Object, url:String):Object {
			var result:Object = {},
				query:Object = _getQuery(url);
			
			for (var key:String in flashVars) {
				if (flashVars[key] && (!query.hasOwnProperty(key) || flashVars[key] != decodeURI(query[key])) ) {
					// there isn't this parameter in query or its value isn't the same as query's one.
					result[key] = flashVars[key];
				}
			}
			
			return result;
		}

		/**
		 * Parse url and return query object.
		 * @param url String
		 * @return Object 
		 * 
		 */
		private static function _getQuery (url:String):Object {
			var query:Object = {},
				queryIndex:int = url.indexOf('?');
			
			if (queryIndex > -1) {
				var queryString:String = url.substring(queryIndex + 1),
					params:Array = queryString.split("&"),
					paramParts:Array,
					key: String;
				params.forEach(function (param:String, index:int, array:Array):void {
					if (param.length) {
						paramParts = param.split("=");
						try {
							key = decodeURIComponent(paramParts[0]);
						}
						catch (e:*) {
							key = paramParts[0].replace(/%[abcdef\d]?./g, '');
						}
						query[key] = paramParts.length == 2 ? paramParts[1] : null;
					}
				});
			}

			return query;
		}

		public function FilterFlashVars()
		{
		}
	}
}
