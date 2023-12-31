-------------------------------------------------------------------------
-- FileName		:	spreader.lua
-- Author		:	lailigao
-- CreateTime	:	2005-06-03 10:15:37
-- Desc			:	游戏推广员系统
-- Include("\\script\\misc\\spreader\\spreader.lua")
---------------------------------------------------------------------------

IncludeLib("SPREADER")

Include("\\script\\global\\systemconfig.lua") -- 系统配置
Include("\\script\\shitu\\shitu_head.lua")
Include("\\script\\misc\\spreader\\head.lua")
Include("\\script\\misc\\spreader\\newaccount.lua")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\misc\\rename\\rename_func.lua")
Include("\\script\\misc\\lostgolditem\\restore_goldeqitem.lua")		--领取丢失黄金装备

function main()
	game_spreader()
end
function game_spreader()
	--if (SWITCH_SPREADER ~= 1) then
	--	Talk(1, "", "<color=green>Th玭g c竜<color>: ch鴆 n╪g n祔 ch璦 頲 m�, xin xem th玭g b竜 c馻 trang web!");
		--return 0;
	--end
	local szOp = 
	{
		"Nh藀 cd-key k輈h ho箃 t礽 kho秐/gsp_input_cdkey",
		"Nh薾 頲 ph莕 thng! /gsp_phase_prize",
		"Nh薾 s�  thi誴 ho祅g kim ngi m韎/gsp_accept_goldcard", 
		"Li猲 quan Th玭g c竜.../gsp_about",
		"B錳 thng cho bang h閕 產ng chi誱 th祅h/about_castellan_remedy",
		"t l筰 t猲 cho nh﹏ v藅/about_rename_role",
		"t l筰 t猲 cho bang h閕/about_rename_tong",
		"Ngi ch琲 i t猲 nh﹏ v藅 khi chuy觧 sang Server m韎/rename_role_tranfer",
		"Nh﹏ ti謓 gh� qua th玦/gsp_cancel",
		"Nh薾 l筰 trang b� Ho祅g Kim  m蕋!/restore_golditem",
	};
	
	if (SYSCFG_REGION_VERSION	== SC_REGION_VER_CN) then -- 大陆版本
		Say("Hoan ngh猲h v祇 <color=green>Th玭g c竜<color>, c� g� c莕 gi髉 ?", 7,
			szOp[1],
			szOp[2],
			szOp[3],
			szOp[4],
			szOp[5],
			szOp[6],
			szOp[8]);
	elseif (SYSCFG_REGION_VERSION	== SC_REGION_VER_VN) then -- 越南版本
		Say("Xin h醝 c� th� gi髉 g� cho qu� kh竎h?", 3,
			szOp[1],
			szOp[2],
			szOp[3],
			szOp[4],
			szOp[5],
			szOp[6],
			szOp[7],
			szOp[8],
			szOp[10],
			szOp[9]);
	else
		Say("Xin h醝 c� th� gi髉 g� cho qu� kh竎h?", 1,
			szOp[8]);	
	end
end

function gsp_input_cdkey()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	local szError;
	
	--if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then
	if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then
		Msg2Player("Ban ch璦 l穘h gi秈 thng gi秈 thng c馻 ho箃 ng khuy課 m穒! B﹜ gi� t苙g b筺.");
		gsp_newaccount_gift_core();
		nValue = nValue + 1; -- 此步可做可不做
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY) then
		szError = "T礽 kho秐 n祔  k輈h ho箃, kh玭g c莕 nh藀 cd-key. Nh璶g b筺 c� th� kh玭g nh薾 頲 th� S�  Ho祅g Kim, xin li猲 h� v韎 Vinagame."
		Talk(1, "", "<color=green>Th玭g c竜<color>:"..szError);
		gsp_writeLog(szError);
		return -1;
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY_PAY) then
		szError = "T礽 kho祅 n祔  k輈h ho箃, kh玭g c莕 nh藀 cd-key. C竚 琻 b筺  駈g h�!"
		Talk(1, "", "<color=green>Th玭g c竜<color>:"..szError);
		-- gsp_writeLog(szError);
		return -1;
	end
	
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "Xin nh藀 cd-key:");
end

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey);
end

function gsp_about()
	Talk(1, "", "<color=green>Th玭g c竜<color>, xin xem trang web ch輓h th鴆.");
end

function gsp_cancel()
end

-- 领取阶段奖励
function gsp_phase_prize()
	local nValue = GetTask(GSP_TASKID_ROLEREINFO);
	if (GetByte(nValue, GSP_TASKID_TAG_BYTE_ROLETYPE) ~= GSP_TASKID_ROLETYPE_CDKEY) then
		Talk(1, "", "<color=green>Th玭g c竜<color>: B筺 ch璦 s� d鬾g cd-key k輈h ho箃 t礽 kho秐 n祔, kh玭g th� l穘h thng. M鋓 chi ti誸 xin xem tr猲 trang web.");
		return 0;
	end
	
	local nLevel = GetLevel();
	local nBonus = 0;
	local nPrizeLevel = 0;
	local nBit = 0;
	-----------------
	if (nLevel < 30) then
		Talk(1, "", "<color=green>Th玭g c竜<color>: Hi謓 ng c蕄 c馻 b筺 l� "..GetLevel().."c蕄, ch璦 l穘h gi秈 thng.<enter>Khi b筺 n c蕄 30, 40, 50, 80 h穣 n nh薾 gi秈 thng! C� l猲! <enter><enter><color=green>Hng d蒼<color>: Cho ph衟 b筺 s� d鬾g <color=yellow>Ho祅g Kim S�  thi誴<color>.");
		return 0;
	end
	if (nLevel >= 30 and GetBit(nValue, GSP_TASKID_TAG_BIT_30BONUS) == 0) then
		nPrizeLevel = 30;
		nBit = GSP_TASKID_TAG_BIT_30BONUS;
		nBonus = 300000; -- 30W
	-----------------
	elseif (nLevel >= 40 and GetBit(nValue, GSP_TASKID_TAG_BIT_40BONUS) == 0) then
		nPrizeLevel = 40;
		nBit = GSP_TASKID_TAG_BIT_40BONUS;
		nBonus = 400000; -- 40W
	-----------------
	elseif (nLevel >= 50 and GetBit(nValue, GSP_TASKID_TAG_BIT_50BONUS) == 0) then
		nPrizeLevel = 50;
		nBit = GSP_TASKID_TAG_BIT_50BONUS;
		nBonus = 1000000; -- 100W
	end
	-----------------
	if (nBonus > 0) then
		Earn(nBonus);
	elseif (nLevel >= 80 and GetBit(nValue, GSP_TASKID_TAG_BIT_80BONUS) == 0) then
		nPrizeLevel = 80;
		nBit = GSP_TASKID_TAG_BIT_80BONUS;
		if (gsp_prize_skills90() == 0) then -- 学会90级技能 = 0:学习失败
			nPrizeLevel = 0;
			nBit = 0;
		end
	end
	-----------------
	
	if (nPrizeLevel ~= 0) then
		print("Value:"..nValue)
		nValue = SetBit(nValue, nBit, 1); -- 设置领取标记
		print("Value:"..nValue)
		SetTask(GSP_TASKID_ROLEREINFO, nValue);
		Talk(1, "", "<color=green>Th玭g c竜<color>: B筺 nh薾 頲"..nPrizeLevel.."ph莕 thng c馻 giai 畂筺 n祔! C� g緉g n� l鵦 th猰 nh�!");
	else
		Talk(1, "", "<color=green>Th玭g c竜<color>: B筺  l穘h gi秈 thng, h穣 c� g緉g!");
	end
end

-- CDKEY检验结果返回处理
function gsp_cdkey_verify_result(nResult)

	local szMsg = 
	{
		"Khi ph竧 sinh l鏸, xin h穣 li猲 h� v韎 GM!",
		"cd-key v� hi謚, xin nh藀 ng cd-key!",
		"cd-key ch輓h x竎, t礽 kho秐  k輈h ho箃! Ch祇 m鮪g v祇 Th玭g c竜!",
		"Th蕋 b筰: T礽 kho秐  s� d鬾g h琻 10 gi�, kh玭g th� ng nh藀 v祇 l筰!",
		"Th蕋 b筰: T礽 kho秐 n祔  k輈h ho箃, kh玭g th� ng nh藀 n鱝!"
	};
	local nSel = 1;
	if (nResult == GSP_CDKEY_E_CDKEYERROR) then
		nSel = 2;
	elseif (nResult == GSP_CDKEY_ACTION_SUCCESS) then
	 	nSel = 3;
	elseif (nResult == GSP_CDKEY_E_NEWTIMEOUT) then
		nSel = 4;
	elseif (nResult == GSP_CDKEY_E_NEWACTIVED) then
		nSel = 5;
	end

	gsp_writeLog(szMsg[nSel].." result: "..nResult);
	Msg2Player(szMsg[nSel]);
	Talk(1, "", " [<color=green>Th玭g c竜<color>]"..szMsg[nSel]);

	if (nResult == GSP_CDKEY_ACTION_SUCCESS) then
		gsp_config_for_join();
	end
	
	return 1;
end

-- 加入系统，配置相关信息
function gsp_config_for_join()
	-- 设置CDKEY激活
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, GSP_ACCOUNT_TYPE_CDKEY - nValue);
	
	gsp_accept_goldcard();
end

-- 接受黄金师徒卡
function gsp_accept_goldcard()
	-- 设置角色类型 for spreader
	SetTask(GSP_TASKID_ROLEREINFO, 0); -- 先清零，有无必要？
	local nTaskValue = 0;
	nTaskValue = SetByte(nTaskValue, GSP_TASKID_TAG_BYTE_ROLETYPE, GSP_TASKID_ROLETYPE_CDKEY);
	SetTask(GSP_TASKID_ROLEREINFO, nTaskValue);
	--print("GSP_TASKID_ROLEREINFO:"..nTaskValue);
	-- 更改扩展点数据
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, 1);
	
	-- 送黄金师徒卡，标记黄金徒弟
	AddItem(6, 1, 441, 1, 0, 0); -- 黄金师徒卡
	SetTask(TKID_GOLD_APPRENTICE, 1); -- 标记角色为黄金徒弟
	
	local szMsg = "B筺 nh薾 頲 <color=yellow>Th� Ho祅g Kim S� <color>! D飊g n�  b竔 s�, b筺 v� s� ph� u s� nh薾 頲 nhi襲 ph莕 thng!"; 
	Msg2Player(szMsg);
	Talk(1, "", "<color=green>Th玭g c竜<color>:"..szMsg);
	-- gsp_writeLog("获得黄金师徒卡");
end

------------------
-- 90级技能
SKILLS_90 = {
	{	{318,1},{319,1},{321,1}}, --少林
	{	{322,1},{323,1},{325,1}}, --天王
	{	{339,1},{302,1},{342,1},{351,0}}, --唐门
	{	{353,1},{355,1},{390,0}}, --五毒
	{	{328,1},{380,1},{332,0}}, --峨嵋
	{	{336,1},{337,1}}, --翠烟
	{	{357,1},{359,1}}, --丐帮
	{	{361,1},{362,1},{391,0}}, --天忍
	{	{365,1},{368,1}}, --武当
	{	{372,1},{375,1},{394,0}}, --昆仑
}

function gsp_prize_skills90()
	local faction = GetLastFactionNumber()
	if(faction ~= -1) then
		for i=1,getn(SKILLS_90[faction+1]) do
			-- 没有学过，才加上，否则会清掉原来的级别
			if (HaveMagic(SKILLS_90[faction+1][i][1]) == -1) then
				AddMagic(SKILLS_90[faction+1][i][1],SKILLS_90[faction+1][i][2])
			end
		end
		Msg2Player("Ch骳 m鮪g b筺  vt qua th� th竎h c馻 <color=green>Th玭g c竜<color>, c� th� l穘h ng� k� n╪g c蕄 90 ")
		AddGlobalNews("M鋓 ngi c飊g nhau ch骳 m鮪g"..GetName().."Thu薾 l頸 th玭g qua th� th竎h c馻 Th玭g c竜 c� th� l穘h ng� k� n╪g c蕄 90 c馻 b鎛 m玭.")
		return 1;
	end
	Msg2Player("B筺 ch璦 nh藀 m玭! Kh玭g th� l穘h ng� 頲 k� n╪g c蕄 90!")
	Talk(1, "", "B筺 ch璦 nh藀 m玭! Kh玭g th� l穘h ng� 頲 k� n╪g c蕄 90!");
	return 0;
end

-- 检查是否有原占城帮会补偿
function check_castellan_remedy()
	if (GetBit(GetTask(TASKVALUE_BLEND), 3) == 1) then
		return 1;
	end
	return 0;
end

-- 清除有原占城帮会补偿任务变量
function clear_castellan_remedy()
	local value = GetTask(TASKVALUE_BLEND)
	value = SetBit(value, 3, 0)
	SetTask(TASKVALUE_BLEND, value)
end

-- 原占城帮会补偿
function about_castellan_remedy()
	if (check_castellan_remedy() == 1) then
		Say("<#> Do c� ph竧 sinh tr鬰 tr芻 n猲 h� th鑞g  x� l� sai quy襫 h筺 c馻 b筺! Ch髇g t玦 k藀 t鴆 b錳 thng! B筺 c� mu鑞 nh薾 b錳 thng ngay b﹜ gi� kh玭g?",
			2,
			"<#> Ta mu鑞 nh薾 b錳 thng/take_castellan_remedy",
			"<#> L莕 sau n nh薾/cancel");
	else
		deny()
	end
end

-- 领取原占城帮会补偿
function take_castellan_remedy()
	Say("<#> M鏸 Bang h閕 chi誱 th祅h nh薾 頲 ph莕 thng b錳 thng: 60 c竔 th莕 b� i h錸g bao (Do bang ch� nh薾 l蕐) v� 500000000 lng (Tr鵦 ti誴 a v祇 ng﹏ qu� Bang h閕) . Xin h穣 x竎 nh薾 c遪 kho秐g tr鑞g tr猲 h祅h trang, b筺 mu鑞 nh薾 ngay b﹜ gi� ch�?",
		2,
		"<#> Ta mu鑞 nh薾 ngay/take_castellan_remedy2",
		"<#> L莕 sau n nh薾/cancel")
end

function take_castellan_remedy2()
	if (check_castellan_remedy() == 1) then
		for i = 1, 60 do
			AddItem(6, 1, 402, 0, 0, 0, 0)
		end
		local now = date("%Y-%m-%d %H:%M:%S")
		local name = GetName()
		WriteLog(now .. " B錳 thng cho bang h閕 產ng chi誱 th祅h" .. name .. "nh薾 頲 60 th莕 b� i h錸g bao")
		Msg2Player("<#> B筺 nh薾 頲 60 c竔 th莕 b� i h錸g bao")

		tong, res = GetTong()
		if (res == 1 and tong ~= "") then
			local money = 500000000
			AddTongMoney(tong, money)
			WriteLog(now .. " B錳 thng cho bang h閕 產ng chi誱 th祅h" .. name .. "Bang h閕 hi謓 t筰" .. tong .. "nh薾 頲 60 th莕 b� i h錸g bao")
			Msg2Player("<#> Bang h閕 c馻 b筺 nh薾 頲" .. money .. " lng")
		end
		clear_castellan_remedy()
	end
end

-- 重名玩家更改角色名对话
function about_rename_role()
	local strInfo = "<#> Ch祇 b筺! V� t猲 nh﹏ v藅 c馻 b筺 v� ngi ch琲 kh竎 gi鑞g nhau, cho n猲 h� th鑞g  gi髉 b筺 i t猲, b筺 c� th� s鯽 t猲 nh﹏ v藅 c馻 b筺 trc y, c� th� ki觤 tra xem t猲  c� d飊g 頲 kh玭g. Ch� �! B筺 ch� c� 1 c� h閕 duy nh蕋  i t猲, xin h穣 c萵 th薾 t鮪g bc.";
	local strError= "<#> Xin l鏸! B筺 kh玭g th� ti課 h祅h thao t竎 n祔. ( Ch� c� th� thay i t猲 Nh﹏ v藅, t猲 Bang h閕, t猲 bang ch� c馻 bang h閕 chi誱 th祅h) . Xin li猲 h� v韎 GM  bi誸 th猲m chi ti誸";
	func_online_rename_role(strInfo, strError);
end

function rename_role_tranfer()
	local strInfo = "<#>B筺 ch� c� duy nh蕋 1 c� h閕  i t猲 nh﹏ v藅. C� th� xem trc  l鵤 ch鋘. Xin xem k� c竎 th玭g tin trc khi quy誸 nh!";
	local strError= "<#> B筺 kh玭g th� th鵦 hi謓 thao t竎 n祔! Ch� ngi 產ng chuy觧 Server m韎 c� th� ti課h h祅h. Xin li猲 h� v韎 b� ph薾 ph鬰 v�  bi誸 th猰 chi ti誸!";
	func_online_rename_role(strInfo, strError);
end

-- 重名帮会更改帮会名
function about_rename_tong()
	if (check_renametong() == 1) then
		Say("<#> Ch祇 b筺! V� t猲 nh﹏ v藅 c馻 b筺 v� ngi ch琲 kh竎 gi鑞g nhau, cho n猲 h� th鑞g  gi髉 b筺 i t猲, b筺 c� th� s鯽 t猲 nh﹏ v藅 c馻 b筺 trc y, c� th� ki觤 tra xem t猲  c� d飊g 頲 kh玭g. Ch� �! B筺 ch� c� 1 c� h閕 duy nh蕋  i t猲, xin h穣 c萵 th薾 t鮪g bc.",
			3,
			"<#> Ki觤 tra t猲 Bang h閕 c遪 s� d鬾g 頲 kh玭g?/query_tongname",
			"<#> S鯽 i t猲 Bang h閕 c馻 m譶h/change_tongname",
			"<#> в l莕 sau ta thay i v藋/cancel")
	else
		deny()
	end
end

-- 查询帮会名
function query_tongname()
	AskClientForString("on_query_tongname", "", 1, 20, "<#> Xin nh藀 t猲 Bang h閕 mu鑞 t譵 hi觰");
end

function on_query_tongname(new_tong)
	if (check_renametong() == 1) then
		QueryTongName(new_tong)
	end
end

-- 更改帮会名
function change_tongname()
	Say("<#> C竎 bc c� th�: цi tho筰 v韎 NPC, nh藀 t猲 bang h閕 c莕 thay i v祇, b筺 s� t� ng r阨 m筺g. Sau 3 ph髏 ng nh藀 l筰, n誹 t猲 bang h閕  thay i th� 頲 xem i t猲 th祅h c玭g; n誹 ch璦 thay i, m阨 b筺 th鵦 hi謓 l筰 c竎 bc tr猲. N誹 xu蕋 hi謓 m閠 s� hi謓 tng l� xin li猲 h� GM gi秈 quy誸.", 
		2,
		"<#> B総 u thay i t猲 Bang h閕/change_tongname2",
		"<#> в ta suy ngh� l筰/cancel");
end

function change_tongname2()
	AskClientForString("on_change_tongname", "", 1, 20, "<#> Xin nh藀 t猲 Bang h閕 m韎 v祇");
end

function on_change_tongname(new_tong)
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#> Ch� c� bang ch� m韎 c� th� thay i t猲 Bang h閕")
	elseif (check_renametong() == 1) then
		old_tong, res = GetTong()
		if (res == 1 and old_tong ~= "") then
			if (old_tong == new_tong) then
				Say("<#> Kh玭g th� thay i t猲 Bang h閕 gi鑞g nhau", 1, "<#> Bi誸 r錳!/cancel")
			else
				RenameTong(old_tong, new_tong)
			end
		end
	end
end

function deny()
	Say("<#> Xin l鏸! B筺 kh玭g th� ti課 h祅h thao t竎 n祔. ( Ch� c� th� thay i t猲 Nh﹏ v藅, t猲 Bang h閕, t猲 bang ch� c馻 bang h閕 chi誱 th祅h) . Xin li猲 h� v韎 GM  bi誸 th猲m chi ti誸",
		1,
		"<#> Bi誸 r錳!/cancel")
end
