Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Thanh Do - Cong Thanh Chien Bat dau");
	-- 星期二
	TaskInterval(1440);
	
	-- 20点00分开战
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 成都编号为2,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(2,4) == 1) then
			StartCityWar(2);
		end
	else
		cw_start_fun(2,2)	--4代表周4,1代表cw_CanStart(2,4)
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
