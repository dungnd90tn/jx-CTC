Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Phuong tuong - Cong thanh chien bat dau");
	-- 星期四
	TaskInterval(1440);
	
	-- 20点00分开战
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 凤翔编号为1,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(1,4) == 1) then
			StartCityWar(1);
		end;
	else
		cw_start_fun(4,1)	--4代表周4,1代表cw_CanStart(1,4)
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
