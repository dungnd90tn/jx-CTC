

function TaskShedule()
	--设置方案名称
	TaskName("HOA SON DAI CHIEN")
	local nStartHour = tonumber(date("%H")) + 1;
	
	if (nStartHour >= 24) then
		nStartHour = 0;
	end;
	
	TaskTime(nStartHour, 0);
	
	--设置间隔时间，单位为分钟
	TaskInterval(60) --15一次
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg("=====> HOAT DONG HOA SON DAI CHIEN 10H, 15H, 22H ");
end

function TaskContent()

	local nHour = tonumber(date("%H"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	

	local bIsStart = 0
	if nHour == 10 or nHour == 22  then
		bIsStart = 1
	elseif (nHour == 15 ) and (nWeek == 6 or nWeek == 0) then
		bIsStart = 1
	end
	
	if bIsStart == 1 then
		OutputMsg(" =================HOA SON DAI CHIEN Started==================");
		GlobalExecute("dwf \\script\\missions\\huashanqunzhan\\missionctrl.lua startHuaShanQunZhanMission()")
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", "Hoa s琻 L穙 T萿  m� Hoa S琻 L玦 i, Hoa S琻 i chi課 產ng trong giai 畂筺 ghi danh."))
	end
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


