-- Created by Danielsun 2006-12-07
-- 祝福卡
-- 一共有六张祝福卡,每张的祝福语都不同.

Include("\\script\\lib\\string.lua")

--<playerbless> -- [收卡人名字]
--<name> -- [发卡人名字]
tbMessage={
	["6,1,1328"] = "Chuc <color=red><playerbless><color> mot Giang Sinh va Nam moi vui ve <color=red><name><color>",
	["6,1,1329"] = "<color=red><playerbless><color> than yeu, chuc nang mot giang sinh vui ve <color=red><name><color>",
	["6,1,1330"] = "<color=red><playerbless><color> than yeu, chuc chang mot giang sinh vui ve <color=red><name><color>",
	["6,1,1331"] = "Voi tat ca tam long, ta xin chuc cho <color=red><playerbless><color> mot Giang sinh vui ve. <color=red><name><color>",
	["6,1,1332"] = "Voi tat ca tam long, ta xin chuc cho <color=red><playerbless><color> mot nam moi vui ve va hanh phuc <color=red><name><color>",
	}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--保证一个祝福没出来前不能使用第二个。

function main(sel)

	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B筺 hi謓 產ng ph竧 c﹗ ch骳! Xin vui l遪g i m閠 l竧!");
		return 1;
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
	
	Say("B筺 c� mu鑞 g雐 thi謕 ch骳 gi竛g sinh cho b筺 b� kh玭g?", 2, "Mu鑞/sendWish","T筸 th阨 kh玭g/wishCancel");
	return 1;
end

function sendWish()
		QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", 1);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	
	ItemGenre,DetailType,ParticularType = GetItemProp(ItemIdx)
	local szItemkey = ItemGenre..","..DetailType..","..ParticularType;
	if (ItemIdx > 0 and tbMessage[szItemkey] ~= nil) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = replace(tbMessage[szItemkey],"<playerbless>",TargetName);
			szMsg = replace(szMsg,"<name>",GetName());
			AddGlobalCountNews(szMsg,1);
		else
			Msg2Player("Kh玭g t譵 頲 th�! Xin th� l筰 1 l莕!.")
		end
	else
		Msg2Player("S� d鬾g th� th蕋 b筰, xin th� l筰 1 l莕.")
	end
	SetTaskTemp(ITEM_TASK_TEMP,0)
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function BlessPlayerOffline(TargetName, nP)
	Msg2Player("Ngi m� b筺 mu鑞 ch骳 ph骳 hi謓 kh玭g c� tr猲 m筺g! ьi l骳 sau th� l筰!.");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function wishCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end