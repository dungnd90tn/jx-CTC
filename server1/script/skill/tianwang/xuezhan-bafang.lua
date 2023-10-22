function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "deadlystrike_p") then
return Getdeadlystrike_p(level)
end;

if (levelname == "attackrating_p") then
return Getattackrating_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsenhance_p(level)
result = 40+level*19
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 10+level
return Param2String(result,0,0)
end;


function Getattackrating_p(level)
result = 20+level*5
return Param2String(result,0,0)
end;

function Getdeadlystrike_p(level)
result = 5+floor(level*1.5)
return Param2String(result,0,0)
end;

