----------------------------------------------------------------
--FileName:	smalltimer.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	周末活动：卫国战争之烽火连城
--			功能：计时器，每20秒触发
--				
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\head.lua")
function OnTimer()
	local t = GetMissionV( MS_SMALL_TIME ) + 1
	SetMissionV( MS_SMALL_TIME, t )
	
	local citycamp = GetMissionV( MS_CITYCAMP )
	local cityname = GetMissionS(MS_S_CD_NAME)
	
	if ( t == RUNGAME_TIME ) then	--开战时间到，提示守城开始，并刷第一批怪
		RunMission(MISSIONID)
		AddGlobalNews("Chi課 tranh v� qu鑓  b総 u, "..tbDEFENCE_ANNOUNCE[citycamp])
		Msg2MSAll( MISSIONID, "<color=yellow>Qu﹏ ch  b総 u c玭g th祅h, v�  b秓 v� th祅h ch髇g ta c竎 Tng s� h穣 x玭g l猲!" )
		cd_writelog(cityname.."B総 u.\ts� ngi\t"..GetMSPlayerCount(MISSIONID, 0))
		cd_buildfightnpc()
		return
	end
	
	if ( t > RUNGAME_TIME ) then
		local RestTime = (TOTAL_TIME - t * SMALL_TIME) / FRAME2TIME
		local RestMin, RestSec = GetMinAndSec(RestTime);

		if ( mod( t, 9 ) == 0 ) then
			cd_sendmsg2msall()		--每隔10分钟，提示当前XX类型怪，还有多少要杀
		end
		if ( mod(t, 15) == 0 ) then
			cd_callnpc()			--每隔10分钟，根据前10分钟的被杀死的普通怪数量，再刷新一次
		end
		if ( mod(t, 60) == 0 and RestMin ~= 0) then
			cd_sendmsg2global()
		end
		if ( t < LASTREPORT_TIME ) then	--每隔5分钟提示结束时间，最后5分钟每分钟提示一次
			if ( mod( t, 15 ) == 0 ) then
				Msg2MSAll( MISSIONID, "Th阨 gian k誸 th骳 th� th祅h c遪<color=yellow>"..RestMin.."ph髏" )
			end
		else
			if ( mod( t, 3 ) == 0 ) then
				Msg2MSAll( MISSIONID, "Th阨 gian k誸 th骳 th� th祅h c遪<color=yellow>"..RestMin.."ph髏" )
			end
		end
	else
		if ( mod( t, 18 ) == 0 ) then	--报名时间中，没6分钟提示报名结束时间，并发滚动消息
			RestTime = (RUNGAME_TIME - t) * SMALL_TIME / FRAME2TIME;
			RestMin, RestSec = GetMinAndSec(RestTime);
			if ( RestMin > 0 ) then
				Msg2MSAll( MISSIONID, "Th阨 gian b竜 danh c遪 l筰 l�:<color=yellow>"..RestMin.."ph髏" )
				AddGlobalNews("Cu閏 chi課  b総 u nh薾 b竜 danh, c� mu鑞 tham gia kh玭g?"..tbDEFENCE_ANNOUNCE[citycamp].."Th阨 gian khai chi課 c遪"..RestMin.."ph髏")
			end
		end
	end
end

function cd_callnpc()
	local tempnpc_1 = GetMissionV( MS_1RSTNPC_CCNT )
	local tempnpc_2 = GetMissionV( MS_2CNDNPC_CCNT )
	local tempnpc_3 = GetMissionV( MS_3RDNPC_CCNT )
--	local tempnpc_4 = GetMissionV( MS_4THNPC_CCNT )
--	local tempnpc_5 = GetMissionV( MS_5THNPC_CCNT )

	local tempnpc_total = tempnpc_1 + tempnpc_2 + tempnpc_3;
	if ( tempnpc_total <= 0 ) then
		return
	end
	
	local commonfile = GetMissionS( MS_S_CMNPCFILE );
	local commonxypos = {};
	local tbpos = {}
	local count = 0;
	local filehigh = GetTabFileHeight( commonfile ) - 1
	
	while ( count < tempnpc_total ) do	--随机选择坐标表的某些不重复的行，作为npc的重生点
		rannum = random( filehigh )
		flag, tbpos = cd_insertcell( tbpos, rannum )
		if ( flag == 1 ) then
			count = count + 1
		end
	end
	
	cd_addcommonnpc( tempnpc_1, tempnpc_2, tempnpc_3, tbpos, commonfile )
	cd_writelog(date("%m%d%H%M ")..format("call xiaoxiao = %d, call duizhang = %d, call xianfeng = %d",tempnpc_1, tempnpc_2, tempnpc_3))
	SetMissionV( MS_1RSTNPC_CCNT, 0 )	--刷完怪后，重新计数
	SetMissionV( MS_2CNDNPC_CCNT, 0 )
	SetMissionV( MS_3RDNPC_CCNT, 0 )
end

function cd_addcommonnpc( npccount_1, npccount_2, npccount_3, tbxypos, npcfile )
	local count = 0
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	local npcname = "Qu﹏ T鑞g"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "Qu﹏ Kim"
	end
	
	if ( npccount_1 > 0 ) then
		cd_addfightnpc(npcfile, 1, npccount_1, tbTNPC_SOLDIER[npccamp][1], tbSOLDIER_LEVEL[1], npcname..tbSOLDIER_NAME[1], 0, npccamp, tbFILE_NPCDEATH[1])
	end
	if ( npccount_2 > 0 ) then
		cd_addfightnpc(npcfile, (npccount_1 + 1), (npccount_1 + npccount_2), tbTNPC_SOLDIER[npccamp][2], tbSOLDIER_LEVEL[2], npcname..tbSOLDIER_NAME[2], 2, npccamp, tbFILE_NPCDEATH[2])
	end
	if ( npccount_3 > 0 ) then
		cd_addfightnpc(npcfile, (npccount_1 + npccount_2 + 1), (npccount_1 + npccount_2 + npccount_3), tbTNPC_SOLDIER[npccamp][3], tbSOLDIER_LEVEL[3], npcname..tbSOLDIER_NAME[3], 1, npccamp, tbFILE_NPCDEATH[3])
	end
end


function cd_insertcell( tbnum, cell )
	local flag = 0
	
	if( getn( tbnum ) == 0 ) then
		tbnum[ 1 ] = cell
		return 1, tbnum
	end
	
	for i = 1, getn( tbnum ) do
		if ( tbnum[i] == cell ) then
			flag = -1
			break
		end
	end
	
	if ( flag ~= -1 ) then
		tbnum[ getn( tbnum ) + 1 ] = cell
		return 1, tbnum
	end
	return 0, tbnum
end


function cd_sendmsg2msall()
	local restnpc_1 = GetMissionV( MS_1RSTNPC_TCNT )
	local restnpc_2 = GetMissionV( MS_2CNDNPC_TCNT )
	local restnpc_3 = GetMissionV( MS_3RDNPC_TCNT )
	local restnpc_4 = GetMissionV( MS_4THNPC_TCNT )
	local restnpc_5 = GetMissionV( MS_5THNPC_TCNT )
	
	local szMsg = "Chi課 b竜 th� th祅h:";
	Msg2MSAll(MISSIONID, "vi謓 binh tham gia th� th祅h l骳 trc g錷<color=yellow>"..GetMSPlayerCount(MISSIONID, 0).." ngi")
	if ( restnpc_1 ~= 0 ) then
		Msg2MSAll( MISSIONID, szMsg.."c莕 h� th� th猰<color=yellow>"..tbSOLDIER_NAME[1].." "..restnpc_1.."<color>ngi " )
	end
	if ( restnpc_2 ~= 0 ) then
		Msg2MSAll( MISSIONID, szMsg.."c莕 h� th� th猰<color=yellow>"..tbSOLDIER_NAME[2].." "..restnpc_2.."<color>ngi " )
	end
	if ( restnpc_3 ~= 0 ) then
		Msg2MSAll( MISSIONID, szMsg.."c莕 h� th� th猰<color=yellow>"..tbSOLDIER_NAME[3].." "..restnpc_3.."<color>ngi " )
	end
	
	if ( restnpc_1 == 0 and restnpc_2 == 0 and restnpc_3 == 0 ) then
		if ( restnpc_4 ~= 0 ) then
			Msg2MSAll( MISSIONID, szMsg.."c莕 h� th� th猰<color=yellow>"..tbSOLDIER_NAME[4].." "..restnpc_4.."<color>ngi " )
		else
			Msg2MSAll( MISSIONID, szMsg.."c莕 h� th� th猰<color=yellow>"..tbSOLDIER_NAME[5].." "..restnpc_5.."<color>ngi " )
		end
	end
	cd_writelog(date("%m%d%H%M\t")..format("c遪 l筰 %s %d\t%s %d\t%s %d\t%s %d\t%s %d",tbSOLDIER_NAME[1],restnpc_1,tbSOLDIER_NAME[2],restnpc_2,tbSOLDIER_NAME[3],restnpc_3,tbSOLDIER_NAME[4],restnpc_4,tbSOLDIER_NAME[5],restnpc_5))
end

function cd_sendmsg2global()
	local szMsg = "V� qu鑓 Phong H醓 li猲 th祅h"..GetMissionS(MS_S_CD_NAME).."Chi課 tranh 產ng trong giai 畂筺 竎 li謙."..tbDEFENCE_ANNOUNCE[GetMissionV(MS_CITYCAMP)]
	AddGlobalNews(szMsg)
end