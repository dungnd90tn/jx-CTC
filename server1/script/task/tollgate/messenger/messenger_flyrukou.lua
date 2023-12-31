-------------------------------------------------------------------------
-- FileName		:	messenger_flyrukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   风之骑入口
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua"); 	--包含玩家任务数据表格的赖
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");	-- 越南资料片生日活动
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"B総 u nhi謒 v� /fly_starttask",
	  	"R阨 kh醝 khu v鵦/fly_movecity",
	  	"L竧 n鱝 quay l筰 /no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, " nhi謒 v� t筰 b秐  Phong K�/birthday0905_fly");
	end
	 Describe(DescLink_YiGuan..": Х b総 u t輓h th阨 gian qua 秈, c� g緉g l猲! B﹜ gi� b筺 mu鑞 l祄 g�?",getn(tbDialog), unpack(tbDialog))
end

function fly_starttask()
	if ( nt_getTask(1201) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:设置任务开始时间
		nt_setTask(1201,20)
		DisabledUseTownP(1)			--禁用回城符				--1：禁用	--0：启用
		SetFightState(1);			--打开战斗状态				--1：打开	--0：关闭
		SetLogoutRV(1);				--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
		SetPunish(0);				--关闭死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
		SetCreateTeam(1);			--允许组队					--1：允许组队		--0：不允许组队
		ForbidChangePK(1);   		--不能更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
		SetPKFlag(0);               --设置为练功模式            
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1559,3113);
		Msg2Player("Х b総 u t輓h th阨 gian l祄 nh蕺m v� ")
	elseif ( nt_getTask(1201) == 20 ) then
		Describe(DescLink_YiGuan.."B筺  ho祅 th祅h nhi謒 v�, kh玭g c莕 ti誴 nh薾 l筰!",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		Describe(DescLink_YiGuan..": Ngi  ho祅 th祅h nhi謒 v�, sao c遪 mu鑞 ti誴 nh薾 l筰 nhi謒 v�? Mau r阨 kh醝 y 甶!",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1201) == 0 ) then
		Describe(DescLink_YiGuan..": Ngi  ho祅 th祅h nhi謒 v� T輓 s� r錳! L祄 琻 bi課 cho khu蕋 m総!",1,"K誸 th骳 i tho筰/no")
	end
end

function fly_movecity()
	local name = GetName()
	if ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("Phong K� D辌h tr筸 cung t鑞g"..name.."Чi nh﹏ n"..citygo[i][4].."D辌h tr筸!")
			end
		end	
	elseif ( nt_getTask(1201) == 10 ) or ( nt_getTask(1201) == 0 ) then
		SetLogoutRV(0);
		NewWorld(37,1601,3001)
	end
end

function birthday0905_fly()
	tbBirthday0905.tbTask:reset_task();
	Say("D辌h quan: T� ng祔 19/06/2009 n 24h ng祔 19/07/2009 , n誹 i hi謕 c� th� vt qua 頲 m閠 trong nh鱪g th� th竎h sau y th� i hi謕 s� nh薾 頲 m閠 trong b鑞 t輓 v藅 v� c飊g qu� gi� l� 揃� Vng Thng�. Чi hi謕 c� b籲g l遪g tham gia th� th竎h kh玭g?", 8, 
		"Nh薾 nhi謒 v� Ti猽 di謙 500 Kim Qu鑓 gian t�./#birthday0905_settask_message(1)",
		"Nh薾 nhi謒 v� Ti猽 di謙 6 H� B竜 K�./#birthday0905_settask_message(2)",
		"Nh薾 nhi謒 v� Ti誴 x骳 100 t鋋 ./#birthday0905_settask_message(3)",
		"Ta  ho祅 th祅h nhi謒 v� Ti猽 di謙 500 Kim Qu鑓 gian t�./#birthday0905_gettask_message(1)",
		"Ta  ho祅 th祅h nhi謒 v� Ti猽 di謙 6 H� B竜 K�./#birthday0905_gettask_message(2)",
		"Ta  ho祅 th祅h nhi謒 v� Ti誴 x骳 100 t鋋 ./#birthday0905_gettask_message(3)",
		"Ta mu鑞 h駓 nhi謒 v� hi謓 t筰/birthday0905_cancel_message",
		"Ta c� chuy謓 g蕄, s� quay l筰 sau./no");
end

function no()
	
end