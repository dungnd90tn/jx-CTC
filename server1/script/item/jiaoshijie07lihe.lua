--教师节07礼盒
Include("\\script\\lib\\award.lua");
Include("\\script\\event\\teacher_day_200711\\head.lua");
function main()
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	if (nDate >= TeacherDay200711_START_TIME and nDate <= TeacherDay200711_UseLimitTime) then--2007年11月17日 至2007年12月02日 24点00
		local tbAwardItemPic =
		{
			{nGID =6, nDID = 1, nPID = 1599, szName = "T玭", nRate = 10},--“尊”字	
			{nGID =6, nDID = 1, nPID = 1600, szName = "揝瓟", nRate = 10},  --“师”字	
			{nGID =6, nDID = 1, nPID = 1601, szName = "Tr鋘g", nRate = 10},   --“重”字	
			{nGID =6, nDID = 1, nPID = 1602, szName = "Чo", nRate = 10},   --“道”字	
			{nGID =6, nDID = 0, nPID = 20, szName = "Mai Kh玦 Hoa V� ", nRate = 60},   --玫瑰花雨
		}
		local nItemIndex=TeacherDay200711_RandomGetOne(tbAwardItemPic,1,getn(tbAwardItemPic));
		AddItem(tbAwardItemPic[nItemIndex]["nGID"],tbAwardItemPic[nItemIndex]["nDID"],tbAwardItemPic[nItemIndex]["nPID"],1,0,0);
		Msg2Player(format("Nh薾 頲 %d %s",1,tbAwardItemPic[nItemIndex]["szName"]))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tGetItem %d %s.","Ho箃 ng Nh� gi竜 Vi謙 Nam 2007",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),1,tbAwardItemPic[nItemIndex]["szName"] ));
		return 0;
	else
		Say("Ho箃 ng Nh� gi竜 Vi謙 Nam  k誸 th骳",0)
		return 0;
	end
end

--返回随机选中的一个位置
function TeacherDay200711_RandomGetOne(Item_Talbe,start_index,end_index)
	local rtotal=100000;
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=start_index,end_index do
		Item_Talbe[i]["nRate"] = Item_Talbe[i]["nRate"] or 100;
		rstep=rstep+floor(Item_Talbe[i]["nRate"]*rtotal/100);
		if(rcur <= rstep) then
			return i
		end
	end
	return -1
end