-- 定时向一组服务器的所有Gameserver发系统公告
function TaskShedule()
	TaskName("THONG BAO TIN TUC TU DONG");
	
	-- 20分钟一次
	TaskInterval(20);
	
	-- 不设TaskTme, 则是Relay启动时就开始
	-- 0点00分开始
	-- TaskTime(0, 0);
	
	TaskCountLimit(0);
	
	OutputMsg("=====> THONG BAO TIN TUC TU DONG");
end

g_strTipMsg = 
	{
		--"每个门派有2-3条清晰的技能发展⒎线，各条⒎线的特点更为鲜明",
		--"在游戏世界中与各大城市的城门卫兵和孝手村的门派接引弟子对话，可了解本门的技能发展⒎线和最适合练级的场所",
		--"在游戏世界中与各大城市的城门卫兵和孝手村的门派接引弟子对话，可了解本门的技能发展⒎线和最适合练级的场所",
		--"在游戏世界中与各大城市的城门卫兵和孝手村的门派接引弟子对话，可了解本门的技能发展⒎线和最适合练级的场所",
		--"在游戏世界中与各大城市的城门卫兵和孝手村的门派接引弟子对话，可了解本门的技能发展⒎线和最适合练级的场所",
		"� tr� ch琲 tr猲 th� gi韎 c飊g c竎 i th祅h th� ch c鯽 th祅h v� binh c飊g tay m韎 th玭 ch m玭 ph竔 ti誴 d蒼  t� i tho筰 , nh璶g hi觰 r� b鎛 m玭 ch k� n╪g ph竧 tri觧 l� tuy課 c飊g th輈h h頿 nh蕋 luy謓 c蕄 ch tr祅g s�",
		--"引入〖技能加成〗的概念，等级高技能点兜的角色的优势将更加得到体现",
		--"〖技能加成〗低级战斗技能对高级战斗技能是指加成高级技能的伤害",
		--"全孝的〖五行系克〗系统，任何门派在和被自己克的门派PK时将会拥有更加明显的优势",
		--"7寓16日之后第一次登⒔游戏世界，系统会根据角色的旧技能状况自动修正为孝的技能，潜能点恢复到原始未分配状态",
		--"〖技能熟练度〗通过不断使用此技能攻击敌人获得提升，与敌人等级和玩家获得的练级经验无关",
		--"鼠标移到NPC身上，可显示〖五行属性图标〗",
		--"NPC只掉系应五行属性的宝物，如想要得到冰枪，可以去打水系的NPC",
		--"NPC只掉系应五行属性的宝物，如想要得到幸运装备，可以去打木系的NPC",
		--"NPC五行属性图标：金色-金系；蓝色-水系；⑻色-木系；红色-火系；褐色-土系",
		--"〖NPC调整〗沙漠迷宫NPC不仅等级高、经验兜、刷孝快，而且掉宝⑹是普通NPC的二到三倍",
		-- "〖组队〗最后一击的玩家得到的经验将是单人经验的1.3倍",		
		--"〖组队〗队伍成员的幸运值将根据队伍中人数得到系应提升",
		--"〖组队〗队伍成员的幸运值将根据队伍中人数得到系应提升；掉装备的属性将根据最后一击玩家角色幸运值来决定",
		--"〖组队建议〗高等级玩家带低等级玩家，等级系差70级以上时，各自的升级速度将提高20％以上",
		--"〖组队死亡惩罚〗组队人数越兜，死亡后掉的经验越少；若队伍中人数达到八人，死亡后将不掉经验",
		--"〖桃花岛〗向桃花隐士购Ⅱ腊八值，籍着岛上的灵气，腊八值的神奇功效将助你轻松修练。",
		"n誹 nh� ph竧 tri觧 m譶h  h鋍 頲 k� n╪g b� m藅 , xin/m阨 tr� v� s� , 甧m h鋍 頲 c竎 lo筰 k� n╪g , nh� , huy誸 chi課 b竧 phng , kh玭g l遪g d� n祇 ch衜 , Thi猲 vng chi課 y ( Thi猲 vng gi髉 ), l遪g d� , c飊g v韎 la a m蕋 ( Л阯g m玭 ).",
		--"〖洗髓岛〗正式开放，50级或以上的非白名玩家有〖一次免费〗进入机会。进岛后可随意洗〖潜能点〗与〖技能点〗，并可在岛上或组队入洞体验加点效果",
		--"免费进入〖洗髓岛〗的机会只有一次。离开洗髓岛，你的〖潜能/技能〗分配将就此确定，离开时请三思再三思！！",	
		"m閠 ph莕 nh� ch琲 ho祅 th祅h 90 c蕄 nhi謒 v� sau , v蒼 kh玭g th� t 頲 k� n╪g , tr� v� s� sau , tr� v� trc khi an ch豱h c秈 [183,182])",
		" m閠 ph莕 Л阯g m玭 nh� ch琲 � h鋍 [ t� t礽 b緉 cung . m璦 sa l� hoa ] g苝 ph秈 kh玭g th� s� d鬾g m璦 sa l� hoa ch t譶h hu鑞g , tr� v� s� sau , n trc khi an 甶襲 ch豱h [183,182]) ",
		"m閠 ph莕 V� Л琻g nh� ch琲 g苝 ph秈 m蕋 甶 k� n╪g 甶觤 ch t譶h hu鑞g , tr� v� s� sau , n trc khi an 甶襲 ch豱h [183,182])",
		--"〖声望查询〗请到各大城市的算命先生〖张铁嘴〗处，襄阳[192,193]",
		--"〖水晶风暴〗2004年7寓22日早11：00以后，充值35元虚卡或者实卡都可以在孝手村野叟那里随机领取一颗水晶，活动延迟到2004年8寓8日结束",
		--"〖武器图谱〗用中原武林的神奇〖水晶〗，与异域神秘商人换取〖武器图谱〗。再让〖铁匠〗参照图谱，百分百地帮你把武器提升一个等级",
		--"〖武器图谱〗异域神秘商人出现在扬州[207,193]与临安[164,177]两地，要换图谱升级武器的玩家请速速行动",
		--"〖蓝名怪物〗惊现江湖(名字显示为蓝色)，携带不少金钱和装备，还可能带有〖水晶〗、〖猩红宝石〗、〖黄金装备〗、〖技能书〗",
		--"〖黄金装备〗〖定国〗〖安邦〗黄金装备套装现身江湖，打〖蓝名怪物〗即有机会获得。参加阿运竟并活动，每天也将随机一件",
		" [ 竜 v薾 tng b礽 a i l� ] m鏸 l莕 Trung qu鑓 i t 頲 tng thng , nh� ch琲 c� th� n [ l� quan ] ch� d蒼 tng : kim b礽 - kim c� l� , ng﹏ b礽 - b筩h c﹗ ho祅 , ng b礽 - l� hoa ", 
		"[竜 v薾 tng b礽 a i l註 nh薾 l蕐 l� ph萴 trc ti猲 畂筺 : B綾 Kinh th阨 gian 10:00~14:00 nh薾 l蕐 trc m閠 ng祔 22:00~ ng祔  4:00 ch ph莕 thng ", 
		"[ 竜 v薾 tng b礽 a i l� ] nh薾 l蕐 l� ph萴 th� hai th阨 gian 畂筺 :19:00~20:00 nh薾 l蕐 ng祔  14:00~18:00 ch ph莕 thng ", 
		"[ 竜 v薾 tng b礽 a i l� ] nh薾 l蕐 l� ph萴 th� ba th阨 gian 畂筺 :23:00~ ng祔 k� 0:00 nh薾 l蕐 ng祔  18:00~22:00 ch ph莕 thng ", 
		" [ 竜 v薾 tng b礽 a i l� ] d蒼 tng c� l骳 h筺 , nh� ch琲 h糿 ch� � v鑞 i ch tranh t礽 , n [ l� quan ] ch� k辮 th阨 d蒼 tng .", 
		" s� d鬾g [ kim c� l� ] � m閠 gi� n閕 luy謓 c蕄 , 甧m t 頲 g蕄 i kinh nghi謒 tr� gi� : � trong v遪g m閠 canh gi� s� d鬾g [ b筩h c﹗ ho祅 ] 甧m t 頲 [ t� ng nh tr竎h ].2 lo筰 thu鑓 men ch鴆 n╪g 甧m � ng祔  m� ra ", 
		" [ d� 畂竛 竜 v薾 cu閏 so t礽 chuy謓 ] � th祅h ph� ch [ l� quan ] ch� tham gia 竜 v薾 cu閏 so t礽 chuy謓 d� 畂竛 ", 
		"[ 竜 v薾 cu閏 so t礽 chuy謓 c竛h 畂竛 ] c竛h 畂竛 tr髇g tng ch nh� ch琲 � t 頲 ti襫 thng h錳 b竜 ch ng th阨 , c遪 c� c� th� t 頲 ? nh nc ?? an bang ? h� li謙 ho祅g kim trang b� trung ch m閠 m鉵 ", 
		" t蕋 c� cu閏 so t礽 chuy謓 sau khi k誸 th骳 , h� th鑞g 甧m � 畂竛 tr髇g Trung qu鑓 i t 頲 ch kim ? ng﹏ ? ng b礽 s� lng ch nh� ch琲 trung sinh ra m閠 v� si猽 c蕄 may m緉 nh� ch琲 , tng thng 竜 v薾 h� li謙 ho祅g kim trang b� s竜 trang ", 
		"[竜 v薾 tng b礽 c竛h 畂竛 ] Trung qu鑓 tng b礽 s� lng c竛h 畂竛 , 甧m � 2004.8.17 ng祔 bu鎖 s竛g duy tr� trc ch苙 ch� . mu鑞 tham gia nh� ch琲 xin/m阨 n緈 ch芻 th阨 gian mua lo筰 n祔 v� s� ", 
		" [ 竜 v薾 ho祅g kim trang b� ] bao g錷 2 b�/v� [ nh� 甶觧 chi h錸 ], [ B綾 Kinh chi m閚g ]", 
		"[ 竜 v薾 chi h錸 ] 竜 v薾 l遪g  thu閏 t輓h u v� ? t蕋 c� v� c玭g c蕄 b薱 th猰 1? , i  sau t� ng k輈h ho箃 to祅 th﹏ trang b� ch t蕋 c� th莔 thu閏 t輓h ", 
		" [ ph骳 duy猲 h� th鑞g ] th玭g qua ch琲 th阨 gian gia t╪g  i l蕐 ph骳 duy猲 tr� gi� , d飊g ph骳 duy猲 tr� gi� n [ th莕 b� thng nh﹏ li評 蕋 ] ch� i l蕐 c竎 lo筰 c bi謙 v藅 ph萴 ", 
		" [ ph骳 duy猲 h� th鑞g ] c飊g th祅h ph� ch [ v� l﹎ truy襫 nh﹏ ] i tho筰 , hi觰 r� c苙 k� tin t鴆 .", 
		" [ trung thu ho箃 ng ] ╪ trung thu b竛h Trung thu , ng緈 tr╪g , m� m� ng� ---- ho箃 ng 產ng to祅 di謓 ti課 h祅h , ph莕 thng ch� ngi . m阨 頲 l� quan ch� h醝 c苙 k� tin t鴆 .", 
		" [ hoa o o ] 竜 v薾 v筺 ngi c飊g nh筩 , � h� th鑞g d鮪g ky b秓 tu , t� 14/8/2004 n 30/8/2004, mi詎 ph� � hoa o o tu luy謓 ."
	};
	
-- 新功能预告信息
g_nFutureDate = 20240723;
STR_HEAD_FUTURE = " [Giang H� truy襫 r籲g]";
g_strFutureMsg = 
	{
		"chuc 即将开放〖单练地图〗、〖打宝地图〗",
		"mung 〖洗髓岛〗洗技能点功能将在2004年7月24日开放，50级或以上的非白名玩家有一次免费进入机会",
		"nam 借助〖紫水晶〗或神秘〖武器图谱〗可以提升武器等级",
		"moi 〖蓝名怪物〗(名字显示为蓝色)蠢蠢欲动，据说将携带不少金钱和装备下山，还可能带有〖水晶〗、〖猩红宝石〗、〖黄金装备〗、〖技能书〗",
		"2013〖黄金装备〗〖定国〗〖安邦〗黄金装备套装现身江湖，打〖蓝名怪物〗即有机会获得",
		"2014〖双倍金钱双倍经验〗90级技能精彩唯美；剑网组队成风，打怪练级火爆。答谢新老玩家，近期将会有双倍金钱双倍经验活动",
		
	};
function TaskContent()
	str = "";
	nFutureCount = getn(g_strFutureMsg);
	nCount = getn(g_strTipMsg) + nFutureCount;
	nIndex = random(1, nCount);
	if (nIndex <= nFutureCount) then -- 1-取预告信息，2-取提示信息
		str = getFutureMsg();
		if (strlen(str) <= 0) then -- 没有预告信息，就取提示信息
			str = getTipMsg();
		end
	else
		str = getTipMsg();
	end
	
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", str));
end

-- 取提示信息
function getTipMsg()

	nCount = getn(g_strTipMsg);
	nIndex = random(1, nCount);

	return g_strTipMsg[nIndex];
end

-- 取预告信息
function getFutureMsg()
	nCurDate = tonumber(date("%Y%m%d"));
	str = "";
	if (g_nFutureDate > nCurDate) then -- 是否在指定日期之前，否则不发
		nCount = getn(g_strFutureMsg);
		nIndex = random(1, nCount);
		str = STR_HEAD_FUTURE..(g_strFutureMsg[nIndex]);
	end
	
	return str;
end
