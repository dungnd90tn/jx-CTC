-------------------------------------------------------------------------
-- FileName		:	posthouse.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-04 15:30:14
-- Desc			:	送信任务驿官脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--开宝箱工具函数
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
--Include("\\script\\lib\\awardtemplet.lua")--给奖励接口

IncludeLib("RELAYLADDER");	--排行榜


--构造各城市去其他城市的任务变量对应表        60-89级，90-119级，120以上三种
--citygo 的构造方式
--到各城市的任务变量，对应值，当前城市名字，去到城市名字，系对任务id，当前城市id，去到城市地图id，x，y
--1201 a tin nhi謒 v� phong chi k� nhi謒 v� thay i lng 
--1202 a tin nhi謒 v� mi誹 s琻 th莕 nhi謒 v� thay i lng 
--1203 a tin nhi謒 v� thi猲 b秓 kho nhi謒 v� thay i lng

citygo = {
---- Dng Ch﹗ 甶 nh鱪g th祅h th� kh竎 (mapid:80) 
{1204,1,"Dng Ch﹗","Bi謓 Kinh",1201,80,37,1601,3001}, 
{1204,2,"Dng Ch﹗","Phng Tng ",1201,80,1,1561,3114}, 
{1204,3,"Dng Ch﹗","L﹎ An",1201,80,176,1592,2925}, 
{1204,4,"Dng Ch﹗","Th祅h Й",1201,80,11,3021,5090}, 
{1204,5,"Dng Ch﹗","Tng Dng",1201,80,78,1596,3379}, 
{1204,6,"Dng Ch﹗","Чi L�",1201,80,162,1674,3132}, 

---- bi謓 kinh 甶 nh鱪g th祅h th� kh竎 (mapid:37) 
{1204,7,"Bi謓 Kinh","Dng Ch﹗",1201,37,80,1676,3000}, 
{1204,8,"Bi謓 Kinh","Phng Tng ",1201,37,1,1561,3114}, 
{1204,9,"Bi謓 Kinh","L﹎ An",1201,37,176,1592,2925}, 
{1204,10,"Bi謓 Kinh","Th祅h Й",1201,37,11,3021,5090}, 
{1204,11,"Bi謓 Kinh","Tng Dng",1201,37,78,1596,3379}, 
{1204,12,"Bi謓 Kinh","Чi L�",1201,37,162,1674,3132},

---- phng tng 甶 nh鱪g th祅h th� kh竎 (mapid:1) 
{1204,13,"Phng Tng","Dng Ch﹗",1202,1,80,1676,3000}, 
{1204,14,"Phng Tng","Bi謓 Kinh",1202,1,37,1601,3001}, 
{1204,15,"Phng Tng","L﹎ An",1202,1,176,1592,2925}, 
{1204,16,"Phng Tng","Th祅h Й",1202,1,11,3021,5090}, 
{1204,17,"Phng Tng","Tng Dng",1202,1,78,1596,3379}, 
{1204,18,"Phng Tng","Чi L�",1202,1,162,1674,3132}, 
-- 
---- trc khi an 甶 nh鱪g th祅h th� kh竎 (mapid:176) 
{1204,19,"L﹎ An","Dng Ch﹗",1202,176,80,1676,3000}, 
{1204,20,"L﹎ An","Phng Tng",1202,176,1,1561,3114}, 
{1204,21,"L﹎ An","Bi謓 Kinh",1202,176,37,1601,3001}, 
{1204,22,"L﹎ An","Th祅h Й",1202,176,11,3021,5090}, 
{1204,23,"L﹎ An","Tng Dng",1202,176,78,1596,3379}, 
{1204,24,"L﹎ An"," Чi L� ",1202,176,162,1674,3132}, 
-- 
---- th祅h  甶 nh鱪g th祅h th� kh竎 (mapid:11) 
{1204,25,"Th祅h Й","Dng Ch﹗",1203,11,80,1676,3000}, 
{1204,26,"Th祅h Й","Phng Tng",1203,11,1,1561,3114}, 
{1204,27,"Th祅h Й","Bi謓 Kinh",1203,11,37,1601,3001}, 
{1204,28,"Th祅h Й","L﹎ An",1203,11,176,1592,2925}, 
{1204,29,"Th祅h Й","Tng Dng",1203,11,78,1596,3379}, 
{1204,30,"Th祅h Й","Чi L�",1203,11,162,1674,3132},

---- tng dng 甶 nh鱪g th祅h th� kh竎 (mapid:78) 
{1204,31,"Tng Dng","Dng Ch﹗",1203,78,80,1676,3000}, 
{1204,32,"Tng Dng","Phng Tng",1203,78,1,1561,3114}, 
{1204,33,"Tng Dng","Bi謓 Kinh",1203,78,37,1601,3001}, 
{1204,34,"Tng Dng","L﹎ An",1203,78,176,1592,2925}, 
{1204,35,"Tng Dng","Th祅h Й",1203,78,11,3021,5090}, 
{1204,36,"Tng Dng","Чi L�",1203,78,162,1674,3132}, 
-- 
---- Чi L� 甶 nh鱪g th祅h th� kh竎 (mapid:162) 
{1204,37,"Чi L�","Dng Ch﹗",1201,162,80,1676,3000}, 
{1204,38,"Чi L�","Phng tng",1201,162,1,1561,3114}, 
{1204,39,"Чi L�","Bi謓 kinh",1202,162,37,1601,3001}, 
{1204,40,"Чi L�","L﹎ An",1202,162,176,1592,2925}, 
{1204,41,"Чi L�","Tng Dng",1203,162,78,1596,3379}, 
{1204,42,"Чi L�","Th祅h Й",1203,162,11,3021,5090}, 

--成都去其他城市(mapid:11)
{1204,1,"Th祅h Й","Чi L�",1203,11,162,1674,3132}, 

-- Чi L� 甶 nh鱪g th祅h th� kh竎 (mapid:162) 
{1204,2,"Чi L�","Th祅h Й",1203,162,11,3021,5090},

}

-------------------------------------------特殊信使任务的主界面-------------------------------------------------
function especiallymessenger()
	if ( nt_getTask(1270) == 0 ) then
		nt_setTask(1270,1)
		nt_setTask(1205,0)
		Msg2Player("Xin l鏸, ngi nh薾 nhi謒 v� t輓 s�  qu� h筺.")
	end

	--七大主城驿官只有成都和大理有任务
	local _, _, nMapIndex = GetPos()
	local MapId = SubWorldIdx2ID( nMapIndex )
	if MapId ~= 11 and MapId ~= 162 then
		Talk(1,"","Tham gia nhi謒 v� T輓 S� h穣 甶 t譵 D辌h Quan <color=red>Th祅h Й<color> ho芻 <color=red> Чi L�<color>!")
		return
	end
	nt_setTask(1211,0)
	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);--积分排名
	Describe(DescLink_YiGuan..": Vi謈 qu﹏ c� c馻 Tri襲 nh g莕 y lu玭 b� gi芻 Kim bi誸 trc, ta nghi ng� c� n閕 gi竛. Nh璶g trc khi m蕐 t猲 b筰 lo筰 n祔 b� ph竧 hi謓, ta mu鑞 r籲g tin n祔 kh緋 n琲 u bi誸, ngi c� mu鑞 g鉷 m閠 ph莕 s鴆 cho Qu鑓 gia kh玭g?",7,
	"Ta b籲g l遪g!/messenger_ido",
	"Ta n  giao nhi謒 v� T輓 s� /messenger_finishtask",
	"Ta mu鑞 x鉧 b� nhi謒 v� T輓 s� /messenger_losemytask",
	"Ta mu鑞 th╪g c蕄 nhi謒 v� t輓 s� danh hi謚/messenger_getlevel", 
     	 "Ta mu鑞 l蕐 甶觤 t輓 s�  i ph莕 thng/messenger_duihuanprize", 
     	 "Ta mu鑞 t譵 hi觰 nhi謒 v� t輓 s�/messenger_what", 
     	 "G莕 y ta c� chuy謓 b薾 r閚/no")
end


-------------------------------------------接受特殊信使任务的主界面-----------------------------------------------


function messenger_ido()
	local _, _, nMapIndex = GetPos()
	
	local Uworld1204 = nt_getTask(1204)  --记⒓玩家的任务变量，每次任务结束时清空
	local Uworld1028 = nt_getTask(1028)  --任务链任务变量
	local MapId = SubWorldIdx2ID( nMapIndex )
	if ( GetLevel() < 120 ) then
		Describe(DescLink_YiGuan..": Xin lng th�, ng c蕄 c馻 ngi hi謓 t筰 ch璦  120. h穣 ti誴 t鬰 t玦 luy謓 r錳 n g苝 ta.",1,"K誸 th骳 i tho筰/no")	
	elseif ( Uworld1204 ~= 0 )  then
		Describe(DescLink_YiGuan..":Xin l鏸! Nhi謒 v� T輓 s� c馻 b筺 ch璦 ho祅 th祅h, kh玭g th� ti誴 nh薾 nhi謒 v� gi鑞g nhau, xin ho祅 th祅h nhi謒 v� n祔 trc, c竚 琻!",1,"K誸 th骳 i tho筰/no")
	elseif (  messenger_givetime() == 10 ) then  --查看今日是否还有关卡时间
		Describe(DescLink_YiGuan.."：对不起，您今天在信使任务中的时间已耗尽，请明日再来,谢谢。",1,"结束对话/no")
	else
    	local nTaskFlag = check_daily_task_count()--检查还有没有任务机会
    	if nTaskFlag == 0 then
    		Describe(DescLink_YiGuan..": Xin lng th�, H玬 nay ngi  v蕋 v� r錳. Ng祔 mai h穣 quay l筰 nh�.",1,"K誸 th骳 i tho筰/no")
    		return
    	elseif nTaskFlag == -1 then
    		Describe(DescLink_YiGuan..": H玬 nay ngi  m謙 m醝 r錳. N誹 ngi c� <color=yellow>Thi猲 Kh� B秓 L謓h<color>, ta s� ph� l� cho ngi tham gia th猰 m閠 l莕 n鱝.",1,"K誸 th骳 i tho筰/no")
    		return
    	elseif nTaskFlag == 2 then
    		Msg2Player("Ngi c� c莔 Thi猲 Kh� B秓 L謓h tham gia nhi謒 v�, <color=yellow>nhi謒 v� ho祅 th祅h<color> ta s� thu h錳 L謓h B礽")
    	end
    	
    	WriteLog(format("Account:%s[Name:%s] ti誴 nh薾 nhi謒 v� T輓 S�, h玬 nay  ho祅 th祅h [%d] l莕.",
				GetAccount(),
				GetName(),
				nTaskFlag
				)
			);
	if nTaskFlag == 2 then
		tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuTinSuSuDungThienBaoKhoLenh")		
	else
		tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuTinSu")
	end
		if ( MapId == 80 ) then
			local CityId = random(1,6)
			for i=1,6 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end
		elseif ( MapId == 37 ) then
			local CityId = random(7,12)
			for i=7,12 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end
		elseif ( MapId == 1 ) then
			local CityId = random(13,18)
			for i=13,18 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end	
		elseif ( MapId == 176 ) then
			local CityId = random(19,24)
			for i=19,24 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end		
		elseif ( MapId == 11 ) then
			if ( messenger_choice(1,1) ~= 10 ) then
					print("messenger_choice error:1")
			end
			local CityId = random(25,30)
			for i=25,30 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end		
		elseif ( MapId == 78 ) then
			local CityId = random(31,36)
			for i=31,36 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end
		elseif ( MapId == 162 ) then
			if ( messenger_choice(2,2) ~= 10 ) then
					print("messenger_choice error:2")
			end
			local CityId = random(37,42)
			for i=37,42 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end
		else
			Msg2Player("Xin l鏸! Kh玭g bi誸 t筰 sao b筺 l筰 kh玭g th� nh薾 nhi謒 v� T輓 s�? Xin li猲 h� v韎 GM!")
		end
	end
end

--前往千宝库
function messenger_storewagoner()
	SetRevPos(11,10)
	
	NewWorld(395,1417,3207)
end

-----------------------------------------------给符合要求的玩家一个特殊信使任务，并改变其信使任务变量和到达关卡变量------------------------
function messenger_choice(CityIdTwo,j)
	if ( CityIdTwo == citygo[j][2] ) then	
		--设置由此地去彼地的任务变量	
		nt_setTask( 1204,citygo[j][2] )
		--设置去到哪个关卡的任务变量   
		nt_setTask( citygo[j][5],10) --设置信使任务的步骤
		local name = GetName()
		Talk(1,"","B筺 nh薾 頲 t� "..citygo[j][3].."n"..citygo[j][4].."c馻 nhi謒 v� T輓 s� c bi謙,"..citygo[j][3].."D辌h tr筸 D辌h quan cung t鑞g"..name.."Чi nh﹏!")		
		return 10
	end
end


---------------------------------------------------升级信使称号----------------------------------------------------------------------
function messenger_getlevel()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local messenger_reallevelname = ""
	if ( Uworld1206 == 1 ) then
		messenger_reallevelname = "M閏 b礽 t輓 s�"
	elseif ( Uworld1206 == 2 ) then
		messenger_reallevelname = "уng b礽 t輓 s�"
	elseif ( Uworld1206 == 3 ) then
		messenger_reallevelname = "Ng﹏ b礽 t輓 s�"
	elseif ( Uworld1206 == 4 ) then
		messenger_reallevelname = "Kim b礽 t輓 s�"
	elseif ( Uworld1206 == 5 ) then
		messenger_reallevelname = "Ng� t� kim b礽 t輓 s�"
	else	
		messenger_reallevelname = "Kh玭g c� b蕋 k� t輓 s� n祇"
	end 
	Describe(DescLink_YiGuan.."Ng礽 trc m総 l� "..messenger_reallevelname.." , ng礽 t輈h l騳 甶觤 t輓 s� v� "..Uworld1205.." 甶觤, ng礽 mu鑞 th╪g c蕄 l祄 lo筰 n祇 t輓 s� khi課 cho y",6,
		"M閏 b礽 t輓 s鯷50点]/messenger_levelmu",
		"уng b礽 t輓 s鯷150点]/messenger_leveltong",
		"Ng﹏ b礽 t輓 s鯷450点]/messenger_levelyin",
		"Kim b礽 t輓 s鯷800点]/messenger_leveljin",
		"Ng� t� kim b礽 t輓 s鯷1500点]/messenger_levelyuci",
		"Ta ch糿g qua l� t飝 ti謓 xem m閠 ch髏/no")
end

function messenger_levelmu()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 50 ) then
		if ( Uworld1206 < 1 ) then
			nt_setTask(1206,1)
			nt_setTask(1205,Uworld1205-50)
			Describe(DescLink_YiGuan..": Ch骳 m鮪g"..name.."Чi nh﹏ tr� th祅h T輓 s� M閏!",1,"K誸 th骳 i tho筰/no")
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_YiGuan..":"..name.."! B筺  l� T輓 s� - M閏, kh玭g c莕 t╪g c蕄, xin h穣 c� g緉g!",1,"K誸 th骳 i tho筰/no")		
		else
			Describe(DescLink_YiGuan..":"..name.."! Ъng c蕄 c馻 b筺 vt qu� T輓 s� - M閏, xin h穣 ch鋘 T輓 s� kh竎.",2,"Quay l筰/messenger_getlevel","K誸 th骳 i tho筰/no")				
		end
	else
		Describe(DescLink_YiGuan..":Xin l鏸!  B筺 kh玭g ph� h頿 v韎 甶襲 ki謓 t╪g c蕄 c馻 T輓 s� - M閏, xin h穣 n� l鵦, c竚 琻!",2,"Quay l筰/messenger_getlevel","K誸 th骳 i tho筰/no")
	end
end

function messenger_leveltong()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 150 )  then
		if ( Uworld1206 < 2 ) then
			nt_setTask(1206,2)
			nt_setTask(1205,Uworld1205-150)
			Describe(DescLink_YiGuan..": Ch骳 m鮪g "..name.." i nh﹏  l� t輓 s� - ng !!",1,"K誸 th骳 i tho筰/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_YiGuan..":"..name.."! Ngi  l� t輓 s� - ng, kh玭g c莕 th╪g c蕄, xin ti誴 t鬰 c� g緉g !",1,"K誸 th骳 i tho筰/no")				
		else
			Describe(DescLink_YiGuan..":"..name.."! C蕄 b薱 c馻 ngi vt qua t輓 s� - ng, xin m阨 l鵤 ch鋘 nh鱪g lo筰 t輓 s� kh竎.",2,"Tr� v�/messenger_getlevel","K誸 th骳 i tho筰/no")				
		end
	else
		Describe(DescLink_YiGuan..":Th藅 xin l鏸 ! Ngi kh玭g   甶襲 ki謓 ph� h頿 th╪g c蕄 t輓 s� - ng, xin ti誴 t鬰 c� g緉g, c竚 琻!",2,"Tr� v�/messenger_getlevel","K誸 th骳 i tho筰/no")
	end
end

function messenger_levelyin()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 450 ) then
		if ( Uworld1206 < 3 ) then
			nt_setTask(1206,3)
			nt_setTask(1205,Uworld1205-450)
			Describe(DescLink_YiGuan..": Ch骳 m鮪g"..name.."Чi nh﹏ th╪g th祅h T輓 s� - B筩!",1,"K誸 th骳 i tho筰/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_YiGuan..":"..name.."! B筺  l� T輓 s� - B筩, kh玭g c莕 th╪g c蕄, h穣 ti誴 t鬰 c� g緉g!",1,"K誸 th骳 i tho筰/no")				
		else
			Describe(DescLink_YiGuan..":"..name.."! Ъng c蕄 c馻 b筺  vt qua T輓 S� - B筩, xin h穣 ch鋘 T輓 s� kh竎!",2,"Quay l筰/messenger_getlevel","K誸 th骳 i tho筰/no")				
		end
	else
		Describe(DescLink_YiGuan..":Xin l鏸!  B筺 kh玭g ph� h頿 v韎 甶襲 ki謓 th╪g c蕄 c馻 T輓 s� - B筩, xin b筺 h穣 ti誴 t鬰 c� g緉g, c竚 琻!",2,"Quay l筰/messenger_getlevel","K誸 th骳 i tho筰/no")
	end
end

function messenger_leveljin()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 800 ) then
		if ( Uworld1206 < 4 ) then
			nt_setTask(1206,4)
			nt_setTask(1205,Uworld1205-800)
			Describe(DescLink_YiGuan..": Ch骳 m鮪g"..name.."Чi nh﹏ th╪g th祅h T輓 s� - V祅g!",1,"K誸 th骳 i tho筰/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_YiGuan..":"..name.."! B筺  l� T輓 s� - V祅g, kh玭g c莕 t╪g c蕄 n鱝, h穣 ti誴 t鬰 c� g緉g!",1,"K誸 th骳 i tho筰/no")		
		else
			Describe(DescLink_YiGuan..":"..name.."! Ъng c蕄 c馻 b筺  vt qu� T輓 s� - V祅g, xin ch鋘 T輓 s� kh竎!",2,"Quay l筰/messenger_getlevel","K誸 th骳 i tho筰/no")				
		end
	else
		Describe(DescLink_YiGuan..":Xin l鏸!  B筺 kh玭g ph� h頿 v韎 甶襲 ki謓 th╪g c蕄 c馻 T輓 s� - V祅g, h穣 ti誴 t鬰 c� g緉g, c竚 琻!",2,"Quay l筰/messenger_getlevel","K誸 th骳 i tho筰/no")
	end
end

function messenger_levelyuci()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 1500 ) then
		if ( Uworld1206 < 5 ) then
			nt_setTask(1206,5)
			nt_setTask(1205,Uworld1205-1500)
			Describe(DescLink_YiGuan..": Ch骳 m鮪g"..name.."Чi nh﹏ th╪g th祅h Ng� T� T輓 s� y猽 b礽!",1,"K誸 th骳 i tho筰/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_YiGuan..":"..name.."B筺  l� Ng� T� T輓 s� - V祅g, kh玭g c莕 t╪g c蕄 n鱝, xin h穣 ti誴 t鬰 c� g緉g!",1,"K誸 th骳 i tho筰/no")				
		end
	else
		Describe(DescLink_YiGuan..":Xin l鏸! B筺 kh玭g ph� h頿 甶襲 ki謓 v韎 甶襲 ki謓 t╪g c蕄 c馻 Ng� T� T輓 s� - V祅g, xin h穣 ti誴 t鬰 c� g緉g, c竚 琻!",2,"Quay l筰/messenger_getlevel","K誸 th骳 i tho筰/no")
	end
end

--------------------------------------------交信使任务------------------------------------------------------
function messenger_finishtask()
	local Uworld1201= nt_getTask(1201)	--送信任务风之骑任务变量
	local Uworld1202= nt_getTask(1202)	--送信任务山神庙任务变量
	local Uworld1203= nt_getTask(1203)	--送信任务千宝库任务变量
	local Uworld1204= nt_getTask(1204)	--送信任务所到地点任务变量
	local Uworld1205= nt_getTask(1205)	--信使积分
	local Uworld1206= nt_getTask(1206)	--信使称号
	local Uworld1208= nt_getTask(1208)	--风之骑杀怪记数器
	local Uworld1209= nt_getTask(1209)	--山神庙杀怪记数器
	local Uworld1210= nt_getTask(1210)	--千宝库杀怪记数器
	local Uworld1218= nt_getTask(1218)  --信使任务完成次数记数器

	if ( Uworld1201 == 30 ) then
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan.."Th藅 xin l鏸, ngi kh玭g c� � ho祅 th祅h t輓 s� t韎 nh薾 l蕐 ph莕 thng, nhi謒 v� n祔 xem th蕋 b筰 !",1,"K誸 th骳 i tho筰/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan.."Ch骳 m鮪g ng礽  ho祅 th祅h nhi謒 v� hi謓 t筰 !",1,"Nh薾 l蕐 ph莕 thng/messenger_flyprize")
		end
	elseif ( Uworld1202 == 30 ) then
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan.."Th藅 xin l鏸, ngi kh玭g c� � ho祅 th祅h t輓 s� t韎 nh薾 l蕐 ph莕 thng, nhi謒 v� n祔 xem th蕋 b筰 ",1,"K誸 th骳 i tho筰/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan.."Ch骳 m鮪g ng礽  ho祅 th祅h nhi謒 v� hi謓 t筰",1,"Nh薾 l蕐 ph莕 thng/messenger_templeprize")
		end
	elseif ( Uworld1203 == 30 or Uworld1203 == 25 ) then
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan..":Xin l鏸!  B筺 ch璦 ho祅 th祅h nhi謒 v� m� h玬 trc n l穘h thng, nhi謒 v� n祔 coi nh�  th蕋 b筰 r錳!",1,"K誸 th骳 i tho筰/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan..":  Ch骳 m鮪g b筺  ho祅 th祅h nhi謒 v�!",1,"Nh薾 l穘h ph莕 thng/messenger_treasureprize")
		end
	elseif ( Uworld1201 == 25 ) or ( Uworld1202 == 25 ) or ( Uworld1203 == 25 ) then   --完成了简单信使任务
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan.."Th藅 xin l鏸, ngi kh玭g c� � ho祅 th祅h t輓 s� t韎 nh薾 l蕐 ph莕 thng, nhi謒 v� n祔 xem th蕋 b筰",1,"K誸 th骳 i tho筰/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan.." Ch骳 m鮪g ng礽  ho祅 th祅h nhi謒 v� hi謓 t筰",1,"Nh薾 l蕐 ph莕 thng/messenger_simpleprize")	
		end
	elseif ( Uworld1201 ~= 0 or Uworld1202 ~= 0 or Uworld1203 ~= 0 ) then
		Describe(DescLink_YiGuan..": Nhi謒 v� t輓 s� c馻 ng礽 ch璦 ho祅 th祅h, xin h穣 ti誴 t鬰 c� g緉g",1,"K誸 th骳 i tho筰/no")
	elseif Uworld1203 ~= 0 then
		Describe(DescLink_YiGuan..": Xin h穣 lng th�, ngi v蒼 ch璦 ho祅 th祅h nhi謒 v� hi謓 t筰. L穙 Xa Phu b猲 c筺h ta c� th� a ngi n b秐  nhi謒 v� !",1,"K誸 th骳 i tho筰/no")
	else
		Describe(DescLink_YiGuan..": Ch璦 ti誴 nh薾 nhi謒 v� n祇 ngi c遪 l筰 tr� nhi謒 v�! Ngi u? B籱 c竔 t猲 n祔 l祄 nh﹏ b竛h bao cho ta!",1,"K誸 th骳 i tho筰/no")
	end
end

function messenger_flyprize()
	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
	local Uworld1207 = nt_getTask(1207)
	local i = random(1,5)
	AddRepute(i)
	Msg2Player("Ch骳 m鮪g ngi thu 頲 "..i.." 甶觤 danh v鋘g. ")
	if ( nt_getTask(1224) ~= 1 ) then
		if ( GetLevel()>=60 and GetLevel()<=89 ) then
			if ( nt_getTask(1223) >= 150 ) then
				messenger_giveplayerexp(1500000)
			end
		elseif ( GetLevel()>=90 and GetLevel()<=119 ) then
			if ( nt_getTask(1223) >= 200 ) then
				messenger_giveplayerexp(2000000)
			end			
		elseif ( GetLevel()>=120 and GetLevel()<=129 ) then
			if ( nt_getTask(1223) >= 300 ) then
				messenger_giveplayerexp(3000000)
			end		
		elseif ( GetLevel()>=130 ) then
			if ( nt_getTask(1223) >= 600 ) then
				messenger_giveplayerexp(6000000)
			end		
		end
	end
	
	nt_setTask(1201,0)	--送信任务风之骑任务变量
	nt_setTask(1204,0)	--送信任务所到地点任务变量
	nt_setTask(1207,0)	--送信任务当前杀怪记数
	nt_setTask(1211,0)
end

function messenger_templeprize()
 	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
	local Uworld1207 = nt_getTask(1207)
	local i = random(1,5)
	AddRepute(i)
	Msg2Player("Ch骳 m鮪g ngi thu 頲 "..i.." 甶觤 danh v鋘g. ")
	if ( nt_getTask(1224) ~= 1 ) then
		if ( GetLevel()>=60 and GetLevel()<=89 ) then
			if ( nt_getTask(1223) >= 150 ) then
				messenger_giveplayerexp(1500000)
			end
		elseif ( GetLevel()>=90 and GetLevel()<=119 ) then
			if ( nt_getTask(1223) >= 200 ) then
				messenger_giveplayerexp(2000000)
			end			
		elseif ( GetLevel()>=120 and GetLevel()<=129 ) then
			if ( nt_getTask(1223) >= 300 ) then
				messenger_giveplayerexp(3000000)
			end		
		elseif ( GetLevel()>=130 ) then
			if ( nt_getTask(1223) >= 600 ) then
				messenger_giveplayerexp(6000000)
			end		
		end
	end
	
	nt_setTask(1202,0)	--送信任务山神庙任务变量
	nt_setTask(1204,0)	--送信任务所到地点任务变量
	nt_setTask(1207,0)	--送信任务当前杀怪记数
	nt_setTask(1211,0)
end

function messenger_treasureprize()
  local nTaskFlag = check_daily_task_count()--检查还有没有任务机会
  if nTaskFlag == 0 then
  	Describe(DescLink_YiGuan..": Xin h穣 lng th�, h玬 nay ngi  qu� m謙 r錳. Hay l� ng祔 mai l筰 n i nhi謒 v� nh�.",1,"K誸 th骳 i tho筰/no")
  	return
  elseif nTaskFlag == -1 then
  	Describe(DescLink_YiGuan..": C� ph秈 ngi  l蕐 <color=yellow> Thi猲 Kh� B秓 L謓h <color> l祄 m蕋 r錳 h�? T譵 L謓h B礽 v� y ta m韎 thng cho ngi.",1,"K誸 th骳 i tho筰/no")
  	return
  end
  
  --检查背包空间
  local nTodayTaskCount = %get_task_daily(1205)
  local nBagCellNeed = 1
  if nTodayTaskCount == 0 then
  	nBagCellNeed = 2
  end
  if (CalcFreeItemCellCount() < nBagCellNeed) then
		Talk(1, "", format("<#>H祅h trang c馻 ngi kh玭g  ch� tr鑞g, h穣 s緋 x誴 l筰 h祅h trang c遪 tr鑞g %d � r錳 h穣 n nh薾 thng nh�.",nBagCellNeed))
		return
	end
	local n_level = GetLevel();
	G_ACTIVITY:OnMessage("FinishMail", 1, n_level);	
	--扣除千宝库令
	if nTaskFlag == 2 then
	--Fix bug 不能在帮会箱子内扣除千宝库令- Modifiec by DinhHQ - 20110502
	    	if ConsumeEquiproomItem(1, 6, 1, 2813, -1) == 1 then--扣除千宝库令
	    		Msg2Player("Ngi  giao 1 Thi猲 B秓 Kh� L謓h")
	    	else
	    		Talk(1, "", "Thi猲 B秓 Kh� L謓h c馻 ngi u sao ta kh玭g th蕐?")
	    		return
	    	end
    end
    
   	%add_task_daily(1205, 1)
	nt_setTask(1201,0)	--
	nt_setTask(1202,0)
	nt_setTask(1203,0)
	nt_setTask(1204,0)
	
	nTodayTaskCount = %get_task_daily(1205)--获取交任务后的计数值
	WriteLog(format("Account:%s[Name:%s] nh薾 ph莕 thng nhi謒 v� T輓 S�, h玬 nay  ho祅 th祅h [%d] l莕.",
			GetAccount(),
			GetName(),
			nTodayTaskCount
			)
		);
		
	--每天第一次完成任务奖励3个行侠令
	if nTodayTaskCount == 1 then
		for i = 1, 3 do
			--Fix bug sai level 行侠令- Modified by DinhHQ - 20110921
			AddItem(6,1,2566,1,0,0)--获取的行侠令为不绑定状态
		end;
		Msg2Player("Ngi nh薾 頲 3 H祅h Hi謕 L謓h")
	end
	
	--每次交任务奖励2个信使宝箱
	for i = 1, 2 do
		AddItem(6,1,2812,0,0,0)
	end;
	Msg2Player("Ngi nh薾 頲 2 T輓 S� B秓 Rng")
end

function messenger_simpleprize()

	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
	local i = random(1,5)
	AddRepute(i)
	Msg2Player("Ch骳 m鮪g ngi thu 頲 "..i.." 甶觤 danh v鋘g.")
	nt_setTask(1201,0)	
	nt_setTask(1202,0)	
	nt_setTask(1203,0)	
	nt_setTask(1204,0)
	nt_setTask(1207,0)
	nt_setTask(1211,0)
		
end

--------------------------------------------积分换奖励-----------------------------------------------------
function messenger_duihuanprize()
	Describe(DescLink_YiGuan..": Ph莕 thng g錷 c�: T輓 s� y猽 b礽 v� Trang b� Ho祅g Kim. Y猽 b礽 c� th� t╪g kh竛g t輓h c馻 nh﹏ v藅, trang b� Ho祅g Kim c� th� t╪g kinh nghi謒. B筺 mu鑞 ch鋘 lo筰 n祇?",3,
		"T輓 s� y猽 b礽 /messenger_prize_yaopai",
		"Ho祅g kim trang b�/messenger_prize_huangjin",
		"H� Tr� уng H祅h/messenger_prize_partner",
		"Nh鱪g v藅 ph萴 kh竎/messenger_prize_other",
		"в ta suy ngh� l筰!/no")
end

function messenger_prize_partner()
	Describe(DescLink_YiGuan..": Th� l躰h Long ng� v鮝 m韎 mang v� m閠 s� <color=red>M苩 n� уng h祅h k� b�<color>, ngi c� mu鑞 d飊g th� kh玭g?",5,
		"K� n╪g уng h祅h/no",
		"M苩 n� уng h祅h/messenger_prize_mianju",
		"V藅 ph萴 уng h祅h/no",
		"Quay l筰/messenger_duihuanprize",
		"Sau n祔 h穣 n鉯!/no")
end

function messenger_prize_mianju()
	Describe(DescLink_YiGuan..": M苩 n� ng h祅h chia th祅h 2 lo筰: 1 l莕 s� dung v� 10 l莕 s� d鬾g.  Mu鑞 i c竔 n祇?",4,
	"фi M苩 n� 1 l莕/prize_mianju_dan",
	"фi M苩 n� 10 l莕/prize_mianju_shi",
	"Quay l筰/messenger_prize_partner",
	"T筸 th阨 kh玭g i 頲!/no")
end

function prize_mianju_shi()
	Describe(DescLink_YiGuan..": B筺 mu鑞 i M苩 n� (10 l莕) Thi誹 Ni猲 V� s� L玦 Ki誱 hay l� Thanh Ni猲 V� s� L玦 Ki誱?  Xem r� ch璦 ch璦?",4,
	"фi M苩 n� Thi誹 Ni猲 V� S� /prize_mianju_shi_shaonian",
	"фi M苩 n� Thanh Ni猲 V� S� /prize_mianju_shi_qingnian",
	"Quay l筰/messenger_prize_mianju",
	"T筸 th阨 kh玭g i 頲!/no")
end

function prize_mianju_shi_shaonian()
	Describe(DescLink_YiGuan..": B総 u i y!",7,
	"M苩 n� (10 l莕) - Thi誹 Ni猲 L玦 Ki誱 [40000 ph髏]/prize_mianju_shi_shaolin_leijian",
	"M苩 n� (10 l莕) - Thi誹 Ni猲 Ti誹 Sng [40000 ph髏]/prize_mianju_shi_shaolin_xiaoshuang",
	"M苩 n� (10 l莕) - Thi誹 Ni猲 H醓 Nh薾 [40000 ph髏]/prize_mianju_shi_shaolin_huoren",
	"M苩 n� (10 l莕) - Thi誹 Ni猲 H秈 Л阯g [40000 ph髏]/prize_mianju_shi_shaolin_haitang",
	"M苩 n� (10 l莕) - Thi誹 Ni猲 Kim Phong [40000 ph髏]/prize_mianju_shi_shaolin_jinfeng",
	"Quay l筰/prize_mianju_shi",
	"T筸 th阨 kh玭g i 頲!/no")
end

function prize_mianju_shi_qingnian()
	Describe(DescLink_YiGuan..": B総 u i y!",7,
	"M苩 n� (10 l莕) - Thanh Ni猲 L玦 Ki誱 [40000 ph髏]/prize_mianju_shi_qinglin_leijian",
	"M苩 n� (10 l莕) - Thanh Ni猲 Ti誹 Sng [40000 ph髏]/prize_mianju_shi_qinglin_xiaoshuang",
	"M苩 n� (10 l莕) - Thanh Ni猲 H醓 Nh薾 [40000 ph髏]/prize_mianju_shi_qinglin_huoren",
	"M苩 n� (10 l莕) - Thanh Ni猲 H秈 Л阯g [40000 ph髏]/prize_mianju_shi_qinglin_haitang",
	"M苩 n� (10 l莕) - Thanh Ni猲 Kim Phong [40000 ph髏]/prize_mianju_shi_qinglin_jinfeng",
	"Quay l筰/prize_mianju_shi",
	"T筸 th阨 kh玭g i 頲!/no")
end

function prize_mianju_shi_qinglin_leijian()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,112,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_shi_qinglin_xiaoshuang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,113,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_shi_qinglin_huoren()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,114,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_shi_qinglin_haitang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,115,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_shi_qinglin_jinfeng()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,116,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_shi_shaolin_leijian()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,102,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_shi_shaolin_xiaoshuang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,103,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_shi_shaolin_huoren()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,104,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_shi_shaolin_haitang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,105,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_shi_shaolin_jinfeng()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,106,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan()
	Describe(DescLink_YiGuan..": B筺 mu鑞 i M苩 n� (1 l莕) Thi誹 Ni猲 V� s� L玦 Ki誱 hay l� Thanh Ni猲 V� s� L玦 Ki誱?  Xem r� ch璦 ch璦?",4,
	"фi M苩 n� Thi誹 Ni猲 V� S� /prize_mianju_dan_shaonian",
	"фi M苩 n� Thanh Ni猲 V� S� /prize_mianju_dan_qingnian",
	"Quay l筰/messenger_prize_mianju",
	"T筸 th阨 kh玭g i 頲!/no")
end

function prize_mianju_dan_qingnian()
	Describe(DescLink_YiGuan..": B総 u i y.",7,
	"M苩 n� (1 l莕) - Thanh Ni猲 L玦 Ki誱 [10000 ph髏]/prize_mianju_dan_qinglin_leijian",
	"M苩 n� (1 l莕) - Thanh Ni猲 Ti誹 Sng [10000 ph髏]/prize_mianju_dan_qinglin_xiaoshuang",
	"M苩 n� (1 l莕) - Thanh Ni猲 H醓 Nh薾 [10000 ph髏]/prize_mianju_dan_qinglin_huoren",
	"M苩 n� (1 l莕) - Thanh Ni猲 H秈 Л阯g [10000 ph髏]/prize_mianju_dan_qinglin_haitang",
	"M苩 n� (1 l莕) - Thanh Ni猲 Kim Phong [10000 ph髏]/prize_mianju_dan_qinglin_jinfeng",
	"Quay l筰/prize_mianju_dan",
	"T筸 th阨 kh玭g i 頲!/no")
end

function prize_mianju_dan_shaonian()
	Describe(DescLink_YiGuan..": B総 u i y.",7,
	"M苩 n� (1 l莕) - Thi誹 Ni猲 L玦 Ki誱 [10000 ph髏]/prize_mianju_dan_shaolin_leijian",
	"M苩 n� (1 l莕) - Thi誹 Ni猲 Ti誹 Sng [10000 ph髏]/prize_mianju_dan_shaolin_xiaoshuang",
	"M苩 n� (1 l莕) - Thi誹 Ni猲 H醓 Nh薾 [10000 ph髏]/prize_mianju_dan_shaolin_huoren",
	"M苩 n� (1 l莕) - Thi誹 Ni猲 H秈 Л阯g [10000 ph髏]/prize_mianju_dan_shaolin_haitang",
	"M苩 n� (1 l莕) - Thi誹 Ni猲 Kim Phong [10000 ph髏]/prize_mianju_dan_shaolin_jinfeng",
	"Quay l筰/prize_mianju_dan",
	"T筸 th阨 kh玭g i 頲!/no")
end

function prize_mianju_dan_shaolin_leijian()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,97,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan_shaolin_xiaoshuang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,98,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan_shaolin_huoren()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,99,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan_shaolin_haitang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,100,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan_shaolin_jinfeng()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,101,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan_qinglin_leijian()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,107,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan_qinglin_xiaoshuang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,108,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan_qinglin_huoren()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,109,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan_qinglin_haitang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,110,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_mianju_dan_qinglin_jinfeng()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,111,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 M苩 n� ng h祅h")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end


function messenger_prize_yaopai()
	Describe(DescLink_YiGuan..": T輓 s� y猽 b礽 c飊g ngi t t韎 t輓 s� cho danh hi謚 tng i 鴑g. T� nh� ngi l� kim t輓 s�, 甧m c� th� i b蕋 k� t輓 s�, n誹 nh� ngi l� m閏 t輓 s�, th� kh玭g th� i kim t輓 s�. Hi觰 kh玭g ? b総 u i 甶 . .",7, 
       	"T輓 s� l謓h - M閏 [50 甶觤 ]/prize_yaopai_mu", 
    	"T輓 s� l謓h - уng [150 甶觤 ]/prize_yaopai_tong", 
     	"T輓 s� l謓h - B筩 [450 甶觤 ]/prize_yaopai_yin", 
	"фi T輓 s� Kim b礽 [800 甶觤]/prize_yaopai_jin",
	"Ng� T� l謓h b礽 - v祅g [1500 甶觤]/prize_yaopai_yuci",
	"Quay l筰/messenger_duihuanprize",
	"T筸 th阨 kh玭g i 頲!/no")
end

function prize_yaopai_mu()
	if ( nt_getTask(1205) >= 50 ) then
		AddItem(6,1,885,1,0,0)
		local Uworld1205 = nt_getTask(1205) - 50
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 t蕀 T輓 s� l謓h - M閏.")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_yaopai_tong()
	if ( nt_getTask(1205) >= 150 ) then
		AddItem(6,1,886,2,0,0)
		local Uworld1205 = nt_getTask(1205) - 150
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 t蕀 T輓 s� l謓h - уng.")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_yaopai_yin()
	if ( nt_getTask(1205) >= 450 ) then
		AddItem(6,1,887,3,0,0)
		local Uworld1205 = nt_getTask(1205) - 450
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 T輓 s� l謓h - B筩.")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end
end

function prize_yaopai_jin()
	if ( nt_getTask(1205) >= 800 ) then
		AddItem(6,1,888,4,0,0)
		local Uworld1205 = nt_getTask(1205) - 800
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 t蕀 T輓 s� l謓h - V祅g.")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_yaopai_yuci()
	if ( nt_getTask(1205) >= 1500 ) then
		AddItem(6,1,889,5,0,0)
		local Uworld1205 = nt_getTask(1205) - 1500
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 t蕀 Ng� T� T輓 S� y猽 b礽")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function messenger_prize_huangjin()
	Describe(DescLink_YiGuan..": Tri襲 nh mu鑞 thng cho b筺 n猲  chu萵 b� 1 b� Trang b� Ho祅g Kim khi gi誸 ch s� 頲 nh﹏ i kinh nghi謒. B筺 mu鑞 i c竔 n祇?",6,
		"H錸g 秐h tr莔 vi猲 v穘 t髖 [100000 甶觤]/prize_huangjin_shenyuan",
		"H錸g 秐h qua ki誱 t﹜ phng [70000 甶觤]/prize_huangjin_guajian",
		"H錸g 秐h m鬰 t骳 tng vong [70000 甶觤]/prize_huangjin_muxu",
		"H錸g 秐h h錸g t� chi猽 [50000 甶觤]/prize_huangjin_hongxiu",
		"Quay l筰/messenger_duihuanprize",
		"T筸 th阨 kh玭g i/no")
end

function messenger_prize_other()
	Describe(DescLink_YiGuan..": Tri襲 nh c� nhi襲 ph莕 thng, hi謓 b筺 v藅 ph萴 b筺 c� th� i:",3,
		"Th莕 b� Чi H錸g Bao [2000 ph髏]/prize_other_hongbao",
		"Quay l筰/messenger_duihuanprize",
		"T筸 th阨 kh玭g i/no")
end

function prize_other_hongbao()
	if ( nt_getTask(1205) >= 2000 ) then
		local Uworld1205 = nt_getTask(1205) - 2000 
		nt_setTask(1205,Uworld1205)
		AddItem(6,1,402,0,0,0)
		Msg2Player("B筺 nh薾 頲 1 Th莕 b� Чi H錸g Bao.")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_huangjin_shenyuan()
	if ( nt_getTask(1205) >= 100000 ) then
		AddGoldItem(0,204)
		local Uworld1205 = nt_getTask(1205) - 100000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 b� trang b� Ho祅g Kim H錸g 秐h.")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end


function prize_huangjin_guajian()
	if ( nt_getTask(1205) >= 70000 ) then
		AddGoldItem(0,205)
		local Uworld1205 = nt_getTask(1205) - 70000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 b� trang b� Ho祅g Kim H錸g 秐h.")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_huangjin_muxu()
	if ( nt_getTask(1205) >= 70000 ) then
		AddGoldItem(0,206)
		local Uworld1205 = nt_getTask(1205) - 70000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 b� trang b� Ho祅g Kim H錸g 秐h.")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end

function prize_huangjin_hongxiu()
	if ( nt_getTask(1205) >= 50000 ) then
		AddGoldItem(0,207)
		local Uworld1205 = nt_getTask(1205) - 50000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B筺 nh薾 頲 1 b� trang b� Ho祅g Kim H錸g 秐h.")
	else
		Describe(DescLink_YiGuan..": Xin l鏸! 觤 t輈h l騳 c馻 b筺 kh玭g .",1,"K誸 th骳! /no")
	end 
end
-------------------------------------------取消信使任务----------------------------------------------------
function messenger_losemytask()
	if ( GetTask(1204) == 0 ) then
		Describe(DescLink_YiGuan..": B筺 ch璦 ti誴 nh薾 nhi謒 v� T輓 s�, kh玭g th� x鉧 b�!",1,"K誸 th骳 i tho筰/no")
	else
		Describe(DescLink_YiGuan..": B筺 x竎 nh mu鑞 x鉧 b�?",2,"ng v藋!/messenger_lostall","в ta suy ngh� l筰!/no")
	end
end
--------------------------------------------解释什么是信使任务----------------------------------------------
function messenger_what()
	Describe(DescLink_YiGuan..": Nhi謒 v� t輓 s� l� tr� gi髉 tri襲 nh a tin cho c竎 th祅h ph� ch d辌h quan nhi謒 v�, b雐 v� g莕 nh蕋 t筰 tri襲 nh xu蕋 hi謓 ph秐 t芻, cho n猲, � a tin ch th阨 甶觤 g苝 ph秈 kh玭g 輙 nguy hi觤. Kh玭g c� tr� d騨g song to祅 ngi c飊g v韎 畂祅 k誸 h頿 t竎 tinh th莕 ngi 甧m r蕋 kh� ho祅 th祅h nhi謒 v�. Ch� c� t t韎 <color=red> 120 c蕄 tr� l猲 <color> m韎 c� th� tham gia. Trc m総 ngi g苝 n nh� sau c鯽 kh萿 ch tr� ng筰 : <color=red> thi猲 b秓 kho <color>. ? n琲 n祔 ch髏 quan b猲 trong , c� v� s� gi鑞g nhau ch nh﹏ v� k� qu竔 c� quan, ngi c莕 d飊g th玭g minh c飊g tr� kh玭 甶 ch輓h x竎 l鵤 ch鋘 . ta ch� c� th� ch骳 ngi th祅h c玭g, c� g緉g , chi課 h鱱 !!",4, 
       "Gi韎 thi謚 c蕄 b薱 b秐  /messenger_levelmap", 
       "Gi韎 thi謚 phong chi k� quan/messenger_flyhorse", 
       "Gi韎 thi謚 S琻 th莕 mi誹 quan t筽 /messenger_mountaindeity", 
    	"Gi韎 thi謚 Thi猲 B秓 kh� /messenger_storehouse",
       "Gi韎 thi謚 t輓 s� y猽 b礽/messenger_orderlevel", 
       "Gi韎 thi謚 nhi謒 v� h筺 l骳/messenger_limittotask", 
       "K誸 th骳 i tho筰 /no")
end

function messenger_levelmap()
	--Describe(DescLink_YiGuan.."：按照玩家的不同等级，我们划分了三种不同强度的地图给您。级别区分是<color=red>60-89级，90-119级，120<color>以上三种。",2,"回上一层/messenger_what","结束对话/no")
	Describe(DescLink_YiGuan..": Trc m総 ch� c� <color=red> c蕄 120 tr� l猲<color> m閠 m鴆  nhi謒 v�",2,"Quay l筰/messenger_what","K誸 th骳 i tho筰/no")
end

function messenger_flyhorse()
	Describe(DescLink_YiGuan..": Trong 秈 Phong K�, b筺 c� th� ch鋘 n c鎛g ra, nh� th� coi nh� ho祅 th祅h nhi謒 v� nh璶g ch� nh薾 頲 甶觤 danh v鋘g. Trong 秈, ch髇g t玦 c� l藀 nh鱪g m鬰 ti猽 nhi謒 v� n gi秐: D鋍 阯g b筺 s� th蕐 nhi襲 k� hi謚 c馻 qu﹏ ta  l筰, c飊g l骳 c� nhi襲 gian t� Kim Qu鑓. B筺 ch� c莕 ti誴 x骳 5 t鋋  trong b秐  c� th� n c鎛g ra t譵 B筩h D鵦 Tng qu﹏ qua 秈. Nh璶g bi觰 hi謓 c馻 b筺 u n籱 trong t莔 m総 c馻 trinh s竧 ta ph竔 n. цi v韎 vi謈 t╪g ng c蕄 Y猽 b礽 c馻 b筺 s� r蕋 c� l頸.",2,"Quay l筰/messenger_what","K誸 th骳 i tho筰/no")
end

function messenger_mountaindeity()
	Describe(DescLink_YiGuan..": Trong 秈 S琻 Th莕 mi誹, b筺 c� th� ch鋘 tr鵦 ti誴 n c鎛g, nh� th� xem nh� ho祅 th祅h nhi謒 v�, nh璶g ch� thng 甶觤 danh v鋘g. Trong 秈, ch髇g t玦 c� l藀 nh鱪g m鬰 ti猽 nhi謒 v� n gi秐: Trong n骾 xu蕋 hi謓 ph秐  c馻 Kinh S� Th莕 產o doanh, b鋘 h� � trong r鮪g c秐 tr� th� t輓. Th� l躰h c馻 b鋘 ch髇g x璶g l� o Y猽. B筺 ch� c莕 nh b筰 2 t猲 o Y猽 th� c� th� n c鎛g t譵 N筽 Lang Thanh Th祅h qua 秈. N誹 ho祅 th祅h nhi謒 v� i v韎 vi謈 t╪g ng c蕄 Y猽 b礽 c馻 b筺 r蕋 c� l頸.",2,"Quay l筰/messenger_what","K誸 th骳 i tho筰/no")
end

function messenger_storehouse()
	Describe(DescLink_YiGuan..": Ngi ho芻 i trng c馻 ngi khi ti誴 nh薾 nhi謒 v� vt 秈 Thi猲 B秓 Kh�, h� th鑞g s� ph﹏ ph鑙 cho ngi ng蓇 nhi猲  nh薾 頲 5 ch� s�, c╪ c� v祇 <color-red> d鵤 theo th� t� <color> c馻 ch� s� m� ra <color=red> B秓 Rng<color> c馻 s� th� t� i 鴑g trong c鯽 秈 Thi猲 B秓 Kh�, th� c� th� qua 秈. Л琻g nhi猲, ph秈 m� B秓 Rng, ngi ph秈 nh b筰 <color=red> boss B秓 Kh� Th� H� Gi� <color> b猲 c筺h B秓 Rng. <color=red> Ng� H祅h Ph� <color> c� b竛 trong K� Tr﹏ C竎 m� ra c� th� nh薾 頲 Tri謙 Kim Ph�, Tri謙 M閏 Ph�, Tri謙 Th駓 Ph�, Tri謙 H醓 Ph�, Tri謙 Th� Ph�, sau khi s� d鬾g c� th� gi髉 ngi d� d祅g nh b筰 boss B秓 Kh� Th� H� Gi�.",2,"Quay l筰/messenger_what","K誸 th骳 i tho筰/no")
end

function messenger_orderlevel()
	Describe(DescLink_YiGuan..": C╪ c� bi觰 hi謓 c馻 b筺 trong 秈, ch髇g t玦 s� phong cho b筺 v礽 Quan h祄, b筺 s� nh薾 頲 nhi襲 ph莕 thng. Y猽 b竔 hi謓 t筰 chia th祅h T輓 s� - M閏, T輓 s� - уng, T輓 s� - B筩, T輓 s� - V祅g v� Ng� T� T輓 s� -  V祅g. уng th阨, b筺 nh蕁 <color=red>F12<color>, xem trong b秐g <color=red>甶觤 t輈h l騳<color> c馻 nhi謒 v� T輓 s�, bi誸 頲 v� tr� ch鴆 quan c馻 m譶h. B筺 c� th� d飊g 甶觤 t輈h l騳 i danh hi謚 T輓 s�. Sau  c� th� d飊g 甶觤 t輈h l騳 T輓 s� i Y猽 b礽. Nh鱪g Y猽 b礽 n祔 s� t╪g kh� n╪g <color=red>ph鬰 h錳<color> c馻 b筺, n� c� t竎 d鬾g trong <color=red>1 gi�<color>, s� l莕 s� d鬾g l� <color=red>5 l莕<color>.",2,"Quay l筰/messenger_what","K誸 th骳 i tho筰/no")
end

function messenger_limittotask()
	Describe(DescLink_YiGuan..": Sau khi ti誴 nh薾 nhi謒 v� T輓 s�, b筺 c� th阨 gian <color=red>2 gi�<color>  ho祅 th祅h. Th阨 gian l祄 nhi謒 v� m鏸 ng祔 l� <color=red>2 gi�<color>. Ch� �! Khi � trong 秈, b筺 b� ch誸 ho芻 r韙 m筺g xem nh� <color=red>nhi謒 v� th蕋 b筰<color>!",2,"Quay l筰/messenger_what","K誸 th骳 i tho筰/no")
end

function messenger_giveplayerexp(playerexp)

	local j =random(1,3)

	if ( j == 1 ) then
		tl_addPlayerExp(playerexp-500000)
	elseif ( j == 2 ) then
		tl_addPlayerExp(playerexp)
	elseif ( j == 3 ) then
		tl_addPlayerExp(playerexp+500000)
	end
	Msg2Player("Do b筺 l祄 nhi謒 v� T輓 s� c� bi觰 hi謓 t鑤, D辌h tr筸 cho b筺 1 ph莕 thng kinh nghi謒!")
	nt_setTask(1224,1)  --设置当天奖励开关为开  
	nt_setTask(1223,0)
end

function messenger_lostall()
	nt_setTask(1201,0)
	nt_setTask(1202,0)
	nt_setTask(1203,0)
	nt_setTask(1204,0)
	nt_setTask(1207,0)
	nt_setTask(1212,0)
	nt_setTask(1213,0)
	nt_setTask(1214,0)
	nt_setTask(1215,0)
	Msg2Player("Ngi  h駓 b� th祅h c玭g nhi謒 v� T輓 S�.")
	WriteLog(format("Account:%s[Name:%s] h駓 b� nhi謒 v� T輓 S�",
			GetAccount(),
			GetName()
			)
		);
end

function no()
end

function check_daily_task_count()
	local nNormalTaskLimit = 2--一天最兜只允许两次普通任务
	local nIBTaskLimit = 1--一天最兜只允许1次IB任务
	local nTodayCnt = %get_task_daily(1205)
	if nTodayCnt < nNormalTaskLimit then
		return 1--还有普通任务机会
	elseif  nTodayCnt < (nNormalTaskLimit + nIBTaskLimit) then
		local nCountIb = CalcItemCount(-1, 6, 1, 2813, -1)
		if nCountIb >= 1 then
			return 2--可以使用道具报名
		else
			return -1--可以使用道具但是身上没有
		end
	end
	return 0--没有任务机会了
end
