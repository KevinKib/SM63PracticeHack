radiansToAngle = function(a)
{
   a = 57.29577951308232 * a;
   return a;
};
angleToRadians = function(a)
{
   a = a / 180 * 3.141592653589793;
   return a;
};
groundFriction = function(a, b, c)
{
   if(a > 0)
   {
	  d = 1;
   }
   else
   {
	  d = -1;
   }
   a = Math.abs(a);
   a = a - b;
   if(a < 0)
   {
	  a = 0;
   }
   a = a / c;
   a = a * d;
   return a;
};
moveObject = function(a, b, c)
{
   c._x = c._x + a;
   c._y = c._y + b;
};
moveObjectFromAngle = function(a, b, c)
{
   c._x = c._x + Math.cos(angleToRadians(b)) * a;
   c._y = c._y + Math.sin(angleToRadians(b)) * a;
};
moveObjectFromRadians = function(a, b, c)
{
   c._x = c._x + Math.cos(b) * a;
   c._y = c._y + Math.sin(b) * a;
};
shuffleArray = function(a, b)
{
   d = a.push();
   i = 0;
   while(i < b)
   {
	  e = random(d);
	  f = random(d);
	  if(e !== f)
	  {
		 g = a[e];
		 a[e] = a[f];
		 a[f] = g;
	  }
	  i++;
   }
   return a;
};
_root.MoveAllPlats = function(Yamount, Xamount)
{
   Xamount = Math.round(Xamount * 10) / 10;
   Yamount = Math.round(Yamount * 10) / 10;
   if(Math.abs(Yamount) > 0.1 || Math.abs(Xamount) > 0.1)
   {
	  _root.Course.Platforms._y = _root.Course.Platforms._y + Yamount;
	  _root.Course.Platforms._x = _root.Course.Platforms._x + Xamount;
	  _root.Course.BPlatforms._y = _root.Course.BPlatforms._y + Yamount;
	  _root.Course.BPlatforms._x = _root.Course.BPlatforms._x + Xamount;
	  _root.Course.FrontGFX._y = _root.Course.FrontGFX._y + Yamount;
	  _root.Course.FrontGFX._x = _root.Course.FrontGFX._x + Xamount;
	  _root.Course.BackGFX._y = _root.Course.BackGFX._y + Yamount;
	  _root.Course.BackGFX._x = _root.Course.BackGFX._x + Xamount;
	  _root.Course.Water._y = _root.Course.Water._y + Yamount;
	  _root.Course.Water._x = _root.Course.Water._x + Xamount;
	  _root.Course.Lava._y = _root.Course.Lava._y + Yamount;
	  _root.Course.Lava._x = _root.Course.Lava._x + Xamount;
	  _root.Course.Puddle._y = _root.Course.Puddle._y + Yamount;
	  _root.Course.Puddle._x = _root.Course.Puddle._x + Xamount;
	  _root.Course.Ice._y = _root.Course.Ice._y + Yamount;
	  _root.Course.Ice._x = _root.Course.Ice._x + Xamount;
	  _root.Course.Edge._y = _root.Course.Edge._y + Yamount;
	  _root.Course.Edge._x = _root.Course.Edge._x + Xamount;
	  _root.Course.CamEdge._y = _root.Course.CamEdge._y + Yamount;
	  _root.Course.CamEdge._x = _root.Course.CamEdge._x + Xamount;
	  _root.BGCourse.BG._y = _root.BGCourse.BG._y + Yamount / 10;
	  _root.BGCourse.BG._x = _root.BGCourse.BG._x + Xamount / 10;
	  _root.MidBackground.BG._y = _root.MidBackground.BG._y + Yamount / 5;
	  _root.MidBackground.BG._x = _root.MidBackground.BG._x + Xamount / 5;
	  _root.BGCloseCourse.BG._y = _root.BGCloseCourse.BG._y + Yamount / 2;
	  _root.BGCloseCourse.BG._x = _root.BGCloseCourse.BG._x + Xamount / 2;
	  _root.Course.Char._y = _root.Course.Char._y + Yamount;
	  _root.Course.Char._x = _root.Course.Char._x + Xamount;
	  _root.Course.Enemyhurt._y = _root.Course.Enemyhurt._y + Yamount;
	  _root.Course.Enemyhurt._x = _root.Course.Enemyhurt._x + Xamount;
   }
};
_root.KeyUP = function()
{
   if(_root.WiiMode == true)
   {
	  if(_root.mousemoveY + Math.abs(_root.mousemoveX / 2) < -30 && _root.pointer._y < 150 || _root.pointer._y < 75)
	  {
		 return true;
	  }
	  return false;
   }
   if(Key.isDown(38))
   {
	  return true;
   }
   return false;
};
_root.KeyDOWN = function()
{
   if(_root.WiiMode == true)
   {
	  if(_root.mousemoveY - Math.abs(_root.mousemoveX / 2) > 30 && _root.pointer._y > 150 || _root.pointer._y > 200)
	  {
		 return true;
	  }
	  return false;
   }
   if(Key.isDown(40))
   {
	  return true;
   }
   return false;
};
_root.KeyLEFT = function()
{
   if(_root.WiiMode == true)
   {
	  if(_root.pointer._x < _root.screensizeX / 2 - _root.screensizeX / 5 || _root.mousemoveX < -15 && _root.pointer._x < _root.screensizeX / 2 - _root.screensizeX / 6 || _root.mousemoveX < -40 && _root.pointer._x < _root.screensizeX / 2 + _root.screensizeX / 8)
	  {
		 return true;
	  }
	  return false;
   }
   if(Key.isDown(37))
   {
	  return true;
   }
   return false;
};
_root.KeyRIGHT = function()
{
   if(_root.WiiMode == true)
   {
	  if(_root.pointer._x > _root.screensizeX / 2 + _root.screensizeX / 5 || _root.mousemoveX > 15 && _root.pointer._x > _root.screensizeX / 2 + _root.screensizeX / 6 || _root.mousemoveX > 40 && _root.pointer._x > _root.screensizeX / 2 - _root.screensizeX / 8)
	  {
		 return true;
	  }
	  return false;
   }
   if(Key.isDown(39))
   {
	  return true;
   }
   return false;
};
_root.KeyTapRIGHT = function()
{
   if(_root.WiiMode == true)
   {
	  if(_root.pointer._x > _root.screensizeX / 2 + _root.screensizeX / 8 || _root.mousemoveX > 7 && _root.pointer._x > _root.screensizeX / 2 + _root.screensizeX / 8 || _root.mousemoveX > 30 && _root.pointer._x > _root.screensizeX / 2 - _root.screensizeX / 7)
	  {
		 return true;
	  }
	  return false;
   }
};
_root.KeyTapLEFT = function()
{
   if(_root.WiiMode == true)
   {
	  if(_root.pointer._x < _root.screensizeX / 2 - _root.screensizeX / 8 || _root.mousemoveX > 7 && _root.pointer._x < _root.screensizeX / 2 - _root.screensizeX / 8 || _root.mousemoveX > 30 && _root.pointer._x < _root.screensizeX / 2 - _root.screensizeX / 7)
	  {
		 return true;
	  }
	  return false;
   }
};
_root.KeyTapDOWN = function()
{
   if(Key.isDown(222))
   {
	  return true;
   }
   return false;
};
_root.KeyTapUP = function()
{
   if(Key.isDown(186))
   {
	  return true;
   }
   return false;
};
_root.KeySPACE = function()
{
   if(_root.WiiMode == true)
   {
	  if(_root.MouseDown == true)
	  {
		 return true;
	  }
	  return false;
   }
   if(Key.isDown(67) || Key.isDown(32))
   {
	  return true;
   }
   return false;
};
_root.KeyMinus = function()
{
   if(Key.isDown(34) || Key.isDown(189))
   {
	  return true;
   }
   return false;
};
_root.KeyPlus = function()
{
   if(Key.isDown(33) || Key.isDown(187))
   {
	  return true;
   }
   return false;
};
_root.KeyHome = function()
{
   if(_root.WiiMode == true)
   {
	  if(Key.isDown(80))
	  {
		 return true;
	  }
	  return false;
   }
   if(Key.isDown(80))
   {
	  return true;
   }
   return false;
};
_root.KeySHIFT = function()
{
   if(Key.isDown(16))
   {
	  return true;
   }
   return false;
};
_root.KeySPIN = function()
{
   if(Key.isDown(88))
   {
	  return true;
   }
   return false;
};
_root.KeyX = function()
{
   if(Key.isDown(88))
   {
	  return true;
   }
   return false;
};
_root.KeyZ = function()
{
   if(Key.isDown(90))
   {
	  return true;
   }
   return false;
};

// More keys
_root.KeyStar = function()
{
   if(Key.isDown(106))
   {
	  return true;
   }
   return false;
};
_root.KeySlash = function()
{
   if(Key.isDown(111))
   {
	  return true;
   }
   return false;
};
_root.Key1 = function()
{
   if(Key.isDown(49))
   {
	  return true;
   }
   return false;
};
_root.Key2 = function()
{
   if(Key.isDown(50))
   {
	  return true;
   }
   return false;
};
_root.Key3 = function()
{
   if(Key.isDown(51))
   {
	  return true;
   }
   return false;
};
_root.Key4 = function()
{
   if(Key.isDown(52))
   {
	  return true;
   }
   return false;
};
_root.Key5 = function()
{
   if(Key.isDown(53))
   {
	  return true;
   }
   return false;
};
_root.Key6 = function()
{
   if(Key.isDown(54))
   {
	  return true;
   }
   return false;
};
_root.Key7 = function()
{
   if(Key.isDown(55))
   {
	  return true;
   }
   return false;
};
_root.Key8 = function()
{
   if(Key.isDown(56))
   {
	  return true;
   }
   return false;
};
_root.Key9 = function()
{
   if(Key.isDown(57))
   {
	  return true;
   }
   return false;
};
_root.Key0 = function()
{
   if(Key.isDown(48))
   {
	  return true;
   }
   return false;
};
_root.KeyBackspace = function()
{
   if(Key.isDown(8))
   {
	  return true;
   }
   return false;
};
_root.KeyEnter = function()
{
   if(Key.isDown(13))
   {
	  return true;
   }
   return false;
};

_root.ChangeFludd = function()
{
   tellTarget(_root.Course.Char)
   {
	  fluddchanged = false;
	  if(_root.Fluddpow == "")
	  {
		 if(changeFludd == true && (_root.FluddArray[_root.Playinglevel][1] == true || _root.SaveFluddH == true))
		 {
			_root.Fluddpow = "H";
			fluddchanged = true;
		 }
		 else if(changeFludd == true && (_root.FluddArray[_root.Playinglevel][2] == true || _root.SaveFluddR == true))
		 {
			_root.Fluddpow = "R";
			fluddchanged = true;
		 }
		 else if(changeFludd == true && (_root.FluddArray[_root.Playinglevel][3] == true || _root.SaveFluddT == true))
		 {
			_root.Fluddpow = "T";
			fluddchanged = true;
		 }
	  }
	  else if(_root.Fluddpow == "H")
	  {
		 if(changeFludd == true && (_root.FluddArray[_root.Playinglevel][2] == true || _root.SaveFluddR == true))
		 {
			_root.Fluddpow = "R";
			fluddchanged = true;
		 }
		 else if(changeFludd == true && (_root.FluddArray[_root.Playinglevel][3] == true || _root.SaveFluddT == true))
		 {
			_root.Fluddpow = "T";
			fluddchanged = true;
		 }
		 else if(changeFludd == true)
		 {
			_root.Fluddpow = "";
			fluddchanged = true;
		 }
	  }
	  else if(_root.Fluddpow == "R")
	  {
		 if(changeFludd == true && (_root.FluddArray[_root.Playinglevel][3] == true || _root.SaveFluddT == true))
		 {
			_root.Fluddpow = "T";
			fluddchanged = true;
		 }
		 else if(changeFludd == true)
		 {
			_root.Fluddpow = "";
			fluddchanged = true;
		 }
	  }
	  else if(_root.Fluddpow == "T")
	  {
		 if(changeFludd == true)
		 {
			_root.Fluddpow = "";
			fluddchanged = true;
		 }
	  }
	  if(fluddchanged == true)
	  {
		 _root.Mariosound = new Sound(this);
		 _root.Mariosound.attachSound("FluddSwitch");
		 _root.Mariosound.start(0,1);
		 _root.Mariosound.setVolume(_root.MarioVolume);
	  }
   }
};