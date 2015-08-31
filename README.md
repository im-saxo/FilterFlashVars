In Flash, flash.display.LoaderInfo.parameters is used to get some initial data on flash load, for example, the name of JS callback function to interact with.

The two sources of parameters are: the query string in the URL of the main SWF file, and the value of the FlashVars HTML parameter (this affects only the main SWF file).

The problem is that a bad person can inject ome JavaScript code via swf url, for example:
https://soroush.secproject.com/blog/2011/03/flash-externalinterface-call-javascript-injection-%E2%80%93-can-make-the-websites-vulnerable-to-xss/

Usage: link `FilterFlashVarsLibrary.swc` library from `bin` folder and use its`filterFlashVars` method.

See the [demo](http://im-saxo.github.io/FilterFlashVars/sources/filterFlashVarsExample/bin-release/filterFlashVarsExample.html)

