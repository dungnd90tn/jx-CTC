IncludeLib("SETTING")
IncludeLib("FILESYS")
IncludeLib("TASKSYS")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\libgm.lua")

tbGMJX = {}
function tbGMJX:_init()
	self.ListPlayer = {};
	self.ListBand = {};
	self.MuteChat = {};
	self.PlayerId = {};
	self.ListName = {};
	self.ListGift = {};
	self.Item = {{}};
	self.ListIdxKichOut = {};
end
tbGMJX:_init()

tbGMJX.szFile = "\\dulieu\\bandbygm.dat"
server_loadfile(tbGMJX.szFile)

--********************Më khãa nh©n vËt t¹m thêi vµ vÜnh viÔn*********************************
function Unlock1()
	AskClientForString("MoKhoaTT","",1,999999999,"Tªn Tµi Kho¶n")
end
function Unlock2()
	AskClientForString("UnlockPlayer","",1,999999999,"Tªn Tµi Kho¶n")
end
function MoKhoaTT(nVar)
	if not tbGMJX.ListPlayer[nVar] then 
		Msg2Player("Tµi kho¶n: <color=yellow>"..nVar.."<color> kh«ng tån t¹i trong hÖ thèng <color=orange> GM..");
		return
	end
	if not tbGMJX.ListName[nVar] then 
		Msg2Player("Tµi kho¶n: <color=yellow>"..nVar.."<color> kh«ng bÞ khãa t¹m thêi.");
		return
	end	
	if not tbGMJX.ListBand[tbGMJX.ListName[nVar]] then 
		Msg2Player("Tµi kho¶n: <color=yellow>"..nVar.."<color> kh«ng bÞ khãa t¹m thêi.");
		return
	end
	tbGMJX.ListBand[tbGMJX.ListName[nVar]] = nil
	Msg2Player(format("<color=orange>GM<color> ®· më khãa t¹m thêi cho tµi kho¶n: <color=yellow>%s",tbGMJX.ListName[nVar]))
end
function UnlockPlayer(zVar)
	local IsBand = server_getdata(tbGMJX.szFile,"ACCOUNT_BAND_FORVER",zVar);
	if not IsBand or IsBand == "" then 
		Msg2Player("Tµi kho¶n: <color=yellow>"..nVar.."<color> kh«ng bÞ khãa vÜnh viÔn.");
		return
	end
	server_setdata(tbGMJX.szFile,"ACCOUNT_BAND_FORVER",zVar,"")
	server_savedata(tbGMJX.szFile);
	Msg2Player("<color=orange>GM<color> ®· më khãa vÜnh viÔn cho tµi kho¶n: <color=yellow>"..zVar.."")
end
--********************Khãa nh©n vËt t¹m thêi vµ vÜnh viÔn*********************************
function tbGMJX:BandLoginServer(nVar)
	if not tbGMJX.ListPlayer[nVar] then 
		Msg2Player("Tµi kho¶n: <color=yellow>"..nVar.."<color> kh«ng tån t¹i trong hÖ thèng <color=orange>GM.");
		return
	end

	local gmrole = PlayerIndex
	Msg2Player(format("B¹n ®· bÞ khãa nh©n vËt <color=yellow>%s <color>vµ tµi kho¶n: <color=orange>%s <color>ra khái server.",self.ListPlayer[nVar].szName,self.ListPlayer[nVar].szAccount));
	PlayerIndex = self.ListPlayer[nVar].PlayerIdx
	if nVar == GetAccount() then 
		local szAccount = GetAccount();
		self.ListBand[szAccount] = 1
		self.ListName[szAccount] = szAccount;
		OfflineLive(PlayerIndex)
		KickOutSelf()
	end
	PlayerIndex = gmrole;
	Msg2Player(format("<color=orange>GM<color> ®· khãa t¹m thêi tµi kho¶n: <color=yellow>%s",nVar))
end
function tbGMJX:BandLoginForver(nVar)
	if not tbGMJX.ListPlayer[nVar] then 
		Msg2Player("Tµi kho¶n: <color=yellow>"..nVar.."<color> kh«ng tån t¹i trong hÖ thèng <color=orange>GM.");
		return
	end

	local gmrole = PlayerIndex
	Msg2Player(format("B¹n ®· bÞ khãa nh©n vËt <color=yellow>%s <color> vµ tµi kho¶n: <color=orange>%s <color> ra khái server.",self.ListPlayer[nVar].szName,self.ListPlayer[nVar].szAccount));
	PlayerIndex = self.ListPlayer[nVar].PlayerIdx
	if nVar == GetAccount() then
		local szAccount = GetAccount();
		server_setdata(self.szFile,"ACCOUNT_BAND_FORVER",szAccount,1);
		server_savedata(self.szFile);
		OfflineLive(PlayerIndex)
		KickOutSelf()
	end
	PlayerIndex = gmrole;
	Msg2Player(format("<color=orange>GM<color> ®· khãa vÜnh viÔn tµi kho¶n: <color=yellow>%s",nVar))
end
--********************Kich out nh©n vËt khãa t¹m thêi*************************************
function tbGMJX:KickYourAss(szAccount)
	if self.ListBand[szAccount] then 
		OfflineLive(PlayerIndex)
		KickOutSelf();
	end
end
function tbGMJX:KickVinhVien(szAccount)
	server_loadfile("\\dulieu\\bandbygm.dat");
	local IsBandForever = server_getdata("\\dulieu\\bandbygm.dat","ACCOUNT_BAND_FORVER",szAccount)
	if IsBandForver ~= nil or IsBandForever ~= "" then 
		OfflineLive(PlayerIndex)
		KickOutSelf();
	end
end
--************************Save nh©n vËt vµo hÖ thèng GM******************************************
function tbGMJX:GetInfoPlayer(szName)
	if not self.ListPlayer[szName] then 
		local CountList = getn(self.ListIdxKichOut) + 1
		self.ListIdxKichOut[CountList] = PlayerIndex;
		self.ListPlayer[szName] = {PlayerIdx = PlayerIndex,szAccount = GetAccount(),nLevel = GetLevel(),szName = GetName(),nID = CountList};
		print(format("Thong tin tai khoan: %s da duoc luu vao, indexid : %d",self.ListPlayer[szName].szAccount,CountList)) --thu lai minh xem
	end
end
--*********************************************************************************************
function tbGMJX:RemoveInfo(szName)
	if self.ListPlayer[szName] then 
		tremove(self.ListIdxKichOut,self.ListPlayer[szName].nID);
		self.ListPlayer[szName] = nil
	end
end
function tbGMJX:LimitAccount(zIp)
	if type(zIp) == "string" then
		local ip1,ip2,ip3,ip4 = strfind(zIp,"(%d+).(%d+).(%d+).(%d+)");
		local strIp = format("%s%s%s%s",ip1, ip2,ip3,ip4)
		if self.LimitAccount[strIp] then 
			local countlogin = self.LimitAccount[strIp].CounLogin;
			if countlogin > 5 then 
	
			else
				self.LimitAccount[strIp].CountLogin = countlogin + 1;
			end
		end
		
		
		
	end
end
--************************Thao tac lªn nh©n vËt*******************************************
function moveNV(ID_NV)
----------------------------------dua ve ba lang huyen------------------------------
	--gmidx=PlayerIndex
	--PlayerIndex=ID_NV
	--w,x,y=GetWorldPos()
	--if (w~=53) then
	--	SetFightState(0)
		--NewWorld(53,200*8,200*16)
	--else
	--	SetPos(1630, 3255)
	--end
	--Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· di chuyÓn b¹n vÒ Ba L¨ng HuyÖn");
	--PlayerIndex=gmidx
	--Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®îc GM di chuyÓn vÒ Ba LÆng HuyÖn thµnh c«ng");

-------------------------------- dua ve vi tri gm-----------------------------------------------
		local szName = GetName()
		gmidx=PlayerIndex
		w,x,y=GetWorldPos()
		PlayerIndex = ID_NV
		SetFightState(0)
		NewWorld(w,x,y)
		Msg2Player("B¹n ®· ®­îc<color=orange> GM<color> triÖu håi.")
		local MVName = GetName()
		PlayerIndex=gmidx
		Msg2Player(format("B¹n ®· triÖu håi nhËn vËt: <color=orange>"..MVName..""))
	
end
function moveGM(ID_NV)
	gmidx=PlayerIndex
	PlayerIndex=ID_NV
	w,x,y=GetWorldPos()
	PlayerIndex=gmidx
	if (w~=53) then
		NewWorld(w,x,y)
	else
		SetPos(x, y)
	end
	Msg2Player("<color=orange>B¹n ®· ®Õn vÞ trÝ nh©n vËt thµnh c«ng");
end
function KichOut_NV(ID_NV)
	gmidx=PlayerIndex
	PlayerIndex=ID_NV
	Msg2Player("<color=orange> GM<color>: <color=green>"..gmName.."<color> ®· kick kÑt tµi kho¶n cho b¹n");
	OfflineLive(PlayerIndex)
	KickOutSelf()
	PlayerIndex=gmidx
	Msg2Player("Nh©n vËt <color=yellow>"..ObjName.."<color> ®îc <color=orange> GM<color> kick kÑt tµi kho¶n thµnh c«ng");
end;

function kickroll()
local countplayers = GetPlayerCount();
		for i=1,countplayers do 
			PlayerIndex = i;
			if PlayerIndex > 0 then 
				KickOutSelf();  
			else
				break;
			end
		end
end

function CamChat_NV(ID_NV)
	gmidx=PlayerIndex
	PlayerIndex=ID_NV
	SetChatFlag(1)
	Msg2Player("B¹n bÞ <color=orange> GM<color> khãa <color=green>Chat<color> trªn mäi tÇn sè !")
	PlayerIndex=gmidx
	--AddGlobalCountNews("Nh©n VËt:<color=red> "..ObjName.."<color> §· BÞ CÊm Chat Trªn Mäi TÇn Sè !",1)
	Msg2Player("<color=orange> GM<color> cÊm <color=green>Chat<color>nh©n vËt<color=yellow> "..ObjName.."");
end
function MoChat_NV(ID_NV)
	gmidx=PlayerIndex
	PlayerIndex=ID_NV
	SetChatFlag(0)
	Msg2Player("B¹n ®îc <color=orange> GM<color> më khãa <color=green>Chat<color>trªn mäi tÇn sè !")
	PlayerIndex=gmidx
	--AddGlobalCountNews("Nh©n VËt:<color=green> "..ObjName.."<color> §îc<color=orange> GM<color> më Chat trªn mäi tÇn sè !",1)
	Msg2Player("<color=orange> GM<color> më <color=green>Chat<color>nh©n vËt <color=yellow>"..ObjName.."");
end 

function CallAllPlayers()
	local gmrole = PlayerIndex;
	local MapId,nX,nY = GetWorldPos();
	local count = GetPlayerCount();
	if count > 0 then 
		for i=1,count do 
			PlayerIndex = i;
			if PlayerIndex > 0 then 
				NewWorld(MapId,nX,nY);
				Msg2Player("B¹n ®­îc <color=orange>GM<color> triÖu tËp.")
			else
				break
			end
		end
		PlayerIndex = gmrole;
		Msg2Player(format("B¹n ®· triÖu tËp thµnh c«ng :<color=orange> [%d]<color> ng­êi ch¬i vÒ <color=orange>MAP<color>:<color=yellow> [%d]<color>  täa ®é:<color=Green> [%d.%d]",count,MapId,nX,nY))
	end
end
