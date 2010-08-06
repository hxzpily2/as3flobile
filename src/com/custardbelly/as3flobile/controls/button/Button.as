/**
 * <p>Original Author: toddanderson</p>
 * <p>Class File: Button.as</p>
 * <p>Version: 0.1</p>
 *
 * <p>Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:</p>
 *
 * <p>The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.</p>
 *
 * <p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.</p>
 *
 * <p>Licensed under The MIT License</p>
 * <p>Redistributions of files must retain the above copyright notice.</p>
 */
package com.custardbelly.as3flobile.controls.button
{
	import com.custardbelly.as3flobile.controls.core.AS3FlobileComponent;
	import com.custardbelly.as3flobile.controls.label.Label;
	import com.custardbelly.as3flobile.skin.ButtonSkin;
	import com.custardbelly.as3flobile.skin.ISkin;
	import com.custardbelly.as3flobile.skin.Skin;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.engine.ElementFormat;
	import flash.text.engine.FontDescription;
	
	/**
	 * Button is a component that renders a graphic and textual display to represent an interactable object. 
	 * @author toddanderson
	 */
	public class Button extends AS3FlobileComponent
	{
		protected var _buttonDisplay:Sprite;
		protected var _labelDisplay:Label;
		
		protected var _label:String;
		protected var _padding:int = 5;
		
		/**
		 * Constructor.
		 */
		public function Button()
		{
			super();
			
			initialize();
			createChildren();
			
			initializeDisplay();
			updateDisplay();
			
			mouseChildren = false;
		}
		
		/**
		 * @private 
		 * 
		 * Initializes any necessary values.
		 */
		protected function initialize():void
		{
			_width = 100;
			_height = 48;
			
			_skin = new ButtonSkin();
			_skin.target = this;
		}
		
		/**
		 * @private
		 * 
		 * Creates any necessary display children.
		 */
		protected function createChildren():void
		{
			_buttonDisplay = new Sprite();
			addChild( _buttonDisplay );
			
			_labelDisplay = new Label();
			_labelDisplay.autosize = true;
			_labelDisplay.multiline = true;
			addChild( _labelDisplay );
		}
		
		/**
		 * @private 
		 * 
		 * Initialize the display using newly created members and properties.
		 */
		protected function initializeDisplay():void
		{
			_skin.initializeDisplay( _width, _height );
		}
		
		/**
		 * @private 
		 * 
		 * Redraws any display content.
		 */
		protected function updateDisplay():void
		{
			_skin.updateDisplay( width, height );
		}
		
		/**
		 * @private 
		 * 
		 * Invalidates the label text for the label display.
		 */
		protected function invalidateLabel():void
		{
			_labelDisplay.text = _label;
			updateDisplay();
		}
		
		/**
		 * @inherit
		 */
		override public function dispose():void
		{
			super.dispose();
			
			while( numChildren > 0 )
				removeChildAt( 0 );
		}
		
		/**
		 * Accessor/Modifier for the textual display of the label. 
		 * @return String
		 */
		public function get label():String
		{
			return _label;
		}
		public function set label( value:String ):void
		{
			if( _label == value ) return;
			
			_label = value;
			invalidateLabel();
		}
		
		/**
		 * Accessor/Modifier for the padding offset for the label display. 
		 * @return int
		 */
		public function get labelPadding():int
		{
			return _padding;
		}
		public function set labelPadding( value:int ):void
		{
			if( _padding == value ) return;
			
			_padding = value;
			updateDisplay();
		}
		
		/**
		 * Accessor for the label display that can be used in skinning process. 
		 * @return Label
		 */
		public function get labelDisplay():Label
		{
			return _labelDisplay;
		}
		
		/**
		 * Accessor for the buttonDisplay that can be used in the skinning process. 
		 * @return Sprite
		 */
		public function get buttonDisplay():Sprite
		{
			return _buttonDisplay;
		}
	}
}