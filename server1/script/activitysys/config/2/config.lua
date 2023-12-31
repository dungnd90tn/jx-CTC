Include("\\script\\activitysys\\config\\2\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click big xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Чi T飊g Gi竛g Sinh"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi韎 thi謚 ho箃 ng Gi竛g Sinh",5} },
		{"AddDialogOpt",	{"Nh薾 C﹜ Th玭g Gi竛g Sinh",2} },
		{"AddDialogOpt",	{"Nh薾 T蕋 Gi竛g Sinh",3} },
		{"AddDialogOpt",	{"фi th祅h ph莕 thng",4} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "nil",
	szName = "get xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSKI_TREE_LIMIT,MAX_GET_TREE_LIMIT,"H玬 nay ngi  nh薾 C﹜ Th玭g Gi竛g Sinh r錳, ng祔 mai h穣 quay l筰.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_TREE,MAX_GET_TREE_LIMIT,EVENT_LOG_TITLE,"get xmas tree"} },
		{"ThisActivity:AddTaskDaily",	{TSKI_TREE_LIMIT,MAX_GET_TREE_LIMIT} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "nil",
	szName = "get xmas stocking",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSKI_STOCKING_LIMIT,MAX_GET_STOCKING_LIMIT,"H玬 nay ngi  nh薾 T蕋 Gi竛g Sinh r錳, ng祔 mai h穣 quay l筰.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_STOCKING,MAX_GET_STOCKING_LIMIT,EVENT_LOG_TITLE,"get xmas stocking"} },
		{"ThisActivity:AddTaskDaily",	{TSKI_STOCKING_LIMIT,MAX_GET_STOCKING_LIMIT} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "get award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T輈h L辌h n",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"N鉵 gi竛g sinh",ITEM_XMAS_HAT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_AWARD,1,EVENT_LOG_TITLE,"exchange award"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "event introduction",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V祇 l骳 0:00 ng祔 1 th竛g 12 n╩ 2011 n 24:00 ng祔 31 th竛g 12 n╩ 2011, nh鱪g i hi謕 c蕄 150 tr� l猲 ( tr飊g sinh kh玭g gi韎 h筺 c蕄 ) c� th� tham gia ho箃 ng, i hi謕 c� th� n Чi T飊g Gi竛g Sinh t筰 L﹎ An (198,184), Phng Tng (198,199), Bi謓 Kinh (213,195), Чi L� (202,198), Tng Dng (198,201), Th祅h Й(392,316) nh薾 C﹜ Th玭g Gi竛g Sinh v� T蕋 Gi竛g Sinh, i hi謕 c� th� � trong th祅h nh蕁 chu閠 ph秈  s� d鬾g o c� C﹜ Th玭g Gi竛g Sinh, nh薾 頲 m閠 C﹜ Th玭g Gi竛g Sinh, i hi謕 c� th� s� d鬾g Qu� Gi竛g Sinh, n L錸g Gi竛g Sinh, K駉 Gi竛g Sinh, Chu玭g Gi竛g Sinh, Sao Gi竛g Sinh  trang tr� cho C﹜ Th玭g Gi竛g Sinh,  nh薾 頲 ph莕 thng, Qu� Gi竛g Sinh, n L錸g Gi竛g Sinh, Qu� Gi竛g Sinh, Chu玭g Gi竛g Sinh, Sao Gi竛g Sinh c� th� nh qu竔 r琲 ra t筰 Trng B筩h S琻 Nam, Kh醓 Lang чng, Sa M筩 T莕g 3, M筩 Cao Qu藅, Ti課 C骳 чng. M鏸 ng祔 v祇 l骳 19:00 - 23:00, i hi謕 c� th� mang theo T蕋 Gi竛g Sinh n жnh Trng B筩h ( Tng Dng-Th莕 B� Thng Nh﹏ Li評 蕋-жnh Trng B筩h)  thu th藀 L� V藅 Gi竛g Sinh, l� v藅 s� v� c飊g h蕄 d蒼 y! c bi謙 trong th阨 gian di詎 ra ho箃 ng trong K� Tr﹏ C竎 c遪 c� v藅 ph萴 M� Gi竛g Sinh, i hi謕 c� th� mang theo M� Gi竛g Sinh 甶 n Чi T飊g Gi竛g Sinh i l蕐 C祅 Kh玭 T輈h L辌h Кn, C祅 Kh玭 T輈h L辌h Кn n祔 c� uy l鵦 v� song, c� th� s� d鬾g n�  no b筰 竎 Lang T� S�, 竎 Lang T� S� 萵 n蕄 trong 竎 Lang C鑓, i hi謕 c� th� th玭g qua Xa Phu t筰 c竎 th祅h th�  甶 v祇 竎 Lang C鑓, nh b筰 竎 Lang T� S� c� th� nh薾 頲 ph莕 thng v� c飊g phong ph� .",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "ServerStart",
	szName = "add big xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"Чi T飊g Gi竛g Sinh",XMAS_BIG_TREE_ID,XMAS_BIG_TREE_POS} },
		{"ThisActivity:CreateAmbienceNpc",	{nil} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "use xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_XMAS_TREE},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskbyTime",	{TSKI_USE_TREE_TIME,60} },
		{"PlayerFunLib:IsFightState",	{0, "Ch� c� th� s� d鬾g t筰 nh鱪g khu v鵦 phi chi課 u."} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d鬾g t筰 c竎 th祅h th� v� c竎 t﹏ th� th玭."} },
		{"PlayerFunLib:CheckTaskDaily",	{2915,6,"S� d鬾g v藅 ph萴 t gi韎 h筺 ng祔.","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{2915,1} },
		{"ThisActivity:UseTree",	{nil} },		
		{"ThisActivity:SetTaskByNowTime",	{TSKI_USE_TREE_TIME} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "use pilidan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2739,-1,-1,-1},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H祅h trang kh玭g "} },
		{"ThisActivity:CheckTaskDaily",	{TSKI_PILIDAN_EXP_LIMIT,MAX_PILIDAN_EXP_LIMIT,"S� d鬾g v藅 ph萴 t gi韎 h筺 ng祔.","<"} },
		{"ELangGuWorld:UseItemKillNpc",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TSKI_PILIDAN_EXP_LIMIT,1} },
		{"ThisActivity:UsePiLiDan",	{nil} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "map321 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"321"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_APPLE,1,25} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "map75 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"75"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_LANTERN,1,25} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "map227 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_CANDY,1,25} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "map340 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"340"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_BELL,1,25} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "NpcOnDeath",
	szName = "map93 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_STAR,1,25} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "map322 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"322"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_APPLE,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_LANTERN,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_CANDY,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_BELL,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_STAR,1,5} },
	},
}
