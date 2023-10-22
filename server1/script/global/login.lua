Include("\\script\\global\\login_head.lua")
-- µÇ¢¼½Å±¾
-- By: LaiLiGao(2004-06-20)
-- Update: Dan_Deng(2004-07-09) Ìí¼Ó×Ô¶¯¸üĞ¢¼¼ÄÜ¹¦ÄÜ
-- Update: FanZai ¸ÄÓÃĞ¢µÄ»úÖÆ£¬Ö»ĞèÈ¥µôInclude¾Í¿ÉÒÔÊµÏÖ¹¦ÄÜ¿ª¹Ø


--Ò»°ãÖ»ĞèĞŞ¸Ä£¨Ìí¼Ó/É¾³ı£©ÕâÀïµÄIncludeÎÄ¼ş£º
--£¨ÔÚÎÄ¼şÖĞÖ´ĞĞÒ»Ï¢login_add(fun, n_time)¼´¿É£¬Àı×Ó²Î¼û"\\script\\missions\\leaguematch\\wlls_login.lua"£©
--============================include namcung====================================
Include("\\script\\global\\namcung\\xephang\\top10_all.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\gmroleitem_player.lua")
--------------------------------------------------------------------------------------
Include("\\script\\global\\login_old.lua")	--¾ÉµÄLogin½Å±¾£¨°üº¬¶µ¸ö»î¶¯£©
Include("\\script\\missions\\leaguematch\\wlls_login.lua")	--WLLSÎäÁÖÁªÈü
Include("\\script\\misc\\extpoint_loginmsg\\login_msg.lua")
Include("\\script\\global\\offline_login.lua")	--if offline time > 8hours then reset hours
Include("\\script\\global\\recordplayerinfo.lua")
Include("\\script\\nationalwar\\login.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\playerlist.lua")
Include ("\\script\\global\\login_hint.lua")	--µÇ¢½»î¶¯ÌáÊ¾
--================================================================

Include("\\script\\activitysys\\g_activity.lua")	


if (GetProductRegion() ~= "vn") then
	Include("\\script\\global\\chuangong_login.lua")
	Include("\\script\\task\\lv120skill\\head.lua")	-- 120¼¶¼¼ÄÜÈÎÎñ

	-- LLG_ALLINONE_TODO_20070802 ´ıÈ·ÈÏ
	Include("\\script\\battles\\battle_login.lua")	--ËÎ½ğÈÙÓş½±ÀøµÄÌáÊ¾
end

if (GetProductRegion() == "cn_ib") then
	Include("\\script\\misc\\spreader\\emigration.lua")
	Include("\\script\\misc\\lost_item\\takelostitem.lua")
	Include([[\script\item\ib\tishenzhiren.lua]])	-- ÌæÉíÖ½ÈË
	Include("\\script\\item\\ib\\zimudai.lua");
end

Include("\\script\\tong\\tong_login.lua");
Include("\\script\\item\\tianziyuxi.lua");	-- ÌìÖ®Óñçô
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")
--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\vng_feature\\top10\\vngtop10.lua");
Include("\\script\\global\\namcung\\login\\login.lua")

function main(bExchangeIn)
	
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( nMapId == 341 ) or ( nMapId == 162 ) then
			Msg2Player("N¬i ®©y ®å th­îng tuyÕn s¾p trë vÒ thµnh...");
			SetRevPos(19);		--ÉèÖÃÖØÉúµã
			UseTownPortal();        --Ö´ĞĞ»Ø³Ç
		end		
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HÖ thèng ViÕt thªm	
login()


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--tinhpn 20110223:Reset pass ruong
	ResetBox:AnnounceResetBoxDate()
	--tinhpn 20100817: Online Award
	if (OnlineAward_StartDate() == 1 and OnlineAward_Check_TransferLife() ~= 0) then
		Msg2Player("Ngµi cã thÓ nhËn lÊy phÇn th­ëng online mçi ngµy!")
		OnlineAward_ResetDaily()
		OnlineAward_SummaryOnlineTime()
		OnlineAward_StartTime()
	end
	
	PlayerList:AddPlayer(PlayerIndex)
	--ÔØÈëÈ«²¿login½Å±¾
	if (TB_LOGIN_FUN[0]) then
		for i = 1, getn(TB_LOGIN_FUN[0]) do
			local func = TB_LOGIN_FUN[0][i]
			if (func) then
				func(bExchangeIn)
			end
		end
	end
	
	EventSys:GetType("OnLogin"):OnPlayerEvent(0, PlayerIndex, bExchangeIn)
	G_ACTIVITY:OnMessage("OnLogin", PlayerIndex)
	
	
	for i = 1, getn(TB_LOGIN_FILEFUN) do
		local reg = TB_LOGIN_FILEFUN[i]
		DynamicExecute(reg[1], reg[2], PlayerIndex, bExchangeIn)
	end
	TaskManager:ResetUseGroup()
	LoginDelaySync(1)  -- 1 ±íÊ¾ĞèÒªÑÓÊ±Í¬²½Êı¾İ, 0 ±íÊ¾²»ĞèÒª
	-- ÇëÎğÔÚ´Ëº¯ÊıÖĞÖ±½ÓÌí¼Ó¢ß¼­´¦Àí£¬Çë·â×°³Éº¯Êı²¢Í¨¹ılogin_add·ÅÖÃµ½TB_LOGIN_FUN[0]Êı×éÀï
end

-------------------------------------------
--  ¹¦ÄÜ£ºµÇ¢¼Ê±£¬ÑÓÊ±Í¬²½Ò»Ğ©²»Ó°ÏìÏµÍ³ÔËĞĞµÄÊı¾İµ½¿Í»§¶Ë£¬¼õÉÙµÇ¢¼ºÄ·ÑµÄÊ±¼ä
--  Ä¿Ç°ÑÓÊ±Ê±¼äÎª2Ãë(¼´£ºÖ´ĞĞmain_delaysyncµÄ¼ä¸ô£ºÁ½Ãë)
--- ²ÎÊı£ºnStep ±íÊ¾µ±Ç°ÊÇµÚ¼¸´ÎÍ¬²½
-- ·µ»Ø£º0 - ±íÊ¾Í¬²½Î´½áÊø£¬ÏµÍ³ÔÚ±¾´Îµ÷ÓÃÍê³Éºó£¬ÈÔ»áÔÙ´Îµ÷ÓÃ main_delaysync
--		 1 - ±íÊ¾ËùÓĞÍ¬²½½áÊø
function main_delaysync(nStep)	
	if (nStep < 1 or nStep > getn(TB_LOGIN_FUN)) then
		print("main_delaysync error: "..nStep.." funccount:"..getn(TB_LOGIN_FUN));
		return 1;
	end
	
	--ÔËĞĞµÚnStep´ÎÑÓÊ±Í¬²½µÄËùÓĞº¯Êı
	if (TB_LOGIN_FUN[nStep]) then
		for i = 1, getn(TB_LOGIN_FUN[nStep]) do
			if (TB_LOGIN_FUN[nStep][i]) then TB_LOGIN_FUN[nStep][i]() end
		end
	end

	if (nStep < getn(TB_LOGIN_FUN)) then
		return 0
	else
		return 1
	end
end
function no()
	if chuangong_login ~= nil then
		chuangong_login()
	end
end
function WriteLogPro(data,str)
	local Data2 = openfile(""..data.."", "a+");
	write(Data2,tostring(str));
	closefile(Data2);
end
function logplayer(zFile,szMsg)
  local handle = openfile(zFile,"a")
  write(handle,format("%s\n",szMsg));
  closefile(handle);
 end