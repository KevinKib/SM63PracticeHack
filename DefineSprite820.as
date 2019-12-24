onEnterFrame = function()
{
   if(this.hitTest(_root._xmouse,_root._ymouse,true) && _parent.clicked !== true)
   {
      sc = 120;
   }
   else
   {
      sc = 100;
   }
   _xscale = _xscale + (sc - _xscale) / 2;
   _yscale = _xscale;
};
onMouseDown = function()
{
   if(sc == 120 && _parent.clicked !== true)
   {
      _xscale = 140;
      _yscale = 140;
      _parent.clicked = true;
      _root.starwarpframe = false;
      _root.Blackout();
      _parent.onEnterFrame = function()
      {
         if(_root.starwarpframe == true)
         {
            _root.newstar = true;
            _root.LastItemGot = "Exit";
            _root.ReturnToCastle();
         }
      };
   }
};
if((_root.TotalStars == 0 || _root.Star[41] == false && _root.BowserKey1 == true) && !_root.betaQuest.isStarted())
{
   onEnterFrame = null;
   onMouseDown = null;
   sc = 90;
   _xscale = 90;
   _yscale = 90;
   _alpha = 75;
   gotoAndStop(3);
}
else
{
   gotoAndStop(2);
}
