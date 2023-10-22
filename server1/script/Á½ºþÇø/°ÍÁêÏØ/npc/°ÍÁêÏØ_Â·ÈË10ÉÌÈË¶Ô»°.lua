--两湖区 巴陵县 路人10沈九对话
--巴陵县新手任务：阿芳的嫁妆
--suyu
-- Update: Dan_Deng(2003-08-10)
--注意：越南只有一种元宝，相当于我们的银元宝，名称叫金元宝，千万注意，编号用 343

function main()
	UTask_world20 = GetTask(48)
	if (CheckStoreBoxState(1) == 0 and  UTask_world20 == 1) then			-- 符合买箱子的条件，允许购买附加储物箱
		Say(11256,4,"Mua /buy_addibox", "Ta n l祄 nhi謒 v� A Phng/task_ring","T譵 hi觰/box_help", "Kh玭g mua/no")
	elseif (UTask_world20 == 1) then
		task_ring()
	elseif (CheckStoreBoxState(1) == 0) then
		Say(11256,3,"Mua/buy_addibox", "T譵 hi觰/box_help", "Kh玭g mua/no")
	else
		other_chat()
	end
end;

function task_ring()
	UTask_world20 = GetTask(48);
	if (UTask_world20 == 1) then
		Say("Mu鑞 mua gi飉 c� nng 蕐 c馻 h錳 m玭 �? H祅g h遖 c遪 l筰 c馻 ta kh玭g nhi襲, ch� c遪 l筰 i b玭g tai v祅g n祔 l� kh� r�, ch� c� 200 lng",2,"Mua/yes", "T竛 g蓇/other_chat","Kh玭g mua/no")
	end
end

function other_chat()
	Talk(3,"","Ta t� T� Xuy猲 n, tr猲 阯g c� r蕋 nhi襲 th� ph�,th藅 l� nguy hi觤!", "Th藅 kh玭g th� ng� 頲 ta c� th� n khu v鵦 h� чng ёnh n祔 m� kh玭g h� b� cp! Ngi th蕐 c� l� kh玭g?","ta nghe ngi ta n鉯 m韎 bi誸, � y kh玭g ch辵 s� qu秐 l� c馻 quan ph�, m� t� m閠 ph竔 t猲 Thi猲 Vng Bang g� , h蘮 g� � y th藅 y猲 b譶h!")
end

function yes()
	if(GetCash() >= 200)then
		Talk(1,"",11260)
		Pay(200);
		AddEventItem(181);
		AddNote("B筺 nh薾 頲 1 i khuy猲 tai...")
		Msg2Player("B筺 nh薾 頲 1 i khuy猲 tai.");
--		SetTask(48, 2);
	else
		Talk(1,"",11261)
	end
end;

function buy_addibox()
		local szMsg = 
		{
				"C竔 rng n祔 頲 l祄 t� san h� di bi觧 s﹗, c� th� ch鴄 nhi襲  c, h琻 n鱝 l� n琲 c蕋 gi�  an to祅. V� th� gi� c� h琲 t m閠 ch髏. M鏸 c竔 gi� <color=yellow>40 Ti襫 ng<color>.",	--1
				"D飊g 40 ti襫 ng  m� r閚g rng/#buy_addibox_yes(40)",	--2
				"D飊g 20 ti襫 ng  m� r閚g rng/#buy_addibox_yes(20)",	--3
				"K誸 th骳 i tho筰/no",			--4
		};
		
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		
		if (nDate >= 20080202 and nDate <= 20080302) then	--春节活动期间内
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		else
			--tinhpn 20100803: Patch Request
			Say(szMsg[1], 2, szMsg[2], szMsg[4]);
			--Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		end;
				
end

function buy_addibox_yes(nNedCount)
	if (nNedCount < 1 or nNedCount == nil) then
		print("Fail!!!!");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(4, 417, 1, 1)
	
	if (nCount < nNedCount) then
		Talk(1,"","Kh竎h quan ch璦  ti襫! Khi n祇 c�  ti襫 h穣 quay l筰. ")
		return 1;
	end
	ConsumeEquiproomItem(nNedCount, 4, 417, 1, 1)
	
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName()..format("]: 花费 %d 铜钱, 得到1个扩展箱.",nNedCount),-2,0,0,0);
	OpenStoreBox(1)
	
	UseSilver(1, 2, nNedCount); -- 金元宝兑换为铜钱的消耗统计(直接消耗的元宝银票，与铜钱兑换等同处理)
	SaveNow(); -- 立即存盘
	  	
	Talk(1,"","T鑤 qu�! я ti襫 r錳! Ta s� l藀 t鴆 l緋 t rng! V� sau kh竎h quan ch� c莕 n n琲 c� rng ch鴄  c馻 m譶h m� <color=yellow>rng m� r閚g<color> l� c� th� d飊g 頲. ")
	Msg2Player("M� r閚g rng th祅h c玭g!")
end


function box_help()
	str=
	{
	"<#>Rng m� r閚g co 60 � tr鑞g c� th� s� d鬾g ch鴄 c竎 v藅 ph萴 nh璶g kh玭g th� gi� ti襫!",
	"<#>B筺 c� th� thi誸 l藀 m� kh鉧 cho rng h祅h! Nh籱 b秓 v� c竎 t礽 s秐 c馻 b筺!",
	};
	Talk(2,"",str[1],str[2]);
end
	
	
function no()
end;
