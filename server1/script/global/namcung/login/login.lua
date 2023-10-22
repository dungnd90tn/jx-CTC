IncludeLib("TIMER")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\lib\\objbuffer_head.lua")
--================================================================
Include("\\script\\global\\namcung\\xephang\\top10_all.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\gmroleitem_player.lua")
Include("\\script\\global\\namcung\\namcung_say.lua")

--================================================================


function login()
------------------------------------------------HÖ thèng xÕp h¹ng------------------------------------------
	Ladder_ClearLadder(10296)	
	XepHang()
--LoginNew()
nhanvongsanght()
---------------------------------------Skills phôc håi 3s------------------------------------------------------------------------------

	SetProtectTime(18*3) --ÈýÃë±£»¤Ê±¼ä
	AddSkillState(963, 1, 0, 18*3) 

-----------------------------------------------------------th«ng b¸o nh©n vËt Online----------------------------------------------------------
		
	--Msg2SubWorld("<color=yellow>§¹i hiÖp<color><color=orange> "..GetName().."<color> ®· <color=green>Online <color> !.")
-------------------------------------------------------------L­u thong tin nhan vËt--------------------------------------------------------
	
	--WriteLogPro("Login_Log/Info_"..tonumber(date("%d")).."-"..tonumber(date("%m")).."-20"..tonumber(date("%y"))..".txt","["..date().."]\t"..GetName().."\t"..GetAccount().."\t"..GetLevel().."\n");
	logplayer("dulieu/thongtintaikhoan-nhanvat.txt",format("[IP : %s ] - Thêi gian : %s  - Tµi kho¶n [ %s] - Nh©n vËt : [%s ] ®¨ng nhËp thµnh c«ng ! ",GetIP(),GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName()))

------------------------------------------------------L­u danh s¸ch qu¶n ly cña GM---------------------------------------------------------------	

	tbGMJX:KickYourAss(GetAccount());
	tbGMJX:GetInfoPlayer(GetAccount());	
	tbGMJX:KickVinhVien(GetAccount());
 end