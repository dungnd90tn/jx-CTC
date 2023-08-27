-- 文件名　：hechengqizi.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-14 14:32:38

--10 旗的碎片1 + 6 旗的碎片2 + 3 旗的碎片3 + 1 旗的碎片4 + 3 万两	获得：1张战胜旗
--被注：- 原料将会在玩家背包种自动扣除。

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_zhanshengqi = {}

jiefang_0804_zhanshengqi.szName = "jiefang_0804_zhanshengqi"

jiefang_0804_zhanshengqi.tbRecipe =
{
	tbItemList = {
		{szName="M秐h c� 1", tbProp={6, 1, 1735}, nCount = 10},
		{szName="M秐h c� 2", tbProp={6, 1, 1736}, nCount = 6},
		{szName="M秐h c� 3", tbProp={6, 1, 1737}, nCount = 3},
		{szName="M秐h c� 4", tbProp={6, 1, 1738}, nCount = 1},
	},
	nMoney = 30000,
	tbAwardItem =
	{
		{szName="L� C� Chi課 Th緉g", tbProp={6, 1, 1739, 1, 0, 0}},
	}
}

function jiefang_0804_zhanshengqi:main()
	local tbSay = 
	{
		"<dec><npc>T� 26-04-2008 n 24h00 18-05-2008, khi nh qu竔 s� thu th藀 頲 c竎 m秐h c�, c� th� mang c竎 m秐h c� n l穙 phu  h頿 th祅h l� c� chi課 th緉g ho祅 ch豱h.",
		format("Ta mu鑞 h頿 th祅h L� c� chi課 th緉g/#%s:Compose()", self.szName),
		"Ta s� gh� l筰 sau/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_zhanshengqi:Compose()
	if (CalcFreeItemCellCount() < 10) then
		Say("T骾 h祅h trang  y, h穣 d鋘 d裵 h祅h trang  b秓 m an to祅 cho v藅 ph萴.",0)
		return 0;
	end
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose("H頿 th祅h 1 l� c� chi課 th緉g", tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "L� Quan: Ch骳 m鮪g i hi謕  h頿 th祅h l� c� chi課 th緉g ho祅 ch豱h!", 0)
end