-------------------------------------------------------------------------
-- FileName		:	messenger_templerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   山神庙入口
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的赖
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"B総 u nhi謒 v� /temple_starttask",
	  	"R阨 kh醝 khu v鵦/temple_movecity",
	  	"L竧 n鱝 quay l筰 /no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, "Nhi謒 v� t筰 b秐  s琻 th莕 mi誹/birthday0905_temple");
	end
	 Describe(DescLink_YiGuan..": Х b総 u t輓h th阨 gian qua 秈, c� g緉g l猲! B﹜ gi� b筺 mu鑞 l祄 g�?",getn(tbDialog), unpack(tbDialog))
end

function temple_starttask()
	if ( nt_getTask(1202) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:设置任务开始时间
		nt_setTask(1202,20)
		DisabledUseTownP(1)--禁用回城符				--1：禁用	--0：启用
		SetFightState(1);--打开战斗状态				--1：打开	--0：关闭
		SetLogoutRV(1);--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
		SetPunish(0);--关闭死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
		SetCreateTeam(1);--允许组队				--1：允许组队		--0：不允许组队
		ForbidChangePK(1);   --不能更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
		SetPKFlag(0);        --设置为练功模式        
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1340,3148);
		Msg2Player("Х b総 u t輓h th阨 gian l祄 nh蕺m v� ")
	elseif ( nt_getTask(1202) == 20 ) then
		Describe(DescLink_YiGuan.."B筺  ho祅 th祅h nhi謒 v�, kh玭g c莕 ti誴 nh薾 l筰!",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		Describe(DescLink_YiGuan..": Ngi  ho祅 th祅h nhi謒 v�, sao c遪 mu鑞 ti誴 nh薾 l筰 nhi謒 v�? Mau r阨 kh醝 y 甶!",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1202) == 0 ) then
		Describe(DescLink_YiGuan..": Ngi  ho祅 th祅h nhi謒 v� T輓 s� r錳! L祄 琻 bi課 cho khu蕋 m総!",1,"K誸 th骳 i tho筰/no")
	end
end

function temple_movecity()
	local name = GetName()
	if ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("D辌h tr筸 mi誹 S琻 th莕 cung t鑞g"..name.."Чi nh﹏ n"..citygo[i][4].."D辌h tr筸!")
			end
		end	
	elseif ( nt_getTask(1202) == 10 ) or ( nt_getTask(1202) == 0 ) then
		SetLogoutRV(0);
		NewWorld(1,1561,3114)
	end	  	
end

function birthday0905_temple()
	tbBirthday0905.tbTask:reset_task();
	Say("D辌h quan: T�  19/06/2009 n 24:00 19/07/2009, th玭g qua nh鱪g nhi謒 v� sau y c� th� thu 頲 h� nh藅 cung. Чi hi謕 c� mu鑞 tham gia?", 6, 
		"Nh薾 nhi謒 v� Ti猽 di謙 2 o Y猽./#birthday0905_settask_message(7)",
		"Nh薾 nhi謒 v� Ti猽 di謙 100 o th� S琻 Th莕 Mi誹./#birthday0905_settask_message(8)",
		"Ta  ho祅 th祅h nhi謒 v� Ti猽 di謙 2 o Y猽./#birthday0905_gettask_message(7)",
		"Ta  ho祅 th祅h nhi謒 v� Ti猽 di謙 100 o th� S琻 Th莕 Mi誹./#birthday0905_gettask_message(8)",
		"Ta mu鑞 h駓 nhi謒 v� hi謓 t筰/birthday0905_cancel_message",
		"Ta c� chuy謓 g蕄, s� quay l筰 sau./no");
end

function no()
end
