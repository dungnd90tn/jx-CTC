Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
IncludeLib("ITEM")


function main(nItemIndex)

	local G,D,P,nLevel = GetItemProp(nItemIndex);
	local nExPiredTime = ITEM_GetExpiredTime(nItemIndex);
	local nLeftTime = nExPiredTime - GetCurServerTime();
	if nExPiredTime ~= 0 and nLeftTime <= 60 then
		Msg2Player("VËt phÈm ®· qu¸ h¹n sö dông")
		return 0;
	end
	nLeftTime = floor((nLeftTime)/60);
	
	if (G ~= 6) then
		return 1;
	end
	
	if CalcFreeItemCellCount() < 6 then
		CreateTaskSay({"Xin h·y s¾p xÕp l¹i hµnh trang! Nhí ®Ó trèng 2 « trë lªn nhÐ!",  "§­îc råi./Cancel",});
		return 1;
	end
	
		local tbItem ={szName="MÆt N¹ T©n Thñ",tbProp={0,11,random(537,541),1,0,0},nCount=1,nExpiredTime=10800,nBindState = -2}
		tbAwardTemplet:GiveAwardByList(tbItem, "MÆt N¹ T©n Thñ", 1)
		return 0;
end	