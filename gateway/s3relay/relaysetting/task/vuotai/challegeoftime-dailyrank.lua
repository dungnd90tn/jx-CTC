

function TaskShedule()
	--设置方案名称
	TaskName(" ho箃 ng x誴 h筺g <Th竎h th鴆 th阨 gian> m鏸 ng祔")
	
	TaskTime(0, 0);
	
	--设置间隔时间，单位为分钟
	TaskInterval(1440) --30分钟一次
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg("=====> BANG XEP HANG <THACH THUC THOI GIAN> MOI NGAY=======");
end

function TaskContent()
	name , value = Ladder_GetLadderInfo(10235, 1);
	value = value * (-1);
	if (name ~= "") then
		local szTime	= format("%s ph髏 %s gi﹜", floor(value/60), floor(mod(value, 60)));
		local szMsg 	= format("Ch骳 m鮪g <%s>  ho祅 th祅h <Th竎h th鴆 th阨 gian> th阨 gian vt 秈 nhanh nh蕋 l� <%s>", name, szTime);
		GlobalExecute(format("dw AddGlobalNews([[%s]], 10)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	end
	Ladder_ClearLadder(10235);
	OutputMsg("=====> Bang Xep Hang Vuot Ai Moi Ngay 00:00 Bat Dau==================");
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


