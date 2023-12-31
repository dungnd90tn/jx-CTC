
--========类定义====================================--
--类名：Convert
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	负责计算鸡年神秘礼物升级关系的价值量和用鸡年神秘
--礼物兑换奖品的价值量。以及选择奖品。
--
--成员变量：
--	__gifttabfile：神秘礼物价值量tabfile
--	__bonustabfile：奖品的tabfile
--	__giftWorth：神秘礼物升级的价值量表
--	__bonusWorth：奖品的价值量表
--成员函数：
--	:loadSettings()：载入价值量设定文件。
--	:giftLevelup(worth)：神秘礼物升级
--	:convert(worth)：用worth换取奖品
--
--用例：
--
--
--
--==================================================--

if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not MEM_HEAD then
	Include ("\\script\\lib\\mem.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
end

if not WORTHANALYSE_HEAD then
	Include ("\\script\\class\\worthanalyse.lua")
end

Convert = {
--========函数定义==================================--
--函数原形：:loadSettings()
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	载入配置文件并进行价值量的计算。该函数首先载入
--settings/event/chinesenewyear/giftlvlup.txt和
--settings/event/chinesenewyear/bounslist.txt文件，
--然后根据这两份文件分别计算神秘礼物升级的价值量表和
--神秘礼物兑换奖品的价值量表。
--参数：
--	无
--返回值：
--	无
--用例：
--
--
--
--==================================================--
	loadSettings = function(self)
		self.__gifttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/giftslvlup.txt","GIFT")
		self.__crystaltabfile = new(KTabFile,"/settings/event/juanzhouhecheng/crystal.txt","CRYSTAL")		
		self.__giftWorth = new(WorthAnalyse,80)
		for i=1,self.__gifttabfile:getRow() do
			self.__giftWorth:addWorth(i,tonumber(self.__gifttabfile:getCell("Worth",i)))
		end
		self.__giftWorth:makeBaseP()
		return
	end,
	
--========函数定义==================================--
--函数原形：:giftLevelup(worth)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	由价值量worth选出将要升级得到的神秘礼物的索引号。
--参数：
--	worth：价值量，这里是从玩家提交的神秘礼物算出来的
--价值量总和。
--返回值：
--	成功则返回将要升级得到的神秘礼物索引，否则为nil
--用例：
--
--
--
--==================================================--
	giftLevelup =function(self,worth)
		self.__giftWorth:makeWorthP(worth)
		return self.__giftWorth:getFromWorth()
	end,
}



TID_CLONECRYSTAL = 503
MAX_CRYSTAL_WORTH = 50000000 --大于5000万，涉嫌刷水晶

MAXGIVENUM = 20  --可以给礼物的最大上限
TF_GIFT_WORTH = 3  --giftlvl.txt中worth项的列数
TF_GIFT_P1 = 4
TF_GIFT_P2 = 5
TF_GIFT_P3 = 6
TF_GIFT_P4 = 7
TF_GIFT_CRYPTIC = 8
TF_CRYSTAL_WORTH = 2

Convert:loadSettings()


--========函数定义==================================--
--函数原形：ComputeWorth(nCount)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	根据给与界面的物品，计算出其价值量。
--参数：
--	nCount：给与界面中物件的总数
--返回值：
--	成功则返回价值量，否则返回nil
--用例：
--	无
--==================================================--
function ComputeWorth(nCount)
	local worth = 0	--礼物价值量
	local crystal = 0	--水晶价值量
	local maxCount = 0	--礼物的总数
	
	if(nCount == 0) then
		Talk(1, "GiveUIForGift", "<#> C竔 g� c騨g kh玭g a, ngi mu鑞 l祄 g� y!")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)

		if(g ~= 4 or d<468 or (d >486 and d < 508) or d > 518) then --错误道具
			Talk(1,"GiveUIForGift","<#> Ngi a cho ta c竔 qu竔 g� th� n祔?")
			return nil
		end
		if(d > 467 and d < 487) then -- 冰晶
			crystal = crystal + GetItemStackCount(itemIdx)* tonumber(Convert.__crystaltabfile:getCell(TF_CRYSTAL_WORTH,(d-467)))
		else --神秘礼物
			function checkGiftCount(idx,count)  --检测神秘道具的数量
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- 数量太多
					Talk(1, "GiveUIForGift", "<#> у ngi cho nhi襲 qu�, nh譶 kh玭g r� g� h誸!")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				if (d == 518) then
					Say("L� v藅 n╩ D藆 b筺 t v祇 trong c� L� v藅 n╩ D藆 (c蕄 10) , nh� th� s� 秐h hng h頿 th祅h th蕋 b筰, c� c莕 h頿 th祅h l筰 kh玭g?", 2, "Л頲, h頿 th祅h l筰 甶!/GiveUIForGift", "Kh玭g c莕!/onCancel")
					return nil
				end
				maxCount = maxCount + num
				local lvl = d - 507
				worth = worth + num * tonumber(Convert.__gifttabfile:getCell(TF_GIFT_WORTH,lvl))
			end
		end
	end
	if(crystal > MAX_CRYSTAL_WORTH) then --价值量大于5000w，涉嫌刷冰晶
		SetTask(TID_CLONECRYSTAL,GetTask(TID_CLONECRYSTAL)+1)
		return -1
	end
	if(worth ==0) then
		Talk(1, "GiveUIForGift", "<#> Xin l鏸! 輙 nh蕋 c莕 m閠 L� v藅 n╩ D藆.")
		return nil
	end

	return worth + crystal
end
--========函数定义==================================--
--函数原形：GiveUIForGift()
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	打开给与界面，用于合成鸡年神秘礼物。被礼官的对话
--调用。
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
function GiveUIForGift()
	GiveItemUI("H頿 th祅h L� v藅 n╩ D藆 ","B筺 c� th� t nhi襲 nh蕋 l� 20 c竔 L� v藅 n╩ D藆 v� B╪g Tinh trong ho箃 ng gi竛g sinh c遪 d� l筰.", "GiftLevelUp", "onCancel" );
end

--========函数定义==================================--
--函数原形：GiftLevelUp(nCount)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	玩家选择升级神秘物品之后，弹出给与界面，此函数为
--该给与界面点击确定按钮之后的回调函数。
--参数：
--	给与界面中道具物品的总数，该数量不计算叠加的数量。
--返回值：
--	无
--用例：
--	无
--==================================================--
function GiftLevelUp(nCount)
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--已经得到合理的价值量，删除所有物品，选择对应的特殊神秘礼物
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if(worth < 0) then
		--涉嫌刷水晶，扣掉所有物品，并记录日志
		WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					"Trong l骳 h頿 th祅h l� V藅 n╩ D藆, ph竧 hi謓 ra  s� d鬾g Th駓 Tinh vt qu� 5000 v筺. Ki課 ngh� n猲 kh鉧 ngay Account n祔")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					"Х s� d鬾g"..GetTask(TID_CLONECRYSTAL).."l莕, Th駓 Tinh n祔 c� nhi襲 kh� n╪g l� phi ph竝. Xin GM h穣 ch� �!")
		end
		--说句神么话呢？迷惑一下
		Talk(1,"","<#> H�! Chuy謓 g� v藋, th蕋 b筰 r錳 礹? Sao k� v藋 n虆� ")
		return
	end
	local idx = Convert:giftLevelup(worth)
	if(not idx) then  --失败，没有选出任何东西
		Talk(1,"","<#> H�! Chuy謓 g� v藋, th蕋 b筰 r錳 礹? Sao k� v藋 n虆� ")
		return
	end
	if (idx == 1) then
		Talk(1,"","<#> H�! Chuy謓 g� v藋, th蕋 b筰 r錳 礹? Sao k� v藋 n虆� ")
		return
	end

	AddItem(tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P1,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P2,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P3,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P4,idx)),
					0,0,0,0,0,0,0,0)
	WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					", s� d鬾g"..worth.."я s� Th莕 b� l� v藅, h頿 th祅h"..
					Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx).."Gi� tr� lng th莕 b� l� v藅, h� th鑞g nh薾 頲 "..
					tostring(worth-Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx)).."Gi� tr� c遪 th鮝 l筰.")
	Talk(1, "","<#> H頿 th祅h ra m閠 ti襪 ch蕋"..Convert.__gifttabfile:getCell(TF_GIFT_CRYPTIC,idx).."L� v藅 n╩ D藆")
	Msg2Player("B筺 nh薾 頲 m閠 L� v藅 n╩ D藆")
	return
end

function main()
	Talk(1, "GiveUIForGift", "H頿 th祅h L� v藅 n╩ D藆: t nhi襲 nh蕋 l� 20 c竔 <color=yellow>L� v藅 n╩ D藆<color>, th� c� kh� n╪g h頿 th祅h 頲 L� v藅 n╩ d藆 cao c蕄 h琻. N誹 b筺 c遪 d� <color=yellow>B╪g Tinh<color> trong d辮 l� gi竛g sinh c騨g c� th� b� v祇  t╪g x竎 xu蕋 cao h琻. ")
end

function onCancel()
end