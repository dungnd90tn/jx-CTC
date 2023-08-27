--description: 中原北区 汴京府 路人12孙秀才对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),2)
		if (UTask_trsub60 == 0) then 
			DelItem(128)			--处理重接任务后，玩家捡起任务道具的情况
			AddNote("T筰 c鯽 B綾 th祅h Bi謓 Kinh, ng錳 t竛 g蓇, 畂竛 ch� v韎 T玭 T� T礽 ")
			L60_sub2_Q1()
		elseif (UTask_trsub60 == 2) then
			L60_sub2_Q1()
		elseif (UTask_trsub60 == 3) then
			L60_sub2_Q2()
		elseif (UTask_trsub60 == 4) then 
			L60_sub2_Q3()
		elseif (UTask_trsub60 == 5) then 
			L60_sub2_Q4()
		elseif (UTask_trsub60 == 6) then 
			L60_sub2_Q5()
		elseif (UTask_trsub60 == 10) and (HaveItem(128) == 0) then		-- 道具丢失
			AddEventItem(128)
			Talk(1,"","T筰 h� r蕋 b竔 ph鬰 s� th玭g minh c馻 c竎 h�, xin h穣 nh薾 thanh ki誱 n祔, ng t� ch鑙! ")
		else
			Talk(1,"","B竔 ph鬰, b竔 ph鬰!")
		end
	else
		i = random(0,3)
		if (i == 0) then
			Talk(1,"","Qu鑓 ph� s琻 h� t筰, th祅h xu﹏ th秓 m閏 th﹎. C秏 th阨 hoa ti詎 l�, t譶h bi謙 甶觰 kinh t﹎.  th藅 ng thng!         ")
		elseif (i == 1) then
			Talk(1,"","Y課 long h祅 th駓 nguy謙 long sa; D� b筩 t蕌 chu萵 c薾 t鰑 gia; Thng n� b蕋 tri vong qu鑓 h薾; C竎h giang 璾 xng h藆 nh hoa. 蕐! Th藅 ng thng! Цng thng! ")
		elseif (i == 2) then
			Talk(1,"","T莕 Th阨 Minh Nguy謙 H竛 Th阨 Quan, V筺 L� Trng Chinh Nh﹏ V� Ho祅. Фm S� Long Th祅h Phi Tng T筰, B蕋 Gi竜 H� M� ч  S琻!Chao 玦! Th藅 ng thng! ")
		else
			Talk(1,"","Y課 li評 h鋋 ki襲, phong li猲 th髖 m�, tham sai th藀 v筺 nh﹏ gia, tr鋘g h� 甶謕 甶謕 thanh giai, h鱱 tam thu qu� t�, t藀 l� h� hoaChao 玦! Цng h薾! Цng h薾!....N誹 nh� kh玭g ph秈 l� v� b礽 th� n祔 th� c� l� Kim qu鑓 c騨g  kh玭g kh雐 bin")
		end
	end
end

function L60_sub2_Q1()
	Say("Ti觰 sinh c� m蕐 ch� n祔. Trong m閠 l骳 b鑙 r鑙 ch璦 th� 畂竛 ra, kh玭g bi誸 ngi c� th� 畂竛 頲 kh玭g. 'S祅g ti襫 minh nguy謙 quang'l� ch� g�? ", 3, "Ho秐g /no1", "Kho竛g /L60_sub2_Q2", "Фm /no1")
end;

function no1()
	SetTask(28, SetByte(GetTask(28),2,2))
	Talk(1,"","Ch� th� nh蕋 ngi an ch璦 ra �?")
end;

function L60_sub2_Q2()
	Say("鮩! C遪 ch� th� hai: 'H鱱 cc kho竔 nh� phong, 甶觤 h醓 h鱱 thanh ﹎, gia th駓 tr� thi誸 th祅h, trng th秓 hoa tng ph鉵g'l� ch� g� v藋? ", 3, "Thng /no2", "Lu﹏ /no2", "Bao /L60_sub2_Q3")
end;

function no2()
	SetTask(28, SetByte(GetTask(28),2,3))
	Talk(1,"","Phi d� phi d�! ")
end;

function L60_sub2_Q3()
	Say("Л頲 r錳! C遪 ch� th� 3: 'B蕋 ch輓h ch� vi v穘 ti誸 khu蕋' l� ch� g� v藋?", 3, "c竔 /L60_sub2_Q4", "Oai /no3", "Th蕋 /no3")
end;

function no3()
	SetTask(28, SetByte(GetTask(28),2,4))
	Talk(1,"","Ta th蕐 kh玭g ph秈 v藋!")
end;

function L60_sub2_Q4()
	Say("Th� ch� th� 4: '觤 甶觤 hu鷑h h醓 chi誹 giang bi猲' l� ch� g� v藋?", 3, "Tr鋍 /no4", "m /L60_sub2_Q5", "N穘g /no4")
end;

function no4()
	SetTask(28, SetByte(GetTask(28),2,5))
	Talk(1,"","H譶h nh� kh玭g ng ph秈 kh玭g?")
end;

function L60_sub2_Q5()
	Say("Ch� cu鑙 m韎 l� kh� 畂竛 nh蕋! 'ёnh ti襫 nguy謙 i 竛h, 秐h h� nh筺 tr薾 nh蕋 h祅g'", 3, "Li謚 /L60_sub2_prise", "Li謚 /no5", "g /no5")
end;

function no5()
	SetTask(28, SetByte(GetTask(28),2,6))
	Talk(1,"","Chao 玦! Cu鑙 c飊g c騨g ch糿g xong! ")
end;

function L60_sub2_prise()
	Talk(1,"","B閕 ph鬰! Ti觰 sinh r蕋 vui 頲 k誸 b筺 v韎 ngi, T� ph� c馻 ti觰 sinh v鑞 l� nh� v�, n i ti觰 sinh th� b� v� theo v╪. Nh璶g ch� l� m閠 th� sinh v� d鬾g th玦. T� ph� c馻 ti觰 sinh c� truy襫 l筰 c﹜ 畂秐 ki誱 n祔, nh璶g m� i v韎 ti觰 s")
	AddEventItem(128)
	SetTask(28, SetByte(GetTask(28),2,10))
	AddNote("竛 ng t蕋 c� nh鱪g c﹗  c馻 t玭 t� t礽, 頲 t苙g cho c﹜ 產o 秐 Th駓 ")
	Msg2Player("Nh薾 頲 c﹜ 產o 秐 Th駓 ")
end;
