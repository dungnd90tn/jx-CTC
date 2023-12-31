-- 超级玩家活动（送天山雪莲）
-- By: Feimingzhi(2007-05-08)
-- Content:
--活动期间，凡在2007年06月01日服务器维护至2007年07月01日24点之间新建的角色，有资格参加《超级玩家活动》。 在活动期间内，创建的新角色并等级达到90级， 并完成116个野叟任务链（无间断地完成任务）就可以在新手村和各大城市的礼官处获得一个天山雪莲。记录LOG。
--一个角色只能领取一次。
--90级以及90级以下的玩家，使用天山雪莲，立即升到120 级。
--
-- 	礼官对话设计
--只有在2007年06月01日服务器维护至2007年07月01日24点之间才会出现“超级玩家活动”选项。

SUPERPLAYERACT_BIGENTIME = 20070601     --超级玩家活动开始日期
SUPERPLAYERACT_ENDTIME = 20070701       --超级玩家活动结束日期
SUPERPLAYERACT_LevRequest = 90          --超级玩家活动角色所需等级
SUPERPLAYERACT_TaskTime = 116             --要求野叟任务最少多少次
SUPERPLAYERACT_TaskDataKey = 1044       --存储野叟任务次数的数据key
TSK_SUPERPLAYERACT = 1816               --存储是否领取奖励。
TSXL_ITEM_ID = 1431                     --天山雪莲的物品ID
SUPERPLAYERACT_ExtPoint = 4             --要求新建帐号
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua")    --包含野叟任务

function SuperPlayerAct2007()
    local tDiaStr = 
    {
        "T礽 kho秐 頲 t筼 m韎 trong kho秐g th阨 gian t� <color=green>01-06-2007<color> n <color=green>01-07-2007<color> ",
        format("s� c� c� h閕 tham gia 'Ho箃 ng ngi ch琲 si猽 c蕄'. Trong th阨 gian ho箃 ng, khi nh﹏ v藅 m韎 (trong t礽 kho秐 m韎 t筼) t n c蕄 <color=yellow>%s<color> v� ho祅 th祅h <color=yellow>",SUPERPLAYERACT_LevRequest),
        format("%s<color> nhi謒 v� D� T萿 (chu鏸 nhi謒 v�) s� c� th� n L� Quan t筰 c竎 th祅h th� v� T﹏ th� th玭  nh薾 1 <yellow=color>Thi猲 S琻 Tuy誸 Li猲<color>.",	SUPERPLAYERACT_TaskTime)
    }
   Say( format("%s%s%s",tDiaStr[1],tDiaStr[2],tDiaStr[3]),
   		3,
   		"Nh薾 Thi猲 S琻 Tuy誸 Li猲/SuperPlayerAct_WinMedal",
   		"Thi猲 S琻 Tuy誸 Li猲 l� g�?/SuperPlayerAct_ItemDes",
   		"K誸 th骳 i tho筰/OnCancel")
end
--
function SuperPlayerAct_WinMedal()

	local nDay = tonumber(GetLocalDate("%Y%m%d"))
    local szMsg = "";
    if nDay < SUPERPLAYERACT_BIGENTIME and nDay > SUPERPLAYERACT_ENDTIME then
        Msg2Player("Th藅 ng ti誧, th阨 gian ho箃 ng  k誸 th骳.")
        return 0;
    end;
     
    if GetExtPoint(SUPERPLAYERACT_ExtPoint) ~= 1 then
    	szMsg = "Th藅 ng ti誧, kh玭g ph秈 l� t礽 kho秐 m韎 t筼, kh玭g th� tham gia ho箃 ng n祔!";
        Say(szMsg,
        	2,
        	"Tr� l筰/main",
        	"K誸 th骳 i tho筰/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nLev = GetLevel()
    if nLev < SUPERPLAYERACT_LevRequest then
    	szMsg = format("Ch璦  c蕄 %s, h穣 t n c蕄 %s r錳 h穣 n t譵 ta.",SUPERPLAYERACT_LevRequest,SUPERPLAYERACT_LevRequest)
        Say(szMsg,
        	2,
        	"Tr� l筰/main",
        	"K誸 th骳 i tho筰/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nTaskEDTime = GetTask(SUPERPLAYERACT_TaskDataKey)
    --local nTaskEDTime = tl_counttasklinknum(1)
    
    if nTaskEDTime < SUPERPLAYERACT_TaskTime then
    	szMsg = format("Th藅 ng ti誧, ch璦 ho祅 th祅h m閠 chu鏸 %s nhi謒 v� D� T萿, kh玭g th� nh薾 Thi猲 S琻 Tuy誸 Li猲.",SUPERPLAYERACT_TaskTime)
        Say(szMsg,2,"Tr� l筰/main","K誸 th骳 i tho筰/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    if  GetTask( TSK_SUPERPLAYERACT ) > 0 then
        Say("Th藅 ng ti誧, nh﹏ v藅 n祔  nh薾 ph莕 thng r錳.",2,"Tr� l筰/main","K誸 th骳 i tho筰/OnCancel")
        return 0
    end
    local nItemIdx = AddItem( 6, 1, TSXL_ITEM_ID, 1, 0, 0 )
    if nItemIdx > 0 then
        SetTask( TSK_SUPERPLAYERACT, 1 )
        Say("Thi猲 S琻 Tuy誸 Li猲 y! H穣 c蕋 gi� c萵 th薾!",0)
        Msg2Player("B筺 nh薾 頲 1 Thi猲 S琻 Tuy誸 Li猲.")
        WriteLog(format("[Ho箃 ng ngi ch琲 si猽 c蕄] \t%s\tName:%s\tAccount:%s\t nh薾 頲 m閠 Thi猲 S琻 Tuy誸 Li猲",
		GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
    else
        Say("H祅h trang  y, kh玭g th� nh薾 v藅 ph萴!",2,"Tr� l筰/main","K誸 th骳 i tho筰/OnCancel")
    end
end
--
function SuperPlayerAct_ItemDes()
    Say("Thi猲 S琻 Tuy誸 Li猲: <enter>Nh﹏ v藅 c蕄  t� 50 n 90 (bao g錷 c蕄 50 v� 90) s� d鬾g s� nhanh ch鉵g n﹏g cao ng c蕄 c馻 m譶h.",2,"Tr� l筰/SuperPlayerAct2007","K誸 th骳 i tho筰/OnCancel")
end
--
function OnCancel()
end