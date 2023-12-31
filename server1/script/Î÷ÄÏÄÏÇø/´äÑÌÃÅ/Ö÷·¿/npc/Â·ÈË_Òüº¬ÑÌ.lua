-- 翠烟门 掌门尹含烟 10级任务、50级任务、出师任务、重返师门任务
-- by：Dan_Deng(2003-07-25)
-- Update: Dan_Deng(2003-09-24)重新设计重返门派与镇派绝学相关
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\item\\skillbook.lua")

function main()
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 5) then
		Describe("T譵 ta c� vi謈 g�?", 2,
			"H鋍 k� n╪g c蕄 120./lvl120skill_learn",
			"Mu鑞 th豱h gi竜 vi謈 kh竎/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_cy = GetTask(6)
	local nFactID = GetLastFactionNumber();

	if (UTask_cy == 70*256) and (GetFaction() == "cuiyan") then			-- 回师错误修正
		SetFaction("")
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_cy == 70*256) and (GetTask(1) >= 5*256) and (GetTask(1) < 10*256) then		-- 以前接过入门任务的
		SetTask(1,0)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_cy == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(6,70*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (GetTask(1) == 70*256) and (GetTask(6) == 70*256) then			-- 转门派错误修正
		SetTask(1,75*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_cy == 80*256 and nFactID == 5 and GetCamp() == 3 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("cuiyan");
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	elseif (UTask_cy == 70*256 and nFactID == 5 and GetCamp() ~= 4 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	end

	local tbDes = {"Цi ngh� u s�/#daiyitoushi_main(5)", "Mu鑞 th豱h gi竜 vi謈 kh竎/common_talk"};
	
	Say("G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_cy = GetTask(6)
	local Uworld51 = GetTask(51)
	local Uworld126 = GetTask(126)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),6) == 0) then				-- 世界任务：武林向背
		Talk(1,"","чc C� minh ch�  c� l謓h, ta u d竚 kh玭g tu﹏! Nh璶g b鎛 m玭 ch� to祅 l� n� nhi y誹 畊鑙 ch� s� vi謈 kh玭g th祅h, xin h錳 b竜 l筰 v韎 чc C� minh ch� l� b鎛 m玭 nh蕋 nh s� 駈g h� c竎 v� anh h飊g, ch骳 c竎 v� k� khai c th緉g!")
		Uworld40 = SetBit(GetTask(40),6,1)
		SetTask(40,Uworld40)
	elseif (Uworld51 == 10) then			-- 洗清冤屈任务进行中
		Talk(5,"Uworld51_20","Л阯g Nh蕋 Tr莕 b秓 ta 甧m kh萿 t輓, cha 玭g ta kh玭g bi誸 v� sao t nhi猲 ph秐 i h玭 s� c馻 2 ngi, h玭 s� c� ch髏 kh� kh╪, nh璶g c� ng qu� lo l緉g.","Nh蕋 Tr莕� ","...ng kh鉩 n鱝! S� vi謈 kh玭g nh蕋 nh nh� v藋 u, ch� c莕 ch髇g ta th藅 t﹎ th� nh蕋 nh s� xoay chuy觧 頲 t譶h th�.","Ta kh玭g kh鉩! Ta ch� l� t鴆 gi薾 ta v� Nh蕋 Tr莕  tr秈 qua nhi襲 gian kh� nh� v藋 cu鑙 c飊g c騨g n 頲 v韎 nhau, t筰 sao ngi nh� huynh 蕐 l筰 ph秐 i?","Kh玭g ph秈 nh� v藋! Л阯g Nh蕋 Tr莕 r蕋 y猽 c�, nh蕋 nh s� kh玭g ng nh譶, ta nh蕋 nh s� h醝 huynh 蕐 cho r� ng鋘 ng祅h.")
	elseif (Uworld51 == 100) then			-- 洗清冤屈任务完成
		Talk(3,"Uworld51_prise"," Th� ra v藋! Ngi v� Nh蕋 Tr莕 v� ta m� kh� s� b蕐 l﹗, kh玭g bi誸 l蕐 g� b竜 p, xin h穣 nh薾 l蕐!","Зy l� c竔 g�?","C竔 n祔 l� ti猲 s�  l筰 cho ta, c� th� th� g﹏ ho箃 m筩h, c� hi謚 qu� t╪g c玭g l鵦 nh蕋 th阨!")
	elseif (GetSeries() == 2) and (GetFaction() == "cuiyan") then		-- 任务相关以及门派对话
		if (UTask_cy == 10*256+10) and (HaveItem(0) == 1) then		-- 10级任务完成
			Talk(2,"L10_prise","Chng m玭,  t�  gi髉 ngi t譵 l筰 Th髖 V� Tr﹎  m蕋! ","T鑤 qu�! Ngi  t譵 l筰 頲 r錳.")
		elseif (UTask_cy == 10*256) and (GetLevel() >= 10) then		--10级任务启动
			Say("Th藅 產u l遪g! H玬 qua khi 甶 d筼 � khu r鮪g nh� ph輆 Йng Nam  nh r琲 c﹜ Th髖 V� tr﹎ m� ta y猽 qu� nh蕋!",2,"Ta gi髉 ngi t譵 l筰 /L10_get_yes","Gi� v� nh� kh玭g nghe/no")
		elseif (UTask_cy == 50*256+50) then		--完成50级任务
			Talk(1,"L50_prise","е t�  l祄 tr遪 s� m謓h  gi髉 S飊g Th竛h T� t譵 v� 頲 V� уng Quan . Phng trng i s� nh�  t� chuy觧 l阨 c秏 琻 n S� ph�.")
		elseif (UTask_cy == 50*256) and (GetLevel() >= 50) then			--50级任务启动
			Say("Phng trng H� Vi猲 � S飊g Th竛h T� Чi L� l� b筺 th﹏ c馻 ta. Phng trng m韎 ph竔 ngi n n鉯 c� m閠 b鋘 tr閙 n l蕐 甶 V� уng Quan  m閠 trong nh鱪g 'S飊g Th竛h Ng� B秓', b� ph竧 hi謓  ch箉 v祇 Thi猲 T莔 Th竝. T猲 tr閙 v� c玭g r蕋 cao cng, c竎 t╪g kh玭g ai ch n鎖, n猲 ph竔 ngi n c莡 c鴘 b鎛 m玭, ngi c� ng � n S飊g Th竛h T� gi髉  b総 t猲 tr閙 kh玭g?",2,"Kh玭g v蕁 , ta s� 甶 n S飊g Th竛h t� /L50_get_yes","V� c玭g  t� th蕄 h蘮 e r籲g kh玭g l祄 頲 /no")
		elseif (UTask_cy == 60*256+30) then							--出师任务完成
			L60_prise()
		elseif (UTask_cy == 80*256) then						-- 重返后的自由出入
			check_skill()
		elseif (UTask_cy >10*256) and (UTask_cy < 20*256) then		-- 10级任务中
			Talk(1,"","Ch璦 t譵 頲 Th髖 V� Tr﹎ sao?")
		elseif (UTask_cy > 50*256) and (UTask_cy < 60*256) then		-- 50级任务中
			Talk(1,"","B総 頲 b鋘 tr閙 ch璦?")
		elseif (UTask_cy >= 60*256) then		-- 完成50级任务后的常规对话
			Talk(1,"","Chuy謓 c馻 S飊g Th竛h T� ngi quy誸 nh r蕋 ng, trc y kh玭g l﹗ Phng trng H� Vi猲 c� n th╩ v� c� h醝 th╩ n ngi.")
		else		-- 门派内其它状态下常规对话
			Talk(1,"","V� c玭g c馻 ngi ti課 b� r蕋 nhanh, nh璶g c騨g ng v� th� m� t� m穘, c莕 ph秈 t藀 luy謓 nhi襲 m韎 c� th� th祅h c玭g.")
		end
	elseif (Uworld126 == 20) then			-- 90级技能任务
		Talk(5,"Uworld126_talk","Do穘 c� nng!","C竎 h� c� chuy謓 g�?","T筰 h� nh薾 l阨 nh� 頲 s� nh� v� c馻 c玭g t� 祅 T� Th祄h, mu鑞 t竎 h頿 hai ngi l筰, nh璶g L� c� nng qu� c� ch蕄."," ! Thu Th駓 qu� c� ch蕄. N╩  祅 c玭g t� l� m閠 nh﹏ t礽, i v韎 c� ta th藅 l遪g th藅 �, ng ti誧 trong gia nh c玭g t� l筰 l� c t玭, l祄 sao c� th� gia nh藀 v祇 Thu� Y猲 m玭 頲 ch�. дn nay mu鑞 quay tr� l筰 v韎 nhau th� th藅 l� kh�, ta khuy猲 kh玭g 頲 c� nng 蕐, hy v鋘g ngi s� t譵 ra 頲 c竎h.","Th� ra l� th�! T筰 h� s� c� g緉g.")
	elseif (Uworld126 == 80) and (GetFaction() ~= "cuiyan") then
		Talk(5,"Uworld126_finish"," Do穘 c� nng! S� vi謈 th祅h c玭g r錳! ","�?","S� vi謈 l� nh� v莥� nh� v莥� ","T猲 n祔 thi謙 l�! Nh璶g h�  g苝 nhau, duy猲 ph薾 ch綾 c騨g s� quay v�, th藅 kh玭g bi誸 ph秈 c竚 琻 ngi nh� th� n祇.","T筰 h� ngh� 頲 l祄 b筺 v韎 c竎 c� nng  r蕋 sung sng r錳, h� t蕋 ph秈 c秏 t�.")
	elseif (Uworld126 > 20) and (Uworld126 < 70) then
		Talk(1,"","Ti觰 L� t輓h t譶h c� ch蕄, c� 蕐 kh玭g ch辵 頲 nh鱪g chuy謓 c馻 b鎛 m玭, c� 蕐 cho r籲g kh玭g c� vi謈 g� t鑤 p c�, n猲 ph秈 l祄 phi襫 c竎 h� r錳.")
--	elseif (UTask_cy == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","尹含烟：你天赋过人，相信很快就能成为本门栋梁了，不必在意现在暂时失去武功。你先去与本门各位姐妹熟悉一下，让我们所有人都快快乐乐地生活吧。")
	elseif (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_cy == 70*256) and ((GetTask(1) < 5*256) or (GetTask(1) == 75*256)) then		-- 重返师门任务
		Talk(2,"return_sele","C� l阨 n r籲g g莕 y ngi gi誸 kh玭g 輙 b鋘 cng o, n猲 r蕋 c� ti課g t╩ trong giang h�.","Nh璶g ta v蒼 nh� c竔 kh玭g kh� 蕀 竝 trong m玭 ph竔. Th璦 s� ph� ta c� th� quay v� Th髖 Y猲 m玭 頲 kh玭g?")
	elseif (GetCamp() == 4) and ((UTask_cy == 70*256+10) or (UTask_cy == 70*256+20)) then		-- 重返师门任务中
		Say("Х chu萵 b� xong 5 v筺 lng ch璦?",2,"Х chu萵 b� xong/return_complete","V蒼 ch璦 chu萵 b� xong/return_uncompleted")
--	elseif (GetTask(1) == 70*256+10) and (HaveMagic(111) >= 0) then		-- 峨嵋派重返门派，收回碧海潮生
--		Say("尹含烟：韶光一去不再来，你真的执意要遁入空门？",2,"红尘实无可眷恋，请掌门让我去吧/defection_yes","我再考虑考虑/no")
	else
		Talk(1,"","N誹 b鎛 m玭 v� Л阯g m玭 li猲 minh 琻g nhi猲 l� t鑤, ch� l�. ")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(114) == -1) then
--		AddMagic(114)					-- 冰骨雪心
--		Msg2Player("你学会了“冰骨雪心”")
--		Say("尹含烟：为师这次闭关苦思数日，新创了一招“冰骨雪心”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("L筰 nh� th� gi韎 b猲 ngo礽 sao?",2,"Ph秈, xin chng m玭 ﹏ chu萵 /goff_yes","Kh玭g, ta t� th蕐 c玭g phut藀 luy謓 v蒼 ch璦 . /no")
--	end
end
--------------------- 转门派相关 ------------------------
function defection_complete()
	Msg2Player("Hoan ngh猲h ngi gia nh藀 Th髖 Y猲 m玭, tr� th祅h Hoa T� ")
	SetRevPos(154,61)		  				-- 重生点
	SetTask(6,10*256)						-- 入门
	SetFaction("cuiyan")      			--玩家加入门派
	SetCamp(3)
	SetCurCamp(3)
	SetRank(31)
	AddMagic(99)
	Msg2Player("H鋍 頲 Phong Hoa Tuy誸 Nguy謙 ")
	AddNote("Gia nh藀 Th髖 Y猲 m玭, tr� th祅h Hoa T�, h鋍 頲 Phong Hoa Tuy誸 Nguy謙 ")
	Msg2Faction("cuiyan",GetName().." t� Nga Mi n gia nh藀 Th髖 Y猲 m玭. L鵦 lng b鎛 ph竔  m筺h l筰 c祅g m筺h!",GetName())
end

-------------------------- 重返门派相关 ------------------------
function goff_yes()
	Talk(1,"","C� m閠 s� vi謈, cu鑙 ch� c� b秐 th﹏ ta tr穒 qua m韎 hi觰 r�. Ngi 甶  c� kinh nghi謒 c騨g t鑤.")
	SetCamp(4)
	SetCurCamp(4)
	SetTask(6,70*256)
	SetFaction("")
	AddNote("R阨 kh醝 Th髖 Y猲 m玭, l筰 m閠 l莕 n鱝 ra giang h�. ")
	Msg2Player("R阨 kh醝 Th髖 Y猲 m玭, l筰 m閠 l莕 n鱝 ra giang h�. ")
end

function return_sele()
	Say("Л琻g nhi猲 l� 頲! B鎛 m玭 kh玭g c� ng﹏ kh� c� nh, ngi ch� c莕 5 n╩ v筺 lng b筩 th� c� th� tr� v� m玭 ph竔.",2,"Th� th� t鑤 qu�! /return_yes","в ta 甶 l蕐 ti襫, r錳 sau  s� n鉯 ti誴. /return_no")
end;

function return_yes()
	Talk(1,"","Л頲! е t� 甶 l蕐 5 v筺 lng! ")
	SetTask(6,70*256+20)
	AddNote("G鉷 50000 lng b筩 cho Th髖 Y猲 m玭 th� c� th� quay v� m玭 ph竔. ")
	Msg2Player("G鉷 50000 lng b筩 cho Th髖 Y猲 m玭 th� c� th� quay v� m玭 ph竔. ")
end;

function return_no()
	Talk(1,"","5 v筺 lng kh玭g ph秈 l� 輙, ngi h穣 ngh� k� 甶.")
end;

function return_complete()
	if (GetCash() >= 50000) then
		Talk(1,"","Л頲! 5 v筺 lng  nh薾 . Ta phong ngi l� Hoa Th莕 c馻 b鎛 ph竔, ng th阨 truy襫 cho ngi h鋍 v� c玭g tuy謙 k� b鎛 m玭 ' B輈h H秈 Tri襲 Sinh', hi v鋘g ngi c� th� ti誴 t鬰 n� l鵦.")
		Pay(50000)
		SetTask(6,80*256)
		SetFaction("cuiyan")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(67)
--		if (HaveMagic(114) == -1) then
--			AddMagic(108)
--			AddMagic(111)
--			AddMagic(114)
		add_cy(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("Ngi h鋍 頲 tuy謙 k� tr蕁 ph竔 c馻 Th髖 Y猲 M玭 l� B╪g C鑤 Tuy誸 T﹎, v� c玭g M鬰 D� L璾 Tinh, B輈h H秈 Tri襲 Sinh ")
--		end
		Msg2Player(GetName().."<#>Quay l筰 Th髖 Y猲 m玭, 頲 phong l� Hoa Th莕 ")
		AddNote("Х quay v� Th髖 Y猲 m玭, ng trong h祅g ng�. ")
	else
		Talk(1,"","Ng﹏ lng ngi mang h譶h nh� kh玭g , kh秓 nghi謒 l筰 xem.")
	end
end;

---------------------- 门派任务 ---------------------------
function L10_get_yes()
	Talk(2,"","Hi誱 th蕐 ngi c� l遪g nh� th� n祔, v藋 th� l祄 phi襫 ngi.","S� ph� qu� kh竎h s竜 r錳!")
	SetTask(6,10*256+10)
	AddNote("Ti誴 nh薾 nhi謒 v� c蕄 10: дn khu r鮪g nh� � ph輆 ng nam t譵 Th髖 V� tr﹎ ")
	Msg2Player("Ti誴 nh薾 nhi謒 v� c蕄 10: дn khu r鮪g nh� � ph輆 ng nam t譵 Th髖 V� tr﹎ ")
end;

function L10_prise()
	Talk(1,"","Л頲 r錳! Ngi th藅 c� t礽! Ta s� th╪g cho ngi l猲  t� 10 c蕄.")
	DelItem(0)
	SetTask(6,20*256)
	SetRank(32)
--	AddMagic(95)
--	AddMagic(97)
	add_cy(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("Giao Th髖 V� tr﹎, quay v� Do穘 H祄 Y猲 ph鬰 m謓h, ho祅 th祅h nhi謒 v� t譵 tr﹎. Tr� th祅h Tam Ph萴 Hoa S� ")
	Msg2Player("Ch骳 m鮪g b筺  頲 phong th祅h Tam Ph萴 Hoa S� c馻 Th髖 Y猲 m玭, h鋍 頲 v� c玭g Th髖 Y猲 產o ph竝, Th髖 Y猲 song 產o. ")
end;

function L50_get_yes()
	Talk(1,"","M鋓 vi謈 ph秈 c萵 th薾.")
	SetTask(6,50*256+10)
	AddNote("Ti誴 nh薾 nhi謒 v� c蕄 50: V� H� Vi猲 phng trng c馻 S飊g Th竛h T� 畂箃 l筰 V� уng Quan  ")
	Msg2Player("Ti誴 nh薾 nhi謒 v� c蕄 50: V� H� Vi猲 phng trng c馻 S飊g Th竛h T� 畂箃 l筰 V� уng Quan  ")
end;

function L50_prise()
	Talk(1,"","R蕋 t鑤! Ngi qu� tr� d騨g song to祅,  l祄 kh玭g 輙 chuy謓 cho B鎛 m玭, th藅 kh玭g h� danh l� tr� c閠 c馻 b鎛 m玭! ")
	SetTask(6,60*256)
	SetRank(36)
--	AddMagic(109)
	add_cy(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! Х 頲 phong l� Hoa Tinh! H鋍 頲 v� c玭g Tuy誸 秐h ")
	AddNote("箃 l筰 V� уng Quan , ho祅 th祅h nhi謒 v� c蕄 50, 頲 phong l� Hoa Tinh ")
end;

function L60_prise()
	Msg2Player("B筺 giao th� cho Do穘 H祄 Y猲, v� k� l筰 to祅 b� s� vi謈 cho n祅g nghe. ")
	Talk(2,"","L莕 n祔 ngi  gi髉 gi秈 quy誸 chuy謓 B鎛 m玭, l藀 頲 i c玭g. Ch骳 m鮪g ngi! Ngi c� th� xu蕋 s�! "," t� Chng m玭! ")
	SetTask(6,70*256)
	SetRank(35)
	SetFaction("") 		   					--退出门派
	SetCamp(4)
	SetCurCamp(4)
	DelItem(235)
	AddNote("B筺 giao th� cho Do穘 H祄 Y猲, v� k� l筰 to祅 b� s� vi謈 cho n祅g nghe, ho祅 th祅h nhi謒 v� x蕋 s�, 頲 phong l� Hoa Ti猲 ")
	Msg2Player("Ch骳 m鮪g b筺 頲 l祄 Hoa Ti猲, ngi  c� th� xu蕋 s� ")
end;

----------------------- 世界任务 --------------------------
function Uworld51_20()
	SetTask(51,20)
	Msg2Player("襲 tra Л阯g Nh蕋 Tr莕 r鑤 cu閏  x秠 ra chuy謓 g�, c� c竎h g� quay tr� v� kh玭g? ")
end

function Uworld51_prise()
	SetTask(51,255)
	AddMagicPoint(1)
	Task86_2 = GetByte(GetTask(86),2) + 1
	if (Task86_2 > 255) then Task86_2 = 255 end
	Task86 = SetByte(GetTask(86),2,Task86_2)
	SetTask(86,Task86)			-- 记录任务得技能点总数
	Msg2Player("Do穘 H祄 Y猲 v� mu鑞 b竜 p m�  l蕐 Kim n c馻 s� ph� 甧m t苙g cho ngi. C玭g phu c馻 ngi  t╪g l猲 th猰 1 甶觤 ")
	Msg2Player("Ho祅 th祅h nhi謒 v� r鯽 s筩h n鏸 oan ")
	AddNote("Ho祅 th祅h nhi謒 v� r鯽 s筩h n鏸 oan ")
end

function no()
end;

function Uworld126_talk()
	SetTask(126,30)
	Msg2Player("Do穘 H祄 Y猲 c騨g kh玭g c� c竎h n祇 t鑤 h琻. B筺 quy誸 nh quay v� g苝 l筰 L� Thu Th駓 ")
	AddNote("Do穘 H祄 Y猲 c騨g kh玭g c� c竎h n祇 t鑤 h琻. B筺 quy誸 nh quay v� g苝 l筰 L� Thu Th駓 ")
end

function Uworld126_finish()
	if (GetTask(6) >= 70*256) and (GetTask(6) ~= 75*256) then
		Talk(3,"","H祅h t萿 giang h� thng g苝 nhi襲 nguy hi觤, � y H祄 Y猲 c� quy觧 b� k輕 c馻 Th髖 Y猲 c� th� gi髉 輈h cho ngi. ","Th藅 ng筰 qu�!","Giang h� nhi n� kh玭g n猲 c﹗ n�, h穣 nh薾 l蕐 甶!")
		if (HaveMagic(336) == -1) then		-- 必须没有技能的才给技能
			AddMagic(336,1)
		end
		if (HaveMagic(337) == -1) then		-- 必须没有技能的才给技能
			AddMagic(337,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("H鋍 xong v� c玭g B╪g tung V� 秐h, B╪g T﹎ ti猲 t� c馻 Th髖 Y猲. ")
		SetTask(126,255)
	else
	   Talk(2,"","C鴘 ngi kh玭g c莕 tr� 琻, ng l� ngh躠 hi謕! ","Do穘 s� ph�  qu� khen!")
	   SetTask(126,245)								--获得声望的设置变量245
	end
	add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
	AddRepute(add_repute)
	Msg2Player("<#>Х x鉧 b� ﹏ o竛 gi鱝 L� Thu Th駓 v� 祅 T� Th祅h, nhi謒 v� ho祅 th祅h. Danh ti課g c馻 ngi  頲 t╪g l猲 "..add_repute.."<#>甶觤.")
	AddNote("Х xo� b� ﹏ o竛 gi鱝 L� Thu Th駓 v� 祅 T� Th祅h. Nhi謒 v� ho祅 th祅h. ")
end
