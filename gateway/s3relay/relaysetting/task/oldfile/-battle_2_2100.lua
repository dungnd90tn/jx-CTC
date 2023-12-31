-- 战役系统
-- Dongzhi

function TaskShedule()
	TaskName( "金国战战役  21:00" );
	TaskInterval( 1440 );
	TaskTime( 20, 50 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "BATTLE[GuoZhan] 21:00 startup..." );

end

function TaskContent()
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		
		if CW_GetOccupant(4) == CW_GetOccupant(7) then
			local szMsg  = format("Chi誹 c竜 thi猲 h� \"%s\" ng th阨 chi誱 頲 L﹎ An c飊g Bi謓 Kinh, bang ch� c� th� tr鵦 ti誴 l猲 ng玦 thi猲 t� ", CW_GetOccupant(4));
			local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
			GlobalExecute(szNews);
			
			for i = 0,10 do
				NW_SetTask(i, 0);
			end
			NW_Abdicate();			-- 原来天子退位
			NW_SetTask(0, 1);		-- 宋赢
			return
		end
		
		local szMsg  = format("Ti襫 tuy課 m藅 b竜, Nc T鑞g \"%s\" 金国 \"%s\"thi猲 t� 畂箃 ng玦  m�, xin m阨 c竎 v� tng s� n t鑞g kim  ghi danh tham chi課!", CW_GetOccupant(7), CW_GetOccupant(4));
		local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
		GlobalExecute(szNews);
		Battle_StartNewRound( 2, 3 );	-- GM指令，启动国战宋金
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
