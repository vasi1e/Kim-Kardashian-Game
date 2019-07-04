package{	import flash.display.Sprite;	import flash.display.MovieClip;	import flash.display.Shape;	import flash.display.DisplayObject;	import flash.events.*;	
		//sprites are just movieclips without any frames in them	public class Enemy extends MovieClip{		//_root will signify the root of the document		private var _root:Object;		//how quickly the enemy can move		private var speed:Number;		//-1 is left, 1 is right		private var direction:int;		
		var mcCamera:MovieClip = new Symbol2();
				public function Enemy(){
			//this code will only be run once
			addEventListener(Event.ADDED, beginClass);
			//this code will constantly be run
			addEventListener(Event.ENTER_FRAME, eFrame);
			addChild(mcCamera);
		}				private function beginClass(event:Event):void{			//defining the root of the document			_root = MovieClip(root);			//defining the movement variables of the enemy			speed = 3;			direction = 1;
			var mcCamera:MovieClip = new Symbol2();			mcCamera.addEventListener(Event.ENTER_FRAME, eFrame);
		}				
				private function eFrame(event:Event):void{			//MOVING THE ENEMY			this.x += speed * direction;			//checking if touching any invisible markers			for(var i:int=0;i<_root.invisMarkerHolder.numChildren;i++){				//the process is very similar to the main guy's testing with other elements				var targetMarker:DisplayObject = _root.invisMarkerHolder.getChildAt(i);				if(hitTestObject(targetMarker)){					direction *= -1;					this.x += speed * direction;				}			}			//TOUCHING THE MAIN CHARACTER			if(this.hitTestObject(_root.mcMain)){				//if it touches the main guy while he's jumping				//and the guy is falling down, not jumping up				if(_root.mainJumping && _root.jumpSpeed > 0){					//kill this guy					this.parent.removeChild(this);					//and remove listners					this.removeEventListener(Event.ENTER_FRAME, eFrame);					//and update score									} else {					//otherwise, kill the main character					_root.resetLvl();				}			}		}
			}}
