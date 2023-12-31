--传家之书
Include("\\script\\event\\teacher_day_200711\\head.lua");

-- 每个角色只能通过家传之书道具获得5亿经验值得上限 。
--

function main()
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	local nExpLimit = GetTask(TSK_TeacherDay200711_UseExpLimit); 
	if ( nExpLimit >= TeacherDay200711_UseExpLimit) then
		Say("S� d鬾g b� k輕 gia truy襫  t gi韎 h筺 甶觤 kinh nghi謒, kh玭g th� s� d鬾g n鱝.",0)
		return 1;
	end
	if (GetLevel() < 50) then
		Say("Th藅 ng ti誧, ch� c� ngi ch琲 <color=yellow>c蕄 tr猲 50<color> m韎 c� th� s� d鬾g b� k輕 n祔.",0)
		return 1;
	end
	if (nDate < TeacherDay200711_START_TIME or nDate > TeacherDay200711_UseLimitTime) then
		Say("Ho箃 ng  k誸 th骳, kh玭g th� s� d鬾g!",0);
		return 0;
	end
	--2.000.000 经验值
	--1,5% 概率获得1颗猩红宝石
	AddOwnExp(2000000);
	SetTask(TSK_TeacherDay200711_UseExpLimit,nExpLimit+2000000);
	if (random(1,10000) <= 150) then
		AddItem(4,353,1,1,0,0)
		Msg2Player(format("Nh薾 頲 %d %s",1,"Tinh H錸g B秓 Th筩h"))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tGetItem %d %s.","Ho箃 ng Nh� gi竜 Vi謙 Nam 2007",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),1,"Tinh H錸g B秓 Th筩h"));			
	end
	return 0;
end