--西南北区 成都府 路人16辛员外对话 峨嵋派40级任务
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)

function main(sel)
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+50) then 		
		UTask_emsub03 = GetByte(GetTask(29),3)
		if (UTask_emsub03 == 0) then 
			Say("T筰 h� b譶h sinh r蕋 th輈h k誸 giao b籲g h鱱 v韎 hi謕 kh竎h giang h�, c竎 b籲g h鱱 t苙g cho ta ngo筰 hi謚 l� 'Tr筰 M筺h Thng' qu� l� qu� khen. Nh璶g g莕 y c� ngi coi t筰 h� ch� l� h� danh, trong l遪g t筰 h� v� c飊g t鴆 gi薾. ", 2, "Xin h醝 /L40_V3_Q1", "Ta c遪 c� vi謈 kh竎. /no")
		elseif (UTask_emsub03 == 3) then 
			L40_V3_Q1()
		elseif (UTask_emsub03 == 5) then 
			L40_V3_Q2()
		elseif ((UTask_emsub03 == 10) and (HaveItem(168) == 0)) then
			AddEventItem(168)
			Talk(1,"","N� hi謕 ng kh竎h kh�, ngi 產ng c莕 thi誸 th� h穣 l蕐 甶")
		else
			Talk(1,"","C� th� k誸 giao b籲g h鱱 v韎 n� hi謕 nh� th� n祔 th� th藅 h筺g ph骳 cho T﹏ m�.")
		end
	else
		Talk(1,"","T筰 h� b譶h sinh r蕋 th輈h k誸 giao b籲g h鱱 v韎 hi謕 kh竎h giang h�, c竎 b籲g h鱱 t苙g cho ta ngo筰 hi謚 l� 'Tr筰 M筺h Thng' qu� l� qu� khen.")
	end
end;

function no()
	Talk(1,"","V藋 t筰 h� kh玭g l祄 phi襫 n鱝 hi謕 n鱝!")
end;

function L40_V3_Q1()
	Say("M筺h Thng Qu﹏ l� ngi nc n祇 nh�?", 4, "S� qu鑓 /f1", "T� qu鑓 /L40_V3_Q2", "Tri謚 qu鑓 /f1", "Ng魕 qu鑓 /f1")
end;

function f1()
	Talk(1,"","H譶h nh� l� kh玭g ph秈? L莕 trc ta c騨g n鉯 nh� th� n祔 b� ngi kh竎 ci. ")
	SetTask(29, SetByte(GetTask(29),3,3))
end;

function L40_V3_Q2()
	Say("Oa! Th� ra l� ngi nc T�. Th阨 Chi課 Qu鑓 c� 4 danh nh﹏: M筺h Thng Qu﹏, T輓 L╪g Vng v� B譶h Nguy猲 Qu﹏. C遪 m閠 ngi n鱝 l� ai nh�?", 4, "Long Dng Qu﹏ /f2", "T辬h Qu竎h Qu﹏ /f2", "Xu﹏ Th﹏ Qu﹏ /L40_V3_prise", "Thi誹 Nguy猲 Qu﹏ /f2")
end;

function f2()
	Talk(1,"","H譶h nh� kh玭g ng! Ta ch璦 nghe qua bao gi�!")
	SetTask(29, SetByte(GetTask(29),3,5))
end;

function L40_V3_prise()
	Talk(4, "select", "ng r錳! Sao ta l筰 kh玭g ngh� ra nh�? Nghe n鉯 n╩ x璦 nh� M筺h Thng Qu﹏ c� 3000 th鵦 kh竎h, ta tuy kh玭g c� kh� ph竎h nh� th�, nh璶g r蕋 th輈h k誸 giao b籲g h鱱 v韎 n� hi謕 nh� th� n祔! N� hi謕 c� c莕 ta gi髉  g� kh玭g?", "Ta 產ng t譵 B輈h T� Gi韎 Ch� ", "Sao kh玭g n鉯 s韒! Ta c� m閠 chi誧 B輈h T� Gi韎 Ch� y! T苙g cho n� hi謕!", " t� Vi猲 ngo筰! ")
end;

function select()
	AddEventItem(168)
	Msg2Player("T譵 頲 nh蒼 M� n穙 ")
	SetTask(29, SetByte(GetTask(29),3,10))
	AddNote("� ch� T﹏ vi猲 ngo筰 t筰 Th祅h Й t譵 頲 nh蒼 M� n穙. ")
end;
