Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Thanh Do - Loi Dai cuoc so tai bat dau");
	TaskSetMode(1);
	
	-- 2005年1月3号(星期一)第一次开始
	TaskSetStartDay(1, 3);

	-- 一周一个循环
	TaskInterval(7);
	
	-- 20点00分开赛
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 成都编号为2,必须跟citywar.ini中指定的一致
	if (cw_CanStart(2,3) == 1) then
		StartArena(2);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
