--------------------------------------
-- 系统配置：开关、状态、

---------------------------------------------------------------
-- 区域版本配置
DEF_PRODUCT_REGION_CN		= 0;		-- 中国大陆版本
DEF_PRODUCT_REGION_CN_IB	= 1;		-- 中国大陆免费版本
DEF_PRODUCT_REGION_TW		= 2;		-- 台湾版本
DEF_PRODUCT_REGION_MY		= 3;		-- 越南版本
DEF_PRODUCT_REGION_VN		= 4;		-- 越南版本

SYSCFG_PRODUCT_REGION_NAME, SYSCFG_PRODUCT_REGION_ID = GetProductRegion();	-- 当前版本

---------------------------------------------------------------
-- 钱庄功能配置 (1 - 开启，nil - 关闭)
SYSCFG_GAMEBANK_GOLDSILVER_OPEN = 1; -- 金银元宝功能开放

SYSCFG_GAMEBANK_GOLD_GET 		= 1; -- 金元宝领取
SYSCFG_GAMEBANK_GOLD_PAY 		= 1; -- 金元宝充值
SYSCFG_GAMEBANK_GOLD_COIN 	= 1; -- 金元宝换铜钱
SYSCFG_GAMEBANK_GOLD_USE 		= 1; -- 金元宝的其它消耗用途

SYSCFG_GAMEBANK_SILVER_GET 	= 1; -- 银元宝领取
SYSCFG_GAMEBANK_SILVER_PAY 	= 1; -- 银元宝充值
SYSCFG_GAMEBANK_SILVER_COIN = 1; -- 银元宝换铜钱
SYSCFG_GAMEBANK_SILVER_USE 	= 1; -- 银元宝的其它消耗用途

SYSCFG_GAMEBANK_TICKET_OPEN = 1; -- 银票功能开放
SYSCFG_GAMEBANK_TICKET_GET 	= 1; -- 银票领取
SYSCFG_GAMEBANK_TICKET_PAY 	= 1; -- 银票充值
SYSCFG_GAMEBANK_TICKET_COIN = 1; -- 银票换铜钱
SYSCFG_GAMEBANK_TICKET_USE 	= 1; -- 银票的其它消耗用途
---------------------------------------------------------------
-- LLG_ALLINONE_TODO_20070802
--扩展点的使用
SYSCFG_EXTPOINTID7_LOGINMSG		= 1;	--登入游戏时，根据扩展点状态给与信息提示

---------------------------------------------------------------
-- 奇珍阁功能配置 (1 - 开启，nil - 关闭)
SYSCFG_SHOP_OPEN            = 1;
---------------------------------------------------------------

---------------------------------------------------------------
-- 桃花岛功能配置 (1 - 开启，nil - 关闭)
SYSCFG_TAOHUAISLAND_OPEN    = 1;
---------------------------------------------------------------

---------------------------------------------------------------
-- 每日领取奖励功能配置 (1 - 开启，nil - 关闭)
SYSCFG_AWARDPERDAY_OPEN     = nil;
if (SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_TW or SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_VN) then
	SYSCFG_AWARDPERDAY_OPEN = 1;
end
---------------------------------------------------------------

---------------------------------------------------------------
-- 转包月用户领取奖励功能配置 (1 - 开启，nil - 关闭)
SYSCFG_PAYMONTHAWARD_OPEN     = nil;
if (SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_TW or SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_VN) then
	SYSCFG_PAYMONTHAWARD_OPEN = 1;
end
---------------------------------------------------------------

---------------------------------------------------------------
-- 同伴功能配置 (1 - 开启，nil - 关闭)
SYSCFG_PARTNER_OPEN     = nil;
if (SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_CN or SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_TW or SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_VN) then
	SYSCFG_PARTNER_OPEN = 1;
end
---------------------------------------------------------------

---------------------------------------------------------------
-- 新帮会功能配置 (1 - 开启，nil - 关闭)
SYSCFG_NEWTONG_OPEN     = nil;
if (SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_CN or SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_CN_IB or SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_VN) then
	SYSCFG_NEWTONG_OPEN = 1;
end
---------------------------------------------------------------

---------------------------------------------------------------
function IncludeForRegionVer(strPath, strLuaFileName)
	
	local strFullName = strPath;
		
	if(SYSCFG_PRODUCT_REGION_NAME == nil) then	
		print("region_version error!!!\n");
		return
	end
	
	strFullName = strFullName..SYSCFG_PRODUCT_REGION_NAME.."\\"..strLuaFileName;
	print(strFullName);	
	Include(strFullName);
end

-- 判断玩家是否 VIP
function IsVip()
	if (GetAccLeftTime() > 0) then 
		return 1;
	end
	return 0
end;