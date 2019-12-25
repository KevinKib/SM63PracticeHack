// Key code
stop();
count = 0;
onEnterFrame = function()
{
   if(count > 3 && _root.Course.Char.air == false)
   {
      if(this.box.hitTest(_root.Course.Char.charClip.body) || this.box.hitTest(_root.Course.Char._x * _root.coursescale / 100 + _root.Course._x,(_root.Course.Char._y - 15) * _root.coursescale / 100 + _root.Course._y,true))
      {
          _root.event.onKeyCollected();
         if(_root[key] !== true)
         {
            _root.Course.Char.attack = true;
            _root.Course.Char.attackFrame = "Key";
            _root.heldItemObtained = key;
            _root.lastPlayinglevel = _root.Playinglevel;
            if(key == "BowserKeyA")
            {
               _root.LastItemGot = "BowserKey1";
            }
            if(key == "BowserKeyB")
            {
               _root.LastItemGot = "BowserKey2";
               _root.heldItemMessage = "CONGRATULATIONS!\rYou have obtained the 2nd Bowser Key.  Now the Upper Rooms of the Castle are unlocked!";
            }
         }
         if(key == "BowserKeyA")
         {
            _root.BowserKey1 = true;
         }
         if(key == "BowserKeyB")
         {
            _root.BowserKey2 = true;
         }
         gotoAndStop(4);
      }
   }
   else
   {
      count++;
   }
};
if(key == "BowserKeyA")
{
   gotoAndStop(2);
}
if(key == "BowserKeyB")
{
   gotoAndStop(3);
}
