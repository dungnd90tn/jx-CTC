IncludeLib("FILESYS");
IncludeLib("TASKSYS");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\gift\\libgm.lua")
Include("\\script\\global\\lib\\serverlib.lua")	
Include("\\script\\activitysys\\functionlib.lua")
szFile = "\\dulieu\\Top5.dat"

--======== TOP-NAMCUNG == 01/7/2018 ========--

function nhantop5()	
	local nCurLevel = GetLevel()
	if nCurLevel < 120 then
		Talk(1, "", "CÊp ®é ng­¬i qu¸ thÊp mau ®i ®i !.")
		return 
	end
	if (GetTeamSize() > 0) then
		Talk(1, "", "H·y rêi ®éi tr­íc khi nhËn th­ëng.")
		return 
	end
	if CalcFreeItemCellCount() < 59 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 59 « trèng råi h·y më.",0);
		return
	end
	nhanthuong120()
end;

tbitem12  =
	{
 		[1]	={szName = "Ngùa B«n Tiªu", tbProp = {0,10,6,10,0,0}, nCount = 1,},
		[2]	={szName = "Trang BÞ Hång ¶nh", tbProp = {0,204}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
		[3]	={szName = "Trang BÞ Hång ¶nh", tbProp = {0,205}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
		[4]	={szName = "Trang BÞ Hång ¶nh", tbProp = {0,206}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
		[5]	={szName = "Trang BÞ Hång ¶nh", tbProp = {0,207}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
		[6]	={szName = "Trang BÞ §Þnh Quèc", tbProp = {0,159}, nCount = 1, nQuality = 1,},
		[7]	={szName = "Trang BÞ §Þnh Quèc", tbProp = {0,160}, nCount = 1,   nQuality = 1,},
		[8]	={szName = "Trang BÞ §Þnh Quèc", tbProp = {0,161}, nCount = 1,  nQuality = 1,},
		[9]	={szName = "Trang BÞ §Þnh Quèc", tbProp = {0,162}, nCount = 1,   nQuality = 1,},
		[10]	={szName = "Trang BÞ §Þnh Quèc", tbProp = {0,163}, nCount = 1,   nQuality = 1,},
	}

function nhanthuong120()
	if GetTask(3651) == 1 then
		Talk(1, "", "Ng­¬i nhËn råi cßn tham lam sao ? !.")
		return 
	end

	local nCheck = tonumber(DBGetData(szFile,"TOP5_CHECK","SoNguoi"))
	if nCheck == null then
		nCheck = 0
	end
	if nCheck == 5  then
		return Say("§· trao th­ëng cho 5 ng­êi ®Çu tiªn råi b¹n ®Õn trÓ råi!!")
	end

		DBSetData(szFile,"TOP5_CHECK","SoNguoi",nCheck +1);
		Earn(10000000)
		tbAwardTemplet:GiveAwardByList(tbitem12, "PhÇn th­ëng t©n thñ");
		SetTask(3651,1)
		Msg2Player("NhËn th­ëng thµnh c«ng!")

end;







