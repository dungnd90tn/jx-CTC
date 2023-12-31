-- 文件名　：makesnowman.lua
-- 创建者　：zhongchaolong
-- 创建时间：2007-11-23 10:56:30

Include("\\script\\event\\xmas07_makesnowman\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\basic.lua");
function main()
	xmas07_makeSnowMan_main()
end
function xmas07_makeSnowMan_main()
	if xmas07_makeSnowMan_isActPeriod() == 0 then
		Say(format("Ho箃 ng <color=yellow>%s<color>  k誸 th骳!",xmas07_makeSnowMan_ActName),0)
		return 0;
	end
	local tbDialog =
	{
		"<dec><npc>Ha ha, gi竛g sinh vui v�!",
		"Ta mu鑞 t譵 hi觰 n閕 dung ho箃 ng/xmas07_makeSnowMan_Content",
		"Ta mu鑞 t筼 ngi tuy誸./xmas07_makeSnowMan_wantCompose",
		"K誸 th骳 i tho筰/OnCancel",
	}

	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_Content()
	local tbDialog =
	{
		"<dec><npc>T� <color=red>0h00 ng祔 08-12-2007 n 24h00 ng祔 13-01-2008<color>, c竎 v� l﹎ nh﹏ s� khi nh qu竔 s� c� c� h閕 nh苩 頲 <color=yellow>揌閜 qu� gi竛g sinh�<color>, m� h閜 qu� gi竛g sinh s� ng蓇 nhi猲 nh薾 頲 nguy猲 li謚 t筼 ngi tuy誸. Sau khi thu th藀  nguy猲 li謚 c� th� n y  ch� t筼 <color=yellow>Ngi Tuy誸 <color> c竎 lo筰.<enter>� khu v鵦 b猲 ngo礽 th祅h, s� d鬾g  揌o祅g Tuy誸 Nh﹏�, 揟� Tuy誸 Nh﹏� ho芻 揕鬰 Tuy誸 Nh﹏� c� th� nh薾 頲 <color=red>1000000 甶觤 kinh nghi謒<color> v� 1 <color=red>v藅 ph萴 ng蓇 nhi猲<color>, d� nhi猲 n誹 may m緉 c� th� g鋓 ra <color=yellow>Boss Tuy誸 Nh﹏<color>, nh b筰 Boss Tuy誸 Nh﹏ s� c� c� h閕 nh薾 頲 ph莕 thng c� gi� tr�.",
		"Ha ha, ta hi觰 r錳/xmas07_makeSnowMan_main"
	}
	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_wantCompose()
	local tbDialog = 
	{
		"<dec><npc>C竎 v� l﹎ nh﹏ s� khi nh qu竔 s� c� c� h閕 nh苩 頲 <color=yellow>B╪g Tinh<color> h� kim, m閏, th駓, h醓, th�. S� d鬾g c竎 lo筰 b╪g tinh kh竎 nhau s� ch� t筼 頲 Ngi Tuy誸 kh竎 nhau, i hi謕 mu鑞 lo筰 n祇?",
		"Ta mu鑞 ch� t筼 'Ho祅g Tuy誸 Nh﹏'/#xmas2007_makeSnowMan_compose([[Yellow]])",
		"Ta mu鑞 ch� t筼 'T� Tuy誸 Nh﹏'/#xmas2007_makeSnowMan_compose([[Purple]])",
		"Ta mu鑞 ch� t筼 'L鬰 Tuy誸 Nh﹏'/#xmas2007_makeSnowMan_compose([[Green]])",
		"L骳 kh竎 quay l筰/OnCancel"
	}
	CreateTaskSay(tbDialog)
end
xmas2007_makeSnowMan_tbItem =
{
	{1, {6,1,1634,1,0,0}, "Ho祅g Tuy誸 Nh﹏"},
	{1, {6,1,1635,1,0,0}, "T� Tuy誸 Nh﹏"},
	{1, {6,1,1636,1,0,0}, "L鬰 Tuy誸 Nh﹏"},
}
xmas2007_makeSnowMan_tbMaterial =
{
	{0, {6,1,1633,nil,nil,nil}, "Ng� S綾 B╪g Tinh"},
	{0, {6,1,1628,nil,nil,nil}, "Kim B╪g Tinh"},
	{0, {6,1,1629,nil,nil,nil}, "M閏 B╪g Tinh"},
	{0, {6,1,1630,nil,nil,nil}, "Th駓 B╪g Tinh"},
	{0, {6,1,1631,nil,nil,nil}, "H醓 B╪g Tinh"},
	{0, {6,1,1632,nil,nil,nil}, "Th� B╪g Tinh"},
}
xmas2007_makeSnowMan_Recipe =
{
	Yellow	= {tbItemList = {1,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[1]},		--1五色冰晶 + 2 金冰晶 + 3 木冰晶 + 4 水冰晶 + 5 火冰晶 + 6 土冰晶
	Purple	= {tbItemList = {0,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[2]},		--0五色冰晶 + 2 金冰晶 + 3 木冰晶 + 4 水冰晶 + 5 火冰晶 + 6 土冰晶
	Green	= {tbItemList = {0,2,3,4,5,6},nMoney = 100000, tbResult = xmas2007_makeSnowMan_tbItem[3]},	--10 万两 + 0五色冰晶 + 2 金冰晶 + 3 木冰晶 + 4 水冰晶 + 5 火冰晶 + 6 土冰晶
}

function xmas2007_makeSnowMan_ComposeConfirm(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	
	if xmas2007_makeSnowMan_CheckMaterial(tbMaterial) ~= 1 then
		Say(format("Чi hi謕 kh玭g c�  nguy猲 li謚, c莕 ph秈 c� %s m韎 c� th� ch� t筼 頲.",szMaterialList), 1 , "Th藅 ng筰 qu�, ta s� quay l筰 sau./OnCancel")
		return 0;
	end
	if Pay(nMoney) == 0 then
		Say(format("Kh玭g 頲 r錳, kh玭g mang theo  ti襫, c莕 c� <color=yellow>%d<color> lng",nMoney),0)
		return 0;
	end
	if nMoney ~= 0 then
		Msg2Player(format("Ti猽 ph� <color=yellow>%d<color> lng",nMoney))
	end
	if xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial) ~= 1 then
		Say("Ch� t筼 th蕋 b筰, m蕋 甶 m閠 s� nguy猲 li謚.",0)
		return 0;
	end
	xmas2007_SnowManItem_AddItem(tbAwardItem[3],tbAwardItem[2]);
	Say(format("g gi� Tuy誸: Ha ha, <color=yellow>%s<color>  ch� t筼 th祅h c玭g, h穣 nh薾 l蕐!",tbAwardItem[3]))
end
function xmas2007_makeSnowMan_compose(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	if nMoney ~= 0 then 
		szMaterialList = format("%s, c莕 ph秈 c� <color=yellow>%d<color> lng",szMaterialList,nMoney)
	end
	local tbNpcSay =
	{
		format("<dec><npc>Ch� t筼 <color=yellow>%s<color>, c莕 c�: %s.",tbAwardItem[3],szMaterialList),
		format("Ch� t筼 ngi Tuy誸/#xmas2007_makeSnowMan_ComposeConfirm([[%s]])",szSelect),
		"в ta chu萵 b� /OnCancel",
	}
	CreateTaskSay(tbNpcSay)
end

function xmas2007_makeSnowMan_CheckMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		if tbItem[1] > 0 and CalcEquiproomItemCount(tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) < tbItem[1] then
			return 0;
		end
	end
	return 1;
end

function xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		--print(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel)
		if tbItem[1] > 0 and ConsumeEquiproomItem(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) ~= 1 then
			return 0;
		end
	end
	return 1;
end

function OnCancel()
end