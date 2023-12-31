-- 玩ZingPlay获得奖品
-- ZingPlay红包

-- COMMON 常量 --
ZingPlay_Start_Date	= 20081018;		-- 活动起始时间
ZingPlay_End_Date	= 20081107;		-- 红包使用限期


-- TSK 任务变量 --
TSK_ZINGPLAY_VERSION	= 2563;		-- 记录活动起始时间
TSK_ZINGPLAY_MAXEXP		= 2564;		-- 记录获得的经验值

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	
	local n_cur_date = GetTask(TSK_ZINGPLAY_VERSION);
	
	if (n_cur_date ~= ZingPlay_Start_Date) then
		SetTask(TSK_ZINGPLAY_VERSION, ZingPlay_Start_Date);
		SetTask(TSK_ZINGPLAY_MAXEXP, 0);
	end
	
	local n_max_exp = 200000000;
	local n_one_exp = 20000000;
	
	
	if (n_date >= ZingPlay_Start_Date and n_date <= ZingPlay_End_Date) then
		local n_cur_exp = GetTask(TSK_ZINGPLAY_MAXEXP);
		
		if (n_cur_exp >= n_max_exp) then
			Say(format("Чi hi謕  nh薾 頲 %d kinh nghi謒 t� ho箃 ng ZingPlay, v� v藋 kh玭g th� ti誴 t鬰 s� d鬾g bao l� x� ZingPlay n鱝.", n_max_exp), 0);
			return 1;
		end
		
		SetTask(TSK_ZINGPLAY_MAXEXP, n_cur_exp + n_one_exp);
		AddOwnExp(n_one_exp);
		
		local sz_msg = format("S� d鬾g bao l� x� ZingPlay thu 頲 %d kinh nghi謒", n_one_exp);
		
		Msg2Player(sz_msg);
		
		WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
				GetLocalDate("%Y-%m-%d_%X"),
				GetName(),
				GetAccount(),
				sz_msg	));
	else
		
		Say("Ho箃 ng  k誸 th骳, kh玭g th� s� d鬾g v藅 ph萴 n祔 n鱝.");
		return 0;
	end
end
