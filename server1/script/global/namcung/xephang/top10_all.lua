IncludeLib("RELAYLADDER");
IncludeLib("TONG")
function XepHang()
dofile("script/global/namcung/xephang/top10_all.lua")
	if GetLevel()>10 then
		XepHang_Top10ALL()
		XepHang_Top10MP()
		XepHang_TopPhuho()
		XepHang_TopMPPhuho()
		--XepHang_CaNhan()
		--XoaXepHang()
	end
end

function XepHang_Top10ALL()
	if GetCamp()==0 or GetCamp()==4 and GetFaction() == "" then
		Ladder_NewLadder(10271, GetName(),GetLevel(),1);
	else
		Ladder_NewLadder(10270, GetName(),GetLevel(),0,GetLastFactionNumber());
	end
end
function XepHang_TopPhuho()
	nMoney = GetBoxMoney()+ GetCash()
	sMoney = nMoney/10000
	if sMoney < 1 then
	return
end
	if GetCamp()==0 or GetCamp()==4 and GetFaction() == "" then
		Ladder_NewLadder(10284, GetName(),sMoney,1);
	else
		Ladder_NewLadder(10283,GetName(),sMoney,0,GetLastFactionNumber());
	end
end
function XepHang_TopMPPhuho()
	local player_Faction = GetFaction()
	nMoney = GetBoxMoney()+ GetCash()
	sMoney = nMoney/10000
		if sMoney < 1 then
	return
end
		if (player_Faction == "cuiyan") then	
			Ladder_NewLadder(10290, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "emei") then				
			Ladder_NewLadder(10289, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "tangmen") then
			Ladder_NewLadder(10287, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "wudu") then
			Ladder_NewLadder(10288, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "tianwang") then
			Ladder_NewLadder(10286, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "shaolin") then
			Ladder_NewLadder(10285, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "wudang") then
			Ladder_NewLadder(10293, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "kunlun") then
			Ladder_NewLadder(10294, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "tianren") then
			Ladder_NewLadder(10292, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "gaibang") then
			Ladder_NewLadder(10291, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (GetLastFactionNumber() == 10) then
			Ladder_NewLadder(10295, GetName(),sMoney,0,GetLastFactionNumber());
	end
end

function XoaXepHang()
	for i=10001,10300 do
		Ladder_ClearLadder(i)
	end
end

function XepHang_Top10MP()
	local player_Faction = GetFaction()
	local szTongName, nTongID = GetTongName();	
	if GetLevel()>10 then
		if (player_Faction == "cuiyan") then	
			Ladder_NewLadder(10277, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (player_Faction == "emei") then				
			Ladder_NewLadder(10276, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (player_Faction == "tangmen") then
			Ladder_NewLadder(10274, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (player_Faction == "wudu") then
			Ladder_NewLadder(10275, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (player_Faction == "tianwang") then
			Ladder_NewLadder(10273, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (player_Faction == "shaolin") then
			Ladder_NewLadder(10272, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (player_Faction == "wudang") then
			Ladder_NewLadder(10280, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (player_Faction == "kunlun") then
			Ladder_NewLadder(10281, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (player_Faction == "tianren") then
			Ladder_NewLadder(10279, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (player_Faction == "gaibang") then
			Ladder_NewLadder(10278, GetName(),GetLevel(),0,GetLastFactionNumber());

		elseif (GetLastFactionNumber() == 10) then
			Ladder_NewLadder(10282, GetName(),GetLevel(),0,GetLastFactionNumber());

		else
				if szTongName == nil or szTongName == "" then
						if GetCamp() == 4 then
								Ladder_NewLadder(10119, GetName(),GetLevel(),1);
						end
				end
		end
	end
end
function XepHang_CaNhan()
	
if GetCamp()==0 and GetFaction() == "" then
		Ladder_NewLadder(10296, "H¹ng Cao Thñ Giang Hå","T©n Thñ",1)
		Ladder_NewLadder(10296, "H¹ng Phó Hé Giang Hå","T©n Thñ",1)
		Ladder_NewLadder(10296, "H¹ng Cao Thñ M«n Ph¸i","T©n Thñ",1)
		Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i","T©n Thñ",1)
else
	for i = 1, 1200 do
		local szname, nrank = Ladder_GetLadderInfo(10270, i)
		if (szname == "") then
			break
		end
		if (szname == GetName()) then
			Ladder_NewLadder(10296, "H¹ng Cao Thñ Giang Hå",i,0,GetLastFactionNumber())
			break
		end
	end
	
	for i = 1, 1200 do
		local szname, nrank = Ladder_GetLadderInfo(10283, i)
		if (szname == "") then
			break
		end
		if (szname == GetName()) then
			Ladder_NewLadder(10296, "H¹ng Phó Hé Giang Hå",i,0,GetLastFactionNumber())
			break
		end
	end
	
	local player_Faction = GetFaction()
	if (player_Faction == "cuiyan") then	
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10277, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "emei") then				
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10276, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "tangmen") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10274, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "wudu") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10275, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "tianwang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10273, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "shaolin") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10272, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "wudang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10280, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "kunlun") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10281, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "tianren") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10279, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "gaibang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10278, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (GetLastFactionNumber() == 10) then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10282, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "Thø H¹ng M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end
	end

	if (player_Faction == "cuiyan") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10290, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end


	elseif (player_Faction == "emei") then				
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10289, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "tangmen") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10287, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "wudu") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10288, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "tianwang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10286, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "shaolin") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10285, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "wudang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10293, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "kunlun") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10294, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "tianren") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10292, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (player_Faction == "gaibang") then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10291, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	elseif (GetLastFactionNumber() == 10) then
			for i = 1, 1200 do
				local szname, nrank = Ladder_GetLadderInfo(10295, i)
				if (szname == "") then
					break
				end
				if (szname == GetName()) then
					Ladder_NewLadder(10296, "H¹ng Phó Hé M«n Ph¸i",i,0,GetLastFactionNumber())
					break
				end
			end

	end

	for i = 1, 1200 do
		local szname, nrank = Ladder_GetLadderInfo(10268, i)
		if (szname == "") then
			return
		end
		if (szname == GetName()) then
			Ladder_NewLadder(10296, "H¹ng binh gi¸p",i,0,GetLastFactionNumber())
			return
		end
	end

end
Ladder_ClearLadder(10296)
end

function xephangcanhan()
	-- local PlayerIndexOld = PlayerIndex
	-- local szArrayRankingLevel = {}
	-- local szArrayRankingName = {}
	-- local i = 1
	-- local MAX_PLAYER = 100
	-- for i=1, MAX_PLAYER do
		-- PlayerIndex = i
		-- szArrayRankingLevel[i] = GetLevel()
		-- szArrayRankingName[i] = GetName()
	-- end
	-- PlayerIndex = PlayerIndexOld
	
	-- local TempLevel = 0
	-- local TempName = ""
	-- local hasChanged
	-- while hasChanged do 
		-- hasChanged = false
		-- for i = 1, MAX_PLAYER - 1 do
			-- if szArrayRankingLevel[i] > szArrayRankingLevel[i + 1] then
				-- Temp = szArrayRankingLevel[i]
				-- szArrayRankingLevel[i] = szArrayRankingLevel[i + 1]
				-- szArrayRankingLevel[i + 1] = Temp
				
				-- TempName = szArrayRankingName[i]
				-- szArrayRankingName[i] = szArrayRankingName[i + 1]
				-- szArrayRankingName[i + 1] = TempName
				-- hasChanged = true
			-- end
		-- end
	-- end
	-- for i=1, MAX_PLAYER do
		-- PlayerIndex = i
		-- SetTask(3001,szArrayRankingLevel[i])
		-- Msg2Player("ThÃ¸ hÂ¹ng cÂ¸ nhÂ©n: NhÂ©n vÃ‹t:"..szArrayRankingName[i].."\tHÂ¹ng:"..szArrayRankingLevel[i].."\n")
	-- end
end
