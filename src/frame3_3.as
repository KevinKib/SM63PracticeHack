_root.ZoomoutCam = function()
{
   _root.nullCam = true;
   _root.coursescale2 = _root.coursescale2 - 7;
   _root.coursescale2 = _root.coursescale2 * 0.9;
   _root.MoveAllPlats(3,0);
};
_root.MarioHit = function(a, b, c, d, e, f, g)
{
   if(_root.Course.Char.blink <= 0 && _root.Invincible !== true && _root.Invisible !== true && _root.CharHP >= 1 && !(attack == true && attackFrame == "Fall" && attackFrame == "Respawn" && attackFrame == "Faint" && attackFrame == "Drown") && _root.playpause == false)
   {
      _root.Course.Char.hurt = true;
      _root.Course.Char.attack = false;
      _root.Course.Char.blink = b;
      _root.CharHP = _root.CharHP - a;
      _root.hpcoincount = 0;
      if(a > 0)
      {
         _root.Course.Char.yspeed = _root.Course.Char.yspeed * 0.5;
         _root.Course.Char.xspeed = _root.Course.Char.xspeed * 0.5;
         _root.Course.Char.divewaitcount = 7;
      }
      else
      {
         _root.Course.Char.yspeed = _root.Course.Char.yspeed + c;
         _root.Course.Char.xspeed = _root.Course.Char.xspeed + d;
      }
      if(a > 0)
      {
         _root.Course.Char.attack = true;
         if(_root.CharHP <= 0)
         {
            if(_root.CurrentPlayer == "Mario")
            {
               _root.Mariosound = new Sound(this);
               _root.Mariosound.attachSound("Mario - Ohhhhh");
               _root.Mariosound.start(0,1);
               _root.Mariosound.setVolume(_root.MarioVolume);
            }
            else if(_root.CurrentPlayer == "Luigi")
            {
               _root.Mariosound = new Sound(this);
               _root.Mariosound.attachSound("Luigi - Faint");
               _root.Mariosound.start(0,1);
               _root.Mariosound.setVolume(_root.MarioVolume);
            }
         }
         if(g == true)
         {
            _root.Course.Char.yspeed = _root.Course.Char.yspeed + c;
            _root.Course.Char.xspeed = _root.Course.Char.xspeed + d;
            if(_root.Course.Char.xspeed * _root.Course.Char._xscale / 100 < 0)
            {
               _root.Course.Char.attackFrame = "hurt3";
            }
            else
            {
               _root.Course.Char.attackFrame = "hurt2";
            }
         }
         else
         {
            _root.Course.Char.setYspeed = c;
            _root.Course.Char.setXspeed = d;
            _root.Course.Char.attackFrame = "hurt1";
         }
      }
      if(e > 0)
      {
         _root.Course.Char.StunTime = e;
      }
      if(f !== "none" && _root.CharHP > 0)
      {
         if(f !== undefined && f !== "")
         {
            _root.Mariosound = new Sound(this);
            _root.Mariosound.attachSound(f);
            _root.Mariosound.start(0,1);
            _root.Mariosound.setVolume(_root.MarioVolume);
         }
         else
         {
            _root.Mariosound = new Sound(this);
            if(_root.CurrentPlayer == "Mario")
            {
               randomnum = random(2) + 1;
               if(randomnum == 1)
               {
                  _root.Mariosound.attachSound("Mario - Doh");
               }
               else if(randomnum == 2)
               {
                  _root.Mariosound.attachSound("Mario - Uh");
               }
               else if(randomnum == 3)
               {
               }
            }
            else if(_root.CurrentPlayer == "Luigi")
            {
               randomnum = random(2) + 1;
               if(randomnum == 1)
               {
                  _root.Mariosound.attachSound("Lugi - Owowow!");
               }
               else if(randomnum == 2)
               {
                  _root.Mariosound.attachSound("Luigi - Wah!");
               }
               else if(randomnum == 3)
               {
               }
            }
            _root.Mariosound.start(0,1);
            _root.Mariosound.setVolume(_root.MarioVolume);
         }
      }
   }
};
_root.Blackout = function()
{
   _root.attachMovie("Blackout","Transition",_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
};
_root.Blackin = function()
{
   _root.attachMovie("StarIn","Transition",_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
};
_root.Whiteout = function()
{
   _root.attachMovie("Whiteout","Transition",_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
};
_root.GetStarMusic1 = function()
{
   _root.StopBGsong();
   _root.bgsong.stop();
   _root.bgsong = new Sound(this);
   _root.bgsong.attachSound("Star Swish");
   _root.bgsong.start(0,1);
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.GetStarMusic2 = function()
{
   _root.bgsong = new Sound(this);
   _root.bgsong.attachSound("GetStar");
   _root.bgsong.start(0,1);
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.GetKeyMusic = function()
{
   _root.StopBGsong();
   _root.bgsong.stop();
   _root.bgsong = new Sound(this);
   _root.bgsong.attachSound("mario-gotkey");
   _root.bgsong.start(0,1);
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.PaintingSound = function()
{
   _root.bgsong.stop();
   _root.bgsong = new Sound(this);
   _root.bgsong.attachSound("enter-painting");
   _root.bgsong.start(0,1);
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.PaintingSound2 = function()
{
   _root.bgsong.stop();
   _root.bgsong = new Sound(this);
   _root.bgsong.attachSound("exit-painting");
   _root.bgsong.start(0,1);
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.StopBGsong = function()
{
   _root.bgsong.stop();
   _root.bgsong = new Sound(this);
   _root.bgsong.start(0,1);
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.StartBossMusic = function()
{
   _root.bgsong = new Sound();
   _root.bgsong.attachSound("Boss Music");
   if(_root.MuteBGMusic == false)
   {
      _root.bgsong.start(0,999);
   }
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.StartBoss64Music = function()
{
   _root.bgsong = new Sound();
   _root.bgsong.attachSound("Boss Music 64 - Intro");
   if(_root.MuteBGMusic == false)
   {
      _root.bgsong.start(0,1);
   }
   _root.bgsong.setVolume(_root.BgVolume);
   _root.bgsong.onSoundComplete = function()
   {
      _root.bgsong.attachSound("Boss Music 64 - Repeat");
      if(_root.MuteBGMusic == false)
      {
         _root.bgsong.start(0,999);
      }
      _root.bgsong.setVolume(_root.BgVolume);
   };
};
_root.PlayMusicAndIntro = function()
{
   if(_root.SongIntro !== undefined && _root.SongIntro !== "None")
   {
      _root.StopBGsong();
      _root.bgsong.stop();
      _root.bgsong = new Sound(this);
      _root.bgsong.attachSound(_root.SongIntro);
      if(_root.MuteBGMusic == false)
      {
         _root.bgsong.start(0,1);
      }
      _root.bgsong.setVolume(_root.BgVolume);
      _root.bgsong.onSoundComplete = function()
      {
         _root.bgsong.attachSound(_root.SongRepeat);
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,999);
         }
         _root.bgsong.setVolume(_root.BgVolume);
      };
   }
   else
   {
      _root.StopBGsong();
      _root.bgsong.stop();
      _root.bgsong = new Sound(this);
      _root.bgsong.attachSound(_root.SongRepeat);
      if(_root.MuteBGMusic == false)
      {
         _root.bgsong.start(0,999);
      }
      _root.bgsong.setVolume(_root.BgVolume);
      _root.bgsong.onSoundComplete = function()
      {
         _root.bgsong.attachSound(_root.SongRepeat);
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,999);
         }
         _root.bgsong.setVolume(_root.BgVolume);
      };
   }
};
_root.StartNewMusicAndIntroNoVar = function(a, b)
{
   _root.StopBGsong();
   if(b !== undefined)
   {
      _root.bgsong.stop();
      _root.bgsong = new Sound(this);
      _root.bgsong.attachSound(a);
      if(_root.MuteBGMusic == false)
      {
         _root.bgsong.start(0,1);
      }
      _root.bgsong.setVolume(_root.BgVolume);
      _root.bgsong.onSoundComplete = function()
      {
         _root.bgsong.attachSound(b);
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,999);
         }
         _root.bgsong.setVolume(_root.BgVolume);
      };
   }
   else
   {
      _root.bgsong.stop();
      _root.bgsong = new Sound(this);
      _root.bgsong.attachSound(a);
      if(_root.MuteBGMusic == false)
      {
         _root.bgsong.start(0,999);
      }
      _root.bgsong.setVolume(_root.BgVolume);
      _root.bgsong.onSoundComplete = function()
      {
         _root.bgsong.attachSound(a);
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,999);
         }
         _root.bgsong.setVolume(_root.BgVolume);
      };
   }
};
_root.HazymazeCaveSongChange = function(a)
{
   _root.Invincible = false;
   _root.Metal = false;
   _root.Invisible = false;
   _root.WingCap = false;
   _root.PowerTimer = 0;
   timeinsong = _root.bgsong.position / 1000;
   _root.bgsong.stop();
   _root.bgsong = new Sound(this);
   _root.SongIntro = "None";
   if(a == 1)
   {
      _root.bgsong.attachSound("HazyMazeCave-Haze");
      _root.bgsong.onSoundComplete = function()
      {
         _root.bgsong.attachSound("HazyMazeCave-Haze");
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,999);
         }
         _root.bgsong.setVolume(_root.BgVolume);
      };
   }
   else
   {
      _root.bgsong.attachSound("HazyMazeCave-Rock");
      _root.bgsong.onSoundComplete = function()
      {
         _root.bgsong.attachSound("HazyMazeCave-Rock");
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,999);
         }
         _root.bgsong.setVolume(_root.BgVolume);
      };
   }
   if(_root.MuteBGMusic == false)
   {
      _root.bgsong.start(timeinsong,1);
   }
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.BuoyBaseSongChange = function(a)
{
   _root.Invincible = false;
   _root.Metal = false;
   _root.Invisible = false;
   _root.WingCap = false;
   _root.PowerTimer = 0;
   timeinsong = _root.bgsong.position / 1000;
   _root.bgsong.stop();
   _root.bgsong = new Sound(this);
   if(_root.PlayingIntro == false)
   {
      _root.SongIntro = "None";
      if(a == 1)
      {
         _root.bgsong.attachSound("BuoyBaseGalaxy(Wet)-Repeat");
         _root.bgsong.onSoundComplete = function()
         {
            _root.bgsong.attachSound("BuoyBaseGalaxy(Wet)-Repeat");
            if(_root.MuteBGMusic == false)
            {
               _root.bgsong.start(0,999);
            }
            _root.bgsong.setVolume(_root.BgVolume);
         };
      }
      else
      {
         _root.bgsong.attachSound("BuoyBaseGalaxy(Dry)-Repeat");
         _root.bgsong.onSoundComplete = function()
         {
            _root.bgsong.attachSound("BuoyBaseGalaxy(Dry)-Repeat");
            if(_root.MuteBGMusic == false)
            {
               _root.bgsong.start(0,999);
            }
            _root.bgsong.setVolume(_root.BgVolume);
         };
      }
   }
   else if(a == 1)
   {
      _root.bgsong.attachSound("BuoyBaseGalaxy(Wet)-Intro");
      _root.bgsong.onSoundComplete = function()
      {
         _root.PlayingIntro = false;
         _root.bgsong.attachSound("BuoyBaseGalaxy(Wet)-Repeat");
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,999);
         }
         _root.bgsong.setVolume(_root.BgVolume);
      };
   }
   else
   {
      _root.bgsong.attachSound("BuoyBaseGalaxy(Dry)-Intro");
      _root.bgsong.onSoundComplete = function()
      {
         _root.PlayingIntro = false;
         _root.bgsong.attachSound("BuoyBaseGalaxy(Dry)-Repeat");
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,999);
         }
         _root.bgsong.setVolume(_root.BgVolume);
      };
   }
   if(_root.MuteBGMusic == false)
   {
      _root.bgsong.start(timeinsong,1);
   }
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.RemoveCourse = function()
{
   _root.pointer.removeMovieClip(_root.pointer);
   _root.Stats.removeMovieClip(_root.Stats);
   _root.Course.removeMovieClip(_root.Course);
   _root.BGCourse.removeMovieClip(_root.BGCourse);
   _root.MidBackground.removeMovieClip(_root.MidBackground);
   _root.BGCloseCourse.removeMovieClip(_root.BGCloseCourse);
   _root.FarBackground.removeMovieClip(_root.FarBackground);
   _root.Blackout.removeMovieClip(_root.Blackout);
   _root.onEnterFrame = null;
};
_root.ReturnToTitle = function()
{
   _root.PlayingLevelDesigner = false;
   _root.Fluddpow = "";
   _root.Starnamenum = 0;
   _root.CalculateStars();
   _root.CharHP = 8;
   _root.WaterHP = 8;
   _root.WaterAmount = _root.TotalWater;
   _root.Power = _root.TotalPower;
   _root.Restartcoins();
   _root.RemoveCourse();
   _root.newstar = false;
   _root.LastItemGot = "";
   _root.gotoAndStop("Title");
};
_root.ReturnToCastle = function() {
	if (_root.PlayingLevelDesigner !== true) {
		_root.Fluddpow = "";
		_root.Starnamenum = 0;
		//
		//_root.SaveFile();
		//
		//
		_root.CharHP = 8;
		_root.WaterHP = 8;
		//
		_root.WaterAmount = _root.TotalWater;
		_root.Power = _root.TotalPower;
		//
		_root.TotalCoins = _root.Coins;
		_root.Restartcoins();
		//_root.CalculateStars();
		_root.RemoveCourse();
		_root.gotoAndStop("Courseframe");
		//
		_root.StopBGsong();
		if (_root.newstar !== true) {
			_root.StartChar("Castle", 0, -100, 0, 0, 100, _root.CurrentPlayer, "", "StarIn", true);
		} else {
            _root.event.onCastleWarpAfterStarCollection();
			_root.SongIntro = "None";
			_root.SongRepeat = "InsidetheCastleWalls";
			if (_root.LastItemGot !== "BowserKey1" && _root.LastItemGot !== "BowserKey2") {
				_root.StartChar(_root.PaintingPosition[_root.Playinglevel][0], _root.PaintingPosition[_root.Playinglevel][1], _root.PaintingPosition[_root.Playinglevel][2], _root.PaintingPosition[_root.Playinglevel][1], _root.PaintingPosition[_root.Playinglevel][2], 200, _root.CurrentPlayer, "", "StarIn");
			} else if (_root.LastItemGot == "BowserKey1") {
                // if (!_root.betaQuest.isStarted()) {
                    _root.StartChar("C-5", -450, 50, -450, 50, 200, _root.CurrentPlayer, "", "StarIn");
                // }
                // else {
                //     //_root.StartChar("8-E3-1", 0, 0, 0, 0, 200, _root.CurrentPlayer, "", "StarIn");
                //     _root.utils.warp("8-E3-1", 0, 0, 0, 0, false);
                // }
			} else if (_root.LastItemGot == "BowserKey2") {
				_root.StartChar("C-7", 0, 0, 0, 0, 0, _root.CurrentPlayer, "", "StarIn");
			}
		}
		_root.Playinglevel = 0;
		// Insert Array for Exit Castle Position _root.PaintingPosition
		//_root.Playinglevel = 1
		_root.onEnterFrame = function() {
			_root.CharCode();
		};
	} else {
		_root.newstar = false;
		// level designer exit
		_root.RemoveCourse();
		_root.CreateLevelDesigner();
		_root.Mariosound.onSoundComplete = null;
	}
};
_root.StartInsideofCastle = function()
{
   _root.RemoveCourse();
   _root.gotoAndStop("Courseframe");
   _root.StartChar("C-1",0,0,0,0,100,_root.CurrentPlayer,_root.Fluddpow,"StarIn",true);
   _root.onEnterFrame = function()
   {
      _root.CharCode();
   };
};
_root.StartBombombBattlefield = function()
{
   _root.RemoveCourse();
   _root.gotoAndStop("Courseframe");
   _root.StartChar("1-1",0,0,0,0,100,_root.CurrentPlayer,_root.Fluddpow,"Fromwhite",true);
   _root.onEnterFrame = function()
   {
      _root.CharCode();
   };
};
_root.StartHazyMazeCave = function()
{
   _root.RemoveCourse();
   _root.gotoAndStop("Courseframe");
   _root.StartChar("3-1",0,0,0,0,100,_root.CurrentPlayer,_root.Fluddpow,"Fromwhite",true);
   _root.onEnterFrame = function()
   {
      _root.CharCode();
   };
};
_root.StartNewCourse = function(level, a, b)
{
   if(a == true)
   {
      _root.RemoveCourse();
   }
   _root.gotoAndStop("Courseframe");
   _root.StartChar(level,0,0,0,0,100,_root.CurrentPlayer,_root.Fluddpow,b,true);
   _root.onEnterFrame = function()
   {
      _root.CharCode();
   };
};
_root.changecourse = function(transition, level, a, b, c, d, e)
{
   _root.RemoveCourse();
   _root.gotoAndStop("Courseframe");
   if(e == undefined)
   {
      e = false;
   }
   _root.StartChar(level,a,b,c,d,100,_root.CurrentPlayer,_root.Fluddpow,transition,e);
   _root.onEnterFrame = function()
   {
      _root.CharCode();
   };
   e = false;
};
_root.gotoCourseSelect = function(level)
{
   _root.Playinglevel = level;
   _root.RemoveCourse();
   _root.Restartcoins();
   _root.gotoAndStop("CourseSelect");
   _root.Transition.removeMovieClip(_root.Transition);
   _root.attachMovie("Fromwhite","Transition",_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
   _root.bgsong.stop();
   _root.bgsong = new Sound(this);
   _root.bgsong.attachSound("Star Swish");
   _root.bgsong.start(0,1);
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.gotoMiniCourseSelect = function(level)
{
   _root.Playinglevelnum = level;
   _root.Playinglevel = level + 8;
   _root.RemoveCourse();
   _root.Restartcoins();
   _root.gotoAndStop("MiniCourseSelect");
   _root.Transition.removeMovieClip(_root.Transition);
   _root.attachMovie("Fromwhite","Transition",_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
   _root.bgsong.stop();
   _root.bgsong = new Sound(this);
   _root.bgsong.attachSound("Star Swish");
   _root.bgsong.start(0,1);
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.DoorTrasition = function(doorplace)
{
   if(doorplace == "XY")
   {
      _root.Course.Char._x = _root.WarpPipeX + _root.Course.BackGFX._x;
      _root.Course.Char._y = _root.WarpPipeY + _root.Course.BackGFX._y;
      _root.Course.Char.attack = false;
      _root.attachMovie("StarIn","Transition",_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
   }
   else if(doorplace == "inCastle")
   {
      _root.StartInsideofCastle();
   }
   else if(doorplace == "outCastle")
   {
      _root.RemoveCourse();
      _root.gotoAndStop("Courseframe");
      _root.StartChar("Castle",0,50,0,50,150,_root.CurrentPlayer,_root.Fluddpow,"StarIn",true);
      _root.onEnterFrame = function()
      {
         _root.CharCode();
      };
   }
   else if(doorplace == "C-MR")
   {
      _root.changecourse("StarIn","C-4-SC1",-674,-60,-674,-60);
   }
   else if(doorplace == "C-MR-back")
   {
      _root.changecourse("StarIn","C-4",1260,0,1260,0);
   }
   else if(doorplace == "C-1-1")
   {
      _root.changecourse("StarIn","C-1",0,0,0,0);
   }
   else if(doorplace == "Castle-02")
   {
      _root.changecourse("StarIn","Castle",1400,390,1400,390,true);
   }
   else if(doorplace == "C-1-2")
   {
      _root.changecourse("StarIn","C-1",-550,-60,-550,-60);
   }
   else if(doorplace == "C-1-3")
   {
      _root.changecourse("StarIn","C-1",550,-60,550,-60);
   }
   else if(doorplace == "C-1-4")
   {
      _root.changecourse("StarIn","C-1",0,-195,0,-195);
   }
   else if(doorplace == "C-1-5")
   {
      _root.changecourse("StarIn","C-1",160,0,160,0);
   }
   else if(doorplace == "C-1-6")
   {
      _root.changecourse("StarIn","C-1",-160,0,-160,0);
   }
   else if(doorplace == "C-1-7")
   {
      _root.changecourse("StarIn","C-1",460,-200,460,-200);
   }
   else if(doorplace == "C-1-8")
   {
      _root.changecourse("StarIn","C-1",-460,-200,-460,-200);
   }
   else if(doorplace == "C-1-9")
   {
      _root.changecourse("StarIn","C-1",-390,-16,-390,-16);
   }
   else if(doorplace == "C-1-10")
   {
      _root.changecourse("StarIn","C-1",390,-16,390,-16);
   }
   else if(doorplace == "C-2-1")
   {
      _root.changecourse("StarIn","C-2",0,0,0,0);
   }
   else if(doorplace == "C-2-2")
   {
      _root.changecourse("StarIn","C-2-2",0,0,0,0);
   }
   else if(doorplace == "C-3-1")
   {
      _root.changecourse("StarIn","C-3",0,0,0,0);
   }
   else if(doorplace == "C-3-2")
   {
      _root.changecourse("StarIn","C-3-2",0,0,0,0);
   }
   else if(doorplace == "C-4-1")
   {
      _root.changecourse("StarIn","C-4",0,0,0,0);
   }
   else if(doorplace == "C-4-2")
   {
      _root.changecourse("StarIn","C-4",-846,-406,-846,-400);
   }
   else if(doorplace == "C-4-L")
   {
      if(_root.CurrentPlayer !== "Luigi")
      {
         _root.CurrentPlayer = "Luigi";
      }
      else
      {
         _root.CurrentPlayer = "Mario";
      }
      _root.changecourse("StarIn","C-4",1100,0,1100,0);
   }
   else if(doorplace == "C-4H-1")
   {
      _root.changecourse("StarIn","C-4H",0,0,0,0);
   }
   else if(doorplace == "C-4H-2")
   {
      _root.changecourse("StarIn","C-4H",0,0,382,-85);
   }
   else if(doorplace == "C-4H-sd")
   {
      _root.changecourse("StarIn","C-4H",400,-365,400,-365);
   }
   else if(doorplace == "C-4H-3")
   {
      _root.changecourse("StarIn","C-4H",0,-300,20,-575);
   }
   else if(doorplace == "C-5-1")
   {
      _root.changecourse("StarIn","C-5",0,0,0,0);
   }
   else if(doorplace == "C-6-1")
   {
      _root.changecourse("StarIn","C-6",250,0,250,0);
   }
   else if(doorplace == "C-6-2")
   {
      _root.changecourse("StarIn","C-6",-250,0,-250,0);
   }
   else if(doorplace == "C-6-3")
   {
      _root.changecourse("StarIn","C-6",0,-95,0,-95,true);
   }
   else if(doorplace == "C-6-4")
   {
      _root.changecourse("StarIn","C-6",0,80,0,80);
   }
   else if(doorplace == "C-7-1")
   {
      _root.changecourse("StarIn","C-7",0,0,0,0);
   }
   else if(doorplace == "C-7-2")
   {
      _root.changecourse("StarIn","C-7",-820,12,-820,12);
   }
   else if(doorplace == "C-7-3")
   {
      _root.changecourse("StarIn","C-7",610,40,610,40);
   }
   else if(doorplace == "C-8-1")
   {
      _root.changecourse("StarIn","C-8",0,0,0,0);
   }
   else if(doorplace == "C-8-2")
   {
      _root.changecourse("StarIn","C-8",784,-16,784,-16);
   }
   else if(doorplace == "C-8-3")
   {
      _root.changecourse("StarIn","C-8",1201,45,1201,45,true);
   }
   else if(doorplace == "C-9-1")
   {
      _root.changecourse("StarIn","C-9",0,0,0,0);
   }
   else if(doorplace == "C-9-2")
   {
      _root.changecourse("StarIn","C-9",300,-185,300,-185);
   }
   else if(doorplace == "C-10-1")
   {
      _root.changecourse("StarIn","C-10",0,0,0,0);
   }
   else if(doorplace == "C-10-2")
   {
      _root.changecourse("StarIn","C-10",-223,0,-223,0);
   }
   else if(doorplace == "C-10-3")
   {
      _root.changecourse("StarIn","C-10",720,-185,720,-185);
   }
   else if(doorplace == "C-10-sd")
   {
      _root.changecourse("StarIn","C-10",-235,-575,-235,-575);
   }
   else if(doorplace == "C-10-D3")
   {
      _root.changecourse("StarIn","C-10",-170,-512,-170,-512,true);
   }
   else if(doorplace == "C-10-D2")
   {
      _root.changecourse("StarIn","C-10",-235,-512,-235,0);
   }
   else if(doorplace == "C-10-D1")
   {
      _root.changecourse("StarIn","C-10",-297,-512,-297,0);
   }
   else if(doorplace == "C-11-1")
   {
      _root.changecourse("StarIn","C-11",0,0,0,0);
   }
   else if(doorplace == "C-12-1")
   {
      _root.changecourse("StarIn","C-12",0,0,0,0);
   }
   else if(doorplace == "C-12-2")
   {
      _root.changecourse("StarIn","C-12",80,-250,80,-250);
   }
   else if(doorplace == "C-13-1")
   {
      _root.changecourse("StarIn","C-13",0,0,0,0);
   }
   else if(doorplace == "C-O-1")
   {
      _root.changecourse("StarIn","C-O",0,0,0,0,true);
   }
   else if(doorplace == "C-O-2")
   {
      _root.changecourse("StarIn","C-O",300,0,-950,-363,true);
   }
   else if(doorplace == "C-Opening")
   {
      if(_root.Star[39] == true)
      {
         _root.changecourse("righttransition2","Castle",-1300,100,-1300,100);
      }
      else
      {
         _root.bgsong.stop();
         _root.gotoAndStop("Intro2");
         _root.RemoveCourse();
      }
   }
   else if(doorplace == "4-1-1")
   {
      _root.changecourse("StarIn","4-1",610,150,610,150);
   }
   else if(doorplace == "4-1-2")
   {
      _root.changecourse("StarIn","4-1",-315,200,-315,200);
   }
   else if(doorplace == "4-1-3")
   {
      _root.changecourse("StarIn","4-1",610,-810,610,-810);
   }
   else if(doorplace == "4-1-4")
   {
      _root.changecourse("StarIn","4-1",245,-1010,245,-1010);
   }
   else if(doorplace == "4-1-5")
   {
      _root.changecourse("StarIn","4-1",610,-1305,610,-1305);
   }
   else if(doorplace == "4-2-1")
   {
      _root.changecourse("StarIn","4-2",0,0,0,0);
   }
   else if(doorplace == "4-2-2")
   {
      _root.changecourse("StarIn","4-2",-400,0,-400,0);
   }
   else if(doorplace == "4-2-3")
   {
      _root.changecourse("StarIn","4-2",-250,0,-250,0);
   }
   else if(doorplace == "4-2-4")
   {
      _root.changecourse("StarIn","4-2",250,0,250,0);
   }
   else if(doorplace == "4-2-5")
   {
      _root.changecourse("StarIn","4-2",400,0,400,0);
   }
   else if(doorplace == "4-2-6")
   {
      _root.changecourse("StarIn","4-2",-400,-375,-400,-375);
   }
   else if(doorplace == "4-2-7")
   {
      _root.changecourse("StarIn","4-2",-250,-375,-250,-375);
   }
   else if(doorplace == "4-2-8")
   {
      _root.changecourse("StarIn","4-2",250,-375,250,-375);
   }
   else if(doorplace == "4-2-9")
   {
      _root.changecourse("StarIn","4-2",400,-375,400,-375);
   }
   else if(doorplace == "4-2-10")
   {
      _root.changecourse("StarIn","4-2",0,-610,0,-610);
   }
   else if(doorplace == "4-3-1")
   {
      _root.changecourse("StarIn","4-3",0,20,0,20);
   }
   else if(doorplace == "4-3-2")
   {
      _root.changecourse("StarIn","4-3",1300,20,1300,20);
   }
   else if(doorplace == "4-3-3")
   {
      _root.changecourse("StarIn","4-3",0,-780,0,-780);
   }
   else if(doorplace == "4-3-4")
   {
      _root.changecourse("StarIn","4-3",100,-1776,100,-1776);
   }
   else if(doorplace == "4-4-1")
   {
      _root.changecourse("StarIn","4-4",0,20,0,20);
   }
   else if(doorplace == "4-4-2")
   {
      _root.changecourse("StarIn","4-4",-1300,20,-1300,20);
   }
   else if(doorplace == "4-4-3")
   {
      _root.changecourse("StarIn","4-4",0,-780,0,-780);
   }
   else if(doorplace == "4-4-4")
   {
      _root.changecourse("StarIn","4-4",200,-1776,200,-1776);
   }
   else if(doorplace == "4-5-1")
   {
      _root.changecourse("StarIn","4-5",-1300,20,-1300,20);
   }
   else if(doorplace == "4-5-2")
   {
      _root.changecourse("StarIn","4-5",1300,20,1300,20);
   }
   else if(doorplace == "4-6-1")
   {
      _root.changecourse("StarIn","4-6",0,0,0,0);
   }
   else if(doorplace == "4-6-2")
   {
      _root.changecourse("StarIn","4-6",0,-480,0,-480);
   }
   else if(doorplace == "4-7-1")
   {
      _root.changecourse("StarIn","4-7",0,0,0,0);
   }
   else if(doorplace == "4-7-2")
   {
      _root.changecourse("StarIn","4-7",-150,-400,-150,-400);
   }
   else if(doorplace == "4-8-1")
   {
      _root.changecourse("StarIn","4-8",-1350,100,-1350,100);
   }
   else if(doorplace == "4-8-2")
   {
      _root.changecourse("StarIn","4-8",-800,100,-800,100);
   }
   else if(doorplace == "4-8-3")
   {
      _root.changecourse("StarIn","4-8",0,0,0,0);
   }
   else if(doorplace == "4-8-4")
   {
      _root.changecourse("StarIn","4-8",1200,100,1200,100);
   }
   else if(doorplace == "4-8-5")
   {
      _root.changecourse("StarIn","4-8",800,100,800,100);
   }
   else if(doorplace == "4-9-1")
   {
      _root.changecourse("StarIn","4-9",0,0,0,0);
   }
   else if(doorplace == "4-9-2")
   {
      _root.changecourse("StarIn","4-9",-1450,0,-1450,0);
   }
   else if(doorplace == "4-9-3")
   {
      _root.changecourse("StarIn","4-9",0,-1055,0,-1055);
   }
   else if(doorplace == "4-10-1")
   {
      _root.changecourse("StarIn","4-10",-3090,-630,-3090,-630);
   }
   else if(doorplace == "4-11-1")
   {
      _root.changecourse("StarIn","4-11",0,0,0,0,true);
   }
   else if(doorplace == "5-1-1")
   {
      _root.changecourse("StarIn","5-1",620,150,620,150);
   }
   else if(doorplace == "5-1-2")
   {
      _root.changecourse("StarIn","5-1",2980,-50,2980,-50);
   }
   else if(doorplace == "5-5")
   {
      _root.changecourse("StarIn","5-5",0,0,0,0);
   }
   else if(doorplace == "5-7-1")
   {
      _root.changecourse("StarIn","5-7",0,0,0,0);
   }
   else if(doorplace == "5-8-1")
   {
      _root.changecourse("StarIn","5-8",0,0,0,0);
   }
   else if(doorplace == "6-5")
   {
      _root.changecourse("StarIn","6-5",500,500,-600,666,true);
   }
   else if(doorplace == "7-6")
   {
      _root.changecourse("StarIn","7-6",0,0,0,0,true);
   }
   else if(doorplace == "8-1-2")
   {
      _root.changecourse("StarIn","8-1",4128,-10,4128,-10);
   }
   else if(doorplace == "8-2-1")
   {
      _root.changecourse("StarIn","8-2",0,0,0,0);
   }
   else if(doorplace == "8-2-bleft")
   {
      _root.changecourse("StarIn","8-2",-812,-114,-812,-114);
   }
   else if(doorplace == "8-2-bright")
   {
      _root.changecourse("StarIn","8-2",760,-114,760,-114);
   }
   else if(doorplace == "8-2-uleft")
   {
      _root.changecourse("StarIn","8-2",-1350,-420,-1350,-420,true);
   }
   else if(doorplace == "8-2-uright")
   {
      _root.changecourse("StarIn","8-2",830,-420,830,-420);
   }
   else if(doorplace == "8-2-top")
   {
      _root.changecourse("StarIn","8-2",0,-1090,0,-1090);
   }
   else if(doorplace == "8-3")
   {
      _root.changecourse("StarIn","8-3",0,95,0,95);
   }
   else if(doorplace == "8-4")
   {
      _root.changecourse("StarIn","8-4",0,95,0,95);
   }
   else if(doorplace == "8-5")
   {
      _root.changecourse("StarIn","8-5",0,0,0,0,true);
   }
   else if(doorplace == "8-6")
   {
      _root.changecourse("StarIn","8-6",0,0,0,0);
   }
   else if(doorplace == "8-7")
   {
      _root.changecourse("StarIn","8-7",0,0,0,0);
   }
   else if(doorplace == "8-7bleft")
   {
      _root.changecourse("StarIn","8-7",-468,20,-468,20);
   }
   else if(doorplace == "8-7bright")
   {
      _root.changecourse("StarIn","8-7",468,20,468,20);
   }
   else if(doorplace == "8-7uleft")
   {
      _root.changecourse("StarIn","8-7",-556,-577,-556,-577);
   }
   else if(doorplace == "8-7uright")
   {
      _root.changecourse("StarIn","8-7",556,-577,556,-577);
   }
   else if(doorplace == "8-7utop")
   {
      _root.changecourse("StarIn","8-7",0,-582,0,-582);
   }
   else if(doorplace == "8-8")
   {
      _root.changecourse("StarIn","8-8",0,0,0,0);
   }
   else if(doorplace == "8-8u")
   {
      _root.changecourse("StarIn","8-8",-656,-2620,-656,-2620);
   }
   else if(doorplace == "8-9")
   {
      _root.changecourse("StarIn","8-9",0,0,0,0);
   }
   else if(doorplace == "8-9u")
   {
      _root.changecourse("StarIn","8-9",0,0,0,0);
   }
   else if(doorplace == "8-10")
   {
      _root.changecourse("StarIn","8-10",-290,0,-290,0);
   }
   else if(doorplace == "8-10-b")
   {
      _root.changecourse("StarIn","8-10-b",-547,-1470,-547,-1470,true);
   }
   else if(doorplace == "8-10u")
   {
      _root.changecourse("StarIn","8-10-b",-575,-1470,-575,-1470,true);
   }
   else if(doorplace == "8-11")
   {
      _root.changecourse("StarIn","8-11",-170,30,-170,30,true);
   }
   else if(doorplace == "8-11u")
   {
      _root.changecourse("StarIn","8-11",0,-820,0,-820,true);
   }
   else if(doorplace == "8-12")
   {
      _root.changecourse("StarIn","8-12",0,0,0,0);
   }
   else if(doorplace == "8-12-Warp")
   {
      _root.Fluddpow = "";
      _root.StopBGsong();
      _root.lvl8keyA = false;
      _root.lvl8keyB = false;
      _root.lvl8keyC = false;
      _root.lvl8keyD = false;
      _root.lvl8keyE = true;
      _root.Playinglevel = 8;
      _root.SongIntro = "BowserTrapIntro";
      _root.SongRepeat = "BowserTrapRepeat";
      _root.PlayMusicAndIntro();
      _root.changecourse("StarIn","8-12",-192,-52,-192,-52);
   }
   else if(doorplace == "C-13-Warp")
   {
      _root.Fluddpow = "";
      _root.StopBGsong();
      _root.lvl8keyA = false;
      _root.lvl8keyB = false;
      _root.lvl8keyC = false;
      _root.lvl8keyD = false;
      _root.lvl8keyE = true;
      _root.Playinglevel = 0;
      _root.SongIntro = "None";
      _root.SongRepeat = "InsidetheCastleWalls";
      _root.StartNewMusicAndIntroNoVar("BowserPlan-Intro","BowserPlan-Repeat");
      _root.changecourse("StarIn","C-13",1066,-215,1066,-215);
   }
   else if(doorplace == "8-E2-2")
   {
      _root.Fluddpow = "";
      _root.changecourse("StarIn","8-E2-2",0,-200,0,-200,true);
   }
   else if(doorplace == "8-13")
   {
      _root.changecourse("StarIn","8-13",0,0,0,0,true);
   }
   else if(doorplace == "8-E3-1")
   {
      _root.changecourse("StarIn","8-E3-1",0,0,0,0,true);
   }
   else if(doorplace == "8-E5-1")
   {
      _root.Fluddpow = "";
      _root.changecourse("StarIn","8-E5-1",-1693,-60,-1693,-60,true);
   }
   else if(doorplace == "8-E5-1-1")
   {
      _root.Fluddpow = "";
      _root.changecourse("StarIn","8-E5-1",-212,-25,-212,-25,true);
   }
   else if(doorplace == "9-02")
   {
      _root.Restartcoins();
      _root.Fluddpow = "";
      _root.changecourse("StarIn","9-02",0,0,0,0,true);
   }
   else if(doorplace == "9-04")
   {
      _root.Restartcoins();
      _root.Fluddpow = "";
      _root.changecourse("StarIn","9-04",0,0,0,0,true);
   }
   else if(doorplace == "9-06")
   {
      _root.Restartcoins();
      _root.Fluddpow = "";
      _root.changecourse("StarIn","9-06",0,0,0,0,true);
   }
   else if(doorplace == "M1-2")
   {
      _root.changecourse("StarIn","M1-2",-1465,-320,-1465,-320,true);
   }
   else if(doorplace == "M2-1-1")
   {
      _root.changecourse("StarIn","M2-1",795,125,795,125);
   }
   else if(doorplace == "M2-2-1")
   {
      _root.changecourse("StarIn","M2-2",0,0,0,0);
   }
   else if(doorplace == "BC-0")
   {
      _root.gotoAndStop("BowserBattle3");
      _root.RemoveCourse();
   }
   else if(doorplace == "BC-1")
   {
      _root.changecourse("StarIn","BC-1",0,0,0,0);
   }
   else if(doorplace == "C-4-SC1")
   {
      _root.changecourse("StarIn","C-4-SC1",0,0,0,0);
   }
   else if(doorplace == "C-4-SC2")
   {
      _root.changecourse("StarIn","C-4-SC1",0,-260,0,-260);
   }
   else if(doorplace == "C-4-SC1-back")
   {
      _root.changecourse("StarIn","C-4",1164,0,1164,0);
   }
   else if(doorplace == "C-4-SC1-back2")
   {
      _root.changecourse("StarIn","C-4",1036,0,1036,0);
   }
   else if(doorplace == "level1")
   {
      _root.changecourse("StarIn","level1",0,0,0,0);
   }
   else
   {
      _root.changecourse("StarIn","C-1",0,0,0,0);
   }
};
_root.StartLevel1 = function()
{
   _root.RemoveCourse();
   _root.gotoAndStop("Courseframe");
   _root.StartChar("Level1",1200,-500,1200,0,40,_root.CurrentPlayer,_root.Fluddpow,"Fromwhite");
   _root.onEnterFrame = function()
   {
      _root.CharCode();
   };
};
_root.PlayBGSong = function(song)
{
   _root.bgsong.stop();
   _root.bgsong.attachSound(song);
   _root.bgsong.start(0,999);
   _root.bgsong.setVolume(_root.BgVolume);
};
_root.PlayMessage = function(a)
{
   _root.Stats.Message.gotoAndPlay(1);
   _root.Stats.Message.mtext = a;
};
_root.PlayPicture = function(a)
{
   _root.Stats.Picture.gotoAndPlay(1);
   _root.Stats.Picture.picturenum = a;
};
_root.StopMessage = function()
{
   _root.Stats.Message.gotoAndPlay(7);
};
_root.StopPicture = function()
{
   _root.Stats.Picture.gotoAndPlay(7);
};
_root.HitWall = function()
{
   tellTarget(_root.Course.Char)
   {
      if(attack == false || attackFrame !== "hurt2")
      {
         hitwall = true;
         _root.Course.Char.attack = true;
         _root.Course.Char.attackFrame = "hurt2";
         if(_root.Course.Char.xspeed > 0)
         {
            _root.Course.Char._xscale = -100;
         }
         else
         {
            _root.Course.Char._xscale = 100;
         }
         xspeed = 0;
         yspeed = 0;
         _root.Mariosound = new Sound(this);
         if(_root.CurrentPlayer == "Mario")
         {
            _root.Mariosound.attachSound("Mario-Squish");
         }
         _root.Mariosound.start(0,1);
         _root.Mariosound.setVolume(_root.MarioVolume);
      }
   }
};
_root.LifeLost = function()
{
   _root.Invincible = false;
   _root.Metal = false;
   _root.Invisible = false;
   _root.WingCap = false;
   _root.PowerTimer = 0;
   _root.StopBGsong();
   if(_root.PlayingLevelDesigner !== true)
   {
      if(_root.TotalStars == 0)
      {
         _root.CharLives++;
      }
      _root.CharLives--;
      if(_root.CharLives < 0)
      {
         _root.CharLives = 4;
         _root.newstar = true;
         _root.LastItemGot = "GameOver";
         _root.RemoveCourse();
         _root.ReturnToCastle();
      }
      else
      {
         _root.attachMovie("LifeLost","LifeLost" + _root.getNextHighestDepth(),_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
      }
   }
   else
   {
      _root.Invincible = false;
      _root.Metal = false;
      _root.Invisible = false;
      _root.WingCap = false;
      _root.PowerTimer = 0;
      _root.newstar = false;
      _root.RemoveCourse();
      _root.CreateLevelDesigner();
   }
};
_root.ReviveMario = function(level, a, b)
{
   _root.gotoAndStop("Courseframe");
   _root.StartChar(level,a,b,a,b,100,_root.CurrentPlayer,_root.Fluddpow,"StarIn",false);
   _root.Course.Char.attack = true;
   _root.Course.Char.attackFrame = "Respawn";
   _root.PlayMusicAndIntro();
   _root.onEnterFrame = function()
   {
      _root.CharCode();
   };
};
_root.AreaTextClipF = function(txt, frame)
{
   _root.Stats.attachMovie("AreaTextClip","AreaTextClip",_root.Stats.getNextHighestDepth(),{_x:225,_y:75,txt:txt,frame:frame});
};
_root.StartLevelDesigner = function(num)
{
   _root.RemoveCourse();
   _root.EraseLevel();
   _root.CreateLevelDesigner();
};
