-- 11.	有个美丽的少女破碗儿，地上有很多花，少女要求玩家交纳1亿两银子，否则采集最红的一朵花，
-- 不论采了哪朵，都不能完成任务，要采集和上交3次，然后破碗儿还是不满意，召唤出11个小破碗儿，击败所有小破碗儿后或者上交1亿两银子过关。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\maze\\progressbar.lua")

pTask = Task:New(11)

function pTask:OnStart()
	local pos_boss = self:GetPosition().t11_boss
	local pos_flower = self:GetPosition().t13_lamp
	local mapid = self:GetMapId()
	self.m_BossIndex = DlgNpcManager:AddNpc("Ph� O秐 Nhi", 1704, mapid, pos_boss.x, pos_boss.y, self, 0)
	self.m_Step = 1
	self.m_Collections = {}
	self.m_GiveCount = 0
	self.m_Monsters = {}
	self.m_Flowers = {}
	for i = 1, 10 do
		local nNpcIndex = DlgNpcManager:AddNpc("hoa", 1706, mapid, pos_flower[i].x, pos_flower[i].y, self, i)
		local tb = {}
		tb.NpcIndex = nNpcIndex
		tb.Bars = {}
		tinsert(self.m_Flowers, tb)
	end
end

function pTask:OnDestroy()
	if (self.m_BossIndex > 0) then
		DlgNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_Flowers) then
		for i = 1, getn(self.m_Flowers) do
			local tb = self.m_Flowers[i]
			if (tb.NpcIndex > 0) then
				DlgNpcManager:DelNpc(tb.NpcIndex)
			end
			for j = 1, getn(tb.Bars) do
				if (tb.Bars[j] > 0) then
					DelTimer(tb.Bars[j])
				end
			end
		end
		self.m_Flowers = nil
	end
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:CallMonsters()
	local pos = self:GetPosition().t11_monster
	local mapid = self:GetMapId()
	for i = 1, 11 do
		local nIndex = FightNpcManager:AddNpc("Ti觰 Ph� O秐 Nhi", 1705, mapid, pos[i].x, pos[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nIndex)
	end
end

function pTask:OnDeath(nKilledIndex, player, nIndex)
	self.m_Monsters[nIndex] = 0
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return
		end
	end
	self:Proceed()
end

function pTask:Say(player, nIndex)
	if (nIndex == 0) then
		return self:BossSay(player)
	else
		return self:FlowerSay(player, nIndex)
	end
end

function pTask:BossSay(player)
	if (self.m_Step == 1) then
		return "Mu鑞 vt 秈 kh玭g? V藋 th� a y 500 v筺 lng ti襫 m穒 l� ph� 甶.", {"Лa", "Kh玭g a", "в ta suy ngh�"}
	elseif (self.m_Step < 5) then
		local name = player:GetName()
		local count = self.m_Collections[name]
		if (not count or count == 0) then
			player:Say("ьi ngi h竔 頲 lo筰 hoa m� ta c莕 r錳 h穣 n t譵 ta nh�.")
			return
		end
		if (self.m_Step == 2) then
			player:Say("сa hoa n祔 kh玭g 頲  cho l緈, c竎 ngi l筰 h竔 v礽 c竔 甶.")
			self.m_Collections[name] = count - 1
			self.m_Step = 3
		elseif (self.m_Step == 3) then
			player:Say("C竔 n祔 m� c騨g n鉯 l� m祏  �? Ti誴 t鬰 h竔 甶! b籲g kh玭g ng c� m� m� vt 秈 .")
			self.m_Collections[name] = count - 1
			self.m_Step = 4
		elseif (self.m_Step == 4) then
			player:Say(" ta th藅 l� th蕋 v鋘g v韎 c竎 ngi qu�, c竎 ch� em, h穣 l玦 h� ra m� no cho ta m閠 tr薾!")
			self:CallMonsters()
			self.m_Step = 5
		end
	else
		player:Say("C竎 ch� em, h穣 l玦 h� ra m� no cho ta m閠 tr薾!")
	end
end

function pTask:FlowerSay(player, nIndex)
	if (self.m_Step >= 2) then
		local tb = self.m_Flowers[nIndex]
		local nId = ProgressBarList:Open("H竔 頲 r錳", player, 3, self, tb)
		tinsert(tb.Bars, nId)
	end
end

function pTask:OnAnswer(player, sel, nIndex)
	if (self.m_Step == 1) then
		if (sel == 1) then
			-- 交银子
			if (player:Pay(5000000) == 0) then
				player:Say("ьi gom  ti襫 r錳 n t譵 ta nh�.")
			else
				self:Proceed()
			end
		elseif (sel == 2) then
			player:Say("Kh玭g a �? V藋 th� gi髉 ta h竔 m閠 a hoa c� m祏  nh蕋 甧m v� y.")
			self.m_Step = 2
		end
	end
end

function pTask:OnProgressbarTimeout(nId, tb, player)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
	if (tb.NpcIndex > 0) then
		local name = player:GetName()
		player:Say("Ngi h竔 頲 m閠 a hoa m祏 ")
		self:BroadCast(format("%s h竔 頲 m閠 a hoa m祏 ", name))
		DlgNpcManager:DelNpc(tb.NpcIndex)
		tb.NpcIndex = 0
		local count = self.m_Collections[name] or 0
		self.m_Collections[name] = count + 1
	end
end

function pTask:OnProgressbarBreak(nId, tb)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
end
