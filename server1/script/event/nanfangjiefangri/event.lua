--南方解放纪念日活动
--by小浪多多
--2007-04-13
XINGYUNLIBAO = 2556 --Byte:1.年 2.月 3.日 4.次数

function nanfangjiefangri_main()
	local aryTalk = {
		"<dec><npc>Nh鱪g n╩ g莕 y, chi課 s� T鑞g Kim ng祔 c祅g k辌h li謙. V� l﹎ nh﹏ s� c竎 n琲  h閕 t� tham chi課. H�  hi sinh th﹏ m譶h  nh 畊鎖 k� th� b秓 v� t� qu鑓. в ca ng頸 tinh th莕 hi謕 ngh躠 n祔, V� l﹎ minh ch� quy誸 nh t苙g thng cho nh鱪g anh h飊g l藀 頲 nhi襲 c玭g tr筺g tr猲 chi課 trng T鑞g Kim.",
		"Ta mu鑞 t譵 hi觰 ho箃 ng n祔./about",
		"Ta mu鑞 nh薾 C玭g tr筺g l謓h./getGongLaoLin",
		"Ta mu鑞 nh薾 ph莕 thng anh h飊g chi課 trng./getXingYunLiBao",
		"Th藅 ng筰 qu�, ta s� quay l筰 sau./no",
	}
	CreateTaskSay(aryTalk)
	
end
function getGongLaoLin()
	if (GetCash()<300000) then
		CreateTaskSay({"<dec><npc>C莕 ph秈 n閜 v祇 30 v筺 lng l� ph� ng k�, i hi謕 kh玭g  ti襫 r錳!","Bi誸 r錳/no"});
		return 0;
	end
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>Ch� c� ngi ch琲  n筽 th� m韎 c� th� nh薾.","Bi誸 r錳/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>Ch� c� ngi ch琲 c蕄 t� 50 tr� l猲 m韎 c� th� nh薾.","Bi誸 r錳/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>H穣 chu萵 b� 1 � tr鑞g  t v祇 1 <color=yellow>C玭g tr筺g l謓h<color>.","Bi誸 r錳/no"});
		return 0;
	end
	Pay(300000);
	local nidx = AddItem(6,1,1411,1,0,0);
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>B筺  nh薾 th祅h c玭g 1 <color=yellow>C玭g tr筺g l謓h<color>.","Bi誸 r錳/no"});
end

function getXingYunLiBao()
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>Ch� c� ngi ch琲  n筽 th� m韎 c� th� nh薾.","Bi誸 r錳/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>Ch� c� ngi ch琲 c蕄 t� 50 tr� l猲 m韎 c� th� nh薾.","Bi誸 r錳/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>H穣 chu萵 b� 1 � tr鑞g  t v祇 1 <color=yellow>C玭g tr筺g l謓h<color>.","Bi誸 r錳/no"});
		return 0;
	end
	local ndate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nlibao = GetTask(XINGYUNLIBAO);
	local olddate = tonumber(GetByte(nlibao,1)..GetByte(nlibao,2)..GetByte(nlibao,3));
	local num = GetByte(nlibao,4);
	if num == nil then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,0));
		num = 0;
	end
	if ndate == olddate then 
		CreateTaskSay({"<dec><npc> M鏸 ng祔 ch� c� th� nh薾 t鑙 產 50 c竔, ng祔 mai h穣 n nh�.","Bi誸 r錳/no"});
		return 0;
	end
	local ngonglao = CalcEquiproomItemCount(6,1,1411,-1)
	local nxunzhang = CalcEquiproomItemCount(6,1,1412,-1)
	if ngonglao < 1 then
		CreateTaskSay({"<dec><npc> Чi hi謕 kh玭g mang theo <color=yellow>C玭g tr筺g l謓h<color>.","Bi誸 r錳/no"});
		return 0;
	end
	if nxunzhang < 1 then
		CreateTaskSay({"<dec><npc> Чi hi謕 kh玭g mang theo <color=yellow>Huy chng T鑞g Kim<color>. H穣 d飊g 甶觤 t輈h l騳  i l蕐 Huy chng T鑞g Kim ","Bi誸 r錳/no"});
		return 0;
	end	
	num = num + 1;
	if num >= 50 then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),1,tonumber(GetLocalDate("%y"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,tonumber(GetLocalDate("%m"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),3,tonumber(GetLocalDate("%d"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,0));
	else
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,num));
	end
	ConsumeEquiproomItem(1, 6, 1, 1411, -1)
	ConsumeEquiproomItem(1, 6, 1, 1412, -1)
	local nidx = AddItem(6,1,1413,1,0,0);
	WriteLog(format("[XINGYUNLIBAO]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>Х nh薾 th祅h c玭g 1 <color=yellow>T骾 qu� may m緉<color>.","Bi誸 r錳/no"});
end

function about()
	CreateTaskSay({"<dec><npc>T� ng祔 28/4/2007 n 13/5/2007, ngi ch琲 c蕄 50  n筽 th� c� th� n ch� ta d飊g 1 <color=yellow>C玭g tr筺g l謓h<color> (ng 30 v筺 ph� ng k� cho ta  nh薾) v� 1 <color=yellow>Huy chng T鑞g Kim<color> (d飊g 500 甶觤 t輈h l騳  i t筰 Qu﹏ Nhu Quan)  i l蕐 ","Bi誸 r錳/no"})
end