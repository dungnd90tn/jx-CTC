-- 各门派接引弟子脚本　少林
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Thi誹 L﹎ La H竛"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 0 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyushaolin","Ngi  l�  t� c馻 b鎛 ph竔, kh玭g c莕 甶 n鱝, c� th� tr鵦 ti誴 g苝 Long Ng� n鉯 chuy謓.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Qu� m玭 l蕐 v� luy謓 v�! Uy觧 chuy觧 m� tinh di謚! Ti觰 t╪g v� c飊g b閕 ph鬰!")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Thanh Hi觰 S� Th竔 c馻 qu� ph竔 tinh th玭g ph藅 h鋍, v� ngh� cao cng, ti觰 t╪g ngng m�  l﹗!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Nghe n鉯 t� Л阯g m玭 i 竚 kh� th祅h minh kh�, h� th� xu蕋 th莕! T筰 h� r蕋 kh﹎ ph鬰!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","чc M玭 c馻 qu� ph竔 thi猲 h� u o竛 gh衪! B莕 t╪g m筼 mu閕 khuy猲 c竎 ngi n猲 tu s鯽 Ph藅 t藀! Quay u l� b�!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Nghe n鉯 Kim qu鑓 產ng mu鑞 ti猽 di謙 qu� bang t薾 g鑓! Xin c竎 v� v� c飊g th薾 tr鋘g!")
	elseif (player_Faction == "shaolin") then
		Say("S� ! S� ph� l筰 ph竔  xu鑞g n骾 �?",4,"V﹏g! Nh� s� huynh a  v� n骾!/return_yes","T譵 hi觰 khu v鵦 luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","Xin thay ta v蕁 an s� ph� /no")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Xin chuy觧 l阨 h醝 th╩ cu� b莕 t╪g n Чo Nh蕋 Ch﹏ Nh﹏! C� d辮 s� n  th豱h gi竜 ngi!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Ngi luy謓 v� k� nh蕋 l� h竚 danh v�  k�! A Di  Ph藅!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Qu� gi竜 tuy 頲 Kim qu鑓 b秓 h�, nh璶g giang h� c� quy t綾 c馻 giang h�. Kh玭g ph秈 mu鑞 l祄 g� th� l祄.")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Di s� l穘h o c馻 qu� bang, d﹏ ch髇g  c� nh鱪g ng祔 y猲 b譶h h筺h ph骳! V筺 l莕 b閕 ph鬰! B閕 ph鬰!")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","T� h鋍 kh� luy謓!  T筰 h� v� c飊g b閕 ph鬰! ")
	else						-- 只要不属于10个门派，不再单独检测“无门派”
		UTask_sl = nt_getTask(7)
--		if (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_sl < 5*256) and (nt_getTask(3) == 70*256) then		-- 转门派任务启动
--			Say("少林罗汉：天下武功出少林，本派武功名门正宗，本寺七千弟子皆引以为傲。",2,"我想改投贵派学艺/defection_get","没兴趣/defection_no")
		if ((UTask_sl > 5*256) and (UTask_sl < 10*256)) then		-- 入门任务中
			Talk(1,"","Ch� c莕 ho祅 th祅h nhi謒 v� nh藀 m玭 l� c� th� tr� th祅h huynh  t鑤 v韎 ch髇g ta!")
		elseif (UTask_sl >= 70*256) and (player_Faction ~= "shaolin") then					--已经出师
			Say("Th� ra l� huynh  ng m玭! Kh玭g bi誸 d筼 n祔 th� n祇?",3,"T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","K誸 th骳 i tho筰/no")
		else
			Talk(1,"enroll_select","Thi誹 l﹎ ph竔 lu玭 頲 xem l� V� l﹎  nh蕋 m玭 ph竔, m謓h danh 'Th竔 s琻 b綾 u' c馻 Trung nguy猲 v� l﹎")
		end
	end
end;

function defection_get()
	Talk(1,"","A di  ph藅! Huynh ch� c莕 th豱h c莡 qu� bang Dng bang ch�  r阨 kh醝 Thi猲 vng bang, r錳 n b萴 b竜 v韎 Huy襫 Nh﹏ phng trng l� c� th� nh藀 n t� t�!")
	nt_setTask(7,5*256+10)
	Msg2Player("Ch� c莕 th豱h c莡 Dng bang ch�  r阨 kh醝 Thi猲 vng bang, r錳 n b萴 b竜 v韎 Huy襫 Nh﹏ phng trng l� c� th� gia nh藀 Thi誹 l﹎!")
	AddNote("Ch� c莕 th豱h c莡 Dng bang ch�  r阨 kh醝 Thi猲 vng bang, r錳 n b萴 b竜 v韎 Huy襫 Nh﹏ phng trng l� c� th� gia nh藀 Thi誹 l﹎!")
end

function defection_no()
	Talk(1,"","V� ngh� b鎛 bang c騨g c� s� trng ri猲g kh玭g thua k衜 Thi誹 L﹎! Ta nguy謓 trung th祅h v韎 Dng bang ch� ")
end

function enroll_select()
	UTask_sl = nt_getTask(7)
	UTask_tw = nt_getTask(3)
	if ((UTask_tw > 5*256) and (UTask_tw < 10*256)) then		-- 已接了入门任务
		Talk(1,"","Thi猲 Vng bang 產ng l� c竔 gai trong m総 Kim qu鑓! Ngi ch鋘 nh� th� ch璦 h糿 l� t鑤!")
	elseif (GetSeries() == 0) and (GetCamp() == 0) and (UTask_tw < 5*256) and (UTask_sl < 5*256) then		--金系、未入天王少林
		if ((GetLevel() >= 10) and (HaveMagic(29) == -1)) then						--等级达到十级（并且没学过“斩龙决”）
			Say("Thi誹 L﹎ kh玭g h� danh l� danh m玭 ch輓h ph竔! Huynh  c� mu鑞 gia nh藀 kh玭g?", 3, "Gia nh藀 Thi誹 L﹎ ph竔/go", "в ta suy ngh� k� l筰 xem/no","T譵 hi觰 tinh hoa v� ngh� c竎 m玭 ph竔/Uworld1000_knowmagic")
		else
			Talk(1,"","C╪ b秐 c馻 ngi c遪 k衜 l緈! H穣 甶 luy謓 t藀 th猰, bao gi� n c蕄 10 l筰 n t譵 ta!")
		end
	end		-- 不是金系的就不再多说话了。
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(103,51)		  			--设置重生点
	nt_setTask(7,10*256)				-- 直接入门
	SetFaction("shaolin")       			--玩家加入门派
	SetCamp(1)
	SetCurCamp(1)
	SetRank(1)
	nt_setTask(137,67)
	SetLastFactionNumber(0)
-- 直接处理流程
--	nt_setTask(7,80*256)
--	SetRank(72)
--	Msg2Player("欢迎你加入少林派，测试中直接学会本门所有技能。")
	add_sl(10)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
	Msg2Player("Hoan ngh猲h b筺 gia nh藀 Thi誹 L﹎, tr� th祅h T秓 мa t╪g! H鋍 頲 H祅g Long B蕋 V�, Kim Cang Ph鬰 Ma ")
	AddNote("Gia Nh藀 Thi誹 L﹎ ph竔, tr� th祅h T秓 мa t╪g.")
	Msg2Faction("shaolin",GetName().."t� h玬 nay gia nh藀 Thi誹 l﹎, xin b竔 ki課 c竎 v� huynh ! Mong c竎 v� quan t﹎ ch� gi竜!",GetName())
	--NewWorld(103, 1845, 2983)			--把玩家传送到门派入口

end;

function return_yes()
	NewWorld(103, 1845, 2983)			--把玩家传送到门派入口
end;

function sl_check_yes()			-- 按技能确定任务变量的检查。。。尚未相应更新
	if (GetSeries() ~= 2) then
		Talk(1,"","Ng� h祅h c馻 ngi kh竎 h� Kim v韎 b鋘 ta!  дn y l祄 g�? H穣 l猲 di詎 n h鋍 h醝 甶!")
	elseif (HaveMagic(91) >= 0) then		-- 做完了50级任务,佛光普照
		nt_setTask(1,60*256)
		Talk(1,"","Ta  ph鬰 h錳 l筰 tr筺g th竔 nhi謒 v� c馻 ngi! B﹜ gi� ngi c� th� 甶 nh薾 nhi謒 v� xu蕋 s� ")
	elseif (HaveMagic(88) >= 0) then		-- 做完了40级任务,不灭不绝
		nt_setTask(1,50*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 40.")
	elseif (HaveMagic(85) >= 0) then		-- 做完了30级任务,一叶知秋
		nt_setTask(1,40*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 30.")
	elseif (HaveMagic(82) >= 0) then		-- 做完了20级任务,四象同归
		nt_setTask(1,30*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 20.")
	elseif (HaveMagic(77) >= 0) then		-- 做完了10级任务,峨眉剑法
		nt_setTask(1,20*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 10.")
	else
		nt_setTask(1,10*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  c� th� nh薾 nhi謒 v� c蕄 10.")
	end
end;

function em_check_no()
	Say("S� ! S� ph� l筰 ph竔  xu鑞g n骾 �?",2,"V﹏g! Nh� s� huynh a  v� n骾!/return_yes","Xin thay ta v蕁 an s� ph� /no")
end

function Uworld1000_jiaoyushaolin()
	nt_setTask(1000,260)
	Msg2Player("е t� ti誴 d蒼 Thi誹 L﹎ b秓 b筺  l�  t� c馻 m玭 ph竔, c� th� tr鵦 ti誴 甶 g苝 Long Ng� n鉯 chuy謓.")
end

function no()
end;
