-- script viet hoa By http://tranhba.com  v╪ ki謓 t猲 ##matchmaker.lua 
-- script viet hoa By http://tranhba.com  ngi khai s竛g ##zhongchaolong 
-- script viet hoa By http://tranhba.com  khai s竛g th阨 gian #2008-01-22 15:11:22 
-- script viet hoa By http://tranhba.com 每日限制n低字位9位记录计数，高位记录日期， 计数可以直接n=n+1
Include("\\script\\event\\valentine2008\\head.lua")
Include("\\script\\event\\valentine2008\\lib\\addaward.lua")
Include("\\script\\lib\\pay.lua")
function IsPickable( nItemIndex, nPlayerIndex ) 
-- script viet hoa By http://tranhba.com  th阨 gian 
if not valentine2008_isGetItemPeriod() then 
Msg2Player(format("Ho箃 ng <color=yellow>%s<color>  k誸 th骳 , kh玭g th� 頲 c竔 g�  . ",valentine2008_szActName)) 
return 0; 
end 
if check_valentine2008_team() ~= 1 then 
Msg2Player("Ch� c� th� l� m閠 nam m閠 n� h鋚 th祅h i m韎 c� th� c飊g h緉 i tho筰 . ") 
return 0; 
end 
local nTeamSize = GetTeamSize() 
local i 
for i=1, nTeamSize do 
if valentine2008_PlayerDo(GetTeamMember(i), valentine2008_PlayerLimit) == 0 then 
Msg2Team("чi ng� c� ngi 甶襲 ki謓 kh玭g ph� h頿 kh玭g th� l蕐 頲 竛h tr╪g b秓 h閜 . ") 
return 0; 
end 
end 
return 1; 
end 

function PickUp( nItemIndex, nPlayerIndex ) 
if( IsMyItem( nItemIndex ) ) then 
local i 
local nCollectExpLimit = GetTask(TSK_valentine2008_CollectExpLimit) 
-- script viet hoa By http://tranhba.com  th藀 l蕐 ngi l蕐 頲 
local tbExp = 
{ 
{nExp = 10000, nRate = 30}, 
{nExp = 40000, nRate = 40}, 
{nExp = 70000, nRate = 30}, 
} 
if nCollectExpLimit < TSKV_valentine2008_CollectExpLimit then 
local nCurSelect = valentine2008_lib_AddAwardByRate(tbExp, valentine2008_szActName) 
			nCollectExpLimit = nCollectExpLimit + tbExp[nCurSelect].nExp
SetTask(TSK_valentine2008_CollectExpLimit, nCollectExpLimit) 
else 
Msg2Player(format("Ngi t 頲 竛h tr╪g b秓 h閜 l蕐 頲 kinh nghi謒 t %d , n l莕 n祔 ho箃 ng thng h筺 . ", nCollectExpLimit)) 
end 
-- script viet hoa By http://tranhba.com  t藀 th� l蕐 頲 
local nTeamSize = GetTeamSize() 
for i=1, nTeamSize do 
valentine2008_PlayerDo(GetTeamMember(i), valentine2008_GetYueGuangBaoHe); 
end 
return 0; -- script viet hoa By http://tranhba.com  th� ti猽 v藅 ph萴 
end 
end 

-- script viet hoa By http://tranhba.com  ngi kia thi h祅h m閠 h祄 s� 
function valentine2008_PlayerDo(nPlayerIdx,fun,...) 
local nOldPlayer = PlayerIndex; 
PlayerIndex = nPlayerIdx 
local re = call(fun, arg); 
PlayerIndex = nOldPlayer; 
return re 
end 

-- script viet hoa By http://tranhba.com  ki觤 tra c� hay kh玭g 2 ngi nam n� i ng� 

function check_valentine2008_team() 
if (GetTeamSize() == 2) then -- script viet hoa By http://tranhba.com  h鋚 th祅h i # nh﹏ s� v� 2# 
Player1_ID = GetTeamMember(1) 
Player2_ID = GetTeamMember(2) 
		if ( (valentine2008_PlayerDo(Player1_ID,GetSex) + valentine2008_PlayerDo(Player2_ID,GetSex) ) ~= 1) then -- script viet hoa By http://tranhba.com 男女情况11 10 00 相加为1说明是异性队伍
return 0 
end 
return 1 
end 
return 0 
end 
-- script viet hoa By http://tranhba.com  nh﹏ v藅 c� li猲 quan h筺 ch� 甶襲 ki謓 
function valentine2008_PlayerLimit() 
local nDate = tonumber(GetLocalDate("%y%m%d")); 
local nMaxCount = GetTask(TSK_valentine2008_CollectMaxLimit) 
local nCollectLimit = GetTask(TSK_valentine2008_CollectLimit) 
-- script viet hoa By http://tranhba.com  c蕄 b薱 
if (IsCharged() == 0 or GetLevel() < 100) then 

Msg2Team(format("%s kh玭g ph秈 l� 100 c蕄 tr� l猲 sung tr� gi� nh� ch琲 . ", GetName())) 
return 0; 
end 

-- script viet hoa By http://tranhba.com  l韓 nh蕋 th藀 l蕐 c� m 
if(nMaxCount >= TSKV_valentine2008_CollectMaxLimit) then 
Msg2Team(format("%s t 頲 竛h tr╪g b秓 h閜 t %d c� ,  t韎 l莕 n祔 ho箃 ng thng h筺 li評 . ", GetName(), nMaxCount)); 
return 0; 
end 
-- script viet hoa By http://tranhba.com  m鏸 ng祔 th藀 l蕐 c� m 

if( nDate ~= floor(nCollectLimit/512) ) then 
nCollectLimit = nDate * 512 
SetTask(TSK_valentine2008_CollectLimit, nCollectLimit) 
end 
if(mod(nCollectLimit, 512) >= TSKV_valentine2008_CollectDayLimit) then 
Msg2Team(format("%s h玬 nay t 頲 竛h tr╪g b秓 h閜 t %d c� ,  t韎 thng h筺 li評 , xin/m阨 ng祔 mai ti誴 t鬰 甶 . ", GetName(), TSKV_valentine2008_CollectDayLimit)); 
return 0; 
end 
return 1 
end 
-- script viet hoa By http://tranhba.com  l蕐 頲 竛h tr╪g b秓 h閜 , nhi謒 v� thay i lng thi誸 tr� 
function valentine2008_GetYueGuangBaoHe() 
local nMaxCount = GetTask(TSK_valentine2008_CollectMaxLimit) 
local nCollectLimit = GetTask(TSK_valentine2008_CollectLimit) 
local nStackCount = 10 
local tbItemList = 
{ 
{szName=" con bm tr﹎ ", tbProp={6, 1, 1667, 1, 0, 0}}, 
{szName=" uy猲 ng m箃 ", tbProp={6, 1, 1666, 1, 0, 0}}, 
} 

	SetTask(TSK_valentine2008_CollectLimit, nCollectLimit+1);-- script viet hoa By http://tranhba.com 今天最大个数+1
	nMaxCount = nMaxCount + 1
	SetTask(TSK_valentine2008_CollectMaxLimit, nMaxCount);-- script viet hoa By http://tranhba.com 最大个数+1
Msg2Player(format("T鎛g c閚g l蕐 頲 %d th竛g quang b秓 h閜 . ", nMaxCount)) 
if mod(nMaxCount, nStackCount) == 0 then 
AddSkillState(703, 1, 1, 18*60*10) 
if GetSex() == 0 then -- script viet hoa By http://tranhba.com  nam 
valentine2008_lib_AddAward(tbItemList[2], valentine2008_szActName) 
else 
valentine2008_lib_AddAward(tbItemList[1], valentine2008_szActName) 
end 
end 
end 
