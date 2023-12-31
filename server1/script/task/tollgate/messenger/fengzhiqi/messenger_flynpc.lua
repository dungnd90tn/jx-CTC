-------------------------------------------------------------------------
-- FileName		:	enemy_flynpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 10:23:14
-- Desc			:   风之骑关卡的出口处对话npc，风之骑将白翼
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的赖
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的赖
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --增加同伴剧情任务完成的控制判断
Include("\\script\\activitysys\\g_activity.lua")			--活动钡辑器
Include("\\script\\activitysys\\playerfunlib.lua")		--活动钡辑器

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	
	if ( messenger_middletime() == 10  ) then
		Msg2Player("Xin l鏸! "..name.."! B筺  h誸 th阨 gian th鵦 hi謓 nhi謒 v� T輓 s�! Nhi謒 v� th蕋 b筰!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_BaiYi..":"..name..", Kh玭g ph秈 b筺  vt qua th� th竎h c馻 Phong K� sao? Mu鑞 xu蕋 quan �?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_BaiYi..": T輓 S� L謓h - M閏"..name..", Kh玭g ph秈 b筺  vt qua th� th竎h c馻 Phong K� sao? Mu鑞 xu蕋 quan �?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_BaiYi..": T輓 s� l謓h - уng"..name.."Чi nh﹏! C� ph秈 ngi  vt qua th� th竎h c馻 Phong K� sao? Mu鑞 xu蕋 quan �?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_BaiYi..": T輓 s� l謓h - B筩"..name.."Чi nh﹏! C� ph秈 ngi  vt qua th� th竎h c馻 Phong K� sao? Mu鑞 xu蕋 quan �?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_BaiYi..": T輓 s� l謓h - V祅g"..name.."Чi nh﹏! C� ph秈 ngi  vt qua th� th竎h c馻 Phong K� sao? Mu鑞 xu蕋 quan �?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_BaiYi..": Ng� T� l謓h b礽 - V祅g"..name.."Чi nh﹏! Ta ch璦 th蕐 qua Ng� T� Kim b礽, h玬 nay coi nh� 頲 m� mang t莔 nh譶! g th藅 l頸 h筰!  Ngi  vt qua th� th竎h c馻 Phong K�, mu鑞 xu蕋 quan �?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 5 ) then
		nt_setTask(1201,30)  --风之骑任务的任务变量设置为任务完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1214,0)  --定点打怪开关
		nt_setTask(1215,0)  --boss刷怪开关
		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		nt_setTask(1211,0)	
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		taskProcess_002_06:doTaskEntity()  --同伴剧情任务
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 1, n_level);
		
		SetPos(1563,3118);
	else
		Describe(DescLink_BaiYi..":Xin l鏸!  B筺 ch璦 qua 秈, trong b秐  Phong K� 輙 nh蕋 b筺 ph秈 x竎 nh 輙 nh蕋 <color=red>5 t鋋 <color> m韎 c� th� qua 秈.",1,"K誸 th骳 i tho筰/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_BaiYi..": C� ph秈 b筺 mu鑞 r阨 kh醝, n誹 ch璦 ho祅 th祅h nhi謒 v� m� r阨 kh醝, b筺 c騨g c� th� n D辌h Quan giao tr� nhi謒 v� v� nh薾 ph莕 thng nh璶g ph莕 thng s� gi秏 xu鑞g r蕋 nhi襲.",2,"ng! Ta mu鑞 r阨 kh醝/f_fallmessengertask","в ta ngh� l筰 xem sao/no")

end

function f_fallmessengertask()	
		nt_setTask(1201,25)  --风之骑任务的任务变量设置为简单任务完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1214,0)  --定点打怪开关
		nt_setTask(1215,0)  --boss刷怪开关
		nt_setTask(1211,0)
		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1563,3118);
end


function no()
end
