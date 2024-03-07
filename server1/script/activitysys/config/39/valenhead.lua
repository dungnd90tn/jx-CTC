ValenAct_nStartDate = 20120209
ValenAct_nEndDate = 20120301
ValenAct_TSK_REDLINE = 0
ValenAct_TREE_STATE = 1
ValenAct_TSK_STATE = 2
ValenAct_TSK_PUBTIME = 3
ValenAct_TSK_CREATETIME = 4
ValenAct_TSK_ID_AND_RANDOMTIME = 5
ValenAct_TSK_ACCTIME = 6
ValenAct_TSK_SCORE = 7
ValenAct_TSK_AWARD = 8
ValenAct_TSK_SINGLE_TIME = 9
--ValenAct_nLifePeriod = 30*60 
ValenAct_nMidTime = 60	-- 每个任务放弃未领取时间
ValenAct_nLoopTime = 90	-- 每个任务以领取未完成时间
ValenAct_nStepTime = 300 -- 成长阶段
ValenAct_nStepTaskTime = 270 -- 每个阶段任务时间
ValenAct_nStepPartTime = 30 -- 每个阶段空闲时间
ValenAct_nPickTime = 10*60  -- 采摘时间
ValenAct_nTskStepCount = 3
ValenAct_tbMap = {1,11,37,176,162,78,80, 174,121,153,101,99,100,20,53}
ValenAct_tbNpcId = {1252, 1253, 1254, 1255,}
ValenAct_nUnGrow = 0
ValenAct_nGrowing = 1
ValenAct_tbConfig = {
	["H箃 Gi鑞g Hoa H錸g"] = {nTeamSize = 2, nItemIndex = 3109, nSexScore = 1, 
		tbName = {"M莔 hoa h錸g", "C﹜ hoa h錸g nh�", "C﹜ hoa h錸g ch璦 tr� hoa", "C﹜ hoa h錸g n� y hoa", },
		tbDialog = {
			"Qu﹏ T﹎ T� Ng� T﹎",
			"Ch蕄 T� Chi Th�, D� T� Giai L穙.",
			"Th� T譶h V� K� Ti猽 Tr�,T礽 H� Mao u, Khc Thng T﹎ u.",
			"Ng� Nguy謓 D� Qu﹏ Tng Tri",
			"Nguy謓 Thi猲 H� H鱱 T譶h Nh﹏ Chung Th祅h Trc Thu閏.",
		},
		szAddStatKey = "qingrenjie_zhongmeiguihuazhong",
	},
	["u H錸g"] = {nTeamSize = nil, nItemIndex = 3110,	nSexScore = nil,
		tbName = {"H箃 Gi鑞g u H錸g", "C﹜ u H錸g nh�", "C﹜ u H錸g ch璦 ra hoa", "C﹜ u H錸g k誸 tr竔", },
		tbDialog = {
			"H錸g u Sinh Nam Qu鑓, Xu﹏ Lai Ph竧 K� Chi",
			"Nguy謓 Qu﹏  Th竔 Hi謙, Th� V藅 T鑙 Tng T�.",
			"T譶h Nh﹏ O竛 Dao, C秐h T辌h Kh雐 Tng T�.",
			"Trng Tng T�, Trng Tng T�, Nhc V蕁 Tng T� Th薽 Li評 K�, Tr� Phi Tng Ki課 Th阨.",
			"Trng T璶g T�, Trng Tng T�, D鬰 B� Tng T� Thuy誸 T� Th飝, Thi觧 T譶h Nh﹏ B蕋 Tri.",
			"Trng Tng T� H� Trng Tng , 秐 Tng T� H� V� C飊g C鵦.",
		},
		szAddStatKey = "qingrenjie_zhonghongdou",
	},
}
ValenAct_nRedLineIndex = 3111
ValenAct_Op = {"Ti nc", "B鉵 ph﹏", "C総 c� d筰", "B総 s﹗",}