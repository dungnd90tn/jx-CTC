Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============师徒双人赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部师徒双人赛相关数据
WLLS_DATA = {
	
	name = "Song u s� ",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10221,
			map = {
				{396, 560, 397, "(1)"},
				{398, 561, 399, "(2)"},
				{400, 562, 401, "(3)"},
				{402, 563, 403, "(4)"},
				{404, 564, 405, "(5)"},
				{406, 565, 407, "(6)"},
				{408, 566, 409, "(7)"},
				{410, 567, 411, "(8)"},
			},
		},
		{
			name = "",
			level = 2,
			ladder = 10222,
			map = {
				{540, 570, 541, "(1)"},
				{542, 571, 543, "(2)"},
				{544, 572, 545, "(3)"},
				{546, 573, 547, "(4)"},
				{548, 574, 549, "(5)"},
				{550, 575, 551, "(6)"},
				{552, 576, 553, "(7)"},
				{554, 577, 555, "(8)"},
			},
		},
	},
	
	award_rank = {
		{	--排行奖励，新秀
			{1, 5000},	--第1名
			{2, 4000},	--第2名
			{3, 3500},	--第3名
			{4, 3000},	--第4名
			{8, 2000},	--第5-8名
			{16, 1500},	--第9-16名
			{32, 1000},	--第17-32名
			{64, 500},	--第33-64名
			{128, 250},	--第65-128名
		}, {	--联赛
			{1, 10000},	--第1名
			{2, 8000},	--第2名
			{3, 7000},	--第3名
			{4, 6000},	--第4名
			{8, 4000},	--第5-8名
			{16, 3000},	--第9-16名
			{32, 2000},	--第17-32名
			{64, 1000},	--第33-64名
			{128, 500},	--第65-128名
		}
	},
	
	max_member = 2,	--每个战队的最大人数
	
	--帮助文字（主要的帮助文字在normal.lua中，这里只写特异的部分）
	help_msg = {
		["Gi韎 thi謚 thi u V� l﹎ ki謙 xu蕋"]	=
			{
				"    Thi u l莕 n祔 l� <color=red>S�  song u<color>. Ngi ch琲 n g苝 <color=red>S� gi� Ki謙 xu蕋<color> b竜 danh th祅h l藀 chi課 i, sau  v祇 H閕 trng li猲 u Ki謙 xu蕋 ti課 h祅h thi u. чi trng (S� ph�) ng c蕄 t� 80- 119, i vi猲 ( ) t� 50- 90",
				"    Thi u l莕 n祔 l� <color=red>S�  song u<color>. Ngi ch琲 n g苝 <color=red>S� gi� Ki謙 xu蕋<color> b竜 danh th祅h l藀 chi課 i, sau  v祇 H閕 trng li猲 u Ki謙 xu蕋 ti課 h祅h thi u. чi trng (S� ph�) ng c蕄 t� 120 tr� l猲, i vi猲 ( ) t� 50- 90",
			},
		["Qu� tr譶h th祅h l藀 i thi u"]	= "    Ngi ch琲 c� th� t� l藀 chi課 i ho芻 gia nh藀 chi課 i ngi kh竎. чi trng ph秈 l�   ch璦 xu蕋 s�. чi trng n g苝 <s>  b竜 danh thi u",
		["R阨 kh醝 i thi u"]	= "    Trong <color=red>giai 畂筺 ngh� c竎h kho秐g<color>, ngi ch琲 c� th� t飝 � tho竧 ly chi課 i. Trong giai 畂筺 thi u, n誹 chi課 i c馻 m譶h <color=red>ch璦 n l骳 thi u<color>, ngi ch琲 c� th� t� � r阨 kh醝 chi課 i, n誹  u r錳 th� kh玭g th� r阨 i. <color=yellow>Sau khi r阨 kh醝 chi課 i s� kh玭g 頲 nh薾 ph莕 thng x誴 h筺g<color>. N誹 i trng r阨 kh醝 i th� chi課 i s� b� gi秈 t竛. <color=yellow>n誹 chi課 i kh玭g c遪 ai th� s� t� ng b� gi秈 t竛<color>. M鏸 l莕 li猲 u k誸 th骳, chi課 i n祇 kh玭g ph� h頿 cho l莕 sau c騨g s� t� ng b� gi秈 t竛",
	},
	
	text_main = {	--officer主对话（末尾差异部分）
		"Thi u l莕 n祔 l� <color=red>S�  song u<color>. ",
		"Thi u l莕 n祔 l� <color=red>S�  song u<color>. ",
	},
	
	text_creat = "    Sau khi l藀 chi課 i tham gia S�  song u b筺 c� th� <color=red>t� m譶h l� i trng<color>. N誹 c� s� ph� th� ph秈 do <color=red>� ph� m譶h l� i trng<color>.<enter>"
		.."    <color=red>n誹 ch璦 n l骳 thi u<color> v� <color=red>ch璦 u qua tr薾 n祇<color>, b筺 c� th� r阨 kh醝 chi課 i. N誹 S� ph� r阨 kh醝 chi課 i, i  l藀 t鴆 b� gi秈 t竛. Ngi x竎 nh l藀 chi課 i cho m譶h ch�?",
	
	--====Functions====
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>    L莕 n祔 "..str_des.."Khi <color=red>song u s� <color>, b筺 c� th� ch鋘 l藀 chi課 i, c騨g c� th� gia nh藀 chi課 i kh竎. чi trng gia nh藀 i vi猲 c莕 ph秈 l�   ch璦 xu蕋 s� c馻 i trng. Sau khi i trng v�   t� ch鴆 i xong, v� "..str_des.."цi tho筰 v韎 Quan vi猲, ch鋘 'чi thi u"..str_des.."c馻 t玦', ch鋘 nh鱪g i h鱱 gia nh藀 trong i m譶h l� 頲. Th祅h vi猲 i thi u nhi襲 nh蕋 <color=red>2 ngi<color>",
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
			"Qu� tr譶h th祅h vi猲 l藀 nh鉳: Trong <color=red>th阨 gian ngh� ng琲 v� th阨 gian thi u<color>, b筺 c� th� c飊g v韎 ngi ch琲 kh竎 l藀 nh鉳, ch鋘 nh鱪g i h鱱 gia nh藀 v祇 i thi u.<enter>"..
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
	check_addmem = function(n_capidx, n_lid, n_mtype)
		local n_oldidx = PlayerIndex
		PlayerIndex = n_capidx
		local n_lid = LG_GetLeagueObjByRole(1, GetName())	--师徒关系战队
		local n_num = GetTask(1403)	--TKID_APPRENTICE_COUNT = 1403 --收徒弟总数
		PlayerIndex = n_oldidx
		if (FALSE(n_lid) or n_num <= 0) then	
			return "Xin l鏸! b筺 ch璦 nh薾  , kh玭g th� l藀 nh鉳 v韎 b蕋 k� i vi猲 kh竎."
		end
		if (n_lid ~= LG_GetLeagueObjByRole(1, GetName())) then
			return "Xin l鏸! "..GetName().."Kh玭g ph秈 l�   c馻 b筺, kh玭g th� gia nh藀 i thi u c馻 b筺."
		end
		if (GetLevel() > 90) then
			return "Xin l鏸! "..GetName().."Qu� c蕄 90, kh玭g th� l祄   gia nh藀 i thi u 頲."
		end
		if (GetLevel() < 50) then
			return "Xin l鏸! "..GetName().."Ch璦  c蕄 50, kh玭g th� gia nh藀 i thi u."
		end
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(3,WLLS_DATA)
