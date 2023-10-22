IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")
--Œ‰¡÷»Ÿ”˛¡Ó µÙ¬‰
--honour
DROPRATE_BOSS_HONOURRATE = {
		["V≠¨ng T∏ "] = {350, 136},--739
		["Huy“n Gi∏c ßπi S≠ "] = {350, 134},--740
		["ß≠Íng B t Nhi‘m"] = {350, 149},--741
		["Bπch Doanh Doanh"] = {350, 138},--742
		["Thanh Tuy÷t S≠ Th∏i"] = {350, 137},--743
		["Y™n Hi”u Tr∏i"] = {350, 168},--744
		["Hµ Nh©n Ng∑ "] = {350, 171},--
		["ß¨n T≠ Nam"] = {350, 171},--746745
		["Tuy“n C¨ Tˆ "] = {350, 144},--747
		--["∫´√…"] = {},--748
		["%ÃÏÕı%"] = {350, 250},--1193
		["¬“ ¿”¢∫¿§≤èù"] = {350, 250},--1194
		["◊∑√¸æ” ø"] = {350, 250},--1195
		["…Òœ…“≤≤ªπ˝»Á¥À"] = {350, 250},--1196
		["∂Ï’Ω—™"] = {350, 250},--1197
		["∫˚µ˚±¥±¥"] = {350, 250},--1198
		["”Ò∫£¬•§ŒŒÕ¸Œ“"] = {350, 250},--1199
		["°·«Âœ„°©°∫ÃÏ»Ã°ª"] = {350, 250},--1200
		["π≈µ¿∑Á"] = {350, 250},--1201
		["»«ªµƒ≈Æ»À"] = {350, 250},--1202
		["ßπi M∑ HÊ "] = {0, 250},
		["Gia LuÀt Tﬁ Ly"] = {350, 130},--563
		["Hoµn Nhan Tuy’t Y"] = {400, 130},--564
		["ßoan MÈc Du÷ "] = {400, 127},--565
		["CÊ B∏ch"] = {350, 141},--566
		["ßπo Thanh Ch©n Nh©n"] = {300, 130},--562
		["Chung Linh TÛ "] = {400, 130},--567
		["Hµ Linh Phi™u"] = {400, 130},--568
		["Lam Y Y"] = {250, 176},--582
		["Mπnh Th≠¨ng L≠¨ng"] = {300, 180},--583
		--[] = {},
}
HONOURID = {1257, 1294}
SIGNET_DROPCOUNT = 10
TSK_PLAYER_BOSSKILLED = 2598 -- ÕÊº“ª˜…±BOSS ˝¡øÕ≥º∆
--DC kinh nghi÷m boss HK - Modified By DinhHQ - 20111007
--KILLBOSSEXPAWARD = 20000000	-- ª˜…±bossΩ±¿¯
--KILLBOSSNEAREXPAWARD = 12000000	-- ª˜…±boss∏ΩΩ¸Ω±¿¯
KILLBOSSEXPAWARD = 10000000
KILLBOSSNEAREXPAWARD = 5000000
--Renew boss award - Modified by DinhHQ - 20120319
local tbVnNewItemDropAward = {
	{{szName="ßπi l˘c hoµn l‘ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=60},},
	{{szName="Phi tËc hoµn l‘ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=60},},
	{{szName="T©m T©m T≠¨ng ∏nh phÔ",tbProp={6,1,18,1,0,0},nCount=1,nRate=60},},
	{{szName="Tˆ ThÒy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Thi™n s¨n  B∂o LÈ",tbProp={6,1,72,1,0,0},nCount=3,nRate=60},},
	{{szName="Lam ThÒy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
	{{szName="LÙc ThÒy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Bµn Nh≠Óc T©m Kinh",tbProp={6,1,12,1,0,0},nCount=2,nRate=80},},
	{{szName="Tinh HÂng B∂o Thπch",tbProp={4,353,1,1,0,0},nCount=2,nRate=80},},
	{{szName="Ti™n Th∂o LÈ Æ∆c bi÷t",tbProp={6,1,1181,1,0,0},nCount=2,nRate=50},},
	{{szName="Ti™n Th∂o LÈ ",tbProp={6,1,71,1,0,0},nCount=1,nRate=50},},
	{{szName="Thi’t La H∏n",tbProp={6,1,23,1,0,0},nCount=5,nExpiredTime=20160,		nRate=5},},
	{{szName="T»y TÒy Kinh",tbProp={6,1,22,1,0,0},nCount=2,nExpiredTime=20160,					nRate=1},},
	{{szName="V‚ L©m MÀt Tﬁch",tbProp={6,1,26,1,0,0},nCount=2,nExpiredTime=20160,					nRate=1},},
	{{szName="ßπi Thµnh B› K›p 90 vµ 120",tbProp={6,1,random(2424,2425),1,0,0},nCount=1,			nRate=0.5},},	
	{{szName="B› quy’t k¸ n®ng c p 120",tbProp={6,1,1125,1,0,0},nCount=1,					nRate=0.5},},

	{{szName = "An Bang B®ng Tinh Thπch Hπng Li™n",tbProp = {164,167},nCount = 1,				nRate =0.1,nQuality = 1,},},
	{{szName = "Hi÷p CËt Thi’t Huy’t Sam",tbProp = {0,186},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "Hi÷p CËt ßa T◊nh Hoµn",tbProp = {0,187},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "Hi÷p CËt ßan T©m GiÌi",tbProp = {0,188},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "Hi÷p CËt T◊nh ˝ K’t",tbProp = {0,189},nCount = 1, 						nRate = 0.3,nQuality = 1, },},
	{{szName = "Nhu T◊nh C©n QuËc Ngh÷ Th≠Íng",tbProp = {0,190},nCount = 1,					nRate = 0.3,nQuality = 1, },},
	{{szName = "Nhu T◊nh ThÙc N˜ Hπng Li™n",tbProp = {0,191},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "Nhu T◊nh PhÙng Nghi Gi Ìi Chÿ",tbProp = {0,192},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "Nhu T◊nh Tu÷ T©m Ng‰c BÈi",tbProp = {0,193},nCount = 1, 					nRate = 0.3,nQuality = 1, },},

	{{szName = "ßﬁnh QuËc",tbProp = {0,random(159,163)},nCount = 1,					nRate = 0.8,nQuality = 1, },},

	{{szName = "Huy“n Thi’t Ki’m",tbProp = {0,0,0,random(5,10),random(0,4),25},tbParam = {10,10,10,10,10,10}, nCount=1,	nRate=50},},
	{{szName = "ßπi Phong ßao",tbProp = {0,0,1,random(5,10),random(0,4),25},tbParam = {10,10,10,10,10,10},nCount=1,		nRate=50},},
	{{szName = "Kim C´ BÊng",tbProp = {0,0,2,random(5,10),random(0,4),25},tbParam = {10,10,10,10,10,10},nCount=1,		nRate=50},},
	{{szName = "Ph∏ Thi™n K›ch",tbProp = {0,0,3,random(5,10),random(0,4),25},tbParam = {10,10,10,10,10,10},nCount=1,		nRate=50},},
	{{szName = "Ph∏ Thi™n Chu˙",tbProp = {0,0,4,random(5,10),random(0,4),25},tbParam = {10,10,10,10,10,10},nCount=1,		nRate=50},},
	{{szName = "Th´n NhÀt Tr∂m",tbProp = {0,0,5,random(5,10),random(0,4),25},tbParam = {10,10,10,10,10,10},nCount=1,		nRate=50},},
	{{szName = "B∏ V≠¨ng Ti™u",tbProp = {0,1,0,random(5,10),random(0,4),25},tbParam = {10,10,10,10,10,10},nCount=1,		nRate=50},},
	{{szName = "To∏i Nguy÷t ßao",tbProp = {0,1,1,random(5,10),random(0,4),25},tbParam = {10,10,10,10,10,10},nCount=1,	nRate=50},},
	{{szName = "KhÊng T≠Ìc Linh",tbProp = {0,1,2,random(5,10),random(0,4),25},tbParam = {10,10,10,10,10,10},nCount=1,		nRate=50},},

}

local tbHKMPCaoCap = 
{	
	[1]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(38,39),1,0,0},nCount=1,nRate=10},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Thi™n V≠¨ng",tbProp={0,random(20,23)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Thi™n V≠¨ng",tbProp={0,26},nCount=1,nQuality = 1,			nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Thi™n V≠¨ng",tbProp={0,random(28,29)},nCount=1,nQuality = 1,		nRate=0.0001,},

			{szName="M∂nh Hoµng Kim",tbProp={4,random(594,603),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1140,1146),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1031,1037),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(603,612),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(795,801),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1146,1152),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(612,621),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1037,1043),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1152,1158),1,0,0},nCount=1,					nRate=10,},
	},
	[2]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(56,58),1,0,0},nCount=1,nRate=10},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Thi’u l©m",tbProp={0,random(1,15)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(998,1004),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(789,795),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1122,1128),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(576,585),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1128,1134),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1019,1025),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(585,594),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1134,1140),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1025,1031),1,0,0},nCount=1,					nRate=10,},
	},
	[3]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(27,28),1,0,0},nCount=1,nRate=10},
			{szName="B› k›p 90",tbProp={6,1,random(45,46),1,0,0},nCount=1,nRate=10},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i ß≠Íng M´n",tbProp={0,random(71,73)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i ß≠Íng M´n",tbProp={0,75},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i ß≠Íng M´n",tbProp={0,random(86,87)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i ß≠Íng M´n",tbProp={0,89},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i ß≠Íng M´n",tbProp={0,81},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i ß≠Íng M´n",tbProp={0,85},nCount=1,nQuality = 1,		nRate=0.0001,},

			{szName="M∂nh Hoµng Kim",tbProp={4,random(980,989),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1073,1079),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1206,1212),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(657,666),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(989,995),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1212,1218),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(666,675),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1218,1224),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1079,1085),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1085,1091),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(843,849),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1224,1230),1,0,0},nCount=1,					nRate=10,},
	},
	[4]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(47,48),1,0,0},nCount=1,nRate=10},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i NgÚ ßÈc",tbProp={0,random(61,62)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i NgÚ ßÈc",tbProp={0,56},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i NgÚ ßÈc",tbProp={0,60},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i NgÚ ßÈc",tbProp={0,random(66,67)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i NgÚ ßÈc",tbProp={0,69},nCount=1,nQuality = 1,		nRate=0.0001,},

			{szName="M∂nh Hoµng Kim",tbProp={4,random(825,831),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1188,1194),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(831,837),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(648,657),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1061,1067),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1194,1200),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1067,1073),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(837,843),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1200,1206),1,0,0},nCount=1,					nRate=10,},
	},
	[5]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(42,43),1,0,0},nCount=1,nRate=10},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Nga Mi",tbProp={0,random(31,33)},nCount=1,nQuality = 1,		nRate=0.0001,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Nga Mi",tbProp={0,random(39,40)},nCount=1,nQuality = 1,		nRate=0.0001,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Nga Mi",tbProp={0,random(41,42)},nCount=1,nQuality = 1,		nRate=0.0001,},	

			{szName="M∂nh Hoµng Kim",tbProp={4,random(621,630),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1158,1164),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1043,1049),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1164,1170),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(801,807),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(807,813),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1170,1176),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(813,819),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1049,1055),1,0,0},nCount=1,					nRate=10,},

	},
	[6]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(40,41),1,0,0},nCount=1,nRate=10},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i ThÛy Y™n",tbProp={0,random(46,49)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i ThÛy Y™n",tbProp={0,random(51,52)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i ThÛy Y™n",tbProp={0,54},nCount=1,nQuality = 1,		nRate=0.0001,},

			{szName="M∂nh Hoµng Kim",tbProp={4,random(630,639),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1176,1182),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1055,1061),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(639,648),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1182,1188),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(819,825),1,0,0},nCount=1,					nRate=10,},
	},
	[7]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(54,55),1,0,0},nCount=1,nRate=10},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i C∏i Bang",tbProp={0,random(92,94)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i C∏i Bang",tbProp={0,random(96,99)},nCount=1,nQuality = 1,		nRate=0.0001,},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i C∏i Bang",tbProp={0,random(91,100)},nCount=1,nQuality = 1,		nRate=0.0001,},

			{szName="M∂nh Hoµng Kim",tbProp={4,random(849,855),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1230,1236),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(855,861),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(675,684),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1236,1242),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1091,1097),1,0,0},nCount=1,					nRate=10,},
	},
	[8]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(35,36),1,0,0},nCount=1,nRate=10},		
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Thi™n Nh…n",tbProp={0,random(107,108)},nCount=1,nQuality = 1,		nRate=0.0001,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Thi™n Nh…n",tbProp={0,110},nCount=1,nQuality = 1,		nRate=0.01,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Thi™n Nh…n",tbProp={0,random(101,102)},nCount=1,nQuality = 1,		nRate=0.0001,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Thi™n Nh…n",tbProp={0,112},nCount=1,nQuality = 1,		nRate=0.01,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i Thi™n Nh…n",tbProp={0,random(114,115)},nCount=1,nQuality = 1,		nRate=0.0001,},	

			{szName="M∂nh Hoµng Kim",tbProp={4,random(684,693),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1097,1103),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1254,1260),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(861,867),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(867,873),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1242,1248),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1103,1109),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1248,1254),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(873,879),1,0,0},nCount=1,					nRate=10,},
	},
	[9]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(33,34),1,0,0},nCount=1,nRate=10},
			{szName="Trang Bi Hoµng Kim M´n Ph∏i C´n L´n",tbProp={0,random(136,137)},nCount=1,nQuality = 1,		nRate=0.0001,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i C´n L´n",tbProp={0,139},nCount=1,nQuality = 1,		nRate=0.0001,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i C´n L´n",tbProp={0,132},nCount=1,nQuality = 1,		nRate=0.0001,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i C´n L´n",tbProp={0,random(126,129)},nCount=1,nQuality = 1,		nRate=0.0001,},	

			{szName="M∂nh Hoµng Kim",tbProp={4,random(702,711),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1272,1278),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1109,1115),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1004,1010),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(891,897),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1278,1284),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(897,903),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1284,1290),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1115,1121),1,0,0},nCount=1,					nRate=10,},
	},
	[10]=
	{
			{szName="B› k›p 90",tbProp={6,1,random(50,52),1,0,0},nCount=1,nRate=10},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i V‚ ßang",tbProp={0,random(121,123)},nCount=1,nQuality = 1,		nRate=0.0001,},	
			{szName="Trang Bi Hoµng Kim M´n Ph∏i V‚ ßang",tbProp={0,random(118,119)},nCount=1,nQuality = 1,		nRate=0.0001,},	

			{szName="M∂nh Hoµng Kim",tbProp={4,random(1010,1019),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1260,1266),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(879,885),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(693,702),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(885,891),1,0,0},nCount=1,					nRate=10,},
			{szName="M∂nh Hoµng Kim",tbProp={4,random(1266,1272),1,0,0},nCount=1,					nRate=10,},
	},

}
function OnDeath( nNpcIndex )
	local x, y, world = GetNpcPos(nNpcIndex);
	local maxcount = SIGNET_DROPCOUNT;
	local _, nTongID = GetTongName();
	if (nTongID > 0) then
		if (IsDoubledMoneyBox(nTongID)) then
			maxcount = getSignetDropRate(SIGNET_DROPCOUNT);
		end;
	end;
	local nNpcID = GetNpcParam(nNpcIndex,1);
	local nCurtime = GetCurServerTime() + 7 * 24 *60 * 60
	local nYear = tonumber(FormatTime2String("%Y", nCurtime))
	local nMonth = tonumber(FormatTime2String("%m", nCurtime))
	local nDay = tonumber(FormatTime2String("%d", nCurtime))
	--B· ph«n th≠Îng vÀt ph»m khi ti™u di÷t boss - Modified by DinhHQ - 20111012
--	for i = 1, maxcount do
--		local nItemIdx = DropItem(world, x, y, PlayerIndex, 6, 1, 1094, 1, 0, 0, 0, 0, 0, 0, 0, 0);
--		SetSpecItemParam(nItemIdx, 1, nCurtime);
--		SetSpecItemParam(nItemIdx, 2, nYear)
--		SetSpecItemParam(nItemIdx, 3, nMonth)
--		SetSpecItemParam(nItemIdx, 4, nDay)
--		SyncItem(nItemIdx);
--	end;
	--Renew boss award - Modified by DinhHQ - 20120319
		       if nNpcID== 739 or 	nNpcID== 566   then STTID= 1
		elseif nNpcID== 740 or	nNpcID== 1365 then STTID= 2 
		elseif nNpcID== 741 or	nNpcID== 1366 then STTID= 3 
		elseif nNpcID== 742 or 	nNpcID== 582   then STTID= 4
		elseif nNpcID== 743 or 	nNpcID== 568   then STTID= 5 
		elseif nNpcID== 744 or 	nNpcID== 567   then STTID= 6 
		elseif nNpcID== 745 or 	nNpcID== 583   then STTID= 7 
		elseif nNpcID== 563 or	nNpcID== 748 	or nNpcID== 565 	then STTID= 8
		elseif nNpcID== 747 or 	nNpcID== 1368 then STTID= 9
		elseif nNpcID== 1367 or 	nNpcID== 562   then STTID= 10 
	end
--	local nzRate = random(1,100)
--	local ListItemcaocap=%tbHKMPCaoCap[STTID];
--	if nzRate > 90 then
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,ListItemcaocap,format("killed_%s",GetNpcName(nNpcIndex)),1)	
--	end
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbVnNewItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	
	-- Œ‰¡÷»Ÿ”˛¡Ó≈∆µÙ¬‰
	if (GetProductRegion() == "cn" or GetProductRegion() == "cn_ib") then
		local szNpcName = GetNpcName(nNpcIndex);
		if (DROPRATE_BOSS_HONOURRATE[szNpcName]) then
			for i = 1, getn(DROPRATE_BOSS_HONOURRATE[szNpcName]) do
				local nrate = random(1, 10000);
				if (nrate < DROPRATE_BOSS_HONOURRATE[szNpcName][i]) then
				DropItem(world, x, y, PlayerIndex, 6, 1, HONOURID[i], 1, 0, 0, 0, 0, 0, 0, 0, 0);
				end;
			end;
		end;
	end;
	
	-- ∏¯…±µÙBOSSµƒ»ÀªÚ∂”ŒÈΩ±¿¯
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSEXPAWARD, 0, format("%s ph«n th≠Îng","Kinh nghi÷m Æ∂ bπi BOSS hoµng kim"));
		end
	else -- “ª∏ˆ»À
		szName = GetName();
		PlayerFunLib:AddExp(KILLBOSSEXPAWARD, 0, format("%s ph«n th≠Îng","Kinh nghi÷m Æ∂ bπi BOSS hoµng kim"));
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSNEAREXPAWARD, 0, format("%s ph«n th≠Îng","Kinh nghi÷m Æ¯ng g«n lÛc BOSS hoµng kim bﬁ ti™u di÷t"));
	end
	
	local szNews = format("ßπi hi÷p <color=yellow>%s<color> tπi <color=yellow>%s<color> Æ∑ ti™u di÷t thµnh c´ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	AddGlobalNews(szNews);
	LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	-- BOSSª˜…±Õ≥º∆
	local nCount = GetTask(TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(TSK_PLAYER_BOSSKILLED, nCount);
	
	if (GetNpcParam(nNpcIndex, 1) == 1) then --19:30µƒª∆ΩBOSS
		-- ª∆ΩBOSSº∆ ˝
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "ReduceGoldBossCount", 0);
	end
end;

function OnTimer(nNpcIndex,nTimeOut)
	DelNpc(nNpcIndex);
end