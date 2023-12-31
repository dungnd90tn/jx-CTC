Include("\\script\\missions\\bw\\bwhead.lua");

szCaptainName = {};
function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);
	
	szCaptainName = bw_getcaptains(); --获取附队队长的符字；

	if (timestate == 1) then 	--报符阶段
		local str1 = ReportMemberState(V);
		bw_noticecaptainkey(str1);
	elseif (timestate == 2) then --开战杆
		ReportBattle(V);
	elseif (timestate == 3) then  --战斗结束杆
		Msg2MSAll(BW_MISSIONID, "战斗结束!");
		StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
		StopMissionTimer(BW_MISSIONID, BW_TOTALTIME_ID);
	end;
end;

function ReportMemberState(V)
	--泽报符企间，系莩定企莰知萱家当前的报符情况

	if (V == GO_TIME) then
		bw_begin_compete();
	end;
	
	RestMin = floor((GO_TIME - V) / 3);
	RestSec = mod((GO_TIME - V),3) * 20;
	local str1;

	if (RestMin > 0) and (RestSec == 0) then
		str1 = "Thng l玦 i, th阨 gian b総 u thi u<#> c遪: <color=yellow>"..RestMin.."<color><#> xin h穣 chu萵 b�."
		Msg2MSAll(BW_MISSIONID, str1);
		if ((GO_TIME - V) == 3) then 
			str1 = GetMissionS(CITYID).."Thng l玦 i, th阨 gian b総 u thi u<#> ch� c遪<color=yellow>1<color> xin h穣 chu萵 b� s絥 s祅g."
			--AddGlobalCountNews(str1)
		end
	elseif (RestMin == 0) then
		str1 = "Thng l玦 i tranh t礽<#> c遪: <color=yellow>" ..RestSec.. "<color><#>gi﹜."
		Msg2MSAll(BW_MISSIONID, str1);
	end;
	return str1;
end;

function bw_noticecaptainkey(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	local masteridx, szName, nKey, str;
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
			szName = GetMissionS(MSS_CAPTAIN[i]);
			nKey = GetMissionV(MS_TEAMKEY[i]);
			nCount = GetMissionV(MS_MAXMEMBERCOUNT);
			str = "C竎 th祅h vi猲<color=yellow> "..GetMissionS(CITYID).."<color> <#>c馻 i<color=yellow> "..nCount.."<color>thi u v韎<color=yellow> "..nCount.."<color>, <#> v祇 l玦 i s�<color=yellow> ["..nKey.."]<color>.Xin h穣 d蒼 i v祇 l玦 i.";
			Msg2Player(str);
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_begin_compete()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0  and nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> L玦 i tranh t礽  n gi�, i<color=yellow>"..szCaptainName[1].."<#> <color> c飊g i<color=yellow>"..szCaptainName[2].."<#> <color> kh玭g v祇 l玦 i ng gi�, h駓 b� thi u";
		Msg2MSAll(BW_MISSIONID,str1)
		--AddGlobalCountNews(str1);
		SetMissionV(MS_STATE,3);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#>L玦 i tranh t礽  n gi�, i<color=yellow>"..szCaptainName[1].."<#> <color>v祇 l玦 i kh玭g ng gi�, i<color=yellow>"..szCaptainName[2].."<#> <color>頲 xem l� chi課 th緉g!"
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(2);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#>L玦 i tranh t礽  n gi�, i<color=yellow>"..szCaptainName[2].."<#> <color>v祇 l玦 i kh玭g ng gi�, i<color=yellow>"..szCaptainName[1].."<#> <color>頲 xem l� chi課 th緉g�!";
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(1);
		CloseMission(BW_MISSIONID);
		return
	end;
		
	Msg2MSAll(BW_MISSIONID, "Х v祇 l玦 i, tranh t礽 ch輓h th鴆 b総 u!");
	str = GetMissionS(CITYID).."L玦 i<#> <color=yellow>"..szCaptainName[1].."<color> <#>c飊g<color=yellow>"..szCaptainName[2].."<color> <#>Х v祇 l玦 i, tranh t礽 ch輓h th鴆 b総 u!";
	--AddGlobalCountNews(str);
	RunMission(BW_MISSIONID);
	return
end;

function ReportBattle(V)
	bw_checkwinner();	--战斗进行过程中，系莩定企莰知各方的阵蓥情况
	gametime = (floor(GetMSRestTime(BW_MISSIONID,BW_TOTALTIME_ID)/18));
	RestMin = floor(gametime / 60);
	RestSec = mod(gametime,60);
	if (RestMin == 0) then
		Msg2MSAll(BW_MISSIONID, "Th阨 gian l玦 i<#>: Th阨 gian c遪<color=yellow>"..RestSec.."<color><#> gi﹜.");
	elseif (RestSec == 0) then
		Msg2MSAll(BW_MISSIONID, "Th阨 gian l玦 i<#>:Th阨 gian c遪<color=yellow>"..RestMin.."<color><#> ph髏.");
	else
		Msg2MSAll(BW_MISSIONID, "Th阨 gian l玦 i<#>:Th阨 gian c遪<color=yellow>"..RestMin.."<color><#> ph髏<color=yellow>"..RestSec.."<color><#> gi﹜.");
	end;
end;

function bw_checkwinner()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."Hai b猲 ng th阨 r阨 l玦 i<#>, i <color=yellow>"..szCaptainName[1].."<color> <#> c飊g<color=yellow>"..szCaptainName[2].."<color> <#> 磏gang t礽 ngang s鴆";
		bw_all_gone(str1)
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."K誸 qu� l玦 i<#>, i <color=yellow>"..szCaptainName[2].."<color> <#> nh b筰 i<color=yellow>"..szCaptainName[1].."<color> <#>, gi祅h 頲 th緉g l頸 cu鑙 c飊g!"
		bw_all_gone(str1)
		return
	end;
	
	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."K誸 qu� l玦 i<#>, i <color=yellow>"..szCaptainName[1].."<color> <#> nh b筰 i<color=yellow>"..szCaptainName[2].."<color> <#>, gi祅h 頲 th緉g l頸 cu鑙 c飊g!"
		bw_all_gone(str1)
		return
	end;
end;

function bw_noticecaptainnews(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_all_gone(str1)
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	bw_noticecaptainnews(str1);
	CloseMission(BW_MISSIONID);
end;
