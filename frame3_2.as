StartChar = function(a, b, c, d, e, f, g, h, i, resetmusic)
{
	// We save the variables b, c, d, e for the lwp command
	_root.utils.setLatestWarpPosition(b, c, d, e);
	
	var warpArray = _root.betaQuest.getCorrespondingArea(a);
	
	a = warpArray[0];
	b = warpArray[1];
	c = warpArray[2];
	d = warpArray[1];
	e = warpArray[2];
	
	//_root.textManager.write(5, a);
   _root.playingcourse = a;
   if(_root.Starnamenum == 0)
   {
      _root.AreaTextAppear = true;
   }
   _root.CinemaMessage = "";
   _root.CinemaMessageFrame = 1;
   _root.TextHint = "";
   _root.ToadMessage = "";
   if(_root[a + "Gravity"] == undefined)
   {
      _root.gravity = 1;
   }
   else
   {
      _root.gravity = _root[a + "Gravity"];
   }
   if(_root[a + "defaultstep"] == undefined)
   {
      _root.defaultstep = "Mario-Step";
   }
   else
   {
      _root.defaultstep = _root[a + "defaultstep"];
   }
   _root.attachMovie(_root[a + "FarBackground"],"FarBackground",_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
   _root.createEmptyMovieClip("BGCourse",_root.getNextHighestDepth());
   _root.BGCourse._y = _root.screensizeY / 2;
   _root.BGCourse._x = _root.screensizeX / 2;
   _root.BGCourse.attachMovie(_root[a + "Background"],"BG",_root.BGCourse.getNextHighestDepth(),{_x:(- b) / 10,_y:(- c) / 10});
   _root.createEmptyMovieClip("MidBackground",_root.getNextHighestDepth());
   _root.MidBackground._y = _root.screensizeY / 2;
   _root.MidBackground._x = _root.screensizeX / 2;
   _root.MidBackground.attachMovie(_root[a + "MidBackground"],"BG",_root.MidBackground.getNextHighestDepth(),{_x:(- b) / 5,_y:(- c) / 5});
   _root.createEmptyMovieClip("BGCloseCourse",_root.getNextHighestDepth());
   _root.BGCloseCourse._y = _root.screensizeY / 2;
   _root.BGCloseCourse._x = _root.screensizeX / 2;
   _root.BGCloseCourse.attachMovie(_root[a + "CloseBackground"],"BG",_root.BGCloseCourse.getNextHighestDepth(),{_x:(- b) / 2,_y:(- c) / 2});
   _root.createEmptyMovieClip("Course",_root.getNextHighestDepth());
   _root.Course._y = _root.screensizeY / 2;
   _root.Course._x = _root.screensizeX / 2;
   b = - b;
   c = - c;
   d = - d;
   e = - e;
   _root.Course.attachMovie(a + "Puddle","Puddle",_root.Course.getNextHighestDepth(),{_x:b,_y:c});
   _root.Course.attachMovie(a + "Ice","Ice",_root.Course.getNextHighestDepth(),{_x:b,_y:c});
   _root.Course.attachMovie(a + "BackGFX","BackGFX",_root.Course.getNextHighestDepth(),{_x:b,_y:c});
   _root.Course.attachMovie(a + "Platforms","Platforms",_root.Course.getNextHighestDepth(),{_x:b,_y:c,_visible:false});
   _root.Course.attachMovie(a + "BPlatforms","BPlatforms",_root.Course.getNextHighestDepth(),{_x:b,_y:c,_visible:false});
   _root.Course.attachMovie("Char","Char",_root.Course.getNextHighestDepth(),{_x:b - d,_y:c - e});
   _root.Course.attachMovie(a + "Water","Water",_root.Course.getNextHighestDepth(),{_x:b,_y:c});
   _root.Course.attachMovie(a + "Lava","Lava",_root.Course.getNextHighestDepth(),{_x:b,_y:c,_visible:false});
   _root.Course.attachMovie(a + "FrontGFX","FrontGFX",_root.Course.getNextHighestDepth(),{_x:b,_y:c});
   if(_root.Course.FrontGFX._x == undefined)
   {
      _root.Course.createEmptyMovieClip("FrontGFX",_root.Course.getNextHighestDepth());
      _root.Course.FrontGFX._x = b;
      _root.Course.FrontGFX._y = c;
   }
   _root.Course.attachMovie(a + "Edge","Edge",_root.Course.getNextHighestDepth(),{_x:b,_y:c,_alpha:0});
   _root.Course.attachMovie(a + "CamEdge","CamEdge",_root.Course.getNextHighestDepth(),{_x:b,_y:c,_alpha:0});
   _root.Course.createEmptyMovieClip("Enemyhurt",_root.Course.getNextHighestDepth());
   _root.Course.Enemyhurt._x = b;
   _root.Course.Enemyhurt._y = c;
   _root.Course.BackGFX.createEmptyMovieClip("StartClip",_root.Course.BackGFX.getNextHighestDepth());
   _root.Course.BackGFX.StartClip._y = _root.Course.Char._y - _root.Course.BackGFX._y;
   _root.Course.BackGFX.StartClip._x = _root.Course.Char._x - _root.Course.BackGFX._x;
   _root.StartY = _root.Course.BackGFX.StartClip._y - _root.Course.BackGFX._y;
   _root.StartX = _root.Course.BackGFX.StartClip._x - _root.Course.BackGFX._x;
   tellTarget(_root.Course.Char)
   {
      tall = 35;
      wide = 10;
      yspeed = 0;
      xspeed = 0;
      air = true;
      frame = 1;
      lockon = true;
      Ice = false;
      Puddle = false;
      Water = false;
      attack = false;
      attackFrame = "";
      _root.DiveRot = 0;
      hurt = false;
      blink = 0;
      StunTime = 0;
      doublejump = 0;
      doublejumpcount = 0;
      _root.playpause = false;
      spinattackcount = 0;
      spincount = 0;
      spinattackcounter = 0;
      Squish = false;
      underwatercount = 0;
      abovewatercount = 0;
      swimup = false;
      changeFludd = false;
      canChangeFludd = true;
      landtime = 0;
      fallcount = 0;
      hurtfallcount = 0;
      divewaitcount = 7;
      swimupcount = 0;
      swimup = false;
      _root.JumpPress = false;
      _root.LastFrameJumpPress = false;
      _xscale = _root.CharXscale;
   }
   _root.Camcenter = _root.Course.Char;
   _root.Controll = true;
   _root.CameraZoom = 100;
   _root.coursescale2 = f - 100;
   _root.coursescale = _root.coursescale2;
   _root.CameraZoom2 = _root.CameraZoom;
   _root.CamYchange = 50;
   _root.CamXchange = 0;
   _root.StepSound = _root.defaultstep;
   _root.changestep = 0;
   _root.Fluddpow = h;
   _root.CanSwitchFludd = true;
   if(_root[a + "Maxzoomout"] == undefined)
   {
      _root.Maxzoomout = 50;
   }
   else
   {
      _root.Maxzoomout = _root[a + "Maxzoomout"];
   }
   if(_root[a + "Maxzoomin"] == undefined)
   {
      _root.Maxzoomin = 200;
   }
   else
   {
      _root.Maxzoomin = _root[a + "Maxzoomin"];
   }
   _root.attachMovie("Stats Clip","Stats",_root.getNextHighestDepth(),{_x:0,_y:0});
   _root.attachMovie(i,"Transition",_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
   _root.attachMovie("Pointer","pointer",_root.getNextHighestDepth(),{_x:_root.screensizeX / 2,_y:_root.screensizeY / 2});
   if(_root.CurrentPlayer == "Mario")
   {
      _root.Course.Char.gotoAndStop(1);
      _root.jumpspeed = _root.Mariojumpspeed;
   }
   if(_root.CurrentPlayer == "Luigi")
   {
      _root.Course.Char.gotoAndStop(4);
      _root.jumpspeed = _root.Luigijumpspeed;
   }
   _root.AntiSquish = 0;
   _root.PlayingChar = _root.CurrentPlayer;
   if(resetmusic == true)
   {
      _root.Invincible = false;
      _root.Metal = false;
      _root.Invisible = false;
      _root.WingCap = false;
      _root.PowerTimer = 0;
      if(_root[a + "MusicIntro"] !== undefined && _root[a + "MusicIntro"] !== "None")
      {
         _root.StopBGsong();
         _root.bgsong.stop();
         _root.bgsong = new Sound(this);
         _root.bgsong.attachSound(_root[a + "MusicIntro"]);
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,1);
         }
         _root.bgsong.setVolume(_root.BgVolume);
         _root.SongIntro = _root[a + "MusicIntro"];
         _root.SongRepeat = _root[a + "Music"];
         _root.PlayingIntro = true;
         _root.bgsong.onSoundComplete = function()
         {
            _root.PlayingIntro = false;
            _root.bgsong.attachSound(_root[a + "Music"]);
            if(_root.MuteBGMusic == false)
            {
               _root.bgsong.start(0,999);
            }
            _root.bgsong.setVolume(_root.BgVolume);
         };
      }
      else
      {
         _root.PlayingIntro = false;
         _root.SongIntro = "None";
         _root.SongRepeat = _root[a + "Music"];
         _root.StopBGsong();
         _root.bgsong.stop();
         _root.bgsong = new Sound(this);
         _root.bgsong.attachSound(_root[a + "Music"]);
         if(_root.MuteBGMusic == false)
         {
            _root.bgsong.start(0,999);
         }
         _root.bgsong.setVolume(_root.BgVolume);
         _root.bgsong.onSoundComplete = function()
         {
            _root.PlayingIntro = false;
            _root.bgsong.attachSound(_root[a + "Music"]);
            if(_root.MuteBGMusic == false)
            {
               _root.bgsong.start(0,999);
            }
            _root.bgsong.setVolume(_root.BgVolume);
         };
      }
   }
};

_focusrect = false;
_root.CameraZoom = 100;
_root.TotalWater = 10000;
_root.Fluddpow = "H";
_root.TotalPower = 100;
_root.newstar = false;
_root.Level1Background = "GrassandHillsBG";
_root.Level1FarBackground = "CloudBackground";
_root.Level1MusicIntro = "NSMBLandIntro";
_root.Level1Music = "NSMBLandRepeat";
_root["K-1MusicIntro"] = "SuperMarioGalaxyPurpleCoin-Intro";
_root["K-1Music"] = "SuperMarioGalaxyPurpleCoin-Repeat";
_root["C-1Music"] = "InsidetheCastleWalls";
_root["C-4Music"] = "InsidetheCastleWalls";
_root["C-6Music"] = "InsidetheCastleWalls";
_root["C-8Music"] = "InsidetheCastleWalls";
_root["C-10Music"] = "InsidetheCastleWalls";
_root["1-1MusicIntro"] = "Bombomb Battlefield Intro";
_root["1-1Music"] = "Bombomb Battlefield Repeat";
_root["1-4Music"] = "Bombomb Battlefield Repeat";
_root["1-5MusicIntro"] = "Secret Course - Intro";
_root["1-5Music"] = "Secret Course - Repeat";
_root["2-1MusicIntro"] = "Snowmans Land - Intro";
_root["2-1Music"] = "Snowmans Land - Repeat";
_root["2-6MusicIntro"] = "HazyMazeCave-Intro";
_root["2-6Music"] = "HazyMazeCave-Haze";
_root["3-1MusicIntro"] = "HazyMazeCave-Intro";
_root["3-1Music"] = "HazyMazeCave-Rock";
_root["3-6Music"] = "HazyMazeCave-Haze";
_root["3-8MusicIntro"] = "Secret Course - Intro";
_root["3-8Music"] = "Secret Course - Repeat";
_root["4-1MusicIntro"] = "Boos Mansion - Intro";
_root["4-1Music"] = "Boos Mansion - Repeat";
_root["4-11MusicIntro"] = "Secret Course - Intro";
_root["4-11Music"] = "Secret Course - Repeat";
_root["5-1MusicIntro"] = "Melty Molten Galaxy - Intro";
_root["5-1Music"] = "Melty Molten Galaxy - Repeat";
_root["5-4MusicIntro"] = "Melty Molten Galaxy - Intro";
_root["5-4Music"] = "Melty Molten Galaxy - Repeat";
_root["5-9MusicIntro"] = "Secret Course - Intro";
_root["5-9Music"] = "Secret Course - Repeat";
_root["6-1MusicIntro"] = "Bombomb Battlefield Intro";
_root["6-1Music"] = "Bombomb Battlefield Repeat";
_root["6-5MusicIntro"] = "Secret Course - Intro";
_root["6-5Music"] = "Secret Course - Repeat";
_root["7-1MusicIntro"] = "Rainbow Ride - Intro";
_root["7-1Music"] = "Rainbow Ride - Repeat";
_root["7-6MusicIntro"] = "Secret Course - Intro";
_root["7-6Music"] = "Secret Course - Repeat";
_root["8-1MusicIntro"] = "BowserTrapIntro";
_root["8-1Music"] = "BowserTrapRepeat";
_root["8-2MusicIntro"] = "BowserTrapIntro";
_root["8-2Music"] = "BowserTrapRepeat";
_root["8-5MusicIntro"] = "Melty Molten Galaxy - Intro";
_root["8-5Music"] = "Melty Molten Galaxy - Repeat";
_root["8-6MusicIntro"] = "HazyMazeCave-Intro";
_root["8-6Music"] = "HazyMazeCave-Haze";
_root["8-7MusicIntro"] = "BowserTrapIntro";
_root["8-7Music"] = "BowserTrapRepeat";
_root["8-8MusicIntro"] = "BowserTrapIntro";
_root["8-8Music"] = "BowserTrapRepeat";
_root["8-9MusicIntro"] = "BowserTrapIntro";
_root["8-9Music"] = "BowserTrapRepeat";
_root["8-10-bMusicIntro"] = "BowserTrapIntro";
_root["8-10-bMusic"] = "BowserTrapRepeat";
_root["8-11Music"] = "Danger Ahead";
_root["8-13MusicIntro"] = "BuoyBaseGalaxy(Dry)-Intro";
_root["8-13Music"] = "BuoyBaseGalaxy(Dry)-Repeat";
_root["BC-1MusicIntro"] = "BowserTrapIntro";
_root["BC-1Music"] = "BowserTrapRepeat";
_root["8-E1-1MusicIntro"] = "PrincessPeachesCastle-Intro";
_root["8-E1-1Music"] = "PrincessPeachesCastle-Repeat";
_root["8-E1-2-2MusicIntro"] = "PrincessPeachesCastle-Intro";
_root["8-E1-2-2Music"] = "PrincessPeachesCastle-Repeat";
_root["8-E2-1MusicIntro"] = "BowserTrapIntro";
_root["8-E2-1Music"] = "BowserTrapRepeat";
_root["8-E2-2MusicIntro"] = "Bowsers Theme - Intro";
_root["8-E2-2Music"] = "Bowsers Theme - Repeat";
_root["8-E3-1MusicIntro"] = "PrincessPeachesCastle-Intro";
_root["8-E3-1Music"] = "PrincessPeachesCastle-Repeat";
_root["8-E5-1MusicIntro"] = "BowserTrapIntro";
_root["8-E5-1Music"] = "BowserTrapRepeat";
_root["8-E5-4MusicIntro"] = "Bowsers Theme - Intro";
_root["8-E5-4Music"] = "Bowsers Theme - Repeat";
_root["9-03MusicIntro"] = "BuoyBaseGalaxy(Dry)-Intro";
_root["9-03Music"] = "BuoyBaseGalaxy(Dry)-Repeat";
_root["9-03-DMusicIntro"] = "BuoyBaseGalaxy(Dry)-Intro";
_root["9-03-DMusic"] = "BuoyBaseGalaxy(Dry)-Repeat";
_root["9-03-2MusicIntro"] = "BuoyBaseGalaxy(Dry)-Intro";
_root["9-03-2Music"] = "BuoyBaseGalaxy(Dry)-Repeat";
_root["9-01MusicIntro"] = "SuperMarioGalaxyPurpleCoin-Intro";
_root["9-01Music"] = "SuperMarioGalaxyPurpleCoin-Repeat";
_root["9-02MusicIntro"] = "Gritzy Desert (SSBB) Intro";
_root["9-02Music"] = "Gritzy Desert (SSBB) Repeat";
_root["9-04MusicIntro"] = "Secret Course - Intro";
_root["9-04Music"] = "Secret Course - Repeat";
_root["9-05MusicIntro"] = "SuperMarioGalaxyPurpleCoin-Intro";
_root["9-05Music"] = "SuperMarioGalaxyPurpleCoin-Repeat";
_root["9-06MusicIntro"] = "Secret Course - Intro";
_root["9-06Music"] = "Secret Course - Repeat";
_root["9-07MusicIntro"] = "PrincessPeachesCastle-Intro";
_root["9-07Music"] = "PrincessPeachesCastle-Repeat";
_root["9-08MusicIntro"] = "Melty Molten Galaxy - Intro";
_root["9-08Music"] = "Melty Molten Galaxy - Repeat";
_root["9-09MusicIntro"] = "SuperMarioGalaxyPurpleCoin-Intro";
_root["9-09Music"] = "SuperMarioGalaxyPurpleCoin-Repeat";
_root["9-10MusicIntro"] = "HazyMazeCave-Intro";
_root["9-10Music"] = "HazyMazeCave-Rock";
_root["9-10-2Music"] = "HazyMazeCave-Haze";
_root["9-11MusicIntro"] = "BuoyBaseGalaxy(Dry)-Intro";
_root["9-11Music"] = "BuoyBaseGalaxy(Dry)-Repeat";
_root["M1-1MusicIntro"] = "Gritzy Desert (SSBB) Intro";
_root["M1-1Music"] = "Gritzy Desert (SSBB) Repeat";
_root["M1-2MusicIntro"] = "HazyMazeCave-Intro";
_root["M1-2Music"] = "HazyMazeCave-Haze";
_root["M2-1MusicIntro"] = "HazyMazeCave-Intro";
_root["M2-1Music"] = "HazyMazeCave-Rock";
_root["M2-3Music"] = "HazyMazeCave-Haze";
_root["M3-1MusicIntro"] = "Secret Course - Intro";
_root["M3-1Music"] = "Secret Course - Repeat";
_root.CastleBackground = "CastleColoredBG";
_root.CastleFarBackground = "CastleColoredFarBG";
_root.CastleMaxzoomout = 75;
_root["C-2Maxzoomout"] = 100;
_root["C-2-2Maxzoomout"] = 100;
_root["C-SMaxzoomout"] = 100;
_root["C-3Maxzoomout"] = 100;
_root["C-3-2Maxzoomout"] = 100;
_root["C-4Maxzoomout"] = 100;
_root["C-4HMaxzoomout"] = 100;
_root["C-6Maxzoomout"] = 100;
_root["C-7Maxzoomout"] = 100;
_root["C-8Maxzoomout"] = 100;
_root["C-9Maxzoomout"] = 100;
_root["C-10Maxzoomout"] = 100;
_root["C-11Maxzoomout"] = 100;
_root["C-12Maxzoomout"] = 100;
_root["C-13Maxzoomout"] = 100;
_root["C-4-SC1Maxzoomout"] = 100;
_root["9-07Maxzoomout"] = 80;
_root["9-08Maxzoomout"] = 100;
_root["K-1FarBackground"] = "K-1FarBG";
_root["K-1Background"] = "GrassandHillsBG";
_root["K-2FarBackground"] = "4-farBG";
_root["K-3FarBackground"] = "4-farBG";
_root["C-1Background"] = "CastleColoredBGHigh";
_root["C-1FarBackground"] = "CastleColoredFarBG";
_root["C-2-2Background"] = "CastleColoredBG";
_root["C-2-2FarBackground"] = "CastleColoredFarBG";
_root["C-SBackground"] = "CastleColoredBG";
_root["C-SFarBackground"] = "CastleColoredFarBG";
_root["C-4Background"] = "CastleColoredBG";
_root["C-4FarBackground"] = "CastleColoredFarBG";
_root["C-4HBackground"] = "CastleColoredBG";
_root["C-4HFarBackground"] = "CastleColoredFarBG";
_root["C-4-SC1Background"] = "CastleColoredBG";
_root["C-4-SC1FarBackground"] = "CastleColoredFarBG";
_root["C-7Background"] = "CastleColoredBG";
_root["C-7FarBackground"] = "CastleColoredFarBG";
_root["C-10Background"] = "CastleColoredBG";
_root["C-10FarBackground"] = "CastleColoredFarBG";
_root["C-11Background"] = "CastleColoredBG";
_root["C-11FarBackground"] = "CastleColoredFarBG";
_root["C-13FarBackground"] = "C-13FarBG";
_root["C-13Background"] = "C-13BG";
_root["C-OBackground"] = "CastleColoredBG";
_root["C-OFarBackground"] = "CastleColoredFarBG";
_root["1-1Background"] = "GrassandHillsBG";
_root["1-1FarBackground"] = "1-FarBG";
_root["1-2Background"] = "GrassandHillsBG";
_root["1-2FarBackground"] = "1-FarBG";
_root["1-3Background"] = "GrassandHillsBG";
_root["1-3FarBackground"] = "1-FarBG";
_root["1-4Background"] = "GrassandHillsBG";
_root["1-4FarBackground"] = "1-FarBG";
_root["1-5FarBackground"] = "SecretLevelBG";
_root["2-1FarBackground"] = "2-farBG";
_root["2-1MidBackground"] = "2-1MidBG";
_root["2-2FarBackground"] = "2-farBG";
_root["2-2AFarBackground"] = "2-farBG";
_root["2-2AMidBackground"] = "2-2AMidBG";
_root["2-3FarBackground"] = "2-farBG";
_root["2-3MidBackground"] = "2-1MidBG";
_root["2-4FarBackground"] = "2-farBG";
_root["2-5FarBackground"] = "SecretLevelBG";
_root["3-1Background"] = "3-BG";
_root["3-1FarBackground"] = "3-farBG";
_root["3-2Background"] = "3-BG";
_root["3-2FarBackground"] = "3-farBG";
_root["3-3Background"] = "3-BG";
_root["3-3FarBackground"] = "3-farBG";
_root["3-4Background"] = "3-BG";
_root["3-4FarBackground"] = "3-farBG";
_root["3-5Background"] = "3-BG";
_root["3-5FarBackground"] = "3-farBG";
_root["3-6Background"] = "3-BG";
_root["3-6FarBackground"] = "3-farBG";
_root["3-7Background"] = "3-BG";
_root["3-7FarBackground"] = "3-farBG";
_root["3-8Background"] = "3-BG";
_root["3-8FarBackground"] = "SecretLevelBG";
_root["4-1FarBackground"] = "4-1BG";
_root["4-2FarBackground"] = "4-1BG";
_root["4-8FarBackground"] = "4-1BG";
_root["4-9FarBackground"] = "4-1BG";
_root["4-11FarBackground"] = "4-11BG";
_root["5-1FarBackground"] = "4-farBG";
_root["5-1CloseBackground"] = "5-1CloseBG";
_root["5-2FarBackground"] = "4-farBG";
_root["5-2CloseBackground"] = "5-2CloseBG";
_root["5-3FarBackground"] = "4-farBG";
_root["5-3CloseBackground"] = "5-3CloseBG";
_root["5-3MidBackground"] = "5-3MidBG";
_root["5-4FarBackground"] = "4-farBG";
_root["5-4CloseBackground"] = "5-4CloseBG";
_root["5-7FarBackground"] = "4-farBG";
_root["5-7CloseBackground"] = "5-1CloseBG";
_root["5-8FarBackground"] = "4-farBG";
_root["5-8CloseBackground"] = "5-8CloseBG";
_root["5-8MidBackground"] = "5-1CloseBG";
_root["5-9FarBackground"] = "SecretLevelBG";
_root["5-5CloseBackground"] = "5-5CloseBG";
_root["5-5MidBackground"] = "5-5MidBG";
_root["5-5Background"] = "5-5BG";
_root["5-5FarBackground"] = "5-5FarBG";
_root["5-6CloseBackground"] = "5-5CloseBG";
_root["5-6MidBackground"] = "5-5MidBG";
_root["5-6Background"] = "5-5BG";
_root["5-5FarBackground"] = "5-5FarBG";
_root["6-1FarBackground"] = "CloudBackground";
_root["6-1Background"] = "GrassandHillsBG";
_root["6-1-2FarBackground"] = "CloudBackground";
_root["6-1-2Background"] = "GrassandHillsBG";
_root["6-2FarBackground"] = "CloudBackground";
_root["6-2Background"] = "GrassandHillsBG";
_root["6-3FarBackground"] = "CloudBackground";
_root["6-3Background"] = "GrassandHillsBG2";
_root["6-4FarBackground"] = "6-farBG";
_root["6-4Background"] = "GrassandHillsBG2";
_root["6-5FarBackground"] = "SecretLevelBG";
_root["6-6FarBackground"] = "CloudBackground";
_root["6-6Background"] = "GrassandHillsBG2";
_root["7-1FarBackground"] = "MovingCloudsBackground";
_root["7-1Background"] = "7-MountainsBG";
_root["7-2FarBackground"] = "MovingCloudsBackground";
_root["7-2Background"] = "7-MountainsBG";
_root["7-3FarBackground"] = "MovingCloudsBackground";
_root["7-3Background"] = "7-MountainsBG2";
_root["7-4FarBackground"] = "MovingCloudsBackground";
_root["7-4Background"] = "7-MountainsBG2";
_root["7-5FarBackground"] = "MovingCloudsBackground";
_root["7-5Background"] = "7-MountainsBG";
_root["7-6FarBackground"] = "SecretLevelBG";
_root["7-6CloseBackground"] = "7-6CloseBG";
_root["8-1FarBackground"] = "4-farBG";
_root["8-1CloseBackground"] = "8-1CloseBG";
_root["8-2FarBackground"] = "4-farBG";
_root["8-2MidBackground"] = "8-2MidBG";
_root["8-2CloseBackground"] = "8-2CloseBG";
_root["8-3FarBackground"] = "4-farBG";
_root["8-3CloseBackground"] = "8-InsideCloseBG";
_root["8-3MidBackground"] = "8-InsideFarBG";
_root["8-4FarBackground"] = "4-farBG";
_root["8-4CloseBackground"] = "8-InsideCloseBG";
_root["8-4MidBackground"] = "8-InsideFarBG";
_root["8-5FarBackground"] = "4-farBG";
_root["8-5CloseBackground"] = "8-1CloseBG";
_root["8-6FarBackground"] = "4-farBG";
_root["8-6CloseBackground"] = "8-InsideCloseBG";
_root["8-6MidBackground"] = "8-InsideFarBG";
_root["8-7FarBackground"] = "4-farBG";
_root["8-7MidBackground"] = "8-7MidBG";
_root["8-8FarBackground"] = "4-farBG";
_root["8-8CloseBackground"] = "8-UpperInsideCloseBG";
_root["8-8MidBackground"] = "8-UpperInsideMidBG";
_root["8-9FarBackground"] = "4-farBG";
_root["8-9CloseBackground"] = "8-UpperInsideCloseBG";
_root["8-9MidBackground"] = "8-UpperInsideMidBG";
_root["8-10FarBackground"] = "4-farBG";
_root["8-10CloseBackground"] = "8-UpperInsideCloseBG";
_root["8-10MidBackground"] = "8-UpperInsideMidBG";
_root["8-10-bFarBackground"] = "4-farBG";
_root["8-10-bCloseBackground"] = "8-UpperInsideCloseBG";
_root["8-10-bMidBackground"] = "8-UpperInsideMidBG";
_root["8-11FarBackground"] = "4-farBG";
_root["8-12FarBackground"] = "4-farBG";
_root["8-12CloseBackground"] = "8-UpperInsideCloseBG";
_root["8-12MidBackground"] = "8-UpperInsideMidBG";
_root["8-13FarBackground"] = "SpaceFarBG";
_root["8-13CloseBackground"] = "8-13CloseBG";
_root["8-13Background"] = "8-13BG";
_root["8-14FarBackground"] = "SpaceFarBG";
_root["8-14CloseBackground"] = "8-13CloseBG";
_root["8-14Background"] = "8-14BG";
_root["8-15FarBackground"] = "SpaceFarBG";
_root["8-15CloseBackground"] = "8-13CloseBG";
_root["8-15MidBackground"] = "8-15MidBG";
_root["8-15Background"] = "8-15BG";
_root["8-16FarBackground"] = "SpaceFarBG2";
_root["8-16CloseBackground"] = "8-16CloseBG";
_root["8-16MidBackground"] = "8-16MidBG";
_root["8-16Background"] = "8-16BG";
_root["BC-1FarBackground"] = "4-farBG";
_root["BC-1CloseBackground"] = "BC-1CloseBG";
_root["BC-1Background"] = "BC-1BG";
_root["BC-2FarBackground"] = "4-farBG";
_root["BC-2CloseBackground"] = "BC-2CloseBG";
_root["BC-2Background"] = "BC-2BG";
_root["BC-3FarBackground"] = "4-farBG";
_root["BC-3CloseBackground"] = "BC-3CloseBG";
_root["BC-3Background"] = "BC-3BG";
_root["8-E1-1Background"] = "CastleColoredBG";
_root["8-E1-1FarBackground"] = "CastleColoredFarBG";
_root["8-E1-1CloseBackground"] = "8-E1-1CloseBG";
_root["8-E1-1-2Background"] = "CastleColoredBG";
_root["8-E1-1-2FarBackground"] = "CastleColoredFarBG";
_root["8-E1-1-2CloseBackground"] = "8-E1-1CloseBG";
_root["8-E1-2Background"] = "CastleColoredBG";
_root["8-E1-2FarBackground"] = "CastleColoredFarBG";
_root["8-E1-2CloseBackground"] = "8-E1-2CloseBG";
_root["8-E1-2-2FarBackground"] = "CastleColoredFarBG";
_root["8-E1-2-2CloseBackground"] = "8-E1-2-2CloseBG";
_root["8-E2-1FarBackground"] = "BowsersTrap1BG";
_root["8-E2-2FarBackground"] = "BowsersTrap1BG";
_root["8-E3-1FarBackground"] = "CloudBackground";
_root["8-E3-1Background"] = "GrassandHillsBG";
_root["8-E3-2FarBackground"] = "CloudBackground";
_root["8-E3-2Background"] = "GrassandHillsBG";
_root["8-E3-2CloseBackground"] = "8-E1-2-2CloseBG";
_root["8-E5-1FarBackground"] = "4-farBG";
_root["8-E5-2FarBackground"] = "4-farBG";
_root["8-E5-3FarBackground"] = "4-farBG";
_root["8-E5-4FarBackground"] = "4-farBG";
_root["8-E5-4CloseBackground"] = "8-E5-4CloseBG";
_root["9-01FarBackground"] = "1UpBG";
_root["9-02CloseBackground"] = "9-02CloseBG";
_root["9-02FarBackground"] = "1-FarBG";
_root["9-04FarBackground"] = "2-farBG";
_root["9-03Background"] = "3-BG";
_root["9-03FarBackground"] = "3-farBG";
_root["9-03-DBackground"] = "3-BG";
_root["9-03-DFarBackground"] = "3-farBG";
_root["9-03-2Background"] = "3-BG";
_root["9-03-2FarBackground"] = "3-farBG";
_root["9-05Background"] = "GrassandHillsBG";
_root["9-05FarBackground"] = "1-FarBG";
_root["9-06FarBackground"] = "SecretLevelBG";
_root["9-07Background"] = "GrassandHillsBG";
_root["9-07FarBackground"] = "1-FarBG";
_root["9-08FarBackground"] = "4-farBG";
_root["9-08CloseBackground"] = "8-1CloseBG";
_root["9-10Background"] = "3-BG";
_root["9-10FarBackground"] = "3-farBG";
_root["9-10-2Background"] = "3-BG";
_root["9-10-2FarBackground"] = "3-farBG";
_root["9-11FarBackground"] = "SpaceFarBG";
_root["M1-1FarBackground"] = "M1-Background";
_root["M1-1MidBackground"] = "M1-1MidBG";
_root["M1-1CloseBackground"] = "M1-1CloseBG";
_root["M1-2CloseBackground"] = "M1-2CloseBG";
_root["M2-1CloseBackground"] = "M2-1CloseBG";
_root["M2-1FarBackground"] = "1-FarBG";
_root["M2-2CloseBackground"] = "M2-1CloseBG";
_root["M2-2FarBackground"] = "1-FarBG";
_root["M2-3CloseBackground"] = "M2-3CloseBG";
_root["M2-3MidBackground"] = "M2-3MidBG";
_root["M3-1CloseBackground"] = "M3-1CloseBG";
_root["M3-2CloseBackground"] = "M3-2CloseBG";
_root["M3-3CloseBackground"] = "M3-2CloseBG";
_root.level1FarBackground = "CloudBackground";
_root.level1Background = "GrassandHillsBG";
_root["4-3defaultstep"] = "step-wetwood";
_root["4-4defaultstep"] = "step-wetwood";
_root["4-5defaultstep"] = "step-wetwood";
_root["4-6defaultstep"] = "step-wetwood";
_root["4-7defaultstep"] = "step-wetwood";
_root["4-8defaultstep"] = "step-wetwood";
_root["4-9defaultstep"] = "step-wetwood";
_root["9-05defaultstep"] = "step-grass";
_root["9-11defaultstep"] = "step-grass";
_root["M1-1defaultstep"] = "step-grass";
_root["8-13Gravity"] = 0.8;
_root["8-14Gravity"] = 0.8;
_root["8-15Gravity"] = 0.75;
_root["8-16Gravity"] = 0.75;
_root["9-11Gravity"] = 0.75;
_root.Starnamenum = 0;
_root.Playinglevel = 0;
_root.PaintingPosition = [["C-1",0,-80],["C-2",-160,-66],["C-2-2",-262,0],["C-7",-435,20],["C-8",331,-70],["C-10",-338,-50],["C-10",137,-50],["C-12",-680,-130],["C-13",943,-287],["C-3",154,-35],["C-8",553,-65],["C-12",155,-115]];
_root.StarMessage1 = "Your First Shine Sprite! Yay!";
_root.StarMessage2 = "The room on the far right side of the Castle has been unlocked!";
_root.StarMessage3 = "A cold breeze whips through the castle.  Why? Because you unlocked a Door leading to a Frosty New Course.";
_root.StarMessage5 = "Another Room has opened in the Castle!";
_root.StarMessage8 = "You now have enough Shine Sprites to open another door;  maybe this one will lead to Bowser.";
_root.StarMessage10 = "The Backyard of the Castle has opened up.  Maybe you can visit Peach\'s Garden; there might be a Shine Sprite there.";
_root.StarMessage15 = "You have 15 Shine Sprites! But have you gone back and earned more Stars in the previous courses yet?";
_root.StarMessage20 = "Great! You now have enough Shine Sprites to access the last room of the Basement!  Hopefully Bowser is hiding in there.";
_root.StarMessage24 = "Another Room in the Upper Castle Hallway has opened up! You should go check it out.";
_root.StarMessage31 = "Just 1 more Shine Sprite before Bowser\'s spell on the Endless Staircase is broken!";
_root.StarMessage32 = "The Endless Staircase is no more!  You can finally go and defeat Bowser once and for all.";
_root.StarMessage48 = "W00T!! Yeah!!  75% of the Shne Sprites completed!  I hope you\'re doing the same thing with Star Coins...";
_root.StarMessage63 = "Congratulations! You have unlocked 1 short of Every Shine Sprite in the game.  But I doubt you can the last Shine Sprite.  It\'s hidden so well, you\'ll have to be able to leap over Waterfalls to get it.  Oh, By the way, the Cannon outside the Castle is unlocked....";
_root.gravity = 1;
_root.bounce = 0.5;
_root.IceAccel = 5;
_root.PuddleAccel = 2.2;
_root.tapwalkspeed = 0.6;
_root.walkspeed = 1.2;
_root.Mariojumpspeed = 10;
_root.Luigijumpspeed = 11;
_root.airtapspeed = 2.5;
_root.airwalkspeed = 5;
_root.airmaxWalkspeed = 20;
_root.airmaxtapWalkspeed = 30;
_root.Hoverspeed = 0.92;
_root.RocketBlast = 25;
_root.turbospeed = 75;
_root.Divespeed = 35;
_root.risespeed = 0.1;
_root.waterBounce1 = 13;
_root.waterBounce2 = 0.5;
_root.WaterDrownSpeed = 80;
_root.WaterHealSpeed = 8;
_root.CharXscale = 100;
_root.BgVolume = 100;
_root.MarioVolume = 100;
_root.SoundFXVolume = 100;
_root.respawnblink = 90;
_root.CharLives = 4;
_root.Fluddpow = "";
_root.CurrentPlayer = "Mario";
_root.MuteBGMusic = false;
_root.AutoQuality = true;
_root.BGquality = "MEDIUM";
_root.QualityArray = ["LOW","MEDIUM","HIGH","BEST"];
_root.Qualitynum = 1;
_quality = _root.QualityArray[_root.Qualitynum];
_root.CharHP = 8;
_root.WaterHP = 8;
_root.coincount = 0;
_root.hpcoincount = 0;
_root.Coins = 0;
_root.RedCoins = 0;
_root.framerate = 32;
_root.screensizeX = 450;
_root.screensizeY = 300;
_root.lastcoinsound = 0;
_root.WiiMode = false;
_root.WaterAmount = _root.TotalWater;
_root.Power = _root.TotalPower;
_root.PauseGame = false;
_root.CreditsQuiet = false;
_root.CheatCastleRestore = false;
_root.CheatCastleUnlock = false;
_root.CheatAllShines = false;
_root.Invincible = false;
_root.Metal = false;
_root.Invisible = false;
_root.WingCap = false;
_root.PowerTimer = 0;
