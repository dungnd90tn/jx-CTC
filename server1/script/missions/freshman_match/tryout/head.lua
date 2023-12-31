Include("\\script\\missions\\freshman_match\\head.lua")
MISSIONID = 18;
MATCH_MS_ID = 19;
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟

UP_A_TIME = 20
RUN_A_TIME = 5 --报名5分钟之后，自动进入战斗赛场

MS_STATE = 1; --任务中记录任务状态的变量ID
MS_TIME_1 = 2	--每20秒加一smalltimer触发器
MS_TIME_2 = 3	--totaltimer触发器
MS_ROUND = 4	--记录当天赛事的轮次
MS_A_TIME = 5	--当前轮次用掉的时间

function Elect_RanField()
	local cnt_1 = 0
	local cnt_2 = 0
	local fieldtab = {}
	for i =1, 100 do
		fieldtab[i] = i
	end
	for i = 1, 100 do
		cnt_1 = random(1, 100) 
		a = fieldtab[cnt_1]
		cnt_2 = random(1, 100)
		fieldtab[cnt_1] = fieldtab[cnt_2]
		fieldtab[cnt_2] = a
	end
	return fieldtab
end

HIGHMEMBER_PERCENT = 20
MIDDLEMEMBER_PERCENT = 40
LOWMEMBER_PERCENT = 100 - HIGHMEMBER_PERCENT - MIDDLEMEMBER_PERCENT

function Elect_RanEnemy(plyidx)
	local num = getn(plyidx)
	local per_num = floor(num / 3);

	plyidx = cp_randomeny(1, per_num, plyidx)
	plyidx = cp_randomeny(per_num + 1, per_num * 2, plyidx)
	plyidx = cp_randomeny(per_num * 2 + 1, num, plyidx)
	
	high_count = floor(num * HIGHMEMBER_PERCENT / 100)
	plyidx = cp_randomeny(1, high_count, plyidx)
	
	middle_count = floor(num * MIDDLEMEMBER_PERCENT / 100)
	plyidx = cp_randomeny(high_count + 1, high_count + middle_count, plyidx)
	
	plyidx = cp_randomeny(high_count + middle_count + 1, num, plyidx)
	return plyidx
end

function cp_randomeny(q, m, tabplyidx )
	local a = 0
	local cnt_1 = 0
	local cnt_2 = 0
	for i = q, m do
		cnt_1 = random(q, m) 
		a = tabplyidx[cnt_1]
		cnt_2 = random(q, m)
		tabplyidx[cnt_1] = tabplyidx[cnt_2]
		tabplyidx[cnt_2] = a
	end
	return tabplyidx
end

function Run_CPMatch()
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end
	tbPlayer = Elect_RandomPL(tbPlayer)
	return tbPlayer
end

function Elect_RandomPL(tabplayindex)
	local ncount = 0
	local tab_index = {}
	oldplayer = PlayerIndex
	if (getn(tabplayindex) > 200) then
		tabplayindex = cp_randomeny(1, getn(tabplayindex), tabplayindex )
		for i = 1, 200 do
			tab_index[i] = tabplayindex[i]
		end
		local str = "S� ngi thi u v遪g n祔  y, xin i tr薾 ti誴 theo!"
		for i = 201, getn(tabplayindex) do 
			PlayerIndex = tabplayindex[i]
			Msg2Player(str)
			nt_settask(CP_TASKID_ENEMY, 0)
			NewWorld(SubWorldIdx2ID(SubWorld), CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
		end
	else
		tab_index = tabplayindex
	end
	PlayerIndex = oldplayer
	return tab_index	
end

function join_tryout()
	if (nt_gettask(CP_TASKID_ROUND) >= CP_MAXROUND ) then
		Say("S� l莕 thi u V� l﹎ ki謙 xu蕋 c馻 b筺  "..CP_MAXROUND.."l莕, kh玭g th� ti誴 t鬰 tham chi課.", 0)
		return
	end
	local subworldid = SubWorldIdx2ID (SubWorld)
	AddMSPlayer(MISSIONID,1);
	nt_settask(CP_TASKID_FLAG, 0)
	SetRevPos(subworldid, 1)
	WL_set_pl_state()
	SetCurCamp(1);
	nt_settask(CP_TASKID_ENEMY, 0)
	for i = 1, getn(CP_FORBID_ITEM) do
		AddSkillState(CP_FORBID_ITEM[i][3], 20, 1, 0)
	end
	
	NewWorld(subworldid, CP_MAPPOS_PRE[1], CP_MAPPOS_PRE[2])
	local mm = RUN_A_TIME - GetMissionV(MS_A_TIME)
	Msg2Player("B筺  v祇 n琲 chu萵 b� thi u. Thi u s� 頲 ti課 h祅h v祇"..mm.."ph髏 b総 u")
end

function join_match()
	WriteLog(date("%Y-%m-%d,%H:%M,").."h筺g th� "..GetMissionV(MS_ROUND).."th� m蕐"..checkmap(1).."S� ngi tham gia thi u m玭 ph竔 ki謙 xu蕋 l� "..GetMSPlayerCount(MISSIONID, 0))
	local fieldtab = {}
	local playertab = {}
	local org_mapindex = 0
	local org_mapid = 0
	local new_mapindex = 0
	local new_mapid = 0
	
	fieldtab = Elect_RanField()
	playertab = Run_CPMatch()
	playertab = Sort_Point(playertab)	
	playertab = Elect_RanEnemy(playertab)
	if (getn(playertab) > 200) then
		num_vs = 100
	else
		num_vs = floor (getn(playertab) / 2) 
	end
	org_mapindex = SubWorld
	org_mapid = SubWorldIdx2ID(SubWorld)
	new_mapid = org_mapid + 1
	new_mapindex = SubWorldID2Idx(new_mapid)
	orgplayeridx = PlayerIndex
	
	SubWorld = new_mapindex
	for i = 1, num_vs * 2, 2 do 
		posx = GetTabFileData(CP_MATCH_POS, fieldtab[i], 1)
		posy = GetTabFileData(CP_MATCH_POS, fieldtab[i], 2)
		org_plyidx = playertab[i]
		PlayerIndex = org_plyidx
		org_plyname = GetName()
		org_plywin = nt_gettask(CP_TASKID_WIN)
		org_plylose = nt_gettask(CP_TASKID_LOSE)
		org_plytie = nt_gettask(CP_TASKID_TIE)
		
		eny_plyidx = playertab[i + 1]
		PlayerIndex = eny_plyidx
		eny_plyname = GetName()
		eny_plywin = nt_gettask(CP_TASKID_WIN)
		eny_plylose = nt_gettask(CP_TASKID_LOSE)
		eny_plytie = nt_gettask(CP_TASKID_TIE)
		PlayerIndex = org_plyidx
		NewWorld (new_mapid, posx, posy)
		AddMSPlayer(MATCH_MS_ID, i);
		nt_settask(CP_TASKID_ENEMY, i + 100)
		nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
		nt_settask(CP_TASKID_LOGOUT, 1)
		SetCurCamp(2)
		WL_set_pl_state()
		SetRevPos(org_mapid, 1)
		Msg2Player("B筺  v祇 trng u, 10 gi﹜ sau s� ch輓h th鴆 b総 u.")
		Msg2Player("цi th� c馻 b筺"..eny_plyname.."K誸 qu� hi謓 t筰:"..eny_plywin.."th緉g "..eny_plylose.."thua"..eny_plytie.."h遖")
		WriteLog(date("%Y-%m-%d %H%M%S,")..GetAccount().."["..GetName().."], giai 畂筺 tham gia chi課 u, chi課 t輈h c馻 b筺 hi謓 t筰 l�: th緉g"..org_plywin.."thua"..org_plylose.."h遖"..org_plytie..",  tham gia r錳"..nt_gettask(CP_TASKID_ROUND))
		Msg2Player("Sau khi v祇 khu v鵦 thi u, kh玭g th� di chuy觧 v藅 ph萴 trong h祅h trang, nh璶g v蒼 c� th� s� d鬾g v藅 ph萴 trong h祅h trang v� b秐g c玭g c�.");
		SetDeathScript("\\script\\missions\\freshman_match\\match\\playerdeath.lua");
		
		PlayerIndex = eny_plyidx
		NewWorld (new_mapid, posx, posy)
		AddMSPlayer(MATCH_MS_ID, i + 100);
		nt_settask(CP_TASKID_ENEMY, i)
		nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
		nt_settask(CP_TASKID_LOGOUT, 1)
		SetCurCamp(3)
		WL_set_pl_state()
		SetRevPos(org_mapid, 1)
		Msg2Player("B筺  v祇 trng u, 10 gi﹜ sau s� ch輓h th鴆 b総 u.")
		Msg2Player("цi th� c馻 b筺"..org_plyname.."K誸 qu� hi謓 t筰:"..org_plywin.."th緉g "..org_plylose.."thua"..org_plytie.."h遖")
		WriteLog(date("%Y-%m-%d %H%M%S,")..GetAccount().."["..GetName().."], giai 畂筺 tham gia chi課 u, chi課 t輈h c馻 b筺 hi謓 t筰 l�: th緉g"..eny_plywin.."thua"..eny_plylose.."h遖"..eny_plytie..",  tham gia r錳"..nt_gettask(CP_TASKID_ROUND))
		Msg2Player("Sau khi v祇 khu v鵦 thi u, kh玭g th� di chuy觧 v藅 ph萴 trong h祅h trang, nh璶g v蒼 c� th� s� d鬾g v藅 ph萴 trong h祅h trang v� b秐g c玭g c�.");
		SetDeathScript("\\script\\missions\\freshman_match\\match\\playerdeath.lua");
	end
	SubWorld = org_mapindex
		local playeridx = {}
		idx = 0;
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
			if (idx == 0) then 
		 		break
		 	end;
		 	playeridx[i] = pidx
		end
		if (getn(playeridx) > 1) then
			str = "S� ngi thi u v遪g n祔  y, xin i tr薾 ti誴 theo!"
			for i = 1, getn(playeridx) do
				PlayerIndex = playeridx[i]
				Msg2Player(str)
				nt_settask(CP_TASKID_ENEMY, 0)
				DelMSPlayer(MISSIONID, PlayerIndex, 1)
				SetLogoutRV(0);
				NewWorld(SubWorldIdx2ID(SubWorld), CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
			end
		else
			str = "S� ngi tham gia v遪g n祔 kh玭g , kh玭g ch鋘 頲 i th� c馻 b筺, v遪g n祔 b筺  chi課 th緉g, 頲 3 甶觤 thng."
			for i = 1, getn(playeridx) do
				PlayerIndex = playeridx[i]
				enyname = GetName()
				nt_settask(CP_TASKID_WIN, nt_gettask(CP_TASKID_WIN) + 1)
				nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
				nt_settask(CP_TASKID_POINT, nt_gettask(CP_TASKID_POINT) + 3)
				Ladder_NewLadder(checkmap(2), GetName(), nt_gettask(CP_TASKID_POINT), 1)
				Msg2Player(str)
				DelMSPlayer(MISSIONID, PlayerIndex, 1)
				WriteLog("Ngi ch琲 ["..enyname.."], do kh玭g c� i th�, chi課 t輈h hi謓 th阨 l�: th緉g"..nt_gettask(CP_TASKID_WIN)..", thua"..nt_gettask(CP_TASKID_LOSE)..", h遖"..nt_gettask(CP_TASKID_TIE)..", chung cu閏"..nt_gettask(CP_TASKID_POINT))
				AddAword(GetLevel(), 60)
				nt_settask(CP_TASKID_ENEMY, 0)
				
				SetLogoutRV(0);
				NewWorld(SubWorldIdx2ID(SubWorld), CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
			end
		end
	PlayerIndex = orgplayeridx
end

function GameOver()
	cp_clearplstate()
	WriteLog(date("%Y-%m-%d %H%M%S,").."мa  n祔 ["..SubWorldIdx2ID(SubWorld).."]Thi u ki謙 xu蕋  k誸 th骳.")
end

function cp_clearplstate()
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
		WL_clear_pl_state()
		nt_settask(CP_TASKID_ENEMY, 0)
		
		SetLogoutRV(0);
		NewWorld(SubWorldIdx2ID(SubWorld), CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
	end
end