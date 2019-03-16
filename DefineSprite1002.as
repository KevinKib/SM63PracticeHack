stop();
if(invis == undefined)
{
   invis = false;
}
if(LevelDesigner == undefined)
{
   LevelDesigner = false;
}
if(firstrun == undefined)
{
   if(LevelDesigner == true)
   {
	  trace(_root.LDRedCoin);
	  if(_root.LDRedCoin > 0 || _root.LDSilverStar > 0)
	  {
		 invis = true;
	  }
   }
   firstrun = true;
}
onEnterFrame = function()
{
   if(invis == false)
   {
	  if(_root.Star[starnum] == true)
	  {
		 if(alternateoldframe !== true)
		 {
			gotoAndStop(2);
		 }
		 else
		 {
			_alpha = 50;
			gotoAndStop(1);
		 }
	  }
	  else
	  {
		 gotoAndStop(1);
	  }
	  if(this.box.hitTest(_root.Course.Char._x * _root.coursescale / 100 + _root.Course._x,(_root.Course.Char._y - 20) * _root.coursescale / 100 + _root.Course._y,true))
	  {
		 if(LevelDesigner !== true)
		 {
			if(_root.Star[starnum] == false)
			{
			   _root.Star[starnum] = true;
			   _root.LastItemGot = "gotStar";
			}
			else
			{
			   _root.LastItemGot = "oldStar";
			}
			_root.newstar = true;
			_root.lastPlayinglevel = _root.Playinglevel;
			_root.lastStarnamenum = starnum;
		 }
		 _root.Invincible = false;
		 _root.Metal = false;
		 _root.Invisible = false;
		 _root.PowerTimer = 0;
		 _root.Course.Char.attack = true;
		 _root.Course.Char.attackFrame = "Star";
		 _root.Course.Char.xspeed = 0;
		 _root.Course.Char.yspeed = _root.Course.Char.yspeed / 2;
		 _root.Course.Char._x = _X + _parent._x;
		 _root.Course.Char._y = _Y + _parent._y + 20 * _root.coursescale / 100;
		 gotoAndStop("Gone");
	  }
   }
   else
   {
	  gotoAndStop("Invis");
   }
};
if(invis == false)
{
   if(_root.Star[starnum] == true)
   {
	  if(alternateoldframe !== true)
	  {
		 gotoAndStop(2);
	  }
	  else
	  {
		 _alpha = 50;
		 gotoAndStop(1);
	  }
   }
   else
   {
	  gotoAndStop(1);
   }
}
else
{
   gotoAndStop(3);
}