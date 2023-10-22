Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\activitysys\\config\\17\\head.lua")

function pActivity:Jiluxiaohao_yesou()
	AddStatData("baoxiangxiaohao_kaiyesouxiangzi", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function pActivity:Jiluxiaohao_chengzhan()
	AddStatData("baoxiangxiaohao_kaichengzhanlibao", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function pActivity:Jiluxiaohao_zhizun()
	AddStatData("baoxiangxiaohao_kaizhizunmibao", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function pActivity:Jiluxiaohao_shuizexiangzi()
	AddStatData("baoxiangxiaohao_kaishuizeixiangzi", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
end

--§iÒu chØnh phÇn th­ëng r¬i ra tõ boss thuû tÆc ®¹i ®Çu lÜnh - Modified By DinhHQ - 20120523
function pActivity:VnFFBigBossDrop(nNpcIndex)
	tbVnFFBigBossDrop = {
		[1]={{szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nCount=1,nRate=3,nExpiredTime=20160},},
		[2]={{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
		[3]={{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=8,nExpiredTime=20160},},
	}	
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVnFFBigBossDrop, "PhÇn th­ëng tiªu diÖt Thñy TÆc §¹i §Çu LÜnh", 1)
end

function pActivity:VnUsePirateBox(nItemIdx)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\17\\vnshuizeibaoxiang.lua", "VnPirateBox_main", nItemIdx)
	return nil
end