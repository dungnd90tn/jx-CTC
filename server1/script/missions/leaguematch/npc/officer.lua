--武林联赛官员

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )
Include("\\script\\lib\\log.lua")


--主对话框
function main()
	local n_level = wlls_getcityinfo()
	if (not wlls_CheckIsOpen(n_level)) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (not FALSE(n_lid)) then
		--检查并提示找错官员的情况
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_mylevel = WLLS_TAB[n_mytype].match_type[n_mtype].level
		if (n_mylevel ~= n_level) then
			wlls_descript("<enter>   C竎 h�  gia nh藀<color=red>"..WLLS_LEVEL_DESC[n_mylevel].."<color> Ta l� <color=red>"..WLLS_LEVEL_DESC[n_level].."<color>, c� ph秈  t譵 nh莔 ngi?", wlls_add_option({}, "Kh玭g c� chuy謓 g� h誸"))
			return
		end
		
		--判断是否越级
		local str = wlls_levelcheck(GetName())
		if (str) then
			Say(wlls_npcname()..str, 3,
				"Ta mu鑞 r阨 kh醝 nh鉳!/wlls_want2leaveleague",
				"Ta mu鑞 xem th� m譶h c� ph莕 thng kh玭g/wlls_wantaward",
				"Ta s� quay l筰 sau/OnCancel")
			return
		end
	end

	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local str = "<enter>  "..WLLS_TAB[n_next].text_main[n_level]
	local str_des = WLLS_LEVEL_DESC[n_level]
	local tb_option = {}
	tb_option[getn(tb_option) + 1] = "Ta mu鑞 n "..str_des.."h閕 trng/wlls_want2signmap"
	tb_option[getn(tb_option) + 1] = ""..str_des.." nh鉳/wlls_mylg"
	tb_option[getn(tb_option) + 1] = "Ta mu鑞 l穘h ph莕 thng li猲 u/wlls_wantaward"
	tb_option[getn(tb_option) + 1] = "Ta mu鑞 ki觤 tra 甶觤 Uy Danh/wlls_ShowRespect"
	tb_option[getn(tb_option) + 1] = "сng ho芻 m� nh薾 kinh nghi謒/wlls_show_expswitch"
	wlls_descript(str, wlls_add_option(tb_option, "Ta ch� ti謓 gh� qua"))
end

--领取奖励（对话）
function wlls_wantaward()
	local n_matchphase = GetGlbValue( GLB_WLLS_PHASE )
	local str_des = wlls_get_desc(1)
	local n_awardmin = wlls_get_award_min()
	local str = "<enter>####b蕋 k� tham gia V� l﹎ li猲 u hay v� l﹎ ki謙 xu蕋 u 頲 nh薾 ph莕 thng. Ph莕 thng bao g錷 <color=red>Ph莕 thng x誴 h筺g<color> v� <color=red>甶觤 Vinh d�<color>. Sau m鏸 giai an thi u k誸 th骳, s� c╪ c� v祇<color=red>甶觤 tich l騳, t� l� th緉g, t鎛g th阨 gian thi u<color>  x誴 h筺g. <color=red>"..n_awardmin.."i x誴 cao nh蕋<color> s� nh薾 頲 <color=red>ph莕 thng c bi謙<color>. Ngi ch琲 trong qu� tr譶h thi u c� th� d飊g 甶觤 vinh d�  i ph莕 thng danh d�. Ngi mu鑞 nh薾 ph莕 thng g�?"
	local tb_option = {}
	if (n_matchphase == 1) then
		tb_option[getn(tb_option)+1] = "Ta mu鑞 l穘h ph莕 thng x誴 h筺g!/wlls_wantaward_rank"
		tb_option[getn(tb_option)+1] = "Ta mu鑞 l穘h gi秈 thng danh hi謚!/wlls_wantaward_title"
	end
	tb_option[getn(tb_option)+1] = "Ta mu鑞 i ph莕 thng danh d�/wlls_buy_honour"
	tb_option[getn(tb_option)+1] = "Ta mu鑞 mua ph莕 thng uy danh/wlls_buy_Respect"
	
	tb_option[getn(tb_option)+1] = "Ta ch� ti謓 gh� qua/OnCancel"
	wlls_descript(str, tb_option)
end

--领取排名奖励（对话）
function wlls_wantaward_rank()
	--检查排名奖励	
	local nAward, nLevel, szLGName, nRank = wlls_checkaward_rank()
	if nAward then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[nLevel][nAward]
		local str = "<enter>  Chi課 i c馻 b筺:<color=yellow>"..szLGName.."<color>Trong l莕 thi u "..str_des.." n祔 頲 x誴 h筺g <color=yellow>"..nRank.."<color>. Ngi c� th� nh薾 頲 甶觤 vinh d�"..tb_award[2].."甶觤."
		if (tb_award[3]) then	--有队长额外奖励
			if (LG_GetMemberTask(WLLS_LGTYPE, szLGName, GetName(), WLLS_LGMTASK_JOB) == 1) then
				str = str.."i trng (S� ph�) nh薾 th猰 甶觤 vinh d�"..tb_award[3].."甶觤."
			end
		end
		str = str.."L穘h ngay b﹜ gi� ch�?"
		wlls_descript(str,
			"Ta mu鑞 l穘h gi秈 thng!/wlls_getaward_rank",
			"Ta s� quay l筰 sau!/OnCancel")
		return
	end
end

--检查是否可以领取排名奖励，返回可以领的类型，nil为不可领
function wlls_checkaward_rank(b_silent)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then	--刚好在跨赛季的时候要领奖
		if (not b_silent) then
			Msg2Player("Hi謓 nay li猲 u  ti課 h祅h cu閏 thi m韎, kh玭g th� nh薾 gi秈 thng x誴 h筺g li猲 u l莕 trc.")
		end
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local str_des = wlls_get_desc(1)
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_awardmin = wlls_get_award_min()
	local n_rank = 0
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > n_awardmin) then
		if (not b_silent) then
			wlls_descript("<enter>  L莕 n祔"..str_des.." <color=red>"..n_awardmin.."<color> hi謓  x誴 h筺g, h譶h nh� chi課 i c馻 C竎 h� kh玭g c� trong y!"..n_awardmin.." ta gi髉 ki觤 tra l筰")
		end
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter>  ng tng gia nh藀 nh鉳 kh竎 l� c� th� n gi� m筼 nh薾 gi秈 thng! Ta ch璦 c� l萴 c萴! M颽 thi u sau C竎 h�  h穣 quay l筰!")
		end
		return nil
	end
	if (GetByte(GetTask(WLLS_TASKID_GOTAWARD), 1) >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter>  C竎 h�  l穘h thng r錳! мnh g箃 ta n鱝 �?")
		end
		return nil
	end
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb_award = WLLS_TAB[n_type].award_rank[n_level]
	local n_award
	for i = getn(tb_award), 1, -1 do
		if (tb_award[i][1] >= n_rank) then
			n_award = i
		else
			break
		end
	end
	return n_award, n_level, str_lgname, n_rank
end

--领取称号奖励
function wlls_wantaward_title()
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then
		Msg2Player("Х ti課 h祅h cu閏 thi u m韎, kh玭g th� nh薾 gi秈 thng!")
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_rank
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > 4) then
		Say(wlls_npcname().."Gi秈 thng n祔 ch� t苙g"..wlls_get_desc(1).."trong, ngi xu蕋 s綾 nh蕋 (4 i h筺g u) . Ngi kh玭g thu閏 nh鉳 , ng n y ph� r鑙!", 0)
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		wlls_descript("<enter>  ng tng gia nh藀 nh鉳 kh竎 l� c� th� n gi� m筼 nh薾 gi秈 thng! Ta ch璦 c� l萴 c萴! M颽 thi u sau C竎 h�  h穣 quay l筰!")
		return nil
	end
	local n_title = WLLS_AWARD_TITLE[n_level] + n_rank - 1
	
	
	if (n_level == 2) then
		if WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)] then
			n_title = WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)][n_rank]
		end
	end
	
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	
	local nTime	= nMon * 1000000 + nDay * 10000	-- 持续到下届联赛结束
	_M("Title_AddTitle", n_title, nTime)
	
	--Remove h祇 quang VLMC n誹 c� trc khi add h祇 quang m韎 - Modified by DinhHQ - 20110524
	if Title_GetActiveTitle() == 3000 then
		Title_RemoveTitle(3000)		
	end
	if GetSkillState(1500) ~= -1 then
		RemoveSkillState(1500)
	end
		
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	
	
	SetTask(1122, n_title)	--当前玩家领取的是哪个头衔ID
	local tb = {"Qu竛 qu﹏", "� ", "H筺g 3", "H筺g 4"}
	Msg2Player("Ch骳 m鮪g b筺 t 頲 danh hi謚 <color=yellow>"..wlls_get_desc(1)..tb[n_rank].."<color>! Danh hi謚 n祔 c� th� duy tr� trong <color=yellow>20<color> ng祔.")
end

--最终领取排行奖励
function wlls_getaward_rank()
	local n_award, n_level, str_lgname, nRank = wlls_checkaward_rank();
	if (n_award) then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[n_level][n_award]
		local n_got = GetGlbValue(GLB_WLLS_SID)
		n_got = SetByte(n_got, 4, n_type)
		n_got = SetByte(n_got, 3, n_level)
		n_got = SetByte(n_got, 2, n_award)
		SetTask(WLLS_TASKID_GOTAWARD, n_got)
		local nPoint	= tb_award[2]
		Msg2Player("Ch骳 m鮪g b筺 t 頲"..str_des.."Ph莕 thng x誴 h筺g: 甶觤 vinh d�"..tb_award[2].."甶觤")
		wlls_award_log(format("Nh薾 頲 ph莕 thng x誴 h筺g %s: 甶觤 vinh d� %d 甶觤",
											str_des, tb_award[2]))
		if (tb_award[3]) then	--有队长额外奖励
			--该判断只对队长不能转移的情况（师徒赛）安全
			if (LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB) == 1) then
				nPoint	= nPoint + tb_award[3]
				Msg2Player("Ch骳 m鮪g b筺 t 頲"..str_des.."Ph莕 thng x誴 h筺g (i trng): 甶觤 vinh d�"..tb_award[3].."甶觤")
				wlls_award_log(format("Nh薾 頲 ph莕 thng x誴 h筺g %s (i trng): 觤 vinh d�: %d 甶觤",
											str_des, tb_award[3]))
			end
		end
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		wlls_award_log(format("T鎛g c閚g c� %d 甶觤 vinh d�", GetTask(WLLS_TASKID_HONOUR)))
		
		if (nRank == 1) then -- 获得第一名 荣誉排行榜 联赛值加1
		    local nCurPoint = GetTask(2601);
		    nCurPoint = nCurPoint + 1;
		    SetTask(2601, nCurPoint);
		end

		SyncTaskValue(WLLS_TASKID_HONOUR)
	end
end

--检查是否可以建立战队
function wlls_cancreate(n_level)
	local n_mylevel = wlls_player_level()
	--等级限制
	if (n_mylevel ~= n_level) then
		if (n_level == 1) then
			if (n_mylevel < n_level) then
				wlls_descript("<enter>  <color=red>V� l﹎ ki謙 xu蕋 li猲 u<color> tuy n鉯 l�  ch鋘 ra nh鱪g h祇 ki謙 璾 t� c馻 c竎 m玭 ph竔 trong giang h�, nh璶g ng c蕄 c馻 b筺 v蒼 ch璦 !"..WLLS_LEVEL_JUNIOR.."c蕄, v� ngh� ch璦 tinh, ch� s� 產o ki誱 v� nh穘, l祄 ngi b� thng. Ngi n猲 ti誴 t鬰 luy謓 t藀!")
			else
				wlls_descript("<enter>  C竎 h�  l� i hi謕 giang h� nh nh i danh, <color=red>li猲 u V� l﹎ ki謙 xu蕋<color> l�  ch鋘 ra nh鱪g t礽 n╪g tr�, ngi c莕 g� ph秈 ra oai v韎 m h藆 b鑙 ch�? Hay l� ngi tham gia <color=red>V� l﹎ li猲 u<color> 甶!")
			end
		else
			wlls_descript("<enter>  <color=red>V� l﹎ li猲 u<color> v蒼 l� n琲 Anh h飊g thi猲 h� lu薾 ki誱, ng c蕄 c馻 ngi v蒼 ch璦 !"..WLLS_LEVEL_SENIOR.."c蕄, anh h飊g kh緋 n琲 t� t�, ng鋋 h� t祅g long, e r籲g ngi ch� l� k� h藆 b鑙! T鑤 h琻 n猲 luy謓 t藀 th猰!")
		end
		return nil
	end
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()))) then
		wlls_descript("<enter>  C竎 h�  v祇 nh鉳 r錳, kh玭g th� th祅h l藀 nh鉳 kh竎!")
		return nil
	end
	return wlls_player_type()
end

--我的战队
function wlls_mylg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local n_type

	if (FALSE(n_lid)) then
		n_type = GetGlbValue(GLB_WLLS_NEXT)
	else
		n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)		
	end
	
	WLLS_TAB[n_type].npc_mylg()
end

function wlls_want2create()
	local n_level = wlls_getcityinfo()
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	if (not wlls_cancreate(n_level)) then return end
	wlls_descript("<enter>"..WLLS_TAB[n_next].text_creat,
		"Ta mu鑞 l藀 nh鉳!/wlls_inputstr_lgname",
		"в ta xem l筰/OnCancel")
end

--输入战队名
function wlls_inputstr_lgname()
	local n_level = wlls_getcityinfo()
	if (not wlls_cancreate(n_level)) then return end
	AskClientForString("wlls_createleague", "", 1, 16, "Nh藀 t猲 nh鉳 mu鑞 th祅h l藀")
end

--建立战队（最终）
function wlls_createleague(str_lgname)
	if (not str_lgname) then
		str_lgname = GetName()
	end
	local n_level = wlls_getcityinfo()
	local n_mtype = wlls_cancreate(n_level)
	if (not n_mtype) then return end
	str_lgname = strsub(str_lgname,1,16)
	local forbidstr={" ","\"","/","#","|","\t","\n"}
	local str
	for i = 1, getn(forbidstr) do
		if (not FALSE(strfind(str_lgname,forbidstr[i]))) then
			str = "Xin l鏸! Nh鉳 c馻 b筺 kh玭g ch鴄 ch� n祔:"
			for i = 1, getn(forbidstr) do
				if (forbidstr[i]==" ") then
					str = str .. " [Space]"
				elseif (forbidstr[i]=="|") then
					str = str .. " [ch魀 h譶h]"
				elseif (forbidstr[i]=="\t") then
					str = str .. "[TAB]"
				elseif (forbidstr[i]=="\n") then
					str = str .. " [Enter]"
				else
					str = str .. forbidstr[i]
				end
			end
			break
		end
	end
	if (not str) then
		if (not FALSE(LG_GetLeagueObj(WLLS_LGTYPE, str_lgname))) then
			str = "Xin l鏸! T猲 i thi u n祔  c� ngi s� d鬾g."
		elseif (FALSE(ST_CheckTextFilter(str_lgname))) then
			str = "Xin l鏸! Nh鉳 c馻 b筺 ch鴄 t� kh玭g ng."
		end
	end
	if (str) then
		Say(wlls_npcname()..str, 2, "Hi觰 r錳! Ta s� nh藀 l筰!/wlls_inputstr_lgname", "Kh玭g c莕!/OnCancel")
		return
	end
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local szParam = GetName().." "..n_next.." "..n_mtype.." "..str_lgname
	LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, GetName(), "\\script\\leaguematch\\league.lua", "wlls_create", szParam , "", "")
	
	
	SetRespect(0)
end


--添加成员（对话）
function wlls_want2addmember()
	local teammember, _, str_lgname = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local str = wlls_npcname().."B筺 mu鑞 nh鱪g ngi di y"..getn(teammember).."gia nh藀 nh鉳 c馻 b筺 ["..str_lgname.."] ph秈 kh玭g?<enter>";
	for i = 1, getn(teammember) do
		str = str.." <color=yellow>"..teammember[i];
	end

	Say(str, 2, "ng r錳! Жng k�  anh 蕐 (c� 蕐) gia nh藀 i thi u/wlls_sure2addmember","Kh玭g c莕!/OnCancel")
end

--添加成员（最终）
function wlls_sure2addmember()
	local teammember = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local str_lgname = LG_GetLeagueInfo(n_lid)
	for i = 1, getn(teammember) do
		local nPlayerIndex = SearchPlayer(teammember[i])
		if nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, SetRespect, 0)
			local szParam = teammember[i].." "..str_lgname.." "..GetName()
			LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, teammember[i], "\\script\\leaguematch\\league.lua", "wlls_add", szParam , "", "")
		end	
	end
end

--检查组队队员是否可以被添加到当前队伍中，成功返回组队队员名单、战队类型、战队名，否则返回nil
function wlls_checkteam()
	if (IsCaptain() ~= 1) then
		Say(wlls_npcname().."Xin l鏸! B筺 c莕 ph秈 l� <color=red> i trng<color> trong <color=red>nh鉳<color>, m韎 c� th� ng k� i vi猲 gia nh藀 chi課 i.",0)
		return nil
	end

	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say(wlls_npcname().."Nh鉳 c馻 b筺 h譶h nh� kh玭g c� th祅h vi猲 nh鉳 kh竎? B筺 mu鑞 cho ai v祇 chi課 i c馻 m譶h?",0)
		return nil
	end

	local n_lid, n_mtype, n_job, str_lgname, n_mcount = wlls_lg_info()
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."Xin l鏸! B筺 ch璦 l藀 nh鉳, kh玭g th� cho ngi kh竎 v祇 nh鉳!", 0)
		return nil
	end
	if (n_job ~= 1) then
		Say(wlls_npcname().."Xin l鏸! B筺 kh玭g ph秈 l� i trng, kh玭g th� cho ngi kh竎 v祇 chi課 i!", 0)
		return nil
	end
	local n_next	= GetGlbValue(GLB_WLLS_NEXT)
	local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	if (n_stype ~= n_next) then
		Say(wlls_npcname().."Xin l鏸! Lo筰 h譶h li猲 u k� sau  thay i, chi課 i c馻 b筺 hi謓 t筰  qu� h筺, kh玭g th� ti誴 t鬰 s� d鬾g.", 0)
		return nil
	end
	local n_maxmem = WLLS_TAB[n_next].max_member
	n_mcount = n_maxmem - n_mcount
	if (n_mcount <= 0) then
		Say(wlls_npcname().."Xin l鏸! Chi課 i c馻 b筺 ["..str_lgname.."]  s� lng, kh玭g th� gia nh藀 th猰 i vi猲!",0)
		return nil
	end
	if (GetTeamSize()-1 > n_mcount) then
		Say(wlls_npcname().."Xin l鏸! Chi課 i c馻 b筺 ["..str_lgname.."]ch� c莕 nh藀 l筰 "..n_mcount.." ngi, kh玭g th� cho to祅 b� th祅h vi猲 c馻 b筺 gia nh藀! Xin h穣 cho th祅h vi猲 th鮝 t筸 th阨 r阨 kh醝 nh鉳!",0)
		return nil
	end

	local teammember = {}
	local str_capname = GetName()
	local n_capidx = PlayerIndex
	for i = 2 , teamsize do
		PlayerIndex = GetTeamMember(i)
		local membername = GetName()
		--避免重复加入队员
		if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, membername))) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname().."Xin l鏸! чi vi猲 trong nh鉳:"..membername.."  l� th祅h vi猲 c馻 chi課 i kh竎, cho n猲 kh玭g th� v祇 chi課 i c馻 b筺!", 0)
		 	return nil
		end
		--加入队员特殊检查
		local str = wlls_check_addmem(n_capidx, n_lid, n_mtype)
		if (str) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname()..str, 0)
		 	return nil
		end
		teammember[i-1] = membername
	end
	PlayerIndex = n_capidx
	return teammember, n_mtype, str_lgname
end

--离开战队（对话）
function wlls_want2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB)
	local str = wlls_npcname().."Ngi mu鑞 r阨 kh醝 chi課 i ["..str_lgname.."]ph秈 kh玭g?"
	if(n_memcount <= 1) then
		str = str .. "B筺 hi謓 l� <color=red>th祅h vi猲 duy nh蕋<color> c馻 chi課 i c馻 b筺. N誹 nh� b筺 r阨 kh醝 chi課 i, chi課 i s� b� gi秈 t竛."
	elseif (not FALSE(n_job)) then
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_type == 3) then	--师徒赛
			str = str .. "Hi謓 t筰 b筺 l� <color=red>i trng (s� ph�)<color> c馻 chi課 i, n誹 b筺 r阨 kh醝 chi課 i,   c馻 b筺 s� <color=red>kh玭g 頲 tham gia thi u<color>."
		else	--其他联赛
			str = str .. "B筺 hi謓 l� <color=red>чi trng<color>, n誹 nh� b筺 r阨 kh醝 nh鉳, ch鴆 чi trng s� 頲 chuy觧 cho th祅h vi猲 kh竎."
		end
	end
	Say(str, 2, "ng v藋!/wlls_sure2leaveleague","Kh玭g c莕!/OnCancel")
end

--离开战队（确认对话）
function wlls_sure2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	Say(wlls_npcname().."Sau khi b筺 r阨 kh醝 nh鉳, s� <color=yellow>kh玭g th� l穘h gi秈 thng c馻 chi課 i<color>, b筺 x竎 nh薾 mu鑞 r阨 kh醝 nh鉳?", 2, "ng v藋!/wlls_leaveleague_final","Kh玭g c莕!/OnCancel")
end

--离开战队（最终）
function wlls_leaveleague_final()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	LG_ApplyDoScript(WLLS_LGTYPE, "", GetName(), "\\script\\leaguematch\\league.lua", "wlls_leave", GetName() , "", "")
end

--进入会场（对话）
function wlls_want2signmap()
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	
	if (n_matchphase < 2) then
		Say(wlls_npcname().."Hi猲 t筰 l� th阨 gian li猲 u t筸 ngh�, h閕 trng s� t筸 ng c鯽, b筺 h穣 ch� n k� thi u h穣 quay l筰!", 0)
		return 
	end
		
	local n_level, n_group = wlls_getcityinfo()
	local n_lid, n_mtype = wlls_check_player(GetName(), n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (FALSE(n_lid)) then
		local str_des = wlls_get_desc(1)
		if (WLLS_TAB[n_type].max_member == 1) then
			wlls_descript("B筺 ch璦 "..str_des.."chi課 i, n誹 tham gia thi u, h� th鑞g s� l藀 cho b筺 1 chi課 i. B筺 c� mu鑞 l藀 1 chi課 i kh玭g?", "Ta mu鑞 l藀 chi課 i!/#wlls_createleague()", "Ta kh玭g mu鑞 thi u!/OnCancel")
		else
			wlls_descript("<enter>  L莕 n祔"..str_des.." ch璦 th蕐 b竜 danh chi課 i c馻 b筺, c� nh莔 l蒼 g� kh玭g? Quy nh c馻 V� l﹎ minh ch� nghi猰 ng苩, ta mu鑞 gi髉 ngi c騨g kh玭g 頲. Чi hi謕 h穣 甶 x竎 nh薾 l筰, r錳 h穣 n t譵 ta!")
		end
		return
	end

	if (not WLLS_TAB[n_type].match_type[n_mtype].map[n_group]) then
		n_group = 1
	end
	--记录入场地点
	local x,y,z = GetWorldPos();
	SetTask(WLLS_TASKID_FROMMAP, x);
	SetTask(WLLS_TASKID_FROM_X, y);
	SetTask(WLLS_TASKID_FROM_Y, z);

	--传送到报名点地图
	local n_signmap = wlls_get_mapid(1, n_mtype, n_group)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	Msg2Player("B筺  n<color=yellow>"..wlls_get_desc(3, n_mtype, n_group).."<color>khu v鵦 thi u")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhThamGiaLienDau")
end

--检查是否可以离开战队。可以返回n_lid，否则返回nil,原因字符串
function wlls_check_leavelg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if(n_lid == 0) then
		return nil, "B筺 v蒼 ch璦 v祇 chi課 i!"
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_phase = GetGlbValue(GLB_WLLS_PHASE)
	if(n_phase ~= 1 and n_total ~= 0) then
		return nil, "Do chi課 i c馻 b筺 產ng thi u, b筺 kh玭g th� r阨 kh醝 chi課 i, h穣 ch� n l骳 thi u xong h穣 quay l筰!"
	end
	
	if(n_phase > 3) then
		return nil, "ng trong thi u, kh玭g th� r阨 kh醝 chi課 i, xin i sau tr薾 u l骳 th阨 gian ngh� ng琲 m韎 r阨 kh醝 chi課 i."
	end
	
	return n_lid
end

--取得当前比赛排名奖励至少需要多少名
function wlls_get_award_min()
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_level = wlls_getcityinfo()
	local tb = WLLS_TAB[n_type].award_rank[n_level]
	return tb[getn(tb)][1]
end

--经验领取开关
function wlls_show_expswitch()
	local b_exps = GetBit(GetTask(WLLS_TASKID_SWITCH), 1)
	local str = "<enter>   Ph莕 thng v� l﹎ li猲 u l莕 n祔 phong ph� l緈! N誹 c竎 ngi kh玭g mu鑞 s� d鬾g ngay 甶觤 kinh nghi謒 th� � ch� ta c� thi誸 l藀 n髏 ng, m� 甶觤 kinh nghi謒, ngi c� th� kh鉧 ph莕 thng 甶觤 kinh nghi謒 c馻 m譶h.<enter>"
	str = str.."<enter>   Tr筺g th竔 ng/m� hi謓 t筰 c馻 b筺 l�:"..iif(b_exps == 0, "<color=red>m�<color> (c� th� nh薾 ph莕 thng kinh nghi謒) ", "<color=red>ng<color> (kh玭g th� nh薾 ph莕 thng kinh nghi謒) ")..""
	wlls_descript(str, iif(b_exps == 0, "Ta mu鑞 ng ph莕 thng/#wlls_set_expswitch(1)", "Ta mu鑞 m� ph莕 thng/#wlls_set_expswitch(0)"), "Л頲 th玦! Ta  thi誸 l藀 xong r錳!/OnCancel")
end

--设置经验领取开关
function wlls_set_expswitch(b_exps)
	local n_switch = GetTask(WLLS_TASKID_SWITCH)
	SetTask(WLLS_TASKID_SWITCH, SetBit(n_switch, 1, b_exps))
	Talk(1, "wlls_show_expswitch", "Th祅h c玭g"..iif(b_exps == 0, "m� ", "сng").."ph莕 thng kinh nghi謒 li猲 u!")
end

--用荣誉换取商品
function wlls_buy_honour()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end

	Msg2Player("b筺 hi謓 產ng c� <color=yellow>"..GetTask(WLLS_TASKID_HONOUR).."<color> 甶觤 vinh d�")
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- 商店的荣誉积分编号为11
	else
		Say(wlls_npcname().."Xin m� kh鉧 rng trc r錳 h穣 mua! ", 0)
	end
end


function wlls_ShowRespect()
	Talk(1, "", "Hi謓 t筰 i hi謕 c� 甶觤 uy danh l� <color=yellow>"..GetRespect().."<color>")
end

--用荣誉换取商品
function wlls_buy_Respect()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end
	--B� gi韎 h筺 th阨 gian b竛 o c� trong shop danh v鋘g - Modified by DinhHQ - 20110429
--	local nDate = tonumber(GetLocalDate("%d"))
--	if (nDate >= 8 and nDate <= 28) then
--		Talk(1, "", "Hi謓 t筰 kh玭g th� mua o c� danh v鋘g")
--		return 
--	end
	
	
	Msg2Player("Hi謓 t筰 i hi謕 c� 甶觤 uy danh l� <color=yellow>"..GetRespect().."<color>")
	if (GetBoxLockState() == 0) then
		Sale(173,13) -- 商店的荣誉积分编号为11
	else
		Say(wlls_npcname().."Xin m� kh鉧 rng trc r錳 h穣 mua! ", 0)
	end
end