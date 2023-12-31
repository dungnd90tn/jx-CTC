-- 时间的挑战比赛定时器

INTERVAL_TIME = 60	-- 每小时触发
-- INTERVAL_TIME = 10	-- 每小时触发

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 0;
end

function TaskShedule()
	TaskName("Thach Thuc Thoi Gian");	

	-- 60分钟一次
	TaskInterval(INTERVAL_TIME);
	-- 设置触发时间
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("=====> VUOT AI KHIEU CHIEN THOI GIAN BAT DAU %d:%d...", h, m));
	-- 执行无限次
	TaskCountLimit(0);

	-- OutputMsg("启动自动滚动公告...");
end

function TaskContent()
	OutputMsg("VUOT AI KHIEU CHIEN THOI GIAN DANG GHI DANH");
	-- 触发GameServer上的脚本
	GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
	szMsg = "'Th竎h th鴆 th阨 gian' Х n gi� b竜 danh. чi trng nhanh ch﹏ n Nhi誴 Th� Tr莕  ghi danh th阨 gian ghi danh l� 10 ph髏."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
