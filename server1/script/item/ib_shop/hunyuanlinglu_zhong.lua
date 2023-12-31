-- 文件名　：hunyuanlinglu_zhong.lua
-- 创建者　：wangjingjun
-- 内容　　：混元灵露（中） 含有500精力，以及7个任务令牌和7个十级的修炼木人
-- 创建时间：2011-07-12 11:19:45

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\jingli.lua")


-- 任务令牌寻找矿石，任务的值为 211 - 216
local renwuSetmagicLevel = function(nItemIndex)
	SetItemMagicLevel(nItemIndex, 1, random(211,216)) -- 设置采矿任务
end

local tbMask = 
{
	{szName = "L謓h b礽 ", tbProp = {6,2,1020,1,0,0}, nExpiredTime = 7*24*60, 
		CallBack = renwuSetmagicLevel,
	},	
	{szName = "M閏 nh﹏", tbProp = {6,1,2969,1,0,0}, nCount = 7, nExpiredTime = 7*24*60},	
	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 2
	local nCount = 8
	local nEnergy = 500
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nCount, nWidth, nHeight))
		return 1
	end
	
	local nRenWuCount = 7
	local tbRealyAward = {}
	
	for i=1,nRenWuCount do
		tinsert(tbRealyAward, %tbMask[1])
	end
	tinsert(tbRealyAward, %tbMask[2])
	
	local player = Player:New(PlayerIndex)
	local potion = HunyuanPotion:New(player)
	if (potion:Use(nEnergy) == 1) then
		tbAwardTemplet:GiveAwardByList(tbRealyAward, "S� d鬾g H鏽 Nguy猲 Linh L�( Trung)", 1)
		return 0
	else
		return 1
	end
end
