--description: 中原北区 汴京府 路人3小海对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),3)
		if (UTask_trsub60 == 2) then 
			Talk(2, "", "Ti觰 H秈 ngoan! Mau v� nh� 甶, m� ngi 產ng lo l緉g cho ngi y! ", "�! Ngi n鉯 v韎 m� ta, ta ch琲 th猰 m閠 ch髏 n鱝 r錳 v�! N鉯 b� 蕐 ng c� lo l緉g!")
			SetTask(28, SetByte(GetTask(28),3,4))
			AddNote("T譵 頲 Ti觰 H秈 trong Qu穘g trng trong th祅h. Khuy猲 c藆 ta 甶 v� nh� ")
			Msg2Player("T譵 頲 Ti觰 H秈 trong Qu穘g trng trong th祅h. Khuy猲 c藆 ta 甶 v� nh� ")
		elseif (UTask_trsub60 >= 4) then 
			Talk(1,"","Ta ch琲 th猰 ch髏 n鱝, r錳 s� v� nhanh th玦!")
		end
	else
		Talk(1,""," Ch竨 th輈h ╪ nh蕋 l� k裲 h� l� b竛 � ti謒 c馻 Л阯g l穙, nh璶g m� m� ta kh玭g cho ta mua. B秓 r籲g n誹 ╪ nhi襲 s� b� 產u b鬾g.")
	end
end;
