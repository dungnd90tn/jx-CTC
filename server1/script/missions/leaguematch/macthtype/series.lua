Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============同系双人赛相关数据===============

-- LLG_ALLINONE_TODO_20070802

if (not tmp_process_data) then
	return
end

--全部同系双人赛相关数据
local nTmpLadderBase	= 10238
WLLS_DATA = {
	
	name = "Song u (C飊g h�)",
	
	--地图信息
	match_type = {
		{
			name = "h� Kim",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = "h� M閏",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = "h� Th駓",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = "h� H醓",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = "h� Th� ",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = "h� Kim",
			level = 2,
			ladder = nTmpLadderBase + 5,
			map = {{540, 570, 541, ""}},
		},
		{
			name = "h� M閏",
			level = 2,
			ladder = nTmpLadderBase + 6,
			map = {{542, 571, 543, ""}},
		},
		{
			name = "h� Th駓",
			level = 2,
			ladder = nTmpLadderBase + 7,
			map = {{544, 572, 545, ""}},
		},
		{
			name = "h� H醓",
			level = 2,
			ladder = nTmpLadderBase + 8,
			map = {{546, 573, 547, ""}},
		},
		{
			name = "h� Th� ",
			level = 2,
			ladder = nTmpLadderBase + 9,
			map = {{548, 574, 549, ""}},
		},
	},
	
	award_rank = {
		{	--排行奖励，新秀
			{1, 4000},	--第1名
			{2, 3000},	--第2名
			{3, 2500},	--第3名
			{4, 2000},	--第4名
			{8, 1500},	--第5-8名
			{16, 1250},	--第9-16名
			{32, 1000},	--第17-32名
			{64, 750},	--第33-64名
			{128, 500},	--第65-128名
			{256, 250},	--第129-256名
		}, {	--联赛
			{1, 8000},	--第1名
			{2, 6000},	--第2名
			{3, 5000},	--第3名
			{4, 4000},	--第4名
			{8, 3000},	--第5-8名
			{16, 2500},	--第9-16名
			{32, 2000},	--第17-32名
			{64, 1500},	--第33-64名
			{128, 1000},	--第65-128名
			{256, 500},	--第129-256名
		}
	},
	
	max_member = 2,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"Thi u l莕 n祔 l� уng h� song u",
		"Thi u l莕 n祔 l� уng h� song u",
	},
	
	addmem_ex	= ", v� ph秈 l� ngi ch琲 <color=red>c飊g h�<color> v韎 nhau",	--组建战队额外要求（可选）

	--====Functions====
	--返回当前角色可以参加的比赛类型，nil为不能参赛
	player_type = function()
		local nLevel = wlls_player_level()
		if (nLevel <= 0) then
			return nil
		end
		local nSeries = GetSeries() + 1
		if (nSeries <= 0) then
			wlls_error_log("GetSeries() = "..(nSeries - 1))
			return nil
		end
		return (nLevel - 1) * 5 + nSeries
	end,
	
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  L莕 n祔"..str_des.." l� <color=red>уng h� song u<color>. B筺 c� th� t� l藀 chi課 i c馻 m譶h ho芻 gia nh藀 chi課 i c馻 ngi kh竎. Sau  do i trng n g苝 "..str_des.."цi tho筰 v韎 Quan vi猲, ch鋘 'чi thi u"..str_des.."Th祅h vi猲 m鏸 chi課 i l� <color=red>2 ngi<color> v� ph秈 l� ngi c飊g h� v韎 nhau",
				"Ta mu鑞 l藀"..str_des.."nh鉳/wlls_want2create",
				"Ta ch� n xem th玦/OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>Chi課 i c馻 b筺 hi謓 l�:<color=yellow>"..str_lgname.."<color><enter>"
		.. "чi trng i chi課 u:"..join(wlls_get_mems(n_lid), "Th祅h vi猲 i chi課 u:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>Ch� �: H筺 ch� thi u m颽 sau l� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n誹 mu鑞 thi u m颽 sau, xin h穣 l藀 chi課 i m韎.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>   B筺 c� th� ch鋘 <color=red> gia nh藀 v祇 i kh竎<color> ho芻 <color=red>r阨 kh醝 i thi u<color>.<enter><enter>"..
			"C竎 bc th祅h l藀 chi課 i: trong <color=red>th阨 gian ngh� v� th阨 gian thi u<color>, Ngi u c� th� t� i v韎 ngi ch琲 kh竎 <color=red>c飊g h�<color>, l鵤 ch鋘 ng � cho ng i gia nh藀 chi課 i c馻 m譶h. <enter>"..
			"R阨 kh醝 i thi u: Trong <color=red>th阨 gian ngh� ng琲<color>, b筺 c� th� r阨 kh醝 i thi u; trong th阨 gian thi u n誹 i thi u c馻 b筺<color=red> ch璦 gia nh藀 thi u k� trc<color>, b筺 c� th� r阨 kh醝 i thi u; n誹  c� tham gia th� kh玭g th� r阨 i. T� c竎h i trng s� 頲 chuy觧 giao l筰 cho th祅h vi猲 kh竎, <color=yellow>n誹 kh玭g c� th祅h vi猲, chi課 i s� b� gi秈 t竛<color>."
			tb_option[getn(tb_option)+1] = "в i h鱱 c馻 Tagia nh藀 v祇 i thi u n祔/wlls_want2addmember"
		else
			str = str.."<enter>       B筺 c� th� ch鋘 r阨 kh醝 nh鉳.<enter><enter>"..
			"R阨 kh醝 nh鉳:   Trong <color=red>th阨 gian ngh� ng琲<color>, b筺 c� th� r阨 kh醝 i thi u; trong th阨 gian thi u n誹 i thi u m譶h <color=red>ch璦 tham gia gi秈 u trc<color>, b筺 c騨g c� th� r阨 kh醝 i thi u; c遪 n誹  gia nh藀 thi u kh玭g th� r阨 kh醝 i."
		end
		tb_option[getn(tb_option)+1] = "R阨 kh醝 i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem chi課 t輈h c馻 i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� ti謓 gh� qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--检查当前角色是否可以加入指定的战队
	check_addmem = function(nCapIdx, nLGID, nMType)
		if (nMType ~= wlls_player_type()) then
		 	return wlls_npcname().."Xin l鏸! чi vi猲 trong nh鉳:"..GetName().."<color=red>Ъng c蕄<color> ho芻 <color=red>ng� h祅h<color> c馻 hai i kh玭g h頿 l�, kh玭g th� th祅h l藀 chi課 i!"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(6,WLLS_DATA)
