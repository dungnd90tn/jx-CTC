-- special_horse.lua Ⅳ特殊㈨(80级㈨)的NPC脚本
-- By Dan_Deng(2003-11-10)

function main()
	UWorld97 = GetTask(97)
	if (UWorld97 == 10) then		-- 已经Ⅱ过
		Talk(1,"","Th萴 C﹗ : Ngi nh蕋 nh ph秈 th藅 t鑤 i i con ng鵤, m鏸 ng祔 c蕄 cho n� t緈, u b輓h b猲 trong mu鑞 s秏 thng tinh m苩......")
	elseif (UWorld97 == 1) and (IsTongMaster() == 1) then			-- 可以Ⅱ㈨
		Talk(4,"sele_color","Th萴 C﹗ : V� n祔 anh h飊g xin d鮪g bc.","Ngi ch琲 : Huynh i c� chuy謓 g� ? ","Th萴 C﹗ : T筰 h� Th萴 C﹗, hi謓 di c� m閠 th蕋 ng祅 d苖 lng c﹗ ra  cho, nh譶 v� n祔 anh h飊g kh� v� b蕋 ph祄, nh蕋 nh l� khai t玭g l藀 ph竔 ch i t玭g s�, t筰 h� ch BMW khi kh玭g c� nh鬰 kh玭g c� anh h飊g danh ti課. ","Ngi ch琲 : ta xem m閠 ch髏 ngi......") 
else 
Talk(1,"","Th萴 C﹗ : Thi猲 l� m� thng c�, m� b� nh筩 kh玭g thng c�. у h� ! kh玭g bi誸 sao !")
	end
end

function sele_color()
	Say("Th萴 C﹗ : Anh h飊g m阨 xem :",6,"Зy kh玭g ph秈 l� � V﹏ Чp Tuy誸 sao/buy_black","Зy kh玭g ph秈 l� X輈h Th� sao !/buy_red","Зy kh玭g ph秈 l� Tuy謙 ?nh sao !/buy_cyan","Зy kh玭g ph秈 l� лch L� sao!/buy_yellow","Зy kh玭g ph秈 l� Chi誹 D� Ng鋍 S� T� sao !/buy_white","Зy l� c竔 g� m�, th� cho th輓h h� m総 v鬾g v� kh玭g bi誸 . /buy_none")
end

function buy_black()
	the_buy(1)
end

function buy_red()
	the_buy(2)
end

function buy_cyan()
	the_buy(3)
end

function buy_yellow()
	the_buy(4)
end

function buy_white()
	the_buy(5)
end

function buy_none()
	Talk(1,"","Th萴 C﹗ : ng u m閠 bang , t玭g s� nh﹏ v藅 nh� th� n祇 kh玭g bi誸 nh� th� long c﹗ ? xin l鏸, xem ra t筰 h� l� nh薾 l莔 ngi .")
end

function the_buy(i)
	SetTaskTemp(49,i)
	Say("Th萴 C﹗ : Kh玭g t�, anh h飊g qu� nhi猲 nh薾 bi誸 ! T筰 h� v鑞 c騨g kh玭g b� 頲 v� v藋 b竛 n�, nh璶g l� hi謓 h� c莕 300 v筺 lng b筩 , nh譶 anh h飊g l� th藅 b� nh筩 , nh辬 產u c総 y猽 , ng緈 anh h飊g ng祅 v筺 h秓 sinh i x� t� t� v韎 n� . ",2,"Kh玭g th祅h v蕁 , ta nh蕋 nh s� kh玭g b筩 i n� /buy_yes","C竔 n祔 nh蕋 th阨 h錳 l﹗ 產ng l骳 l筰 l猲 kia 甶 tr� s� ti襫 kia y ? /buy_no")
end

function buy_yes()
	if (GetCash() >= 3000000) then
		i = GetTaskTemp(49)
		Pay(3000000)
		AddItem(0,10,5,i,0,0,0)
		SetTask(97,100+i)			-- 变量赋值，并且记住Ⅱ的是什么颜色㈨
		Talk(1,"","Th萴 C﹗ : Con ng鵤 nha con ng鵤, sau n祔 ngi theo v� n祔 anh h飊g, nh蕋 nh ph秈 ngoan ngo穘 nha.") 
else 
Talk(1,"","Ngi ch琲 : Ta tr猲 ngi b﹜ gi� ng﹏ lng mang ph秈 kh玭g , ngi th� i ch髏. ")
	end
end

function buy_no()
	Talk(1,"","Th萴 C﹗ : Th藅 ng l� mu鑞 m閠 v╪ ti襫 l祄 kh� anh h飊g h竛 sao ?")
end
