-- 闯关宝箱物品（随机获得一样物品）
-- By: Wangjingjun(2011-03-02)

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Ch骳 m鮪g cao th� <color=yellow>%s<color=green>  nh薾 頲 <color=yellow><%s><color=green> t� <color=yellow><B秓 Rng Vt 秈><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbCOT_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbCOT_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
		{szName="觤 kinh nghi謒 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(100000, "B秓 rng vt 秈")
					end,
					nRate = 52,
		},
		{szName="觤 kinh nghi謒 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(200000, "B秓 rng vt 秈")
					end,
					nRate = 30,
		},
		{szName="觤 kinh nghi謒 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(300000, "B秓 rng vt 秈")
					end,
					nRate = 10,
		},
		{szName="觤 kinh nghi謒 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(400000, "B秓 rng vt 秈")
					end,
					nRate = 5,
		},
		{szName="觤 kinh nghi謒 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(500000, "B秓 rng vt 秈")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.005,nExpiredTime=43200},
		{szName="Kim Hoa Chi B秓",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2},
		{szName="Ti猲 Th秓 L� c bi謙",tbProp={6,1,1181,1,0,0},nCount=1,nRate=2.666,nExpiredTime=43200},
		{szName="觤 kinh nghi謒 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(300000, "B秓 rng vt 秈")
					end,
					nRate = 35,
		},
		{szName="觤 kinh nghi謒 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(500000, "B秓 rng vt 秈")
					end,
					nRate = 25,
		},
		{szName="觤 kinh nghi謒 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(800000, "B秓 rng vt 秈")
					end,
					nRate = 10,
		},
		{szName="觤 kinh nghi謒 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "B秓 rng vt 秈")
					end,
					nRate = 5,
		},
		{szName="觤 kinh nghi謒 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1500000, "B秓 rng vt 秈")
					end,
					nRate = 3,
		},
		{szName="觤 kinh nghi謒 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "B秓 rng vt 秈")
					end,
					nRate = 2,
		},
		{szName="觤 kinh nghi謒 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "B秓 rng vt 秈")
					end,
					nRate = 1,
		},		
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)	
	local tbKey1 = tbCOT_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbCOT_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("C莕 ph秈 c� Ch譨 Kh鉧 V祅g ho芻 Ch譨 Kh鉧 Nh� � m韎 c� th� m� 頲 B秓 Rng Vt 秈", 1, "сng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("S� d鬾g Ch譨 kh鉧 nh� �/#VnCOTBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("S� d鬾g Ch譨 kh鉧 v祅g/#VnCOTBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "сng/Oncancel")
		Say("S� d鬾g ch譨 kh鉧  m� rng:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnCOTBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbCOT_Key_Require[strKeyType]
	local tbAward = tbCOT_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("C莕 ph秈 c� Ch譨 Kh鉧 V祅g ho芻 Ch譨 Kh鉧 Nh� � m韎 c� th� m� 頲 B秓 Rng Vt 秈", 1, "сng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2742, -1) ~= 1 then
		Say("Kh玭g t譵 th蕐 B秓 Rng Vt 秈", 1, "сng/no")
		return
	end	
	tbAwardTemplet:Give(tbAward, 1, {"chuangguan", "use chuangguanbaoxiang"})
	AddStatData("baoxiangxiaohao_kaichuangguanbaoxiang", 1)	--数据埋点第一期
end