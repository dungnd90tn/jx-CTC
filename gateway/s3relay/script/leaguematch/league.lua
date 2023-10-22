Include( "\\script\\leaguematch\\head.lua" )

--Ìá¹©GameServerµ÷ÓÃµÄ½¨Á¢Õ½¶Óº¯Êı
function wlls_create(szParam)
	_M("Çë wlls_create ÊäÈë²ÎÊıÎª:"..szParam);
	
	--²ğ·Ö´«Èë²ÎÊı
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	n_type = tonumber(aryParam[2])
	n_mtype = tonumber(aryParam[3])
	leaguename = aryParam[4]

	--±ÜÃâÖØ¸´¼ÓÈë¶ÓÔ±
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "Xin lçi b¹n ®· tham gia nhãm kh¸c kh«ng thÓ t¹o mét nhãm cho riªng m×nh!")
		return 0
	end

	--±ÜÃâÕ½¶ÓÃûÖØ¸´
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if(not FALSE(n_lid)) then
		wlls_say(rolename, "Xin lçi tªn nhãm [<color=yellow>"..leaguename.."<color>] ®· ®­îc sö dông!")
		return 0
	end
	
	--½¨Á¢Õ½¶Ó
	if(wlls_relay_createleague(leaguename) == 1) then
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_MTYPE, n_mtype)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_STYPE, n_type)
		--Ìí¼Óµ±Ç°rolenameµ½Õ½¶Ó
		if(wlls_relay_addmember(leaguename, rolename) == 1) then
			wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_JOB, 1)
			wlls_say(rolename, "B¹n ®· t¹o nhãm thi ®Êu [<color=yellow>"..leaguename.."<color>] thµnh c«ng!", nil, 1)
			wlls_rest_hint(rolename, 1, n_type)
			return 1
		end
		wlls_say(rolename, "Xin vui lßng liªn hÖ qu¶n lı !")
	end

	OutputMsg("create league "..leaguename.." error!!!")
	return 0
end

--Ìá¹©GameServerµ÷ÓÃµÄ¼ÓÈë¶ÓÔ±º¯Êı
function wlls_add(szParam)
	_M("Çë wlls_add ÊäÈë²ÎÊıÎª:"..szParam);

	--²ğ·Ö´«Èë²ÎÊı
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	leaguename = aryParam[2]
	cpname = aryParam[3]
	
	--±ÜÃâÖØ¸´¼ÓÈë¶ÓÔ±
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "Xin lçi b¹n ®· tham gia nhãm kh¸c kh«ng thÓ gia nhËp vµo nhãm nµy !!")
		wlls_say(cpname, "C¸c thµnh viªn nhãm kh¸c kh«ng thÓ gia nhËp nhãm cña  <color=yellow>"..rolename.."<color> !", 0)
		return 0
	end
	
	--·ÀÖ¹³¬¹ıÕ½¶ÓÈËÊıÉÏÏŞ
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "Xin lçi nhãm b¹n t×m kh«ng tån t¹i hoÆc ®· gi¶i t¸n!")
		wlls_say(cpname, "Nhãm b¹n gÆp vÊn ®Ò! Kh«ng cßn thµnh viªn trong nhãm.", 0)
		return 0
	end
	_, _, membercount = LG_GetLeagueInfo(n_lid)
	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (membercount >= n_maxmem) then
		wlls_say(rolename, "Xin lçi nhãm cña b¹n ph¶i cã ®ñ thµnh viªn míi cã thÓ tham gia !!")
		wlls_say(cpname, "Nhãm cña b¹n ®· ®ñ ng­êi kh«ng thÓ thªm thµnh viªn míi!!", 0)
		return 0
	end

	--¼ÓÈëÕ½¶Ó
	if(wlls_relay_addmember(leaguename, rolename) == 1) then
		wlls_say(rolename, "Xin chóc mõng b¹n ®· gia nhËp thµnh c«ng nhãm [<color=yellow>"..leaguename.."<color>]", nil, 1)
		wlls_say(cpname, "<color=yellow>"..rolename.."<color> gia nhËp nhãm thµnh c«ng!", 0)
		wlls_rest_hint(cpname, membercount+1, n_type)
		return 1
	end

	OutputMsg("wlls_add error!", rolename, leaguename)
	return 0
end

--Ìá¹©GameServerµ÷ÓÃµÄÉ¾³ı¶ÓÔ±º¯Êı£¨×îÖÕ£©
function wlls_leave(rolename)
	_M("Çë wlls_leave ÊäÈë²ÎÊıÎª:"..rolename);
	
	--È·ÈÏÒÑ¾­¼ÓÈëÁË¶ÓÎé
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "B¹n kh«ng cã nhãm!")
		return 0
	end

	local leaguename, _, membercount = LG_GetLeagueInfo(n_lid)
	local str = "[<color=yellow>"..leaguename.."<color>] ®· rêi khái ®éi! "
	local removelg = 0

	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	if (membercount > 1) then
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, leaguename, rolename, WLLS_LGMTASK_JOB)
		if (n_job == 1) then	--¶Ó³¤ÍË³ö
			for i = 0, LG_GetMemberCount(n_lid)-1 do
				local name = LG_GetMemberInfo(n_lid, i)
				if (name ~= rolename) then
					if (n_type == 3) then	--Ê¦Í½Èü£¬È¡ÏûÍ½µÜ±ÈÈü×Ê¸ñ
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_OVER, 1)
					else	--ÆäËû±ÈÈü£¬ÒÆ½»¶Ó³¤
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_JOB, 1)
						str = str .. "§æi tr­ëng cña b¹n ®· ®­îc chuyÓn giao cho ®ång ®éi: <color=yellow>" .. name.."<color>"
						break
					end
				end
			end
			if (n_type == 3) then	--Ê¦Í½Èü£¬È¡ÏûÍ½µÜ±ÈÈü×Ê¸ñ
				str = str .. "Thµnh viªn nhãm b¹n ®· bŞ xo¸ khái cuéc thi !."
			end
		end
	else
		str = str .. "ÄãµÄ¶ÓÒÑ½âÉ¢!"
		removelg = 1
	end
	
	--É¾³ı¶ÓÔ±
	if(LGM_ApplyRemoveMember(WLLS_LGTYPE, leaguename, rolename, "", "", removelg) == 1) then
		wlls_say(rolename, str, 1, 1)
		return 1
	end

	OutputMsg("wlls_leave error!", rolename, leaguename)
	return 0
end

--½¨Á¢Õ½¶Ó£¨×îÖÕ£©
function wlls_relay_createleague(leaguename)
	local nNewLeagueID = LG_CreateLeagueObj()	--Éú³ÉÉçÍÅÊı¾İ¶ÔÏó(·µ»Ø¶ÔÏóID)
	LG_SetLeagueInfo(nNewLeagueID, WLLS_LGTYPE, leaguename)	--ÉèÖÃÉçÍÅĞÅÏ¢(ÀàĞÍ¡¢Ãû³Æ)
	local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
	LG_FreeLeagueObj(nNewLeagueID)
	return ret
end

--¼ÓÈë¶ÓÔ±£¨×îÖÕ£©
function wlls_relay_addmember(leaguename, rolename)
	local nMemberID = LGM_CreateMemberObj() -- Éú³ÉÉçÍÅ³ÉÔ±Êı¾İ¶ÔÏó(·µ»Ø¶ÔÏóID)
	--ÉèÖÃÉçÍÅ³ÉÔ±µÄĞÅÏ¢(½ÇÉ«Ãû¡¢Ö°Î»¡¢ÉçÍÅÀàĞÍ¡¢ÉçÍÅÃû³Æ)
	LGM_SetMemberInfo(nMemberID, rolename, 0, WLLS_LGTYPE, leaguename) 
	local ret = LGM_ApplyAddMember(nMemberID, "", "") 
	LGM_FreeMemberObj(nMemberID)
	
	if (ret == 1) then	--¼ÇÂ¼¼ÓÈëÕ½¶ÓµÄÈü¼¾
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		--±ÈÈüÆÚ¼ÓÈëµÄ£¬ÊÓÎªÉÏÒ»¸öÈü¼¾¼ÓÈëµÄ
		if (GetGblInt(RLGLB_WLLS_PHASE) > 1) then n_sid = n_sid - 1 end
		wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_ADDSID, n_sid)
	end

	return ret
end

--ÌáĞÑ¶Ó³¤»¹¿ÉÒÔ¼ÓÈë¶àÉÙ¶ÓÔ±
function wlls_rest_hint(n_plname, n_count, n_type)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (n_count < n_maxmem) then
		wlls_say(n_plname, "Nhãm [<color=yellow>"..leaguename.."<color>] cã <color=yellow>"..n_count.."<color> thµnh viªn.CÇn thªm <color=yellow>"..(n_maxmem-n_count).."<color> ng­êi", 1)
	else
		wlls_say(n_plname, "Nhãm [<color=yellow>"..leaguename.."<color>] cã ®ñ  <color=yellow>"..n_maxmem.."<color> thµnh viªn", 1)
	end
end

--ÏòÖ¸¶¨½ÇÉ«ÃûµÄÍæ¼Ò·¢ĞÅÏ¢
function wlls_say(rolename, msg, b_msg, b_sync)
	_M("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
	GlobalExecute("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
end

