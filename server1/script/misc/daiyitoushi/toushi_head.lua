-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一“带艺投师”头文件文件

-- Edited by 子非魚
-- 2008/02/28 12:10

-- ======================================================

IncludeLib("FILESYS");
IncludeLib("SETTING");
Include("\\script\\global\\skills_table.lua");				-- 各门派、各等级技能总表
Include("\\script\\task\\metempsychosis\\task_func.lua");	-- 嫁衣神功心法头文件:清技能点,清潜能点
Include("\\script\\task\\system\\task_string.lua");			-- 对话文字处理
Include("\\script\\lib\\common.lua");						--


FILE_SKILLEXP			= "\\settings\\npc\\player\\magic_level_exp.txt";
TB_TOUSHI_SKILLEXP		= {};

function toushiLoadMagicLevelExp()
	local b1			= TabFile_Load(FILE_SKILLEXP, "DaiYiTouShiLevelExp");
	
	if b1~=1 then
		print("Error!!!! Load Magic_Level_Exp File Error!!!");
		return
	end
	
	local nRowCount		= TabFile_GetRowCount("DaiYiTouShiLevelExp");
	
	for y = 2, nRowCount do
		local nSkill				= tonumber(TabFile_GetCell("DaiYiTouShiLevelExp", y, "MAGICID"));
		TB_TOUSHI_SKILLEXP[nSkill]	= {};
		
		for k = 1, 20 do
			TB_TOUSHI_SKILLEXP[nSkill][k]	= tonumber(TabFile_GetCell("DaiYiTouShiLevelExp", y, "LEVEL"..k));
		end
	end
end
toushiLoadMagicLevelExp();

LV120_SKILL_ID				=	2463					-- 纪录玩家120级技能ID
TSK_LV150_SKILL				=	2885					-- 150级技能任务TaskID
TSK_TOUSHI_FLAG				=	1881					-- “带艺投师”退出门派的标记
													--	 0：未申请转投门派或转投门派成功（与转职次数一起决定）；1：成功申请转投门派；
TSK_ZHENPAILINGDAN_USECNT	=	1882;
TSK_TOUSHI_COUNT			=	1883;					-- “带艺投师”转职的次数
TSK_LAST_CHANGE_FACTION     =   2604;                   -- 上次转门派时间 相对时间(单位:秒)

TOUSHI_FACTION_CHUSHI	=	70*256;					-- 门派任务出师状态
TOUSHI_FACTION_HUISHI	=	80*256;					-- 门派任务出师状态
TOUSHI_90SKILL_TASK		=	255;					-- 90级技能任务状态
TOUSHI_150SKILL_TASKSTATE	=	14;					-- 150级技能任务状态
TOUSHI_COLDDOWN_TIME    =   60*24*60*60;                     -- 转门派冷却时间(单位:秒)

TOUSHI_UNKNOWN		= -1;				-- 未知错误
TOUSHI_SUCCEED		= 1;				-- 条件判断成功
TOUSHI_LVLERR		= 2;				-- 角色等级不满足
TOUSHI_FLAGERR		= 3;				-- 角色不具有转投师门的标记（资格）
TOUSHI_LGERR		= 4;				-- 角色不满足解散或退出战队条件
TOUSHI_EQUIPERR		= 5;				-- 角色不满足卸下装备条件
TOUSHI_REDOERR		= 6;				-- 角色已转投过新师门，不能再次转投
TOUSHI_EQFACTERR	= 7;				-- 转投门派不能是当前门派
TOUSHI_MALEERR		= 8;				-- 翠烟峨眉不接受男弟子
TOUSHI_FEMALEERR	= 9;				-- 少林派不接受女弟子
TOUSHI_TWFEMALEERR	= 10;				-- 女性角色没有“杨瑛的信物”不能加入天王帮
TOUSHI_NOFACTERR	= 11;				-- 白名角色不能“带艺投师”
TOUSHI_NOFREEBAG	= 12;				-- 背包空间不足
TOUSHI_TIMEERR	    = 13;				-- 转门派冷却时间未到

TB_TOUSHI_MENPAIXINWU		= {6, 1, 1670}				-- 门派信物IDKey
TB_TOUSHI_YANGYINGXINWU		= {6, 1, 1671}				-- 杨瑛信物IDKey
TB_TOUSHI_ZHENPAILINGDAN	= {6, 1, 1704, 1, 0, 0}		-- 镇派灵丹
TB_TOUSHI_ZHENPAILINGYAO	= {6, 1, 1705, 1, 0, 0}		-- 镇派灵药
TB_TOUSHI_HIERARCH			= {"Chng m玭", "Gi竜 ch�", "Bang ch� "};	-- 各门派对掌门的不同称呼
TB_TOUSHI_ERR_MSG			= 							-- 错误提示信息
	{
		[TOUSHI_UNKNOWN]		= "<dec><npc>Kh玭g th� l祄 nh� v藋 頲.",
		[TOUSHI_LVLERR]			= "<dec><npc>Hi謓 t筰 ngi v蒼 ch璦  {c蕄 120}, h穣 甶 r蘮 luy謓 th猰 甶!",
		[TOUSHI_FLAGERR]		= "<dec><npc>Mu鑞 gia nh藀 b鎛 bang, chng m玭 c馻 ngi  ng � ch璦?",
		[TOUSHI_LGERR]			= "<dec><npc>Mu鑞 gia nh藀 b鎛 bang, c莕 ph秈 {gi秈 t竛 quan h� chi課 i li猲 u}.",
		[TOUSHI_EQUIPERR]		= "<dec><npc>Mu鑞 gia nh藀 b鎛 bang, c莕 ph秈 c雐 h誸 trang b� tr猲 ngi xu鑞g!",
		[TOUSHI_REDOERR]		= "<dec><npc><sex>  chuy觧 th祅h c玭g sang m玭 ph竔 m韎.",
		[TOUSHI_EQFACTERR]		= "<dec><npc>S� ph� cho ph衟 ngi xu鑞g n骾 t譵 con 阯g v� h鋍 m韎, v� c騨g hi v鋘g ngi c� ng祔 h飊g b� thi猲 h�",
		[TOUSHI_MALEERR]		= "<dec><npc>V� <sex>  t譵 y n y, ch綾 c騨g  bi誸 t蕋 c� s� vi謈 t� chng m玭 m� n. Nh璶g m� ngi kh玭g ph� h頿 gia nh藀 v韎 m玭 ph竔.",
		[TOUSHI_TWFEMALEERR]	= "<dec><npc>Ngi v蒼 ch璦 c� t輓 v藅 c馻 b鎛 bang ch�, kh玭g th� gia nh藀 頲 m玭 ph竔.",
		[TOUSHI_NOFACTERR]		= "<dec><npc>Th藅 l� k� l�! Ta nh薾 kh玭g ra ngi tu luy謓 v� c玭g thu閏 m玭 ph竔 n祇?",
		[TOUSHI_NOFREEBAG]		= "<dec><npc>H祅h trang kh玭g , h穣 s緋 x誴 r錳 quay l筰 nh�.",
		[TOUSHI_TIMEERR]		= format("<dec><npc>Sau khi chuy觧 m玭 ph竔 <color=green>%d<color> ng祔 m韎 c� th� ti誴 t鬰 chuy觧.", TOUSHI_COLDDOWN_TIME/(24*60*60)),
	}

TB_TOUSHI_ERR_MSG[TOUSHI_FEMALEERR] = TB_TOUSHI_ERR_MSG[TOUSHI_MALEERR];

TB_DAIYITOUSHI_FACTS = 					-- 各门派 技能 称号等
	{
--		{-- 
--			门派名,	门派ID,	阵营,	头衔ID,	属性
--			任务ID, 
--			137的变量,	137变量的值,		// 就这一项来说，搞不明白是做什么的，入门的时候设置
--			技能Tab,
--			入门公告,
--		},	
		{-- 少林
			szFacName		=	"shaolin",	nFacNumb	=	0,	nCamp	=	1,	nRankId	=	72,	nSeries	=	0,
			nTaskId_Fact	=	7,
			nTaskId_90Skill	=	122,
			nTaskId_137 	=	137,		nValue_137	=	67,
			tbSkillID		=	{
							[10]	=	{
											14,		-- 行龙不雨[14]
											10,		-- 金刚伏魔[10]（入门）
										},
										
							[20]	=	{
											8,		-- 少林拳法[8]
											4,		-- 少林棍法[4]（10级）
											6,		-- 少林刀法[6]（10级）
										},
										
							[30]	=	{
											15,		-- 不动明王[15]（20级）
										},
										
							[40]	=	{
											16,		-- 罗汉阵[16]（30级）
										},
										
							[50]	=	{
											20,		-- 狮子吼 [20]（40级）
										},
										
							[60]	=	{
											271,	-- 龙爪虎抓[271]
											11,		-- 横扫六合 [11]（50级）
											19,		-- 摩诃无量 [19]（50级）
										},
										
							[70]	=	{
											273,	-- 如来千叶[273]
											21,		-- 易筋经[21]（60级）
										},
										
							[90]	=	{
											{318, 1, "Quy襫 ph竝"},	-- 达摩渡江[318]			添加熟练度技能 至少添加为1级
											{319, 1, "C玭 ph竝"},	-- 横扫千军[319]（90级）
											{321, 1, "o ph竝"},	-- 无相斩  [321]（90级）
										},
										
							[120]	=	{
											{709, 1}
										},
										
							[150]	=	{
											{1055, 1, "Quy襫 ph竝"},	-- 大力金刚掌[318]			添加熟练度技能 至少添加为1级
											{1056, 1, "C玭 ph竝"},	-- 韦陀献杵[319]（90级）
											{1057, 1, "o ph竝"},	-- 叁戒归禅[321]（90级）
										},
						},
			szMsg = "K� t� h玬 nay %s gia nh藀 m玭 ph竔 Thi誹 L﹎, sau n祔 nh� c竎 huynh ch� gi竜!",
		},	
		
		{-- 天王
			szFacName		=	"tianwang",	nFacNumb	=	1,	nCamp	=	3,	nRankId	=	69,	nSeries	=	0,
			nTaskId_Fact	=	3,
			nTaskId_90Skill	=	121,
			nTaskId_137		=	137,		nValue_137	=	63,
			tbSkillID		=	{
							[10]	=	{
											34,		-- 惊雷斩[34]  （入门）
											30,		-- 回风落雁[30]（入门）
											29,		-- 斩龙诀[29]  （入门）
										},
										
							[20]	=	{
											26,		-- 天王锤法[26]（10级）
											23,		-- 天王枪法[23]（10级）
											24,		-- 天王刀法[24]（10级）
										},
										
							[30]	=	{
											33,		-- 静心诀[33]  （20级）
										},
										
							[40]	=	{
											37,		-- 泼风斩  [37]（30级）
											35,		-- 阳关三叠[35]（30级）
											31,		-- 行云诀  [31]（30级）
										},
										
							[50]	=	{
											40,		-- 断魂刺  [40]（40级）
										},
										
							[60]	=	{
											42,		-- 金钟罩  [42]（50级）
										},
										
							[70]	=	{
											32,		-- 无心斩  [32] （60级）
											36,		-- 天王战意[36]（镇派）
											41,		-- 血战八方[41] （60级）
											324,	-- 乘龙诀  [324]（60级）
										},
										
							[90]	=	{
											{322, 1, "o ph竝"},	-- 破天斩  （90级）
											{323, 1, "Thng ph竝"},	-- 追星逐月（90级）
											{325, 1, "Ch飝 ph竝"},	-- 追风诀  （90级）
										},
										
							[120]	=	{
											{708, 1}	--
										},
										
							[150]	=	{
											{1058, 1, "o ph竝"},	-- 豪雄斩
											{1060, 1, "Thng ph竝"},	-- 霸王錾金
											{1059, 1, "Ch飝 ph竝"},	-- 纵横八荒
										},
						},
			szMsg = "K� t� h玬 nay %s gia nh藀 Thi猲 Vng, nh� c竎 s� huynh ch� gi竜!",
		},
		
		{-- 唐门
			szFacName		=	"tangmen",	nFacNumb	=	2,	nCamp	=	3,	nRankId	=	76,	nSeries	=	1,
			nTaskId_Fact	=	2,
			nTaskId_90Skill	=	123,
			nTaskId_137		=	137,	nValue_137	=	62,
			tbSkillID		=	{
							[10]	=	{
											45,		-- 霹雳弹[45 ]（入门）
										},
										
							[20]	=	{
											43,		-- 唐门暗器[43 ]（10级）
											347,	-- 地焰火[347]（10级）
										},
										
							[30]	=	{
											303,	-- 毒刺骨  [303]（20级）
										},
										
							[40]	=	{
											50,		-- 追心箭  [50 ]（30级）
											54,		-- 漫天花雨[54 ]（30级）
											47,		-- 夺魂镖  [47 ]（30级）
											343,	-- 穿心刺  [343]（30级）
										},
										
							[50]	=	{
											345,	-- 寒冰刺  [345]（40级）
										},
										
							[60]	=	{
											349,	-- 雷击术[349]（50级）
										},
										
							[70]	=	{
											249,	-- 小李飞刀[249]（60级）
											48,		-- 心眼  [48 ]（镇派）
											58,		-- 天罗地网[58 ]（60级）
											341,	-- 散花镖  [341]（60级）
										},
										
							[90]	=	{
											{339, 1, "Phi o"},	-- 摄魂月影[339]（90级）
											{302, 1, "N� ti詎"},	-- 暴雨梨花[302]（90级）
											{342, 1, "Phi Ti猽"},	-- 九宫飞星[342]（90级）
											351,	-- 乱环击  [351]（90级）
										},
										
							[120]	=	{
											{710, 1}
										},
										
							[150]	=	{
											{1069, 1, "Phi o"},	-- 无影穿
											{1070, 1, "N� ti詎"},	-- 铁莲四杀
											{1071, 1, "Phi Ti猽"},	-- 乾坤一掷
											1110,	-- 霹雳乱环击
										},
						},
			szMsg = "K� t� h玬 nay, %s gia nh藀 Л阯g m玭, c秏 phi襫 c竎 s� huynh s� t� ch� gi竜!",
		},
		
		{-- 五毒
			szFacName		=	"wudu",	nFacNumb	=	3,	nCamp	=	2,	nRankId	=	80,	nSeries	=	1,
			nTaskId_Fact	=	10,
			nTaskId_90Skill	=	124,
			nTaskId_137		=	137,	nValue_137	=	70,
			tbSkillID		=	{
							[10]	=	{
											63,		-- 毒砂掌  [63]（入门）
											65,		-- 血刀毒杀[65]（入门）
										},
										
							[20]	=	{
											62,		-- 五毒掌法[62]（10级）
											60,		-- 五毒刀法[60]（10级）
											67,		-- 九天狂雷[67]（10级）
										},
										
							[30]	=	{
											70,		-- 赤焰蚀天[70]（20级）
											66,		-- 杂难药经[66]（20级）
										},
										
							[40]	=	{
											68,		-- 幽冥骷髅[68 ]（30级）
											384,	-- 百毒穿心[384]（30级）
											64,		-- 冰蓝玄晶[64 ]（30级）
											69,		-- 无形蛊  [69]（30级）
										},
										
							[50]	=	{
											356,	-- 穿衣破甲  [356]（40级）
											73,		-- 万蛊蚀心[73 ]（40级）
										},
										
							[60]	=	{
											72,		-- 穿心毒刺[72]（50级）
											
										},
										
							[70]	=	{
											71,		-- 天罡地煞手[71 ]（60级）
											75,		-- 五毒奇经[75]（镇派）
											74,		-- 朱蛤青冥  [74 ]（60级）
										},
										
							[90]	=	{
											{353, 1, "Chng ph竝"},	-- 阴风蚀骨[353]（90级）
											{355, 1, "o ph竝"},	-- 玄阴斩  [355]（90级）
											390,	-- [390]（90级）
										},
										
							[120]	=	{
											{711, 1}
										},
										
							[150]	=	{
											{1066, 1, "Chng ph竝"},	-- 形销骨立
											{1067, 1, "o ph竝"},	-- 幽魂噬影
										},
						},
			szMsg = "K� t� h玬 nay, %s gia nh藀 m玭 Ng� чc gi竜, c秏 phi襫 c竎 s� huynh s� t� ch� gi竜!",
		},
		
		{-- 峨眉
			szFacName		=	"emei",	nFacNumb	=	4,	nCamp	=	1,	nRankId	=	64,	nSeries	=	2,
			nTaskId_Fact	=	1,
			nTaskId_90Skill	=	125,
			nTaskId_137		=	137,	nValue_137 = 61,
			tbSkillID		=	{
							[10]	=	{
											85,		-- 一叶知秋[85]（入门）
											80,		-- 飘雪穿云[80]（入门）
										},
										
							[20]	=	{
											77,		-- 峨嵋剑法[77]（10级）
											79,		-- 峨嵋掌法[79]（10级）
										},
										
							[30]	=	{
											93,		-- 慈航普渡[93]（20级）
										},
										
							[40]	=	{
											385,	-- 推窗望月[385]（30级）
											82,		-- 四象同归[82]（30级）
											89,		-- 梦蝶    [89]（30级）
										},
										
							[50]	=	{
											86,		-- 流水    [86 ]（40级）
										},
										
							[60]	=	{
											92,		-- 佛心慈佑[92]（50级）
										},
										
							[70]	=	{
											88,		-- 不灭不绝[88]（60级）
											252,	-- 佛法无边[252]（镇派）
											91,		-- 佛光普照[91]（60级）
											282,	-- 清音梵唱[282]（60级）	
										},
										
							[90]	=	{
											{328, 1, "Ki誱 ph竝"},	-- 三峨霁雪[328]（90级）
											{380, 1, "Chng ph竝"},	-- 风霜碎影[380]（90级）
											332,	-- 普渡众生[332]（90级）
										},
										
							[120]	=	{
											{712, 1}
										},
										
							[150]	=	{
											{1061, 1, "Ki誱 ph竝"},	-- 剑花挽晶
											{1062, 1, "Chng ph竝"},	-- 冰雨珞晶
											{1114, 1, "H� tr� "},	-- 玉泉心经
										},
						},
			szMsg = "K� t� h玬 nay, %s gia nh藀 Nga My ph竔, c秏 phi襫 c竎 s� t� ch� gi竜",
		},
		
		{-- 翠烟
			szFacName		=	"cuiyan",	nFacNumb	=	5,	nCamp	=	3,	nRankId	=	67,	nSeries	=	2,
			nTaskId_Fact	=	6,
			nTaskId_90Skill	=	126,
			nTaskId_137		=	137,	nValue_137	=	66,
			tbSkillID = {
							[10]	=	{
											99,		-- 风花雪月[99 ]（入门）
											102,	-- 风卷残雪[102]（入门）
										},
										
							[20]	=	{
											95,		-- 翠烟刀法[95 ]（10级）
											97,		-- 翠烟双刀[97 ]（10级）
										},
										
							[30]	=	{
											269,	-- 冰心倩影[269]（20级）
										},
										
							[40]	=	{
											105,	-- 雨打梨花[105]（30级）
											113,	-- 浮云散雪[113]（30级）
										},
										
							[50]	=	{
											100,	-- 护体寒冰[100]（30级）
										},
										
							[60]	=	{
											109,	-- 雪影    [109]（40级）
										},
										
							[70]	=	{
											108,	-- 牧野流星[108]（60级）
											114,	-- 冰骨雪心[114]（镇派）
											111,	-- 碧海潮生[111]（60级）
										},
										
							[90]	=	{
											{336, 1, "o ph竝"},	-- 冰踪无影[336]（90级）
											{337, 1, "Song 產o"},	-- 冰心仙子[337]（90级）
										},
										
							[120]	=	{
											{713, 1}
										},
										
							[150]	=	{
											{1063, 1, "o ph竝"},	-- 冰雀越枝
											{1065, 1, "Song 產o"},	-- 水映曼秀
										},
						},
			szMsg = "K� t� h玬 nay, %s gia nh藀 Th髖 Y猲 m玭, c秏 phi襫 c竎 s� t� ch� gi竜!",
		},
		
		{-- 丐帮
			szFacName		=	"gaibang",	nFacNumb	=	6,	nCamp	=	1,	nRankId	=	78,	nSeries	=	3,
			nTaskId_Fact	=	8,
			nTaskId_90Skill	=	128,
			nTaskId_137		=	137,	nValue_137	=	68,
			tbSkillID		=	{
							[10]	=	{
											122,	-- 见人伸手[122]（入门）
											119,	-- 沿门托钵[119]（入门）
										},
										
							[20]	=	{
											116,	-- 丐帮掌法[116]（10级）
											115,	-- 丐帮棒法[115]（10级）
										},
										
							[30]	=	{
											129,	-- 化险为夷[129]（20级）
										},
										
							[40]	=	{
											274,	-- 降龙掌[274]（30级）
											124,	-- 打狗阵[124]（30级）
										},
										
							[50]	=	{
											277,	-- 滑不留手[277]（40级
										},
										
							[60]	=	{
											128,	-- 亢龙有悔[128]（50级）
											125,	-- 棒打恶狗[125]（50级）
										},
										
							[70]	=	{
											130,	-- 醉蝶狂舞[130]（镇派）
											360,	-- 逍遥功[360]（60级）
										},
										
							[90]	=	{
											{357, 1, "Chng ph竝"},	-- 飞龙在天[357]（90级）
											{359, 1, "B鎛g ph竝"},	-- 天下无狗[359]（90级）
										},
										
							[120]	=	{
											{714, 1}
										},
										
							[150]	=	{
											{1073, 1, "Chng ph竝"},	-- 时乘六龙
											{1074, 1, "B鎛g ph竝"},	-- 棒迥掠地
										},
						},
			szMsg = "K� t� h玬 nay, %s gia nh藀 C竔 Bang, c秏 phi襫 c竎 ti襫 b鑙 ch� gi竜!",
		},
		
		{-- 天忍
			szFacName		=	"tianren",	nFacNumb	=	7,	nCamp	=	2,	nRankId	=	81,	nSeries	=	3,
			nTaskId_Fact	=	4,
			nTaskId_90Skill	=	127,
			nTaskId_137		=	137,	nValue_137 = 64,
			tbSkillID		=	{
							[10]	=	{
											135,	-- 残阳如血[135]（入门）
											145,	-- 弹指烈焰[145]（入门）
										},
										
							[20]	=	{
											132,	-- 天忍矛法[132]（10级）
											131,	-- 天忍刀法[131]（10级）
											136,	-- 火焚莲华[136]（10级）
										},
										
							[30]	=	{
											137,	--幻影飞狐[137]（20级）
										},
										
							[40]	=	{
											141,	-- 烈火情天[141]（30级）
											138,	-- 推山填海[138]（30级）
											140,	-- 飞鸿无迹[140]（30级）
										},
										
							[50]	=	{
											364,	-- 悲酥清风[364]（40级）
										},
										
							[60]	=	{
											143,	-- 厉魔夺魂[143]（50级）
										},
										
							[70]	=	{
											142,	-- 偷天换日[142]（60级）
											150,	-- 天魔解体[150]（镇派）
											148,	-- 魔焰七杀[148]（60级）
										},
										
							[90]	=	{
											{361, 1, "Thng ph竝"},	-- 云龙击  [361]（90级）
											{362, 1, "o ph竝"},	-- 天外流星[362]（90级）
											391,	-- [391]（90级）
										},
										
							[120]	=	{
											{715, 1}
										},
										
							[150]	=	{
											{1075, 1, "Thng ph竝"},	-- 江海怒澜
											{1076, 1, "o ph竝"},	-- 疾火燎原
										},
						},
			szMsg = "K� t� h玬 nay, %s gia nh藀 Thi猲 Nh蒼 gi竜, b竔 ki課 c竎 s� huynh s� t�!",
		},
		
		{-- 武当
			szFacName		=	"wudang",	nFacNumb	=	8,	nCamp	=	1,	nRankId	=	73,	nSeries	=	4,
			nTaskId_Fact	=	5,
			nTaskId_90Skill	=	129,
			nTaskId_137		=	137,	nValue_137	=	65,
			tbSkillID		=	{
							[10]	=	{
											153,	-- 怒雷指  [153]（入门）
											155,	-- 沧海明月[155]（入门）
										},
										
							[20]	=	{
											152,	-- 武当拳法[152]（10级）
											151,	-- 武当剑法[151]（10级）
										},
										
							[30]	=	{
											159,	-- 七星阵  [159]（30级）
										},
										
							[40]	=	{
											164,	-- 剥及而复[164]（30级）
											158,	-- 剑飞惊天[158]（30级）
										},
										
							[50]	=	{
											160,	-- 梯云纵  [160]（40级）
										},
										
							[60]	=	{
											157,	-- 坐望无我[157]（50级）
										},
										
							[70]	=	{
											165,	-- 无我无剑[165]（60级）
											166,	-- 太极神功[166]（镇派）
											267,	-- 三环套月[267]（60级）
										},
										
							[90]	=	{
											{365, 1, "Quy襫 ph竝"},	-- 天地无极[365]（90级）
											{368, 1, "Ki誱 ph竝"},	-- 人剑合一[368]（90级）
										},
										
							[120]	=	{
											{716, 1}
										},
										
							[150]	=	{
											{1078, 1, "Quy襫 ph竝"},	-- 造化太清
											{1079, 1, "Ki誱 ph竝"},	-- 剑垂星河
										},
						},
			szMsg = "K� t� h玬 nay, %s gia nh藀 V� ng ph竔, tham ki課 c竎 s� huynh s� t�!",
		},
		
		{-- 昆仑
			szFacName		=	"kunlun",	nFacNumb	=	9,	nCamp	=	3,	nRankId	=	75,	nSeries	=	4,
			nTaskId_Fact	=	9,
			nTaskId_90Skill	=	130,
			nTaskId_137		=	137,	nValue_137	=	69,
			tbSkillID		=	{
							[10]	=	{
											169,	-- 呼风法  [169]（入门）
											179,	-- 狂雷震地[179]（入门）
										},
										
							[20]	=	{
											167,	-- 昆仑刀法[167]（10级）
											168,	-- 昆仑剑法[168]（10级）
											392,	-- 缠字诀[392]（10级）
											171,	-- 清风符  [171]（10级）
										},
										
							[30]	=	{
											174,	-- 羁绊符  [174]（20级）
										},
										
							[40]	=	{
											178,	-- 一气三清[178]（30级）
											172,	-- 迅雷咒  [172]（30级）
											393,	-- 缺少ID（30级）
											173,	-- 天清地浊[173]（30级）
										},
										
							[50]	=	{
											175,	-- 欺寒傲雪[175]（40级）
											181,	-- 弃心符  [181]（40级）
										},
										
							[60]	=	{
											176,	-- 狂风骤电[176]（50级）
											90,		-- 迷踪幻影[90 ]（50级）
										},
										
							[70]	=	{
											275,	-- 霜傲昆仑[275]（镇派）
											182,	-- 五雷正法[182]（60级）
											630,;	-- 第三资料片，增加昆仑新技能"玄天无极"
										},
										
							[90]	=	{
											{372, 1, "o ph竝"},	-- 傲雪啸风[372]（90级）
											{375, 1, "Ki誱 ph竝"},	-- 雷动九天[375]（90级）
											394,	-- [394]（90级）
										},
										
							[120]	=	{
											{717, 1}
										},
										
							[150]	=	{
											{1080, 1, "o ph竝"},	-- 九天罡风
											{1081, 1, "Ki誱 ph竝"},	-- 天雷震岳
										},
						},
			szMsg = "K� t� h玬 nay, %s gia nh藀 C玭 L玭 ph竔, b竔 ki課 c竎 v� o huynh!",
		},

	}


TB_WUXING_SKILL_ID	= 
	{
		{nMagicId1	=	445, nMagicId2	=	534},
		{nMagicId1	=	446, nMagicId2	=	535},
		{nMagicId1	=	447, nMagicId2	=	536},
		{nMagicId1	=	448, nMagicId2	=	537},
		{nMagicId1	=	449, nMagicId2	=	538},
	}

