-------------------------------------------------------------------------
-- FileName		:	messenger_turenpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 10:46:14
-- Desc			:   千宝库关卡的出口处对话npc，萧镇
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的赖
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的赖
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --增加同伴剧情任务完成的控制判断
Include("\\script\\activitysys\\g_activity.lua")			--活动钡辑器
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")		--活动钡辑器

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--开宝箱工具函数

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>V� n祔 anh h飊g, t譵 ta c� chuy謓 g� kh玭g?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)

	tbDailog:AddOptEntry("Ta mu鑞 甶 ra ngo礽",messenger_main);
	
	--弹出对话框
	tbDailog:Show()
end

function messenger_main()
--	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("Xin l鏸! "..name.."! B筺  h誸 th阨 gian th鵦 hi謓 nhi謒 v� T輓 s�! Nhi謒 v� th蕋 b筰!.")
		losemessengertask()
	else
		Describe(DescLink_XiaoZhen..":"..name..", c� ph秈 ngi  th玭g qua kh秓 nghi謒 c馻 Thi猲 B秓 Kh�, c� c莕 ra kh醝 秈 kh玭g?"
			,3
			,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback"
			,"Ta ch璦 ho祅 th祅h kh秓 nghi謒, ta mu鑞 甶 ra m閠 ch髏/messenger_icantdo"
			,"Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")	
		
		if ( Uworld1206 == 0 ) then 
                          Describe(DescLink_XiaoZhen..":"..name.." ,Ngi c� ph秈 hay kh玭g  th玭g qua thi猲 b秓 kho kh秓 nghi謒, c莕 xu蕋 quan ? ",3,"ng v藋, ta ph秈 ra kh醝 quan/messenger_comeback","Ta kh玭g xong th祅h kh秓 nghi謒, b蕋 qu� ta kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l�, ta c遪 mu鑞 n鱝 ng� ng竎/no") 
                elseif ( Uworld1206 == 1 ) then 
                          Describe(DescLink_XiaoZhen..": M閏 b礽 t輓 s� "..name..", ng礽 l� kh玭g ph秈 l�  th玭g qua thi猲 b秓 kho ch kh秓 nghi謒, c莕 xu蕋 quan ? ",3,"ng v藋, ta ph秈 ra kh醝 quan /messenger_comeback","Ta kh玭g xong th祅h kh秓 nghi謒, b蕋 qu� ta kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l�, ta c遪 mu鑞 n鱝 ng� ng竎 /no") 
                elseif ( Uworld1206 == 2 ) then 
                          Describe(DescLink_XiaoZhen..": уng b礽 t輓 s� "..name.." Чi nh﹏ ! ng礽 l� kh玭g ph秈 l�  th玭g qua thi猲 b秓 kho ch kh秓 nghi謒, c莕 xu蕋 quan ? ",3,"ng v藋, ta ph秈 ra kh醝 quan /messenger_comeback","Ta kh玭g xong th祅h kh秓 nghi謒, b蕋 qu� ta kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l�, ta c遪 mu鑞 n鱝 ng� ng竎 /no") 
                elseif ( Uworld1206 == 3 ) then 
                          Describe(DescLink_XiaoZhen..": Ng﹏ b礽 t輓 s� "..name.." Чi nh﹏ ! kh� c鵦 ng礽 k衞 ! ngi c� ph秈 hay kh玭g  th玭g qua thi猲 b秓 kho ch kh秓 nghi謒, c莕 xu蕋 quan ? ",3,"ng v藋 , Ta ph秈 ra kh醝 quan /messenger_comeback","Ta kh玭g xong th祅h kh秓 nghi謒, b蕋 qu� ta kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l�, ta c遪 mu鑞 n鱝 ng� ng竎 /no") 
                elseif ( Uworld1206 == 4 ) then 
                          Describe(DescLink_XiaoZhen..": Kim b礽 t輓 s� "..name.." Чi nh﹏ ! l韓 nh� v藋 th藅 xa ch ch箉 t韎 th藅 l� lao ng礽 ph� t﹎, ng礽 b﹜ gi� l� kh玭g ph秈 l�  th玭g qua thi猲 b秓 kho ch kh秓 nghi謒, c莕 xu蕋 quan ? ",3,"ng v藋, ta ph秈 ra kh醝 quan /messenger_comeback","Ta kh玭g xong th祅h kh秓 nghi謒, b蕋 qu� ta kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l�, ta c遪 mu鑞 n鱝 ng� ng竎 /no") 
                elseif ( Uworld1206 == 5 ) then 
                         Describe(DescLink_XiaoZhen..": Ng� t� kim b礽 t輓 s� "..name.." Чi nh﹏ ! ta c遪 cho t韎 b﹜ gi� ch璦 t鮪g th蕐 ng� t� kim b礽 y, h玬 nay coi l� m� r閚g t莔 m総 li評 ! ng礽 th藅 l� l頸 h筰. Ng礽 l� kh玭g ph秈 l�  th玭g qua thi猲 b秓 kho ch kh秓 nghi謒, c莕 xu蕋 quan ? ",3,"ng v藋, ta ph秈 ra kh醝 quan /messenger_comeback","Ta kh玭g xong th祅h kh秓 nghi謒, b蕋 qu� ta kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l�, ta c遪 mu鑞 n鱝 ng� ng竎 /no") 
                end
	end
end

function messenger_comeback()
	if check_task_state()==30 then
		nt_setTask(1203,30)  --千宝库任务的任务变量设置为任务完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1215,0)  --boss刷怪开关
		local nRealjifen = 0;
		if ( Uworld1214 ~= 0 ) then
			--根据救出的人数给予对应奖励
			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
				AddOwnExp(50000*Uworld1214)
				local Uworld1205 = nt_getTask(1205)
				nRealjifen = Uworld1214*16;
				nt_setTask(1205,Uworld1214*16+Uworld1205)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
				AddOwnExp(100000*Uworld1214)
				local Uworld1205 = nt_getTask(1205)
				nRealjifen = Uworld1214*18;
				nt_setTask(1205,Uworld1214*18+Uworld1205)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
				AddOwnExp(150000*Uworld1214)
				local Uworld1205 = nt_getTask(1205)
				nRealjifen = Uworld1214*24;
				nt_setTask(1205,Uworld1214*24+Uworld1205)		
			end				 
			nt_setTask(1214,0)
		end
		local nBeishu = greatnight_huang_event(2);--by 小山
		if (nBeishu > 0) then--by 小山
			nOrgRealjifen = floor(nRealjifen / nBeishu);--by 小山
		end;
		tongaward_message(nRealjifen);	--by 小山
		
		nt_setTask(1203,30)

		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
--		taskProcess_002_08:doTaskEntity()
		SetDeathScript("");
		
--		local n_level = GetLevel();
--		G_ACTIVITY:OnMessage("FinishMail", 3, n_level);
		
		SetPos(1414,3197);
	else
		Describe(DescLink_XiaoZhen..": Xin lng th�, hi謓 t筰 ngi v蒼 ch璦 ho祅 th祅h m鬰 ti猽 c鯽 秈, � trong b秐  Thi猲 B秓 Kh� ngi ph秈 d鵤 theo th� t� nhi謒 v� m� ra 5 B秓 Rng m韎 頲 xem l� qua 秈.",1,"K誸 th骳 i tho筰/no")
	end
end

function messenger_icantdo()
	if nt_getTask(1203) ==25 then
		Talk(1, "", "Nhi謒 v� c馻 ngi  ho祅 th祅h, hay l� ta tr鵦 ti誴 ti詎 ngi ra kh醝 秈 nh�.")
		messenger_comeback()
	else
		Describe(DescLink_XiaoZhen..": Ngi quy誸 nh r阨 kh醝 �, nhi謒 v� ch璦 ho祅 th祅h ngi v蒼 c� th� quay l筰 b蕋 c� l骳 n祇!",2,"ng! Ta mu鑞 r阨 kh醝/q_fallmessengertask","в ta ngh� l筰 xem sao/no")
	end
end

function q_fallmessengertask()
	local Uworld1207 = nt_getTask(1207)  --信使任务当前杀怪记数器
	local Uworld1204 = nt_getTask(1204)  --送信任务所到地点任务变量
	local Uworld1214 = nt_getTask(1214)  --获救少女剧情
	local name = GetName()
	
		nt_setTask(1203,25)  --千宝库任务的任务变量设置为简单任务完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1215,0)  --boss刷怪开关
		local nRealjifen = 0;
		if ( Uworld1214 ~= 0 ) then
			--根据救出的人数给予对应奖励
			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
				AddOwnExp(50000*Uworld1214)
				local Uworld1205 = nt_getTask(1205)
               			nRealjifen = Uworld1214*16;
				nt_setTask(1205,Uworld1214*16+Uworld1205)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
				AddOwnExp(100000*Uworld1214)
				local Uworld1205 = nt_getTask(1205)
				nRealjifen = Uworld1214*18;
				nt_setTask(1205,Uworld1214*18+Uworld1205)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
				AddOwnExp(150000*Uworld1214)
				local Uworld1205 = nt_getTask(1205)				
                                nRealjifen = Uworld1214*24;
				nt_setTask(1205,Uworld1214*24+Uworld1205)		

			end				 
			nt_setTask(1214,0)
		end
		local nBeishu = greatnight_huang_event(2);--by 小山
		if (nBeishu > 0) then--by 小山
			nOrgRealjifen = floor(nRealjifen / nBeishu);--by 小山
		end;
		tongaward_message(nRealjifen);	--by 小山

		nt_setTask(1203,25)  --千宝库任务的任务变量设置为简单任务完成状态

		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		nt_setTask(1203,21)--暂时中断任务
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1414,3197);
end

function no()
end
