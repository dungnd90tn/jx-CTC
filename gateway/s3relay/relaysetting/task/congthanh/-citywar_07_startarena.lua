Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Lam An - Loi Dai Cuoc So Tai Bat Dau");
	TaskSetMode(1);
	
	-- 2005年1月1号(星期六)第一次开始
	TaskSetStartDay(1, 1);

	-- 一周一个循环
	TaskInterval(7);
	
	-- 20点00分开赛
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 临安编号为7,必须跟citywar.ini中指定的一致
	if (cw_CanStart(7,3) == 1) then
		StartArena(7);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
