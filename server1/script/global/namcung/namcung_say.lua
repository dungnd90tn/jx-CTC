Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\xephang\\top10_all.lua")
Include("\\script\\task\\partner\\education\\swordking_people.lua")
Include("\\script\\global\\namcung\\hotrotanthu\\doiraclayvk.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\ds_gm.lua");


function main()
	dofile("script/global/namcung/namcung_say.lua");		

	if CheckAccountGM() then
	local szTitle = "<npc>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
		local tbOpt =
	{
		{"Hñy trang bŞ khãa", deltem},
		{"Xem sè l­îng ng­êi ch¬i ®ang Online", dkgm9},
		{"§æi tªn nh©n vËt", game_spreader2},
		{"§¨ng kı quyÒn h¹n GM", dkgm},
		{"Tho¸t"},
	}

		CreateNewSayEx(szTitle, tbOpt)		
	elseif CheckAccountMod() then
	local szTitle = "<npc>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
		local tbOpt =
	{
		{"Hñy trang bŞ khãa", deltem},
		{"Xem sè l­îng ng­êi ch¬i ®ang Online", dkgm9},
		{"§æi tªn nh©n vËt", game_spreader2},
		{"§¨ng kı quyÒn h¹n MOD", dkgm},
		{"Tho¸t"},
	}

		CreateNewSayEx(szTitle, tbOpt)		
	else

	local szTitle = "<npc>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
				local tbOpt =
	{
		--{"Hæ trî test Game", namcung2},
		{"Hñy trang bŞ khãa", deltem},
		{"NhËn L¹i Vßng S¸ng Hæ trî t©n thñ", nhanvongsanght},
		{"§æi tªn nh©n vËt", game_spreader2},
		--{"§æi r¸c lÊy vò khİ ngÉu nhiªn", doirac},
		--{"NhËn Vßng s¸ng hæ trî tíi cÊp 80", nhanvongsanght},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	

end
end			


function dkgm9()
Msg2Player("<color=yellow>HiÖn t¹i ®ang cã<color><color=green> "..GetPlayerCount().."<color> Ng­­êi Online !.")
end

function nhanvongsanght()
	if GetLevel()< 80 then
		--AddSkillState(531,10,1,600*60*18)	--Ng«i sao
		--AddSkillState(461,1, 1,600*60*18)

		--AddSkillState(512,20,1,600*60*18)
		--AddSkillState(527,5,1,600*60*18)
		AddSkillState(313,5,1,600*60*18)  	--Vong duoi chan
		AddSkillState(314,12,1,600*60*18)	 --Vong duoi chan
		--AddSkillState(546,1,1,600*60*18)		 --Rong bay
		Talk(1, "", "B¹n sÏ ®­îc nhËn hæ trî kü n¨ng nµy ®Õn cÊp 80");
	else
		--RemoveSkillState(531)	--Ng«i sao
		--RemoveSkillState(461)

	---	RemoveSkillState(512)
		--RemoveSkillState(527)
		RemoveSkillState(313)  	--Vong duoi chan
		RemoveSkillState(314)	 --Vong duoi chan
		--RemoveSkillState(546)		 --Rong bay
		return
	end
end

function dkgm()
	n_title = 5000 -- S?a ID danh hi?u vào
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate = FormatTime2Number(nServerTime);
	local nDay = floor(mod(nDate,1000000) / 10000);
	local nMon = mod(floor(nDate / 1000000) , 100)
	local nTime = nMon * 1000000 + nDay * 10000 
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	local nCurLevel = GetLevel()
	if nCurLevel < 150 then
		ST_LevelUp(150 - nCurLevel)
	end
	SetFightState(0)
	SetCamp(6)
	SetCurCamp(6)
	AddMagic(732, 50) --Skill GM
	AddMagic(733, 50) --Skill GM
	if CalcFreeItemCellCount() >= 1 then
		local tbItem = {szName="LÖnh bµi Gm", tbProp={6,1,4257,1,0,0}, nBindState=-2}
		tbAwardTemplet:GiveAwardByList(tbItem, "LÖnh bµi Gm", 1)
		local tbItem1 = {szName="MÆt N¹ Gm", tbProp={0,11,367,1,0,0}, nBindState=-2}
		tbAwardTemplet:GiveAwardByList(tbItem1, "MÆt N¹ Gm", 1)
	end
end

function deltem()
	if (GetBoxLockState() ~= 0) then
		Say("Xin më khãa r­¬ng tr­íc !", 0)
		return
	end
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)	

	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		local nQuality = GetItemQuality(nItemIndex);
		local nBindState = GetItemBindState(nItemIndex)
	if (nBindState >=0)  then
		Talk(1, "", "VËt phÈm cÇn hñy ph¶i lµ vËt phÈm khãa!");
		return
	end
		--SaveLog(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
	end--for
	Talk(1, "", "§¹i hiÖp cã thÓ s¾p xÕp l¹i r­¬ng chøa ®å råi!");
	Msg2Player("§¹i hiÖp võa hñy vËt phÈm thµnh c«ng")
end

function doirac()
weapon_ring()
end
function game_spreader2()
	local tbOpt = {}
	local strTittle ="<npc>  Ng­¬i t×m ta cã viÖc g×?"
	tinsert(tbOpt, {"§¨ng kı ®æi tªn nh©n vËt thu phİ",dangkydoiten})
	tinsert(tbOpt, {"§Æt l¹i tªn cho nh©n vËt",about_rename_role})
	tinsert(tbOpt, {"Nh©n tiÖn ghĞ qua th«i"})
	CreateNewSayEx(strTittle,tbOpt)
end

function about_rename_role()
	local strInfo = "<color=green>Ch©n Nhi:<color> Chµo b¹n! V× tªn nh©n vËt cña b¹n vµ ng­êi ch¬i kh¸c gièng nhau, cho nªn hÖ thèng ®· gióp b¹n ®æi tªn, b¹n cã thÓ söa tªn nh©n vËt cña b¹n tr­íc ®©y, cã thÓ kiÓm tra xem tªn ®ã cã dïng ®­îc kh«ng. Chó ı! B¹n chØ cã 1 c¬ héi duy nhÊt ®Ó ®æi tªn, xin h·y cÈn thËn tõng b­íc.";
	func_online_rename_role(strInfo);
end
function func_online_rename_role(strInfo)
	if (check_renamerole() == 1) then
		Say(strInfo,
			3,
			"T×m hiÓu tªn nh©n vËt cßn sö dông ®­îc kh«ng/query_rolename",
			"Thay ®æi tªn nh©n vËt cña m×nh/change_rolename",
			"§Ó lÇn sau ta thay ®æi vËy/cancel");
	else
		deny()
	end
end
function query_rolename()
	AskClientForString("on_query_rolename", "", 1, 20, "Xin nhËp tªn nh©n vËt cÇn t×m hiÓu");
end

function on_query_rolename(new_name)
	QueryRoleName(new_name);
end
function change_rolename()
	Say("<color=green>Ch©n Nhi:<color> C¸c b­íc cô thÓ: Rêi Bang Héi nÕu cã, ®èi tho¹i víi NPC, nhËp tªn nh©n vËt cÇn thay ®æi vµo, b¹n sÏ tù ®éng rêi m¹ng. Sau 3 phót ®¨ng nhËp l¹i, nÕu tªn nh©n vËt ®· thay ®æi th× ®­îc xem ®æi tªn thµnh c«ng; nÕu ch­a thay ®æi, mêi b¹n thùc hiÖn l¹i c¸c b­íc trªn. NÕu xuÊt hiÖn mét sè hiÖn t­îng l¹ xin liªn hÖ GM gi¶i quyÕt.",
		2,
		"B¾t ®Çu thay ®æi tªn nh©n vËt/change_rolename2",
		"§Ó ta suy nghÜ l¹i/cancel")
end
function change_rolename2()
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Player(" <color=green>§¹i hiÖp ®· cã Bang Héi kh«ng thÓ tiÕn hµnh thao t¸c nµy!<color>")
		return
	end
	AskClientForString("on_change_rolename", "", 1, 20, "Xin nhËp tªn nh©n vËt míi vµo");
end
function on_change_rolename(new_name)
	if (check_renamerole() == 1) then
		if (GetName() == new_name) then
			Talk(1, "", "B¹n muèn ®æi tªn g×?")
		else
			RenameRole(new_name);
		end
	end
end
function dangkydoiten()
	if (GetBit(GetTask(TASKVALUE_BLEND), 1) == 1) then
		Say("<color=green>Ch©n Nhi:<color> B¹n vÉn cßn 1 lÇn ®æi tªn nh©n vËt. H·y chän '§Æt l¹i tªn cho nh©n vËt' ®Ó ®æi tªn nh©n vËt",1,
		"§Ó ta kiÓm tra xem sao/cancel")
		return
	end
	Say("<color=green>Ch©n Nhi:<color> Mçi lÇn ®æi tªn nh©n vËt cÇn <color=red>100 tiÒn ®ång<color>, ng­êi chuÈn bŞ xong ch­a?",
		2,
		"Ta ®· chuÈn bŞ xong/dongkymua",
		"Khi nµo ®ñ tiÒn ta sÏ quay l¹i sau!/cancel");
end
function dongkymua()
	buy_addibox_yes(100)
end
function buy_addibox_yes(nNedCount)
	if (nNedCount < 1 or nNedCount == nil) then
		print("Fail!!!!");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(4, 417, 1, 1)
	if (nCount < nNedCount) then
		Say("<color=green>Ch©n Nhi:<color> Kh¸ch quan ch­a ®ñ 100 tiÒn ®ång! Khi nµo cã ®ñ tiÒn h·y quay l¹i.",1,
		"§Ó ta kiÓm tra xem sao/cancel")
		return
	end
	ConsumeEquiproomItem(nNedCount, 4, 417, 1, 1)
	UseSilver(1, 2, nNedCount);
	value = SetBit(value, 1, 1)
	SetTask(TASKVALUE_BLEND, value)
	Talk(1, "", "<color=green>Ch©n Nhi:<color> B¹n nhËn ®­îc 1 lÇn ®æi tªn nh©n vËt. H·y chän '§Æt l¹i tªn cho nh©n vËt' ®Ó ®æi tªn nh©n vËt");
end
function deny()
	Say("<color=green>Ch©n Nhi:<color> Xin lçi! B¹n ph¶i mua lÇn ®æi tªn nh©n vËt råi h·y chän chøc n¨ng nµy!",
		1,
		"BiÕt råi!/cancel")
end

tbitemht  =
	{
              		[1]	={szName = "ThÇn Hµnh Phï", tbProp = {6, 1, 1266, 1,0,0}, nCount = 1,  nBindState = -2,nExpiredTime = 10080 },
		[2]	={szName = "Håi thµnh phï (nhá)", tbProp = {6,1,1082,0,0}, nCount = 1,  nBindState = -2, },
--		[3]	={szName = "Trang BŞ Kim Phong", tbProp = {0,184}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
--		[4]	={szName = "Trang BŞ Kim Phong", tbProp = {0,179}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
--		[5]	={szName = "Trang BŞ Kim Phong", tbProp = {0,177}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
--		[6]	={szName = "Trang BŞ Kim Phong", tbProp = {0,178}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
--		[7]	={szName = "Trang BŞ Kim Phong", tbProp = {0,183}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
--		[8]	={szName = "Trang BŞ Kim Phong", tbProp = {0,181}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
--		[9]	={szName = "Trang BŞ Kim Phong", tbProp = {0,182}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
--		[10]	={szName = "Trang BŞ Kim Phong", tbProp = {0,185}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
--		[11]	={szName = "Trang BŞ Kim Phong", tbProp = {0,180}, nCount = 1,  nBindState = -2, nQuality = 1,nExpiredTime = 10080},
		[3]	={szName = "LÖnh Bµi T©n Thñ", tbProp = {6, 1, 4265, 1,0,0}, nCount = 1,  nBindState = -2},

	}

function LoginNew()


	local nCurLevel = GetLevel()
	if nCurLevel > 1 then
		return
	end
	--if nCurLevel < 100 then
		--ST_LevelUp(10 - nCurLevel)
		--end
		Earn(2000)
	tbAwardTemplet:GiveAwardByList(tbitemht, "PhÇn th­ëng t©n thñ");

end;