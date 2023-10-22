Include("\\script\\global\\gift\\gift.lua")
Include("\\script\\tagnewplayer\\tbitemHK.lua");
Include("\\script\\global\\namcung\\top5.lua")

function main()
	local szTitle = "<npc>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color> CTC<enter>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
				local tbOpt =
	{

		{"Mua ThÇn Hµnh Phï (50 V¹n)", MuaThanHanh},
		{"NhËp Gifcode T©n Thñ", Nhap_Code},
		{"NhËn th­ëng Top 5 ng­êi ®Çu ®¹t 120 cÊp", nhantop5},
		--{"XuÊt S­", xuatsu},
		--{"Hoµn Thµnh NhiÖm Vô Vµ häc Skills 60", Hotro_Skills},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	

end			

function Nhap_Code()
	if GetTask(3932) == 1  then
		Talk(1, "", "Ng­¬i ®· nhËn code råi mau ®i luyÖn tËp thªm ®i.")
		return
	end
	if GetLevel() < 10 then
		Talk(1, "", "Ta lµ ng­êi tæ chøc c¸c sù kiÖn! h·y di luyÖn ®Õn cÊp 10 råi t×m ta nhËn th­ëng.")
		return
	end
	--local strFaction = GetFaction()
	--if (tbItemHK[strFaction] == nil) then
		--Talk(1, "", "Ng­¬i lµ ai ? kh«ng thuéc ph¸i nµo th× ®i ®i ! ta kh«ng xem träng v« danh tiÓu tèt !.")
		--return
	--end
	CodeStrings()
end

function Hotro_Skills()
	if GetTask(3932) ~= 1  then
		Talk(1, "", "Ng­¬i h·y nhËn code t©n thñ råi ®Õn t×m ta !.")
		return
	end
	if GetTask(3933) == 1  then
		Talk(1, "", "Ng­¬i ®· cã danh tiÕng trªn giang hå råi mau ®i luyÖn tËp thªm ®i.")
		return
	end
	if GetLevel() < 80 then
		Talk(1, "", "h·y di luyÖn ®Õn cÊp 10 råi t×m ta nhËn th­ëng.")
		return
	end
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "Ng­¬i lµ ai ? kh«ng thuéc ph¸i nµo th× ®i ®i ! ta kh«ng xem träng v« danh tiÓu tèt !.")
		return
	end

	HoTroSkill()
	Talk(1, "", "Chóc mõng ? Ng­êi ®· cã thÓ b«n tÈu giang hå råi h·y mau ®i ®i !.")

end

function MuaThanHanh()
	if (GetCash() <= 500000) then
		Talk(1, "", "Ph¶i ca ®ñ 50 v¹n míi ca thÓ mua.")
		return
	end
	Pay(500000)
	local tbItem = {szName="ThÇn hµnh phï", tbProp={6,1,1266,1,0,0}, nBindState=-2,nExpiredTime = 10080}
	tbAwardTemplet:GiveAwardByList(tbItem, "ThÇn hµnh phï", 1)

end

function OnExit()
end


Include("\\script\\global\\lib\\serverlib.lua")

function xuatsu()
	local tb = {"<dec><npc>Ta lµ ng­êi cã thÓ gióp ng­¬i rêi bá m«n ph¸i mét c¸ch dÔ dµng, nÕu ng­¬i mang theo 10 v¹n."};
	Tong_name,oper = GetTong()
	if Tong_name == "" then 
		local nCamp = GetCamp();
		if nCamp ~= 4 then 
			tinsert(tb,"Ta muèn rêi khái s­ m«n/leave_sumon_change2killer");
		else
			tinsert(tb,"Ta muèn trë l¹i m«n ph¸i/back_sumon_change2normal");
		end
		tinsert(tb,"§Ó ta suy nghÜ thªm/cancel")
		CreateTaskSay(tb);
	else
		Talk(1,"","Ng­¬i ®ang cã bang héi h·y rêi khái bang héi råi ta míi cã thÓ gióp ng­¬i.")
	end
end

function leave_sumon_change2killer()
	if GetCash() >= 100000  then
		Pay(100000);
		SetCamp(4);
		SetCurCamp(4);
		Msg2Player("B¹n ®· rêi khái s­ m«n.")
	else
		Msg2Player(GetName().." ng­¬i kh«ng cã 10 v¹n ta kh«ng thÓ gióp ng­¬i")
	end
end

function back_sumon_change2normal()
	local nFaction = GetLastFactionNumber();
	local listcamp = {[0] = 1,[1] = 3,[2] = 3,[3] = 2,[4] = 1,[5] = 3,[6] = 1,[7] = 2, [8]= 1,[9] = 3};
	if GetCash() >= 500000  then
		Pay(500000);
		SetCamp(listcamp[nFaction]);
		SetCurCamp(listcamp[nFaction]);
		Msg2Player("B¹n ®· quay trë l¹i s­ m«n.")
	else
		Msg2Player(GetName().." ng­¬i kh«ng cã 50 v¹n ta kh«ng thÓ gióp ng­¬i")
	end
end

function cancel()
end

