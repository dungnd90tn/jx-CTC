Include( "\\script\\leaguematch\\head.lua" )

--提供GameServer调用的建立战队函数
function wlls_create(szParam)
	_M("请 wlls_create 输入参数为:"..szParam);
	
	--拆分传入参数
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	n_type = tonumber(aryParam[2])
	n_mtype = tonumber(aryParam[3])
	leaguename = aryParam[4]

	--避免重复加入队员
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "Xin l鏸 b筺  tham gia nh鉳 kh竎 kh玭g th� t筼 m閠 nh鉳 cho ri猲g m譶h!")
		return 0
	end

	--避免战队名重复
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if(not FALSE(n_lid)) then
		wlls_say(rolename, "Xin l鏸 t猲 nh鉳 [<color=yellow>"..leaguename.."<color>]  頲 s� d鬾g!")
		return 0
	end
	
	--建立战队
	if(wlls_relay_createleague(leaguename) == 1) then
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_MTYPE, n_mtype)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_STYPE, n_type)
		--添加当前rolename到战队
		if(wlls_relay_addmember(leaguename, rolename) == 1) then
			wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_JOB, 1)
			wlls_say(rolename, "B筺  t筼 nh鉳 thi u [<color=yellow>"..leaguename.."<color>] th祅h c玭g!", nil, 1)
			wlls_rest_hint(rolename, 1, n_type)
			return 1
		end
		wlls_say(rolename, "Xin vui l遪g li猲 h� qu秐 l� !")
	end

	OutputMsg("create league "..leaguename.." error!!!")
	return 0
end

--提供GameServer调用的加入队员函数
function wlls_add(szParam)
	_M("请 wlls_add 输入参数为:"..szParam);

	--拆分传入参数
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	leaguename = aryParam[2]
	cpname = aryParam[3]
	
	--避免重复加入队员
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "Xin l鏸 b筺  tham gia nh鉳 kh竎 kh玭g th� gia nh藀 v祇 nh鉳 n祔 !!")
		wlls_say(cpname, "C竎 th祅h vi猲 nh鉳 kh竎 kh玭g th� gia nh藀 nh鉳 c馻  <color=yellow>"..rolename.."<color> !", 0)
		return 0
	end
	
	--防止超过战队人数上限
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "Xin l鏸 nh鉳 b筺 t譵 kh玭g t錸 t筰 ho芻  gi秈 t竛!")
		wlls_say(cpname, "Nh鉳 b筺 g苝 v蕁 ! Kh玭g c遪 th祅h vi猲 trong nh鉳.", 0)
		return 0
	end
	_, _, membercount = LG_GetLeagueInfo(n_lid)
	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (membercount >= n_maxmem) then
		wlls_say(rolename, "Xin l鏸 nh鉳 c馻 b筺 ph秈 c�  th祅h vi猲 m韎 c� th� tham gia !!")
		wlls_say(cpname, "Nh鉳 c馻 b筺   ngi kh玭g th� th猰 th祅h vi猲 m韎!!", 0)
		return 0
	end

	--加入战队
	if(wlls_relay_addmember(leaguename, rolename) == 1) then
		wlls_say(rolename, "Xin ch骳 m鮪g b筺  gia nh藀 th祅h c玭g nh鉳 [<color=yellow>"..leaguename.."<color>]", nil, 1)
		wlls_say(cpname, "<color=yellow>"..rolename.."<color> gia nh藀 nh鉳 th祅h c玭g!", 0)
		wlls_rest_hint(cpname, membercount+1, n_type)
		return 1
	end

	OutputMsg("wlls_add error!", rolename, leaguename)
	return 0
end

--提供GameServer调用的删除队员函数（最终）
function wlls_leave(rolename)
	_M("请 wlls_leave 输入参数为:"..rolename);
	
	--确认已经加入了队伍
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "B筺 kh玭g c� nh鉳!")
		return 0
	end

	local leaguename, _, membercount = LG_GetLeagueInfo(n_lid)
	local str = "[<color=yellow>"..leaguename.."<color>]  r阨 kh醝 i! "
	local removelg = 0

	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	if (membercount > 1) then
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, leaguename, rolename, WLLS_LGMTASK_JOB)
		if (n_job == 1) then	--队长退出
			for i = 0, LG_GetMemberCount(n_lid)-1 do
				local name = LG_GetMemberInfo(n_lid, i)
				if (name ~= rolename) then
					if (n_type == 3) then	--师徒赛，取消徒弟比赛资格
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_OVER, 1)
					else	--其他比赛，移交队长
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_JOB, 1)
						str = str .. "фi trng c馻 b筺  頲 chuy觧 giao cho ng i: <color=yellow>" .. name.."<color>"
						break
					end
				end
			end
			if (n_type == 3) then	--师徒赛，取消徒弟比赛资格
				str = str .. "Th祅h vi猲 nh鉳 b筺  b� xo� kh醝 cu閏 thi !."
			end
		end
	else
		str = str .. "你的队已解散!"
		removelg = 1
	end
	
	--删除队员
	if(LGM_ApplyRemoveMember(WLLS_LGTYPE, leaguename, rolename, "", "", removelg) == 1) then
		wlls_say(rolename, str, 1, 1)
		return 1
	end

	OutputMsg("wlls_leave error!", rolename, leaguename)
	return 0
end

--建立战队（最终）
function wlls_relay_createleague(leaguename)
	local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
	LG_SetLeagueInfo(nNewLeagueID, WLLS_LGTYPE, leaguename)	--设置社团信息(类型、名称)
	local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
	LG_FreeLeagueObj(nNewLeagueID)
	return ret
end

--加入队员（最终）
function wlls_relay_addmember(leaguename, rolename)
	local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
	--设置社团成员的信息(角色名、职位、社团类型、社团名称)
	LGM_SetMemberInfo(nMemberID, rolename, 0, WLLS_LGTYPE, leaguename) 
	local ret = LGM_ApplyAddMember(nMemberID, "", "") 
	LGM_FreeMemberObj(nMemberID)
	
	if (ret == 1) then	--记录加入战队的赛季
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		--比赛期加入的，视为上一个赛季加入的
		if (GetGblInt(RLGLB_WLLS_PHASE) > 1) then n_sid = n_sid - 1 end
		wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_ADDSID, n_sid)
	end

	return ret
end

--提醒队长还可以加入多少队员
function wlls_rest_hint(n_plname, n_count, n_type)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (n_count < n_maxmem) then
		wlls_say(n_plname, "Nh鉳 [<color=yellow>"..leaguename.."<color>] c� <color=yellow>"..n_count.."<color> th祅h vi猲.C莕 th猰 <color=yellow>"..(n_maxmem-n_count).."<color> ngi", 1)
	else
		wlls_say(n_plname, "Nh鉳 [<color=yellow>"..leaguename.."<color>] c�   <color=yellow>"..n_maxmem.."<color> th祅h vi猲", 1)
	end
end

--向指定角色名的玩家发信息
function wlls_say(rolename, msg, b_msg, b_sync)
	_M("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
	GlobalExecute("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
end

