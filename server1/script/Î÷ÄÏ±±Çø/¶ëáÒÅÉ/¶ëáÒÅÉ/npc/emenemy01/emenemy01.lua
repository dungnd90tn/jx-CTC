--description: 峨嵋派钻天坡敌人
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 70) and (HaveItem(17) == 0) and (random(0,100) < 40) then			--没有白玉如意时，40%概率
		AddEventItem(17)
		Msg2Player("Nh薾 頲 B筩h Ng鋍 Nh� �. ")
		AddNote("Цnh b筰 To祅 Thi猲 Ph�, nh薾 頲 B筩h Ng鋍 Nh� �. ")
	end
end;
