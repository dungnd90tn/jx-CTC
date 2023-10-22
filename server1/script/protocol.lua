Include("\\script\\lib\\objbuffer_head.lua")



ScriptProtocol = {}

ScriptProtocol.KE_SCRIPT_PROTOCOL = 
{
	"emSCRIPT_PROTOCOL_ECHO",
	"emSCRIPT_PROTOCOL_EQUIP_RANK",
	--"emSCRIPT_PROTOCOL_CLIENT_CMD",
	"emSCRIPT_PROTOCOL_STORES_REQUEST_ITEM",
	"emSCRIPT_PROTOCOL_REQUESTTABLE",
	"emSCRIPT_PROTOCOL_BATTLE",
	"emSCRIPT_PROTOCOL_BINGO_MACHINE",
	"emSCRIPT_PROTOCAL_HuoYueDu_Award", --给活跃度奖励	
	"emSCRIPT_PROTOCOL_COUNT",
	"emSCRIPT_PROTOCOL_BINGO_OPENWINDOW",
	"emSCRIPT_PROTOCOL_BINGO_COIN",
	"emSCRIPT_PROTOCOL_BINGO_GET_AWARD_RESULT",
	"emSCRIPT_PROTOCOL_BINGO_GET_COIN",
	
	"emSCRIPT_PROTOCOL_OPEN_CREDITS_SHOP",
	"emSCRIPT_PROTOCOL_SIGNUP_AREAN",
	"emSCRIPT_PROTOCOL_QIANCHONGLOU",
	"emSCRIPT_PROTOCOL_OPEN_JIAOZI_SHOP",
	"emSCRIPT_PROTOCOL_FULI_REPORT",
	"emSCRIPT_PROTOCOL_SECURITY_LOCK",
	"emSCRIPT_PROTOCOL_SECURITY_UNLOCK",
	"emSCRIPT_PROTOCOL_SECURITY_CONFIG",
	"emSCRIPT_PROTOCOL_SECURITY_RESET",
	"emSCRIPT_PROTOCOL_LUCKY_TURNTABLE",
	"emSCRIPT_PROTOCOL_POP_BLACK_TIPS",
	"emSCRIPT_PROTOCOL_OFFLINE",
	"emSCRIPT_PROTOCOL_ONLINE_AWARD",
	"emSCRIPT_PROTOCOL_CLIENT_EVENT",
	"emSCRIPT_PROTOCOL_ACHIEVEMENT_REWARD",
	"emSCRIPT_PROTOCOL_ACHIEVEMENT_ACHIEVED",
	"emSCRIPT_PROTOCOL_TONG_GUTA",
	---------------------签到系统 Begin--------------------------
	"emSCRIPT_PROTOCAL_SIGNIN_FETCH_DATA",
	"emSCRIPT_PROTOCAL_SIGNIN_DO",
	"emSCRIPT_PROTOCAL_SIGNIN_AWARD",
	"emSCRIPT_PROTOCAL_SIGNIN_SYNC_DATE",
	"emSCRIPT_PROTOCAL_SIGNIN_SYNC_AWARD",
	---------------------签到系统 End--------------------------
	"emSCRIPT_PROTOCOL_TONG_PKMESSAGE",
}

function ScriptProtocol:_InitProtocolEnum()
	for key, v in self.KE_SCRIPT_PROTOCOL do
		self[v] = key
	end
end


function ScriptProtocol:RegProtocol(szProtocolEnum, szFile, szFun, tbParamFormat)
	self.tbProtocolDef = self.tbProtocolDef or {}	
	local nProtocolId =  self[szProtocolEnum]	
	if type(nProtocolId) ~= "number" then
		print("reg script protocol fail because it's nil"..szProtocolEnum)
		return
	end
	if self.tbProtocolDef[nProtocolId] then
		error("reg script protocol fail because reged "..(self.KE_SCRIPT_PROTOCOL[nProtocolId] or "nil"))
		return
	end
	
	self.tbProtocolDef[nProtocolId] = {szFile, szFun, tbParamFormat}
end

function ScriptProtocol:HandleProcess(nHandle, tbParamFormat)
	
	if type(tbParamFormat) ~= "table" then
		return {nHandle}
	end
	
	local tbParam = {}

	for i=1, getn(tbParamFormat) do
		local var = ObjBuffer:PopByType(nHandle, tbParamFormat[i])
		tinsert(tbParam, var)
	end
	
	return tbParam
end


--服务器收到的协议, 服务器处理
function ScriptProtocol:ProtocolProcess(nProtolId, nHandle)	
	if type(nProtolId) == "number" and type(self.tbProtocolDef[nProtolId]) == "table" then
		
		local szFile = self.tbProtocolDef[nProtolId][1]
		local szFun = self.tbProtocolDef[nProtolId][2]
		local tbParamFormat = self.tbProtocolDef[nProtolId][3]
		local tbParam = self:HandleProcess(nHandle, tbParamFormat)
		
		if MODEL_GAMESERVER == 1 then
			DynamicExecuteByPlayer(PlayerIndex, szFile, szFun, unpack(tbParam))
		elseif MODEL_GAMECLIENT == 1 then
			if szFile ~= "" then
				Require(szFile)
			end
			DynamicExecute(szFile, szFun, unpack(tbParam))
		end
	end
end

function ScriptProtocol:RegProtocolSet(tbDefSet)
	for i=1, getn(tbDefSet) do 
		local tb = tbDefSet[i]
		if tb then
			self:RegProtocol(unpack(tb))
		end
	end
end

function ScriptProtocol:Echo(nHandle)
end

ScriptProtocol:_InitProtocolEnum()


--临时解决方案
if MODEL_GAMECLIENT == 1 then
	local Def = 
	{
		{
			"emSCRIPT_PROTOCOL_CLIENT_CMD",
			"\script\\lib\\clientcmd.lua",
			"ClientCmd:LuaExecute",
			{OBJTYPE_STRING}
		},
		{
			"emSCRIPT_PROTOCOL_STORES_REQUEST_ITEM",
			"\\script\\item\\dynamic_shop\\logic_c.lua",
			"DynamicShop:RecvItem",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER, OBJTYPE_TABLE}
		},
		{
			"emSCRIPT_PROTOCOL_BATTLE",
			"\\script\\missions\\battle\\protocol_c.lua",
			"show_battle_select",
			{OBJTYPE_TABLE}
		},
		{
			"emSCRIPT_PROTOCOL_BINGO_MACHINE",
			"\\script\\event\\bingo_machine\\bingo_machine_c.lua",
			"BingoMachine:RecvResult",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER, 
			 OBJTYPE_NUMBER, OBJTYPE_NUMBER},
			
		},
		{
			"emSCRIPT_PROTOCOL_BINGO_OPENWINDOW",
			"\\script\\event\\bingo_machine\\bingo_machine_c.lua",
			"BingoMachine:OpenWindow",
			{ OBJTYPE_NUMBER, OBJTYPE_NUMBER, 
				OBJTYPE_NUMBER, OBJTYPE_NUMBER, 
				OBJTYPE_NUMBER, OBJTYPE_NUMBER },
		},		
		{
			"emSCRIPT_PROTOCOL_BINGO_COIN",
			"\\script\\event\\bingo_machine\\bingo_machine_c.lua",
			"BingoMachine:RecvCoin",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER},
		},		
		{
			"emSCRIPT_PROTOCOL_BINGO_GET_AWARD_RESULT",
			"\\script\\event\\bingo_machine\\bingo_machine_c.lua",
			"BingoMachine:GetAwardResult",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER},
		},
		{
			"emSCRIPT_PROTOCOL_QIANCHONGLOU",
			"\\script\\missions\\qianchonglou\\ui.lua",
			"process_protocol",
			{OBJTYPE_NUMBER, OBJTYPE_TABLE},
		},
		{
			"emSCRIPT_PROTOCOL_FULI_REPORT",
			"\\script\\missions\\miniencounter\\report_ui.lua",
			"DataUpdated",
			{OBJTYPE_TABLE},
		},
		{
			"emSCRIPT_PROTOCOL_LUCKY_TURNTABLE",
			"\\script\\event\\luckyturntable\\client.lua",
			"LuckyTurntable:ProtocolProcess",
			{OBJTYPE_NUMBER, OBJTYPE_TABLE},
		},
		{
			"emSCRIPT_PROTOCOL_POP_BLACK_TIPS",
			"",
			"PopBlackTips",
			{OBJTYPE_STRING},
		},
		{
			"emSCRIPT_PROTOCOL_OFFLINE",
			"\\script\\event\\offline\\offline_c.lua",
			"tbOffline:ProtocolProcess",
			{OBJTYPE_NUMBER},
		},
		{
			"emSCRIPT_PROTOCOL_ONLINE_AWARD",
			"\\script\\event\\online_award\\client.lua",
			"tbOnlineAward:OnSyncGsData",
			{OBJTYPE_NUMBER, OBJTYPE_NUMBER, OBJTYPE_NUMBER, OBJTYPE_NUMBER},
		},
		{
			"emSCRIPT_PROTOCOL_ACHIEVEMENT_ACHIEVED",
			"",
			"PopAchievement",
			{OBJTYPE_NUMBER},
		},
		{
			"emSCRIPT_PROTOCOL_TONG_GUTA",
			"\\script\\missions\\tong_guta\\ui_client.lua",
			"GuTaUI:OnReceiveData",
			{OBJTYPE_NUMBER, OBJTYPE_TABLE},
		},
		{
        "emSCRIPT_PROTOCAL_SIGNIN_SYNC_DATE",
        "\\script\\ui\\signinsystem_c.lua",
        "ProcessSignInSyncDate",
        {OBJTYPE_TABLE},
    },
    {
        "emSCRIPT_PROTOCAL_SIGNIN_SYNC_AWARD",
        "\\script\\ui\\signinsystem_c.lua",
        "ProcessSignInSyncAward",
        {OBJTYPE_TABLE},
    },
    {
			"emSCRIPT_PROTOCOL_TONG_PKMESSAGE",
			"\\script\\tongpkmessage\\tong_pk_message.lua",
			"tbTongPkMessage:OnRecvProtocol",
			{OBJTYPE_TABLE},
		}
	}
	ScriptProtocol:RegProtocolSet(Def)
end

