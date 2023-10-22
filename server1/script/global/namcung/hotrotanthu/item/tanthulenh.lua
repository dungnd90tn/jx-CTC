IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\namcung\\hotroitem.lua")
Include("\\script\\global\\namcung\\hotrotanthu\\itemblue.lua")
Include("\\script\\global\\namcung\\namcung_say.lua")

function main()
dofile("script/global/namcung/hotrotanthu/item/tanthulenh.lua");	
	local szTitlez =  "<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Chµo mõng b¹n ®Õn víi thÕ giíi<color=red> Vâ L©m TruyÒn Kú <color>.<enter>Chóc c¸c nh©n sü b«n tÈu giang hå vui vÎ t¹i. Xin ch©n thµnh c¶m ¬n quý nh©n sü... !"
		local tbOpt =
		{	--{"NhËn §å Xanh", trangbixanh},
			--{"NhËn Bé An Bang", nhananbang},
			--{"NhËn Bé §Þnh Quèc", nhandinhquoc},
			--{"Hç Trî Test Game", testgame},
			--{"NhËn 2000 V¹n", tienvan2},
			--{"T¹i H¹ Muèn NhËn Ngùa", layngua},
			--{"NhËn VËt PhÈm Ho¹t §éng", vatpham},
			{"Hñy trang bÞ khãa", deltem},
			--{"B¸n shop VËt phÈm", sellitem},
			--{"NhËn L¹i Skill", nhandaithanhbikip},
			{"NhËn L¹i Vßng S¸ng Hæ trî t©n thñ", nhanvongsanght},
			{"Gi¶i kÑt nh©n vËt", giaiket},
			{"Fix lag thÇn hµnh phï", fixphu},	
			{"Tho¸t"},
		}
		CreateNewSayEx(szTitlez, tbOpt)	
	return 1				
end

function sellitem()
Sale(154)
end

function giaiket()
	SetFightState(0)
	Msg2Player( "<color=yellow>Trë vÒ Ba l¨ng huyÖn!");
	NewWorld(53, 1622, 3181);
end


function fixphu()
	DisabledUseTownP(0)
	WorldIdx = SubWorldID2Idx(53)
	SubWorld = WorldIdx;
	SetAutoHangMapFlag(0)
	Msg2Player("<color=yellow>Söa lçi kh«ng sö dông ®­îc ThÇn Hµnh Phï vµ Thæ §Þa Phï thµnh c«ng<color>")
end

function nhananbang()
		for i=164,167 do
		local ItemIdx=AddGoldItem(0, i);
		--SetItemBindState(ItemIdx, -2);
	end	
end;
function nhandinhquoc()
		for i=159,163 do
		local ItemIdx=AddGoldItem(0, i);
		--SetItemBindState(ItemIdx, -2);
	end	
end;
function deltem()
	if (GetBoxLockState() ~= 0) then
		Say("Xin më khãa r­¬ng tr­íc !", 0)
		return
	end
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm!", "DisposeConfirm", "onCancel", 1);
end
function tienvan2()
	Earn(20000000)	
end
function tiendong()
	for i = 1,3 do
		AddStackItem(100,4,417,1,1,0,0,0)	-- nhan 300 tien dong
	end
end;
function DisposeConfirm(nCount)	

	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		local nQuality = GetItemQuality(nItemIndex);
		local nBindState = GetItemBindState(nItemIndex)
	if (nBindState >=0)  then
		Talk(1, "", "VËt phÈm cÇn hñy ph¶i lµ vËt phÈm khãa!");
		return
	end
		--SaveLog(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
	end--for
	Talk(1, "", "§¹i hiÖp cã thÓ s¾p xÕp l¹i r­¬ng chøa ®å råi!");
	Msg2Player("§¹i hiÖp võa hñy vËt phÈm thµnh c«ng")
end


function trangbixanh()
dofile("script/global/namcung/hotrotanthu/itemblue.lua");		
trangbixanh()	
end
tbDoXanh =
{
[1]=
{
szName = "D©y chuyÒn",
tbEquip =
{
{"Toµn th¹ch h¹ng liªn",0,4,0},
{"Lôc PhØ Thóy Hé Th©n phï ",0,4,1},
}
},
[2]=
{
szName = "¸o gi¸p",
tbEquip =
{
{"ThÊt B¶o Cµ Sa",0,2,0},
{"Ch©n Vò Th¸nh Y",0,2,1},
{"Thiªn NhÉn MËt Trang",0,2,2},
{"Gi¸ng Sa Bµo",0,2,3},
{"§­êng Nghª gi¸p",0,2,4},
{"V¹n L­u Quy T«ng Y",0,2,5},
{"TuyÒn Long bµo",0,2,6},
{"Long Tiªu ®¹o Y",0,2,8},
{"Cöu VÜ B¹ch Hå trang",0,2,9},
{"TrÇm H­¬ng sam",0,2,10},
{"TÝch LÞch Kim Phông gi¸p",0,2,11},
{"V¹n Chóng TÒ T©m Y",0,2,12},
{"L­u Tiªn QuÇn",0,2,13},
}
},
[3]=
{
szName = "§ai l­ng",
tbEquip =
{
{"Thiªn Tµm Yªu §¸i",0,6,0},
{"B¹ch Kim Yªu §¸i",0,6,1},
}
},
[4]=
{
szName = "Giµy",
tbEquip =
{
{"Cöu TiÕt X­¬ng VÜ Ngoa",0,5,0},
{"Thiªn Tµm Ngoa",0,5,1},
{"Kim Lò hµi",0,5,2},
{"Phi Phông Ngoa",0,5,3},
}
},
[5]=
{
szName = "Bao tay",
tbEquip =
{
{"Long Phông HuyÕt Ngäc Tr¹c",0,8,0},
{"Thiªn Tµm Hé UyÓn",0,8,1},
}
},
[6]=
{
szName = "Nãn",
tbEquip =
{
{"Tú L« m·o",0,7,0},
{"Ngò l·o qu¸n",0,7,1},
{"Tu La Ph¸t kÕt",0,7,2},
{"Th«ng Thiªn Ph¸t Qu¸n",0,7,3},
{"YÓm NhËt kh«i",0,7,4},
{"TrÝch Tinh hoµn",0,7,5},
{"¤ Tµm M·o",0,7,6},
{"Quan ¢m Ph¸t Qu¸n",0,7,7},
{"¢m D­¬ng V« Cùc qu¸n",0,7,8},
{"HuyÒn Tª DiÖn Tr¸o",0,7,9},
{"Long HuyÕt §Çu hoµn",0,7,10},
{"Long L©n Kh«i",0,7,11},
{"Thanh Tinh Thoa",0,7,12},
{"Kim Phông TriÓn SÝ ",0,7,13},
}
},
[7]=
{
szName = "Vò khÝ c©n chiÕn",
tbEquip =
{
{"HuyÒn ThiÕt KiÕm",0,0,0},
{"§¹i Phong §ao",0,0,1},
{"Kim C« Bæng",0,0,2},
{"Ph¸ Thiªn KÝch",0,0,3},
{"Ph¸ Thiªn chïy",0,0,4},
{"Th«n NhËt Tr·m",0,0,5},
}
},
[8]=
{
szName = "Ngäc béi",
tbEquip =
{
{"Long Tiªn H­¬ng Nang",0,9,0},
{"D­¬ng Chi B¹ch Ngäc",0,9,1},
}
},
[9]=
{
szName = "Vò khÝ tÇm xa",
tbEquip =
{
{"B¸ V­¬ng Tiªu",0,1,0},
{"To¸i NguyÖt §ao",0,1,1},
{"Khæng T­íc Linh",0,1,2},
}
},
[10]=
{
szName = "NhÉn",
tbEquip =
{
{"Toµn Th¹ch Giíi ChØ ",0,3,0},
}
},
}
function trangbixanh()
	if CalcFreeItemCellCount() < 6 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 6 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
	end
local tbOpt = {}
for i=1, getn(tbDoXanh) do
tinsert(tbOpt, {tbDoXanh[i].szName, laydoxanh1, {i}})
end

tinsert(tbOpt, {"Kªt thóc ®èi tho¹i."})
CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Xin mêi lùa chän trang bÞ:", tbOpt)
end
function laydoxanh1(nType)
local tbEquip = %tbDoXanh[nType]["tbEquip"]
local tbOpt = {}
for i=1, getn(tbEquip) do
tinsert(tbOpt, {tbEquip[i][1], laydoxanh2, {i, nType}})
end

tinsert(tbOpt, {"Kªt thóc ®èi tho¹i."})
local szTitle = format("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Xin mêi lùa chän trang bÞ:")
CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh2(nIndex, nType)
local tbOpt = {}
tinsert(tbOpt, {"Kim", laydoxanh3, {nIndex, nType, 0}})
tinsert(tbOpt, {"Méc", laydoxanh3, {nIndex, nType, 1}})
tinsert(tbOpt, {"Thñy", laydoxanh3, {nIndex, nType, 2}})
tinsert(tbOpt, {"Háa", laydoxanh3, {nIndex, nType, 3}})
tinsert(tbOpt, {"Thæ ", laydoxanh3, {nIndex, nType, 4}})


tinsert(tbOpt, {"Kªt thóc ®èi tho¹i."})
local szTitle = format("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Chän hÖ:")
CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh3(nIndex, nType, nSeries)
g_AskClientNumberEx(0, 10, "Sè l­îng:", {laydoxanh4, {nIndex, nType, nSeries}})
local tbEquipSelect = %tbDoXanh[nType]["tbEquip"][nIndex]
--for i=1,30 do AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 200, 10) end
end
function laydoxanh4(nIndex, nType, nSeries, nCount)
local tbEquipSelect = %tbDoXanh[nType]["tbEquip"][nIndex]
for i=1,10 do AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 100, 10) end
end

function layngua()
	local tbOpt =
	{
		{"Ngùa ChiÕu D¹",chieuda},
		{"Ngùa XÝch Thè",xichtho},
		{"Ngùa §Ých L«",dichlo},
		{"Ngùa TuyÖt ¶nh",tuyetanh},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:§¹i HiÖp CÇn G×?", tbOpt)
end
function chieuda()
AddItem(0,10,5,10,0,0,0)
end
function xichtho()
AddItem(0,10,5,7,0,0,0)
end
function dichlo()
AddItem(0,10,5,9,0,0,0)
end
function tuyetanh()
AddItem(0,10,5,8,0,0,0)
end

function vatpham()
	local tbOpt =
	{
		--{"LÔ Bao Khiªu ChiÕn LÖnh",khieuchienlenh},
		{"S¸t Thñ Gi¶n",satthugian},
		{"LÖnh Bµi Phong L¨ng §é",phonglangdo},
		{"Thiªn C¬ LÖnh",thiencolenh},
		{"Thuèc L¾c Tèng Kim",thuoclactongkim},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:§¹i HiÖp CÇn G×?", tbOpt)
end

function satthugian()
AddItem(6,1,400,0,0,0,0)
end
function phonglangdo()
AddItem(4,489,1,1,0,0)
end
function thuytac()
AddItem(6,1,2745,0,0,0,0)
end
function thiencolenh()
AddItem(6,1,1091,0,0,0,0)
end
function khieuchienlenh()
AddItem(6,1,2006,0,0,0,0)
end


function thuoclactongkim()
	if CheckGioiHan(3997)==1 then
		Say("<color=green>Hæ trî t©n thñ<color>: Ngµy h«m nay b¹n ®· nhËn th­ëng råi. Ngµy mai h·y quay l¹i gÆp ta",0);
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 5 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
	end
	local tbAwardItemmn = {
		{szName="phi tèc",tbProp={6,1,190,1,0,0},nCount=50,nBindState = -2,nExpiredTime = 1440},
		{szName="lÖnh bµi",tbProp={6,1,157,1,0,0},nCount=50,nBindState = -2,nExpiredTime = 1440},
		{szName="chiÕn cæ",tbProp={6,1,156,1,0,0},nCount=50,nBindState = -2,nExpiredTime = 1440},
	}
	tbAwardTemplet:Give(tbAwardItemmn, 1)
end
function CheckGioiHan(TaskDate)
	old_date = GetByte(GetTask(TaskDate), 1)
	old_month = GetByte(GetTask(TaskDate), 2)
	old_year = GetByte(GetTask(TaskDate), 3)

	now_date = tonumber(date("%d"))
	now_month = tonumber(date("%m"))
	now_year = tonumber(date("%y"))

	if old_date == now_date and old_month == now_month and old_year == now_year then
		return 1;
	else
		SetTask(TaskDate, SetByte(GetTask(TaskDate), 1, now_date))
		SetTask(TaskDate, SetByte(GetTask(TaskDate), 2, now_month))
		SetTask(TaskDate, SetByte(GetTask(TaskDate), 3, now_year))	
		return 0;
	end
end

function hkmp()
	local tbOpt =
	{
		{"Ph¸i ThiÕu L©m",thieulam},
		{"Ph¸i Thiªn V­¬ng",thienvuong},
		{"Ph¸i §­êng M«n",duongmon},
		{"Ph¸i Ngò §éc",ngudoc},
		{"Ph¸i Nga My",ngamy},
		{"Ph¸i Thóy Yªn",thuyyen},
		{"Ph¸i Thiªn NhÉn",thiennhan},
		{"Ph¸i C¸i Bang",caibang},
		{"Ph¸i Vâ §ang",vodang},
		{"Ph¸i C«n L«n",conlon},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end
function thieulam()
	local tbOpt =
	{
		{"ThiÕu L©m §ao",thieulamdao},
		{"ThiÕu L©m Bæng",thieulambong},
		{"ThiÕu L©m QuyÒn",thieulamquyen},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function thieulamdao()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tø Kh«ng Gi¸ng Ma Giíi ®ao",tbProp={0,11},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tø Kh«ng Tö Kim Cµ Sa",tbProp={0,12},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="TTø Kh«ng Hé ph¸p Yªu ®¸i",tbProp={0,13},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tø Kh«ng NhuyÔn B× Hé UyÓn",tbProp={0,14},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tø Kh«ng Giíi LuËt Ph¸p giíi",tbProp={0,15},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] Tø Kh«ng §¹t Ma T¨ng Hµi",tbProp={0,776},nCount=1,nQuality = 1,},}, "test", 1);
end

function thieulambong()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Phôc Ma Tö Kim C«n",tbProp={0,6},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Phôc Ma HuyÒn Hoµng Cµ Sa",tbProp={0,7},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Phôc Ma ¤ Kim NhuyÔn §iÒu",tbProp={0,8},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Phôc Ma PhËt T©m NhuyÔn KhÊu",tbProp={0,9},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Phôc Ma Phæ §é T¨ng hµi",tbProp={0,10},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] Phôc Ma V« L­îng Kim Cang UyÓn",tbProp={0,771},nCount=1,nQuality = 1,},}, "test", 1);
end

function thieulamquyen()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Méng Long ChÝnh Hång T¨ng M·o",tbProp={0,1},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Méng Long Kim Ti ChÝnh Hång Cµ Sa",tbProp={0,2},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Méng Long HuyÒn Ti Ph¸t ®¸i",tbProp={0,3},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Méng Long PhËt Ph¸p HuyÒn Béi",tbProp={0,4},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Méng Long §¹t Ma T¨ng hµi",tbProp={0,5},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] Méng Long Tö Kim B¸t Nh· Giíi",tbProp={0,769},nCount=1,nQuality = 1,},}, "test", 1);
end

function thienvuong()
	local tbOpt =
	{
		{"Thiªn V­¬ng Chïy",thienvuongchuy},
		{"Thiªn V­¬ng Th­¬ng",thienvuongthuong},
		{"Thiªn V­¬ng §ao",thienvuongdao},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function thienvuongchuy()
if CalcFreeItemCellCount() < 1 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="H¸m Thiªn Kim Hoµn §¹i Nh·n ThÇn Chïy",tbProp={0,16},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="H¸m Thiªn Vò ThÇn T­¬ng Kim Gi¸p",tbProp={0,17},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="H¸m Thiªn Uy Vò Thóc yªu ®¸i",tbProp={0,18},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="H¸m Thiªn Hæ ®Çu KhÈn Thóc UyÓn",tbProp={0,19},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="H¸m Thiªn Thõa Long ChiÕn Ngoa",tbProp={0,20},nCount=1,nQuality = 1,},}, "test", 1);
end

function thienvuongthuong()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="KÕ NghiÖp B«n L«i Toµn Long th­¬ng",tbProp={0,21},nCount=1,nQuality = 1,},}, "test", 1);
tbAwardTemplet:GiveAwardByList({{szName="KÕ NghiÖp HuyÒn Vò Hoµng Kim Kh¶i",tbProp={0,22},nCount=1,nQuality = 1,},}, "test", 1);
tbAwardTemplet:GiveAwardByList({{szName="KÕ NghiÖp B¹ch Hæ V« Song khÊu",tbProp={0,23},nCount=1,nQuality = 1,},}, "test", 1);
tbAwardTemplet:GiveAwardByList({{szName="KÕ NghiÖp HáaV©n Kú L©n Thñ ",tbProp={0,24},nCount=1,nQuality = 1,},}, "test", 1);
tbAwardTemplet:GiveAwardByList({{szName="KÕ NghiÖp Chu T­íc L¨ng V©n Ngoa",tbProp={0,25},nCount=1,nQuality = 1,},}, "test", 1);
end

function thienvuongdao()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Ngù Long L­îng Ng©n B¶o ®ao",tbProp={0,26},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ngù Long ChiÕn ThÇn Phi Qu¶i gi¸p",tbProp={0,27},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ngù Long Thiªn M«n Thóc Yªu hoµn",tbProp={0,28},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ngù Long TÊn Phong Hé yÓn",tbProp={0,29},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ngù Long TuyÖt MÖnh ChØ hoµn",tbProp={0,30},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] Ngù Long TÊn Phong Ph¸t C¬",tbProp={0,793},nCount=1,nQuality = 1,},}, "test", 1);
end

function duongmon()
	local tbOpt =
	{
		{"§­êng M«n Ná",duongmonno},
		{"§­êng M«n Phi §ao",duongmonphidao},
		{"§­êng M«n Phi Tiªu",duongmonphitieu},
		--{"§­êng M«n BÉy",duongmonbay},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function duongmonno()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Thiªn Quang Hoa Vò M¹n Thiªn",tbProp={0,76},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Thiªn Quang §Þnh T©m Ng­ng ThÇn Phï ",tbProp={0,77},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Thiªn Quang S©m La Thóc §¸i",tbProp={0,78},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Thiªn Quang Song B¹o Hµn ThiÕt Tr¹c",tbProp={0,79},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Thiªn Quang Thóc Thiªn Ph­îc §Þa Hoµn",tbProp={0,80},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] Thiªn Quang §Þa Hµnh Thiªn Lý  Ngoa",tbProp={0,843},nCount=1,nQuality = 1,},}, "test", 1);
end

function duongmonphidao()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="B¨ng Hµn §¬n ChØ Phi §ao",tbProp={0,71},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="B¨ng Hµn HuyÒn Y Thóc Gi¸p",tbProp={0,72},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="B¨ng Hµn T©m TiÔn Yªu KhÊu",tbProp={0,73},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="B¨ng Hµn HuyÒn Thiªn B¨ng Háa Béi",tbProp={0,74},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="B¨ng Hµn NguyÖt ¶nh Ngoa",tbProp={0,75},nCount=1,nQuality = 1,},}, "test", 1);
end

function duongmonphitieu()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="S©m Hoµng Phi Tinh §o¹t Hån",tbProp={0,81},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="S©m Hoang KimTiÒn Liªn Hoµn Gi¸p",tbProp={0,82},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="S©m Hoang Hån Gi¶o Yªu Thóc",tbProp={0,83},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="S©m Hoang HuyÒn ThiÕt T­¬ng Ngäc Béi",tbProp={0,84},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="S©m Hoang Tinh VÉn Phi Lý ",tbProp={0,85},nCount=1,nQuality = 1,},}, "test", 1);
end

function duongmonbay()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§Þa Ph¸ch H¾c DiÖm Xung Thiªn Liªn",tbProp={0,87},nCount=7,nQuality = 1,nExpiredTime=24*60*365},}, "test", 1);
end

function ngudoc()
	local tbOpt =
	{
		{"Ngò §éc §ao",ngudocdao},
		{"Ngò §éc Ch­ëng",ngudocchuong},
		--{"Ngò §éc Bïa",ngudocbua},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function ngudocdao()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh ¶o Tµ S¸t §éc NhËn",tbProp={0,61},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh ¶o U §éc ¸m Y",tbProp={0,62},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh ¶o §éc YÕt ChØ Hoµn",tbProp={0,63},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh ¶o Hñ Cèt Hé uyÓn",tbProp={0,64},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh ¶o Song Hoµn Xµ Hµi",tbProp={0,65},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] Minh Hoan Song Hoµn Xµ KhÊu",tbProp={0,829},nCount=1,nQuality = 1,},}, "test", 1);
end

function ngudocchuong()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="U Lung Kim Xµ Ph¸t ®¸i ",tbProp={0,56},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="U Lung XÝch YÕt MËt trang ",tbProp={0,57},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="U Lung Thanh Ng« TriÒn yªu",tbProp={0,58},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="U Lung Ng©n ThÒm Hé UyÓn",tbProp={0,59},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="U Lung MÆc Thï NhuyÔn Lý ",tbProp={0,60},nCount=1,nQuality = 1,},}, "test", 1);
end

function ngudocbua()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Chó Ph­îc B¨ng Háa Thùc Cèt Ngoa",tbProp={0,70},nCount=7,nQuality = 1,nExpiredTime=24*60*365},}, "test", 1);
end

function ngamy()
	local tbOpt =
	{
		{"Nga My KiÕm",ngamykiem},
		{"Nga My Ch­ëng",ngamychuong},
		--{"Nga My Buff",ngamybuff},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function ngamykiem()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="V« Gian û Thiªn KiÕm",tbProp={0,31},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="V« Gian Thanh Phong Truy Y",tbProp={0,32},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="V« Gian PhÊt V©n Ti ®¸i",tbProp={0,33},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="V« Gian CÇm VËn Hé UyÓn",tbProp={0,34},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="V« Gian B¹ch Ngäc Bµn ChØ ",tbProp={0,35},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] V« Gian Thanh Phong NhuyÔn KÞch",tbProp={0,796},nCount=1,nQuality = 1,},}, "test", 1);

end

function ngamychuong()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="V« Ma Ma Ni qu¸n",tbProp={0,36},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="V« Ma Tö Kh©m Cµ Sa",tbProp={0,37},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="V« Ma B¨ng Tinh ChØ Hoµn",tbProp={0,38},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="V« Ma TÈy T­îng Ngäc KhÊu ",tbProp={0,39},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="V« Ma Hång Truy NhuyÔn Th¸p hµi",tbProp={0,40},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] V« YÓm Thu Thñy L­u Quang §¸i",tbProp={0,801},nCount=1,nQuality = 1,},}, "test", 1);
end

function ngamybuff()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="V« TrÇn PhËt T©m Tõ H÷u Yªu Phèi",tbProp={0,44},nCount=15,nQuality = 1,nExpiredTime=24*60*365},}, "test", 1);
end

function thuyyen()
	local tbOpt =
	{
		{"Thóy Yªn §ao",thuyyendao},
		{"Thóy Yªn Song §ao",thuyyensongdao},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function thuyyendao()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tª Hoµng Phông Nghi ®ao",tbProp={0,46},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tª Hoµng TuÖ T©m Khinh Sa Y",tbProp={0,47},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tª Hoµng Phong TuyÕt B¹ch V©n Thóc §¸i",tbProp={0,48},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tª Hoµng B¨ng Tung CÈm uyÓn",tbProp={0,49},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tª Hoµng Thóy Ngäc ChØ Hoµn",tbProp={0,50},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] Tª Hoµng HuÖ T©m Tr­êng Sinh KhÊu",tbProp={0,811},nCount=1,nQuality = 1,},}, "test", 1);
end

function thuyyensongdao()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao ",tbProp={0,51},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="BÝch H¶i Hoµn Ch©u Vò Liªn",tbProp={0,52},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="BÝch H¶i Hång Linh Kim Ti ®¸i",tbProp={0,53},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="BÝch H¶i Hång L¨ng Ba",tbProp={0,54},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="BÝch H¶i Khiªn TÕ ChØ hoµn",tbProp={0,55},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] BÝch H¶i Hoµn Ch©u Tuyªn Thanh C©n",tbProp={0,816},nCount=1,nQuality = 1,},}, "test", 1);
end

function vodang()
	local tbOpt =
	{
		{"Vâ §ang KiÕm",vodangkiem},
		{"Vâ §ang KhÝ",vodangkhi},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function vodangkiem()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="CËp Phong Ch©n Vò KiÕm",tbProp={0,121},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="CËp Phong Tam Thanh Phï",tbProp={0,122},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="CËp Phong HuyÒn Ti Tam §o¹n cÈm",tbProp={0,123},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="CËp Phong Thóy Ngäc HuyÒn Hoµng Béi",tbProp={0,124},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="CËp Phong Thanh Tïng Ph¸p giíi",tbProp={0,125},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] CËp Phong Thóy Ngäc HuyÒn Hoµng UyÓn",tbProp={0,888},nCount=1,nQuality = 1,},}, "test", 1);
end

function vodangkhi()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="L¨ng Nh¹c Th¸i Cùc KiÕm",tbProp={0,116},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="L¨ng Nh¹c V« Ng· ®¹o bµo",tbProp={0,117},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="L¨ng Nh¹c Né L«i Giíi",tbProp={0,118},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi",tbProp={0,119},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="L¨ng Nh¹c Thiªn §Þa HuyÒn Hoµng giíi",tbProp={0,120},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] L¨ng Nh¹c V« Ng· Thóc §¸i",tbProp={0,881},nCount=1,nQuality = 1,},}, "test", 1);
end

function conlon()
	local tbOpt =
	{
		{"C«n L«n §ao",conlondao},
		{"C«n L«n KiÕm",conlonkiem},
		--{"C«n L«n Bïa",conlonbua},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function conlondao()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="S­¬ng Tinh Thiªn Niªn Hµn ThiÕt",tbProp={0,126},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="S­¬ng Tinh Ng¹o S­¬ng ®¹o bµo",tbProp={0,127},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="S­¬ng Tinh Thanh Phong Lò ®¸i",tbProp={0,128},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="S­¬ng Tinh Thiªn Tinh B¨ng Tinh thñ ",tbProp={0,129},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="S­¬ng Tinh Phong B¹o chØ hoµn",tbProp={0,130},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] S­¬ng Tinh L­u Tinh C¶n NguyÖt KhÊu",tbProp={0,891},nCount=1,nQuality = 1,},}, "test", 1);
end

function conlonkiem()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="L«i Khung Hµn Tung B¨ng B¹ch quan",tbProp={0,131},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="L«i Khung Thiªn §Þa Hé phï",tbProp={0,132},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="L«i Khung Phong L«i Thanh CÈm ®¸i",tbProp={0,133},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="L«i Khung Linh Ngäc UÈn L«i",tbProp={0,134},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="L«i Khung Cöu Thiªn DÉn L«i giíi",tbProp={0,135},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] L«i Khung Linh Ngäc Èn L«i UyÓn",tbProp={0,899},nCount=1,nQuality = 1,},}, "test", 1);
end

function conlonbua()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Vô ¶o B¾c Minh §¹o qu¸n ",tbProp={0,136},nCount=8,nQuality = 1,nExpiredTime=24*60*365},}, "test", 1);
end

function caibang()
	local tbOpt =
	{
		{"C¸i Bang Rång",caibangrong},
		{"C¸i Bang Bæng",caibangbong},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function caibangrong()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§ång Cõu Phi Long §Çu hoµn",tbProp={0,91},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§ång Cõu Gi¸ng Long C¸i Y",tbProp={0,92},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§ång Cõu TiÒm Long Yªu §¸i",tbProp={0,93},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§ång Cõu Kh¸ng Long Hé UyÓn",tbProp={0,94},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§ång Cõu KiÕn Long Ban ChØ",tbProp={0,95},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] §ång Cõu Ngù Long Ngäc Béi",tbProp={0,855},nCount=1,nQuality = 1,},}, "test", 1);
end

function caibangbong()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§Þch Kh¸i Lôc Ngäc Tr­îng",tbProp={0,96},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§Þch Kh¸i Cöu §¹i C¸i Y",tbProp={0,97},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§Þch Kh¸i TriÒn M·ng yªu ®¸i",tbProp={0,98},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§Þch Kh¸i CÈu TÝch B× Hé uyÓn",tbProp={0,99},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§Þch Kh¸i Th¶o Gian Th¹ch giíi",tbProp={0,100},nCount=1,nQuality = 1,},}, "test", 1);
end

function thiennhan()
	local tbOpt =
	{
		{"Thiªn NhÉn §ao",thiennhandao},
		{"Thiªn NhÉn KÝch",thiennhankich},
		--{"Thiªn NhÉn Bïa",thiennhanbua},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:Mêi B¹n Chän Ph¸i !", tbOpt)
end

function thiennhandao()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Ma ThÞ LiÖt DiÖm Qu¸n MiÖn",tbProp={0,111},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ma ThÞ LÖ Ma PhÖ T©m Liªn",tbProp={0,112},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ma ThÞ NghiÖp Háa U Minh Giíi",tbProp={0,113},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ma ThÞ HuyÕt Ngäc ThÊt S¸t Béi",tbProp={0,114},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ma ThÞ s¬n  H¶i Phi Hång Lý",tbProp={0,115},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] Ma ThÞ LÖ Ma PhÖ T©m §¸i",tbProp={0,876},nCount=1,nQuality = 1,},}, "test", 1);
end

function thiennhankich()
if CalcFreeItemCellCount() < 50 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 50 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Ma S¸t Quû Cèc U Minh Th­¬ng",tbProp={0,101},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ma S¸t Tµn D­¬ng ¶nh HuyÕt Gi¸p",tbProp={0,102},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ma S¸t XÝch Ký Táa Yªu KhÊu",tbProp={0,103},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ma S¸t Cö Háa Liªu Thiªn uyÓn",tbProp={0,104},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Ma S¸t V©n Long Thæ Ch©u giíi",tbProp={0,105},nCount=1,nQuality = 1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="[H¹n chÕ thêi gian] Ma S¸t Cö Háa Liªu Thiªn Hoµn",tbProp={0,868},nCount=1,nQuality = 1,},}, "test", 1);
end

function thiennhanbua()
if CalcFreeItemCellCount() < 5 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 5 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Ma Hoµng Kim Gi¸p Kh«i",tbProp={6,1,2126,1,0,0},nCount=1,nExpiredTime=24*60},}, "test", 1);
end
--------------------------------------------------------------------------------------
function testgame()
	local tbOpt =
	{
		{"NhËn TiÒn §ång",tiendong},
		{"NhËn Ngùa Quý",nguaquy},
		{"NhËn Trang BÞ HKMP",hkmp},
		{"NhËn Vinh DiÖu",vinhdieu},
		{"NhËn VËt PhÈm",vatpham2},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>: §¹i HiÖp CÇn G× ?", tbOpt)
end

function nguaquy()
	local tbOpt =
	{
		{"Ngùa B«n Tiªu",bontieu},
		{"Ngùa Phi V©n",phivan},
		{"Ngùa Phiªn Vò",phienvu},
		{"Ngùa XÝch Long C©u",xichlongcau},
		{"Ngùa Siªu Quang",sieuquang},
		{"Ngùa H·n HuyÕt Long C©u",hanhuyetlongcau},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:§¹i HiÖp CÇn G×?", tbOpt)
end
function bontieu()
AddItem(0,10,6,10,0,0,0)
end
function phivan()
AddItem(0,10,8,10,0,0,0)
end
function phienvu()
AddItem(0,10,7,10,0,0,0)
end
function xichlongcau()
AddItem(0,10,9,9,0,0,0)
end
function sieuquang()
AddItem(0,10,13,9,0,0,0)
end
function hanhuyetlongcau()
AddItem(0,10,18,10,0,0,0)
end

function vinhdieu()
if CalcFreeItemCellCount() < 20 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 20 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Vinh DiÖu Chi Y",tbProp={0,214},nCount=1,nQuality = 1},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh ChuÈn Chi Ngoa",tbProp={0,215},nCount=1,nQuality = 1},}, "test", 1);
end

function vatpham2()
	local tbOpt =
	{
		{"LÖnh Bµi Thñy TÆc",thuytac},
		{"Thñy Tinh",thuytinh},
		{"LÔ Bao TÝch Lòy §iÓm Tèng Kim",lebaotongkim},
		{"VËt PhÈm Ðp Ngùa",epngua},
		{"Phóc Duyªn",phucduyen},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Hµo KiÖt Vâ L©m .Com<color>:§¹i HiÖp CÇn G×?", tbOpt)
end

function thuytinh()
if CalcFreeItemCellCount() < 10 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Lam Thñy Tinh",tbProp={4,238,1,0,0,0},nCount=2,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tö Thñy Tinh",tbProp={4,239,1,0,0,0},nCount=2,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Lôc Thñy Tinh",tbProp={4,240,1,0,0,0},nCount=2,},}, "test", 1);
end

function lebaotongkim()
if CalcFreeItemCellCount() < 15 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 15 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Lam Thñy Tinh",tbProp={6,1,4382,1,0,0,0},nCount=10,},}, "test", 1);
end

function phucduyen()
if CalcFreeItemCellCount() < 20 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 20 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Phóc Duyªn TiÓu",tbProp={6,1,122,1,0,0,0},nCount=5,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Phóc Duyªn Trung",tbProp={6,1,123,1,0,0,0},nCount=5,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Phóc Duyªn §¹i",tbProp={6,1,124,1,0,0,0},nCount=5,},}, "test", 1);
end

function epngua()
if CalcFreeItemCellCount() < 20 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 20 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="B¾c §Èu ThuÇn M· ThuËt",tbProp={6,1,4381,1,0,0,0},nCount=10,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Cá T­¬i",tbProp={6,1,4378,1,0,0,0},nCount=10,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="D©y Thõng",tbProp={6,1,4379,1,0,0,0},nCount=10,},}, "test", 1);
end

function nhandaithanhbikip()
if CalcFreeItemCellCount() < 5 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 5 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="S¸ch kü n¨ng cÊp 90",tbProp={6,1,2426,1,0,0,0},nCount=1,},}, "test", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§¹i Thµnh BÝ KÝp 90",tbProp={6,1,2424,1,0,0,0},nCount=1,},}, "test", 1);
end

