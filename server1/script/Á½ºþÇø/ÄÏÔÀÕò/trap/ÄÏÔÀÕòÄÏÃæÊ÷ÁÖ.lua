--两湖区 南岳镇南面树林 战斗状态切换Trap

function main(sel)

if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在城内
	SetPos(1565, 3242)		-- 设置走出Trap点，目的点在城外	
	SetFightState(1)		-- 转换为战斗状态
else			       		-- 玩家处于战斗状态，即在城外
	SetPos(1570, 3240)		-- 设置走出Trap点，目的点在城内	
	SetFightState(0)		-- 转换为非战斗状态
end;
	AddStation(11)			-- 记录角色曾经到过南岳镇
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3) 
end;