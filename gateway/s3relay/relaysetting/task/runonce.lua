-- 提交此文件切记同时提交TaskLit.ini！！！

RUNONCE_NAME	= "Th� ti猽  chi課 i v� d鬾g"

function TaskShedule()
	-- 设置方案名称
	TaskName(RUNONCE_NAME)
	-- 只执行一次
	TaskInterval( 244000 )
	-- 设置触发次数，0表示无限次数
	TaskCountLimit(1)
	-- 输出启动消息
end

function TaskContent()
	if (tonumber(date("%Y%m%d")) > 20060228) then
		OutputMsg("["..RUNONCE_NAME.."] Nhi謒 v�  qua k� h筺, kh玭g th� ti誴 nh薾.")
		return
	end
	
	for n_lgtype = 2, 4 do
		local n_count	= 0
		local n_lid		= LG_GetFirstLeague(n_lgtype)
		while (n_lid ~= 0) do 
			local str_lgname = LG_GetLeagueInfo(n_lid)
			n_lid = LG_GetNextLeague(n_lgtype, n_lid)
			LG_ApplyRemoveLeague(n_lgtype, str_lgname)
			n_count	= n_count + 1
		end
		OutputMsg("Th� ti猽 chi課 i, lo筰 h譶h :"..n_lgtype..". S� lng:"..n_count)
	end

	OutputMsg("Х ho祅 th祅h nhi謒 v� ["..RUNONCE_NAME.."]!")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
