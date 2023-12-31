------------------------------------------------------------------------
-- FileName		:	partner_educationpeople.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-06 14:34:15
-- Desc			:  	各同伴教育任务npc对话
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的赖
Include("\\script\\task\\partner\\partner_problem.lua") --调用 nt_getTask 同步变量到客户端的赖
Include("\\script\\task\\partner\\partner_head.lua") --包含了图象调用
IncludeLib("PARTNER")

partner_birthday={"Th�","Ng璾"," h� ","Th�","Long","X�","M�","Dng","H莡","K�","C萿","Tr� "} 
partner_caimei ={"B骯","K衞","Bao"}

function partner_keepjiguan1(nChange)
	if ( nChange == 0 ) then
		Msg2Player("Ngi kh玭g c� h頿 c竎h, cho ta ngoan ngo穘 tr� l阨 v蕁  b筺 ng h祅h 甶.")
		partner_edu(3,1,29,3,1228,2,1,1)
	elseif ( nChange == 1 ) then
		jiguan1_giveprize()
	end
end

function partner_keepjiguan2(nChange)
	if ( nChange == 0 ) then
		Msg2Player("Ngi kh玭g c� h頿 c竎h, cho ta ngoan ngo穘 tr� l阨 v蕁  b筺 ng h祅h 甶")
		partner_edu(3,1,29,3,1228,4,1,2)
	elseif ( nChange == 1 ) then
		jiguan2_giveprize()
	end
end

function partner_keepjiguan3(nChange)
	if ( nChange == 0 ) then
		Msg2Player("Ngi kh玭g c� h頿 c竎h, cho ta ngoan ngo穘 tr� l阨 v蕁  b筺 ng h祅h 甶.")
		partner_edu(3,1,29,3,1228,6,1,3)
	elseif ( nChange == 1 ) then
		jiguan3_giveprize()
	end
end

function partner_keepjiguan4(nChange)
	if ( nChange == 0 ) then
		Msg2Player("Ngi kh玭g c� h頿 c竎h, cho ta ngoan ngo穘 tr� l阨 v蕁  b筺 ng h祅h 甶.")
		partner_edu(3,1,29,3,1228,8,1,4)
	elseif ( nChange == 1 ) then
		jiguan4_giveprize()
	end
end

function partner_keepzhuofeifan(nChange)
	if ( nChange == 0 ) then
		Msg2Player("Ngi kh玭g c� h頿 c竎h, cho ta ngoan ngo穘 tr� l阨 v蕁  b筺 ng h祅h 甶.")
		partner_edu(3,1,29,3,1228,10,1,5)
	elseif ( nChange == 1 ) then
		zhuofeifan_giveprize()
	end
end

function partner_keepheishadizi(nChange)
	if ( nChange == 0 ) then
		Msg2Player("Th藅 xin l鏸, ngi kh玭g tr� l阨 ch輓h x竎, ta kh玭g th� n鉯 cho ngi bi誸 c竔 g� ")
	elseif ( nChange == 1 ) then
		local Uworld1235 = nt_getTask(1235)
			  nt_setTask(1235,Uworld1235-1)
			if ( Uworld1235 - 1 <= 0 ) then 
                               nt_setTask(1230,12) 
                               Describe(DescLink_HeiShaDizi..": Kh玭g sai, b籲g h鱱, ngi mu鑞 b� t辌h 產ng � tr猲 tay c馻 ta ! ta l藀 t鴆 甧m b� t辌h a n ch� L穙 S�, ngi c� th� tr� v� 甶 t譵 H綾 S竧 l穙 s� h鋍 t藀 ba 畂筺 nh. C� g緉g l猲 ",1,"K誸 th骳 i tho筰 /heishadizi_chenggong") 
                        else 
                               Describe(DescLink_HeiShaDizi..": Th藅 xin l鏸 b籲g h鱱, b� t辌h kh玭g c� � y trong tay ta, ngi h穣 t譵 ngi kh竎 甶. B蕋 qu� nh� ngi v藋 c鵦 kh� p , ta l� h糿 cho ngi ch髏 tng thng.",2,"Nh薾 l蕐 ph莕 thng /heishadizi_giveprize","K誸 th骳 i tho筰 /heishadizi_geiyujiangli") 
                        end
	end
end

function partner_moxiaofeng_fajiang1(nChange)
	if ( nChange == 1 ) then
		moxiaofeng_giveprize()
	end	
end

function partner_xiaoding_fajiang1(nChange)
	if ( nChange == 1 ) then
		xiaoding_giveprize()
	end	
end

function partner_quwan_fajiang1(nChange)
	if ( nChange == 1 ) then
		quwan_getprize()
	end	
end

function partner_xieqinger_fajiang1(nChange)
	if ( nChange == 1 ) then
		xieqinger_getprize()
	end	
end

partner_keeponproblem = {
[1] = partner_keepjiguan1,
[2] = partner_keepjiguan2,
[3] = partner_keepjiguan3,
[4] = partner_keepjiguan4,
[5] = partner_keepzhuofeifan,
[6] = partner_keepheishadizi,
[7] = partner_moxiaofeng_fajiang1,
[8] = partner_xiaoding_fajiang1,
[9] = partner_quwan_fajiang1,
[10] = partner_xieqinger_fajiang1,
}



----------------------------------------------------------堑对话---------------------------------------------------
function pe_luqing()   
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务堑任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋尧水任务变量
	
	if ( Uworld1226 == 10 and Uworld1227 == 20 and Uworld1228 == 20 and Uworld1229 == 20 and Uworld1230 == 20 and Uworld1231 == 20) then 
              Describe(DescLink_LuQing..": M蕐 ngi ch髇g ta gi竜 d鬰 c騨g k誸 th骳. Ngi b﹜ gi� c� th� 甶 t譵 ki誱 Ho祅g  t�.",1,"K誸 th骳 i tho筰 /no") 
        elseif ( Uworld1226 == 10 ) and (Uworld1227 == 0) then 
              Describe(DescLink_LuQing..": Nh� ngi l� t韎 l祄 nhi謒 v� gi竜 d鬰. Ta y猽 c﹗ x輈h 秐h ng� b謓h, 產ng ph竧 ng tu luy謓 c竎 v� s� gi髉 m閠 tay t譵 th秓 dc y. Ngi c� th� � <color=red> b猲 tr竔 xu鑞g n骾 tr猲 s琻 o <color> t譵 頲 <color=red> ba nam m閠 n� <color> b鑞 v� s�. Kia gi髉 ngi n ph秈 c� th�, n誹 nh� ngi c� th� gi髉 ta 甧m tr� li謚 x輈h 秐h ch th秓 dc <color=red> mang v� <color>, ta s� cho ngi m閠 m苩 v� s� l祄, c� th� mang cho ngi r蕋 nhi襲 ch� t鑤 nga.<enter>" 
            .."<color=green> nhi謒 v� tng thng : B筺 ng h祅h k� n╪g kim cng kh玭g ph�, L玦 nh t� gi竝 <color>",2,"B総 u nhi謒 v�/luqing_findmedicin","K誸 th骳 i tho筰 /no") 
       elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then 
             Describe(DescLink_LuQing..": Th秓 dc ngi c騨g l蕐 頲 ? th藅 t鑤 qu�, ng鵤 c馻 ta m� 頲 c鴘 r錳. T鑤 l緈, ta s� n鉯 cho ngi bi誸 m閠 輙 khi誹 m玭 甶 :<enter>,t鑤 l緈, � ch� n祔 c馻 ta ngi  h鋍 kh玭g t韎 nhi襲 th� h琻, 甶 t譵 nh鱪g ngi kh竎 甶.B秓 tr鋘g ! nh譶 th蕐 ta c c� s� huynh ch th阨 甶觤 , xin m阨 thay ta th╩ h醝 h緉.",2,"Nh薾 l蕐 ph莕 thng /luqing_getprize","Sau n祔 tr� l筰 /no") 
       elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) then 
            Describe(DescLink_LuQing..": Kh玭g ph秈 l� n鉯 cho ngi bi誸 sao, ngi c� th� � <color=red> b猲 tr竔 xu鑞g n骾 tr猲 s琻 o <color> t譵 頲 <color=red> ba nam m閠 n� <color> b鑞 v� s�. Kia gi髉 ngi n ph秈 c� th�, n誹 nh� ngi c� th� gi髉 ta 甧m tr� li謚 x輈h 秐h ch th秓 dc <color=red> mang v� <color> , ta s� cho ngi m閠 m苩 v� s� l祄, c� th� mang cho ngi r蕋 nhi襲 ch� t鑤.",1, 
            "K誸 th骳 i tho筰 /no") 
       else 
            Describe(DescLink_LuQing..": R蕋 nhi襲 n╩ trc c c� s� huynh ng � giang h� cao nh蕋 ng鋘 n骾 kia tr猲 nh n骾, ta nh� v� l﹎ c竎  t� nh蕋 t� r髏 ra ba thc ki誱 phong i v韎 h緉 th� hi謚 m謓h ,  l� m閠 th莕 tho筰 甶. N╩ ngo竔 ta ngo礽 � mu鑞 nh薾 頲 m閠 phong t輓 s�, h緉 n鉯 g莕 nh蕋 H祅h S琻 產ng tuy誸, tr阨 l筺h nhanh h琻 kh玭g ch辵 n鎖. R蕋 mu鑞 t譵 ngi u鑞g ru, l筰 ph竧 gi竎 kh玭g c� ngi n祇 nh璶g kh竚 c閚g 萴. H緉 n鉯 s� m閠 m鵦 玭 tr� kia v� h祅h t飊g ru ch� ta. A a, ng v藋, ta ch� n祔 l� l鯽 th辬h vng m蕐 th藀 ni猲, v竎h n骾 b猲 ch  quy猲 c騨g khai c竚 琻 m蕐 th藀 ni猲, ta mu鑞 n╩ x璦 nh鱪g th� kia h﹎ m� suy ngh� c騨g h鉧 l祄 gi� r衪 th鎖 v祇 s� huynh ch trong th﹏ th� li評 甶. Ta y s� ph秈 甶 b錳 h緉, c騨g kh玭g bi誸 tr猲 阯g c� hay kh玭g b譶h t躰h, thi猲 h� lung tung ph秈 qu� l﹗.<enter>",1,"K誸 th骳 i tho筰 /no") 
       end
		
end

function luqing_findmedicin()
	if ( partner_checkdo() == 10 ) then
		nt_setTask(1227,10)
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,100 ,1)                   			--给当前同伴增加经验，+100
		Msg2Player("L� Thanh cho ngi 甶 b猲 tr竔 阯g xu鑞g n骾 thng, n琲  c� ba nam m閠 n� b鑞 v� v� s�.")
	end
end

function luqing_getprize()                                          --获得在堑处的总奖励
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()   --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,0,549,1)                      --增加同伴抗性技能《金刚不破》    
		Msg2Player("Ch骳 m鮪g ngi thu 頲 b筺 ng h祅h k� n╪g ?Kim cng kh玭g ph�?")
		nt_setTask(1227,20)											--堑处的所有任务已结束
		Msg2Player("Ngi  ho祅 th祅h � L� Thanh ch� ta h鋍 t藀, c� th� 甶 H綾 b筩h song s竧, Л阯g ?nh, thu y nc v� ch錸g n琲  nh譶 m閠 ch髏.")
	end
end

----------------------------------------------------------书生莫笑风对话-----------------------------------------

function pe_moxiaofeng()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务堑任务变量
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),1) ~= 1 ) then 
               Describe(DescLink_MoXiaoFeng..":<color=green>Phanh d� l祄 th辴 b� th� l祄 th� vui, s� tu m閠 u鑞g ba tr╩ ch衝. S莔 phu t�, 產n kh﹗ sinh, 甧m v祇 ru, qu﹏ s� d鮪g. C飊g qu﹏ ca m閠 kh骳, xin m阨 qu﹏ v� ta l鉵g tai nghe. Chu玭g ng h� c� so筺 ng鋍 ch璦  t, ch� mong trng say kh玭g ph鬰 t豱h. X璦 nay th竛h hi襫 t蕋 c� t辌h m辌h, duy c� u鑞g ngi l璾 k� danh.<color><enter>" 
             .." y l� Л阯g tri襲 i thi nh﹏ l� b筩h ch ki謙 t竎, say ru cu閏 s鑞g, l璾 danh d� s�. Dng n祇 th輈h �, ta ch� ci phong n誹 c� th� th祅h t鵸 m閠 phen ho礽 b穙, c騨g coi l� kh玭g c� u鎛g n th� gian n祔 甶 m閠 l莕. C竔 g� ? ngi l� l� thanh l穙 u kia t譵 t韎 mu鑞 th秓 dc ch? H� h�, mu鑞 th秓 dc c騨g kh玭g n gi秐 nh� v藋. Ta c� ba v蕁 , n誹 nh� ngi c騨g c� th� p i v韎, li襫 甧m tr猲 tay th秓 dc cho ngi. Цp kh玭g ng l阨 c馻, c鯽 u kh玭g c�.",2, 
               "Ngi c� h醝 /moxiaofeng_taskproblem", 
               "Sau n祔 l筰 t韎 t譵 ngi 甶 /no") 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),1) == 1 ) and ( GetBit(GetTask(1232),2) == 0 ) then 
               Describe(DescLink_MoXiaoFeng..": Л頲 r錳, ta 甧m ta ch� n祔 nh薾 thng cho ngi . ",2,"Nh薾 l蕐 ph莕 thng /moxiaofeng_giveprize","Sau n祔 tr� l筰 /no") -- nh薾 l蕐 tng thng ? ? ? ? ? ? ? ? ? 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then 
                Describe(DescLink_MoXiaoFeng..": Ngi  ho祅 th祅h � ch髇g ta b鑞 ngi ngi n琲 n祔 tu h祅h, dc th秓 c莔 xong tr� v� t譵 L� Thanh l穙 u 甶.",1,"K誸 th骳 i tho筰 /no") 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) then 
                Describe(DescLink_MoXiaoFeng..": Uh, ta y m閠 c鯽 秈 ngi  th玭g qua, 甶 t譵 ph輆 di v� s� 甶. B鋘 h� c騨g kh玭g ta nh� v藋 h秓 n鉯 chuy謓, m譶h c萵 th薾.",1,"K誸 th骳 i tho筰 /no") 
        else 
               Describe(DescLink_MoXiaoFeng..": Ch� ci 甶猲 cu錸g ch� ci phong, mi n╩ t藀 ki誱 mi n╩ t飊g. Th� sinh ta  s韒 mu鑞 ki誱 th� giang h�, k裻 long m閠 bu鎖 s竛g ph秈 c靑, v藋 c遪 kh玭g bay 甶 c鰑 thi猲, th辬h h祅h v� b� sao ? c竝 c竝 c竝 c竝 ha ha ..",1,"K誸 th骳 i tho筰 /no") 
       end
end

function moxiaofeng_taskproblem()
	--调用公共问题库，回答正确数要求为3，问题为问题1~问题29随机，玩家问答峰值为20次，完成回答后将1232号变量字节1置1
	partner_edu(3,1,29,3,1232,1,1,7)
end

function moxiaofeng_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,430,1 )                   			--给当前同伴增加经验，+430
		nt_setTask(1232,SetBit(GetTask(1232),2,1))  --发奖完毕
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� ta, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end

----------------------------------------------------------屠夫牛ⅩⅩ对话-----------------------------------------
function pe_niumanman()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务牛ⅩⅩ任务变量
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),3) ~= 1 ) then 
              Describe(DescLink_NiuManMan..": Ta l� m閠 s竧 th�, thu ti襫 b竛 m筺g. Ngi l� mu鑞 gi誸 heo y, hay l� mu鑞 gi誸 ngi ? <enter>" 
            .."A ? ngi l� c莕 dc li謚 ! Ta ng蕋, ngi t韎 b蕋 thi謓 kia ! Uh! Х nh� v藋, v藋 ngi nh蕋 nh ph秈 theo ta ch琲 m閠 tr� ch琲. Ch琲 b蕋 qu� ta l阨 c馻 ph秈 tr� v� p v蕁 , <color=red> b蕋 lu薾 p r蕋 ng i v韎 l鏸 u ph秈 s� c飊g ta ch琲 <color>. Cho n <color=red> th緉g <color> nh薾 ta m韎 c� th� xu蕋 quan. C竔 g� c竔 g� ? ta b� o ! Li襫 b� o, ngi n鉯 ngi c� 甶.",3, 
              "H秓, b総 u 甶 /niumanman_startcaimei", 
              "Nghe gi秐g thu藅 quy t綾 tr� ch琲/niumanman_guize", 
              "Sau n祔 l筰 t韎 t譵 ngi 甶/no") 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),3) == 1 ) and ( GetBit(GetTask(1232),4) == 0 ) then 
                Describe(DescLink_NiuManMan..": Л頲 r錳, ta 甧m ta ch� n祔 nh薾 thng cho ngi. ",2,"Nh薾 l蕐 ph莕 thng /niumanman_giveprize","Sau n祔 tr� l筰/no") -- nh薾 l蕐 tng thng ? ? ? ? ? ? ? ? ? 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then 
                Describe(DescLink_NiuManMan..": Ngi  ho祅 th祅h � ch髇g ta b鑞 ngi ngi n琲 n祔 tu h祅h, dc th秓 c莔 xong tr� v� t譵 L� Thanh l穙 u 甶 . ",1,"K誸 th骳 i tho筰 /no") 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),4) == 1 ) then 
                Describe(DescLink_NiuManMan..": Uhm, ta y m閠 c鯽 秈 ngi  th玭g qua, 甶 t譵 ph輆 di v� s� 甶. B鋘 h� 甶觤 t� c騨g kh玭g thi觰, ngi ph秈 c萵 th薾. ",1," K誸 th骳 i tho筰 /no") 
        else 
                Describe(DescLink_NiuManMan..": Gi誸 m閠 產o, gi誸 ngi c騨g l� m閠 產o. Nh� v藋 th� n祇, nh﹏ h遖 heo c� c竔 g� kh竎 nhau ? Thay v� gi誸 heo, kh玭g b籲g gi誸 ch髏 heo ch� kh玭g b籲g ngi c馻. Ngi n鉯 ng kh玭g ? t韎 t韎 t韎 , ch髇g ta ch琲 c� tr� ch琲 nh� th� n祇 ? ",2, 
             "Ch琲 li襫/niumanman_startcaimei", 
             "Kh玭g r穘h kh玭g r穘h /no") 
        end
end

function niumanman_startcaimei()
	Describe(DescLink_NiuManMan..": Л頲 r錳, nh� v藋 b﹜ gi� ngi l鵤 ch鋘 m閠 t� sinh ti誹 b総 u c飊g ta tranh t礽 甶, h� h�. Thua ngi !",3, 
         "Ta l鵤 ch鋘 th� ng璾 h� th� long x� c竔 n祔 t�/niumanman_bisai1", 
         "Ta l鵤 ch鋘 m� d� h莡 g� ch� heo c竔 n祔 t�/niumanman_bisai2", 
         "Ch� ch髏 tr� l筰 ch琲 /no")
end

function niumanman_guize()
Describe(DescLink_NiuManMan..": Ta ch� n祔 c� <color=red> t� th�, x蕌 x� b�, d莕 h�, m穙 th�, th莕 long, t� x�, ng� m�, kh玭g d�, th﹏ h莡, d藆 g�, tu蕋 ch�, h頸 heo <color> mi hai sinh ti誹. Ch髇g ta t韎 so l韓 nh�, c� th� quy t綾 l� : Ch髇g ta 甧m mi hai sinh ti誹 chia l祄 hai t�, trc s竨 th� ng璾 h� th� long x� l祄 m閠 t�. Sau s竨 m� d� h莡 g� ch� heo l祄 m閠 t�. Ngi t飝 � ch鋘 l鵤 m閠 t� t韎 c飊g ta so l韓 nh�. T� nh� ngi l鵤 ch鋘 th� ng璾 h� th� long x� c竔 n祔 m閠 t�, nh� v藋 n誹 nh� ta ra c� h�, ngi ra c� th�, nh� v藋 ngi so v韎 ta i. N誹 nh� ta ra c� long, ngi ra c� x�, v藋 th� ngi i. C騨g ch輓h l� d鵤 theo th� t� c祅g ng h祅g ph輆 sau c祅g l韓. B蕋 qu� y ngi cu鑙 c飊g l� so th� nh蕋 nh�  ti觰 nh﹏, c騨g ch輓h l� th� c� th� so v韎 x� i. Ch髇g ta hai m閠 ngi ra m閠 sinh ti誹, xem ai ch i. N誹 nh� trung gian xu蕋 hi謓 hai sinh ti誹 kh玭g ph秈 l� t鵤 v祇 c飊g nhau t譶h hu鑞g, nh� ta ra c� h�, ngi ra c� x�, nh� v藋 coi l� ta th緉g.?",2,
                   "Х hi觰,  cho ta tr� v�/pe_niumanman",
                   "Qu� kh� kh╪, kh玭g ch琲 /no")
end

function niumanman_bisai1()
	SetTaskTemp(190,0)
	local i = random (1,6)
	SetTaskTemp(190,i)
	Describe(DescLink_NiuManMan..": Л頲 r錳 頲 r錳 , b総 u ch鋘 b総 u ch鋘, c竝 c竝 c竝 c竝, nhanh l猲 m閠 ch髏 nhanh l猲 m閠 ch髏. Ngi ra c竔 g� ? ",6, 
      "Th� /niumanman_num1", 
      "Ng璾 /niumanman_num2", 
      "H� /niumanman_num3", 
      "Th� /niumanman_num4", 
      "Long /niumanman_num5", 
      "X� /niumanman_num6")
end

function niumanman_bisai2()
	SetTaskTemp(190,0)
	local i = random (7,12)
	SetTaskTemp(190,i)
	Describe(DescLink_NiuManMan..": Л頲 r錳 頲 r錳, b総 u ch鋘 b総 u ch鋘, c竝 c竝 c竝 c竝, nhanh l猲 m閠 ch髏 nhanh l猲 m閠 ch髏. Ngi ra c竔 g� ? ",6, 
       "M� /niumanman_num7", 
       "Dng /niumanman_num8", 
       "H莡 /niumanman_num9", 
       "K� /niumanman_num10", 
       "C萿 /niumanman_num11", 
       "Tr� /niumanman_num12")
end

function niumanman_bisaijieguo(partner_personnum)
	local partner_systnum = GetTaskTemp(190)
	if ( partner_personnum == 1 or partner_personnum == 7 ) then 
               if ( partner_systnum == 6 or partner_systnum == 12 ) then 
                    Describe(DescLink_NiuManMan..": Ta ra "..partner_birthday[partner_systnum]..", A ! Ngi l筰 nh� n祔 l頸 h筰, th藅 b� ngi nh b筰. Л頲 r錳, ngi qua ta y ng. ",1," K誸 th骳 i tho筰 /niumanman_taskfinish") 
               else 
                    Describe(DescLink_NiuManMan..": ta ra "..partner_birthday[partner_systnum]..", H綾 h綾, ngi thua n鱝 r錳 ! Tr� l阨 v蕁  甶.",1,"Л頲 r錳, ta tr� l阨 /niumanman_shule") 
               end 
        else 
              if ( partner_personnum == partner_systnum + 1 ) then 
                    Describe(DescLink_NiuManMan..": Ta ra "..partner_birthday[partner_systnum]..", A ! ngi l筰 nh� n祔 l頸 h筰, th藅 b� ngi nh b筰. Л頲 r錳, ngi qua ta y ng.",1,"K誸 th骳 i tho筰 /niumanman_taskfinish") 
              else 
                    Describe(DescLink_NiuManMan..": Ta ra "..partner_birthday[partner_systnum]..", H綾 h綾, ngi thua n鱝 r錳 ! Tr� l阨 v蕁  甶. ",1,"Л頲 r錳, ta tr� l阨 /niumanman_shule") 
              end 
        end
end

function niumanman_taskfinish()
	if ( nt_getTask(1226) == 10 ) and ( nt_getTask(1227) == 10 ) and ( GetBit(GetTask(1232),3) == 0 ) then
		nt_setTask(1232,SetBit(GetTask(1232),3,1))  --牛ⅩⅩ处任务完成，但未领取奖励
		niumanman_giveprize()
	end
end

function niumanman_shule()
	--调用公共问题库，回答正确数要求为1，问题为问题1~问题20随机，玩家问答峰值为100次，不设置完成字节
	if ( partner_edu(1,1,29,1,0) == 10 ) then 
             Describe(DescLink_NiuManMan..": L筰 b� ngi p ng r錳 , h秓 , tr� l筰 ch琲 tr� ch琲, ngi c� th� th緉g ta li襫 vt qua ki觤 tra",1,"T韎 th� t韎/niumanman_startcaimei") 
        else 
            Msg2Player("Цp sai l莔 r錳 li襫 tr� l筰.") 
        end
end

function niumanman_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,430,1)                   			--给当前同伴增加经验，+430
		PARTNER_AddSkill(partnerindex,0,553,1)                          --增加同伴抗性技能《雷霆护甲》
		Msg2Player("Ch骳 m鮪g ngi thu 頲 ng b筺 k� n╪g ?L玦 nh h� gi竝 ?") 
                   nt_setTask(1232,SetBit(GetTask(1232),4,1)) -- ph竧 tng xong 
                Say("Ngi  ho祅 th祅h nhi謒 v� ta ch� n祔, 甶 nh鱪g ngi kh竎 n琲  甶.",0)
	end
end

----------------------------------------------------------采花公子小丁对话----------------------------------------------
function pe_xiaoding()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务堑任务变量
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),5) ~= 1 ) then 
          Describe(DescLink_XiaoDing..":Ta l� c玭g t� h竔 hoa, kh玭g ph秈 l� kh� d﹜ d璦 c玭g t�. B筺 ng h祅h c馻 ta kh糿g nh cho ngi x誴 t r蕋 u b蓎 r藀 甶, n ta ch� n祔 kh玭g c莕. An t﹎ tr� l阨 i v韎 ba o  m鬰 li襫 甧m th秓 dc cho ngi.",2, 
              "V蕁  g� ? Ngi c� h醝/xiaoding_taskproblem", 
              "Sau n祔 l筰 t韎 t譵 ngi/no") 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),5) == 1 ) and ( GetBit(GetTask(1232),6) == 0 ) then 
             Describe(DescLink_XiaoDing..": Л頲 r錳, ta 甧m ta ch� n祔 ch tng thng cho ngi.",2,"Nh薾 l蕐 ph莕 thng /xiaoding_giveprize","Sau n祔 tr� l筰 /no") -- nh薾 l蕐 tng thng ? ? ? ? ? ? ? ? ? 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then 
             Describe(DescLink_XiaoDing..": Ngi  ho祅 th祅h � ch髇g ta b鑞 ngi ngi n琲 n祔 tu h祅h, dc th秓 c莔 xong tr� v� t譵 ti謒 l穙 u 甶.",1,
             "K誸 th骳 i tho筰 /no") 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),6) == 1 ) then 
             Describe(DescLink_XiaoDing..": Uh, ta y m閠 c鯽 秈 ngi  th玭g qua, 甶 t譵 h琲 th� m苩 ch v� s� 甶. B鋘 h� c騨g kh玭g ta nh� v藋 h秓 n鉯 chuy謓, m譶h c萵 th薾.",1,"K誸 th骳 i tho筰 /no") 
       else 
          if ( GetSex() == 0 ) then 
              Describe(DescLink_XiaoDing..": Ai , ai ai , ai ai ai .. ta oan kia ? 頲 x璶g c玭g t� h竔 hoa, l筰 m閠 a hoa c騨g kh玭g th秈 qu�. M韎 v鮝 � giang h� x玭g ra danh ti課g, li襫 b� trng ca c鯽 c鴑g r緉 頲 thu v祇 c鯽 trong , qu� tr� t鑙 t╩ kh玭g m苩 tr阨 , luy謓 c玭g t藀 v� ch ng祔 . i hi謕 , p trai , ngi nh蕋 nh ph秈 c鴘 ta 甶 ra ngo礽 a !",1,"K誸 th骳 i tho筰 /no") 
         else 
              Describe(DescLink_XiaoDing..": Ai , ai ai , ai ai ai .. ta oan kia ? 頲 x璶g c玭g t� h竔 hoa, l筰 m閠 a hoa c騨g kh玭g th秈 qu�. M韎 v鮝 � giang h� x玭g ra danh ti課g, li襫 b� trng ca c鯽 c鴑g r緉 頲 thu v祇 c鯽 trong , qu� tr� t鑙 t╩ kh玭g m苩 tr阨 , luy謓 c玭g t藀 v� ch ng祔 . m� n� , t� t� , ngi nh蕋 nh ph秈 c鴘 ta 甶 ra ngo礽 a !",1,"K誸 th骳 i tho筰 /no") 
         end 
    end
	
end

function xiaoding_taskproblem()
	--调用公共问题库，回答正确数要求为3，问题为问题1~问题20随机，玩家问答峰值为20次，完成回答后将1232号变量字节5置1
	partner_edu(3,1,29,3,1232,5,1,8)
end

function xiaoding_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,430,1 )                   			--给当前同伴增加经验，+430
		nt_setTask(1232,SetBit(GetTask(1232),6,1))  --发奖完毕
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� ta, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end
----------------------------------------------------------可爱女侠云雀儿对话---------------------------------------------
function pe_yunqueer()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务堑任务变量
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),7) ~= 1 ) then 
            Describe(DescLink_YunQueEr..": ha ha , ngi c飊g ch誸 gi誸 heo ch c竔  u heo ba n鉯 chuy謓 nhi襲 kh玭g c� ? h緉 c� ph秈 hay kh玭g  cho ngi c騨g sinh ti誹 ch l韓 nh� ? c竔 n祔 kh玭g c� h鋍 qu� s竎h ch . b鎛 ti觰 th� thu� nh� li襫 c thu閏 t� th� ng� kinh , n琲 n祇 l� h緉 c� th� h� so . ch髇g ta t韎 ch琲 cao c蕄 c騨g mai tr� ch琲 :  k衞 t� b� . h� h� ...... ngi thua gi鑞g nhau l� ph秈 v� p b鎛 ti觰 th� n鉯 ch v蕁  , nh� th� n祇 ? ",3, 
            "B総 u 甶/yunqueer_wenti", 
            "Cho ta gi秐g gi秈 m閠 h琲 th� quy t綾 /yunqueer_guize", 
            "Sau n祔 l筰 t韎 t譵 ngi 甶 /no") 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),7) == 1 ) and ( GetBit(GetTask(1232),8) == 0 ) then 
                Describe(DescLink_YunQueEr..": Л頲 r錳 , ta 甧m ta ch� n祔 ch tng thng cho ngi. ",2,"Nh薾 l蕐 ph莕 thng /yunqueer_giveprize","Sau n祔 tr� l筰 /no") -- nh薾 l蕐 tng thng ? ? ? ? ? ? ? ? ? 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then 
                Describe(DescLink_YunQueEr..": Ngi  ho祅 th祅h � ch髇g ta b鑞 ngi ngi n琲 n祔 tu h祅h , dc th秓 c莔 xong tr� v� t譵 ti謒 l穙 u 甶.",1,"K誸 th骳 i tho筰 /no") 
        elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),8) == 1 ) then 
                Describe(DescLink_YunQueEr..": Uh, ta y m閠 c鯽 秈 ngi  th玭g qua , 甶 t譵 h琲 th� m苩 ch v� s� 甶. B鋘 h� c騨g kh玭g ta nh� v藋 h秓 n鉯 chuy謓, m譶h c萵 th薾.",1,"K誸 th骳 i tho筰 /no") 
        else 
            if ( GetSex() == 0 ) then 
                  Describe(DescLink_YunQueEr..": H� h�, ta 產ng c飊g tr猲 c﹜ ch con chim n鉯 chuy謓 y. Ngi c� th� nghe hi觰 b鋘 h� n鉯 g� ? b鋘 h� n鉯 n琲 n祔 r蕋 p , c� s琻 ch v﹏ h� , c遪 c� so v﹏ h� p h琻 ch v﹏ tc m� y. Ca ca mang ta 甶 ra ngo礽 ch琲, c� 頲 hay kh玭g ? ",1,"K誸 th骳 i tho筰 /no") 
            else 
                  Describe(DescLink_YunQueEr..": H� h�, ta 產ng c飊g tr猲 c﹜ ch con chim n鉯 chuy謓 y. Ngi c� th� nghe hi觰 b鋘 h� n鉯 g� ? b鋘 h� n鉯 n琲 n祔 r蕋 p , c� s琻 ch v﹏ h� , c遪 c� so v﹏ h� p h琻 ch v﹏ tc m� y. T� t� mang ta 甶 ra ngo礽 ch琲, c� 頲 hay kh玭g ? ",1,"K誸 th骳 i tho筰 /no")
            end 
        end
end

function yunqueer_guize()
	Describe(DescLink_YunQueEr..": Quy t綾 l� nh� v藋 :  k衞 t� b� y ,  th緉g k衞 t� , k衞 t� th緉g b� , b� th緉g . Х hi觰 kh玭g c� ? ngi th緉g ta li襫 vt qua ki觤 tra , kh玭g c� th緉g ta ho芻 l� nh ngang tay , t� nh� ngi ra k衞 t� ta c騨g ra k衞 t� , v藋 c騨g coi l� ta th緉g. H� h�. B蕋 qu� ta th緉g c騨g kh玭g ph秈 l� kh� kh╪ ngi, p i v韎 ta ba o  m鬰 l� t鑤 r錳.",1,"Ta mu鑞 tr� v�/pe_yunqueer")
end

function yunqueer_wenti()
	Describe(DescLink_YunQueEr..": t韎 t韎 t韎 , b総 u vung quy襫 l筩. Ngi ra c竔 g� ? ",3, 
	"B骯/yunqueer_shitou", 
        "K衞/yunqueer_jianzi", 
        "Bao/yunqueer_bu")
end

function yunqueer_shitou()
	local i = random(1,3)
	if ( i ~= 2 ) then 
            Describe(DescLink_YunQueEr..": Ta ra "..partner_caimei[i]..", 羒 nha ! Ta th緉g n鱝 r錳 , h� h� , tr� l阨 v蕁  甶 ",1,"Tr� l阨 v蕁 /yunqueer_problem") 
       else 
            Describe(DescLink_YunQueEr..": Ta ra "..partner_caimei[i]..", 羒 nha ! B� ngi th緉g n鱝 r錳 , 頲 r錳. Coi nh� ngi qu� n鱝/r錳 . ",1,"Coi nh� ngi qu� quan /yunqueer_finish") 
       end
end

function yunqueer_jianzi()
	local i = random(1,3)
	if ( i ~= 3 ) then 
             Describe(DescLink_YunQueEr..": Ta ra "..partner_caimei[i]..", 羒 nha ! Ta th緉g n鱝 r錳 , h� h� , tr� l阨 v蕁  甶 ",1,"Tr� l阨 v蕁 /yunqueer_problem") 
       else 
            Describe(DescLink_YunQueEr..": Ta ra "..partner_caimei[i]..", 羒 nha ! B� ngi th緉g n鱝 r錳 , 頲 r錳. Coi nh� ngi qu� n鱝/r錳 . ",1,"Coi nh� ngi qu� quan /yunqueer_finish") 
       end
end

function yunqueer_bu()
	local i = random(1,3)
	if ( i ~= 1 ) then
	   Describe(DescLink_YunQueEr..": Ta ra "..partner_caimei[i]..", 羒 nha ! Ta th緉g n鱝 r錳 , h� h� , tr� l阨 v蕁  甶 ",1,"Tr� l阨 v蕁 /yunqueer_problem") 
       else 
            Describe(DescLink_YunQueEr..": Ta ra "..partner_caimei[i]..", 羒 nha ! B� ngi th緉g n鱝 r錳 , 頲 r錳. Coi nh� ngi qu� n鱝/r錳 . ",1,"Coi nh� ngi qu� quan /yunqueer_finish") 
       end
end

function yunqueer_problem()
	--调用公共问题库，回答正确数要求为3，问题为问题1~问题20随机，玩家问答峰值为100次，不设置完成字节
	if  ( partner_edu(3,1,29,3,0) == 10 ) then
		Msg2Player("T鑤, n� l鵦 li猲 t鬰 v� 畂筺 n祇 c馻 n�. Hee hee.")
	else
		Msg2Player("Thua c騨g kh玭g c莕 n鎖 gi薾, ti誴 t鬰. H� h�.")
	end
end

function yunqueer_finish()
	if ( nt_getTask(1226) == 10 ) and ( nt_getTask(1227) == 10 ) and ( GetBit(GetTask(1232),7) == 0 ) then
		nt_setTask(1232,SetBit(GetTask(1232),7,1))  --云雀儿处任务完成，但未领取奖励
		yunqueer_giveprize()
	end
end


function yunqueer_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,430,1 )                   			--给当前同伴增加经验，+430
		nt_setTask(1232,SetBit(GetTask(1232),8,1))  --发奖完毕
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� n祔, 甶 nh鱪g ngi kh竎 n琲  甶",0)
	end
end



-----------------------------------------------------------------唐影对话-----------------------------------------------------

function pe_tangying()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务堑任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋尧水任务变量
	
	if ( Uworld1226 == 10 and Uworld1227 == 20 and Uworld1228 == 20 and Uworld1229 == 20 and Uworld1230 == 20 and Uworld1231 == 20) then 
                Describe(DescLink_TangYing..": M蕐 ngi ch髇g ta gi竜 d鬰 c騨g k誸 th骳. Ngi b﹜ gi� c� th� 甶 t譵 ki誱 ho祅g  .",1,"K誸 th骳 i tho筰 /no") 
        elseif ( partner_getpartnerlevel(4) ~= 10 ) then 
                return 
        elseif ( Uworld1226 == 10 ) and ( Uworld1228 == 0 ) then -- 阯g 秐h ch� nhi謒 v� kh玭g c� x骳 ph竧 ? ? ? ? ? kh玭g c� 甧m nhi謒 v� tng thng n鉯 cho nh� ch琲 
               Describe(DescLink_TangYing..": Ai , v藋 ph秈 l祄 sao b﹜ gi� y ? thu nghi猽 a nh� n祔 qu� kh玭g nghe l阨.<enter>" 
               .."ngi l� ki誱 ho祅g   gi韎 thi謚 t韎. V藋 c騨g t鑤 , con trai c馻 ta 阯g thu nghi猽 b� tr蕁 tr猲 m閠 qu竔 nh﹏ 甶 r錳 , ta b﹜ gi� l筰 v閕 v祅g th秈 ch� m閠 lo筰 k� l� dc li謚 , hy v鋘g ngi c� th� thay ta 甧m thu nghi猽 c鴘 ra , ph秈 c� h錳 b竜. C竔  qu竔 nh﹏ 產ng � b猲 ph秈 treo ti觧 n琲  thi誸 tr� m閠 c竔 kh玭g th蕐 頲 kh玭g trung s筺 o , ngi c莕 t譵 頲 甶襲 n祔, h琻 n鱝 c鴘 ra con trai c馻 ta. Kia ch� � treo ti觧 b猲 tr猲 s� c� m閠 vi猲 k� qu竔 c﹜. Tr猲 c� cho ph衟 u kh玭g trung th筩h s琻 , m鏸 ng鋘 n骾 thng u ph秈 m� ra m閠 c� quan , ngi m竬 s� h醝 ngi ch髏 v蕁 . T鉳 l筰 v� c飊g kh玭g d� d祅g , ngi ph秈 c萵 th薾.<enter>" 
               .."<color=green> nhi謒 v� tng thng : ng b筺 k� n╪g ' b竎h c b蕋 x﹎ '?' ch﹏ h醓 kh竛g l鵦 '<color>",2, 
               "Ta ti誴 nh薾 khi猽 chi課 /tangying_findchildren", 
               "Ta c遪 kh玭g c� l祄 h秓 chu萵 b� y /no") 

       elseif ( Uworld1226 == 10 ) and ( Uworld1228 == 8191 ) then 
              Describe(DescLink_TangYing..": Thu nghi猽 ch� h琲 th� s� tr� l筰 ? th藅 t鑤 qu� ! C竚 琻 ngi. T鑤 l緈 , ta s� n鉯 cho ngi bi誸 m閠 輙 khi誹 m玭 甶 :<enter>" 
              .."<color=yellow> khi ngi x� vu ch� ng c玭g k輈h tr筺g th竔 th� ch nh﹏ � ng b筺 ch h祅h ng trong ph筸 vi l骳 , n誹 nh� l� anh m穘h h譶h l璾 manh h譶h h蘮 y誹 h譶h ch ng b筺 , s� g苝 t� ng c玭g k輈h n�, c╪ c� ng b筺 b蕋 ng t輓h t譶h h祅h ng c馻 h緉 ph筸 vi c飊g phng th鴆 c玭g k輈h c騨g s� kh玭g gi鑞g nhau. Khi ngi kh玭g mu鑞  cho ng b筺 c馻 ngi 甶 c玭g k輈h ch nh﹏ th阨 甶觤, ngi ch� c莕 � ng b筺 ch kho竔 ti謕 lan trong t譵 頲 c竔 n髏 sau  b猲 tr竔 ki謓 產n k輈h n� l� 頲 r錳. N誹 nh� ngi mu鑞 cho ng b筺 c馻 ngi c玭g k輈h l莕 n鱝 ch nh﹏ tho筰, v藋 ngi li襫 c莕 � ng b筺 ch kho竔 ti謕 lan trong t譵 頲 c竔 n髏 c騨g 甶觤 k輈h n�. Kh玭g mu鑞 c竔 n祔 ng b筺 l骳 , ta ph秈 nh� th� n祇 gi秈 t竛 h緉 y ? ngi u ti猲 mu鑞 � ng b筺 thu閏 t輓h gi韎 m苩 t譵 頲 gi秈 t竛 ng b筺 c竔 n髏 <color><enter>" 
              .."T鑤 l緈 , � ch� n祔 c馻 ta ngi  h鋍 kh玭g t韎 h琻 u ch , 甶 t譵 nh鱪g ngi kh竎 甶. Thu nghi猽 nc l� c馻 ta l穙 b� , ngi th蕐 n祅g l骳 c萵 th薾 m閠 ch髏 , ng祅 v筺 ng n鉯 cho n祅g con trai n衜 qu� a , n誹 kh玭g bu鎖 t鑙 ta s� b� giam � c鯽 . nh� c藋 nh� c藋 . ",2,"Nh薾 l蕐 ph莕 thng /tangying_getprize","Sau n祔 tr� l筰 /no") 

      elseif ( Uworld1226 == 10 ) and ( GetBit(GetTask(1228),1) == 1 ) then -- m韎 v鮝 nh薾 頲 阯g 秐h ch� nhi謒 v� 
              Describe(DescLink_TangYing..": 甶 <color=red> b猲 ph秈 treo ti觧 <color> n琲  t譵 頲 m閠 c竔 <color=red> ti觰 ?<color> , th玭g qua ngi m竬 tr薾 , 甧m ta h礽 t� t� c竔  ch誸 qu竔 v藅 tr竎 phi ph祄 trong tay c鴘 ra . ",1, 
              "K誸 th骳 i tho筰 /no") 
      else 
             Describe(DescLink_TangYing..": Nghe n鉯 b﹜ gi� Л阯g m玭 chng m玭 l� 阯g th� ? a nh� n祔 t﹎ t輓h h裵 h遡 kh� lng c� h筺 , l祄 g� ph秈 ba th鬰  nh蕋 gia ch ch� y ? c� l� i trc chng m玭 l� xem th蕌 ? i , c� � ch鋘 c� kh玭g bi誸 ti課 th� h筺g ngi th� nh� 甶 . nh綾 t韎 n╩  n誹 kh玭g ph秈 Nam Cung thi誹 hi謕 th祅h to祅 , h玬 nay ta 阯g 秐h  s韒 l� kh� c鑤 m閠 c� . c� ch髏 th辬h ngi kh玭g th� kh玭g tranh , r錳 l筰 tranh kh玭g th� tranh , c� th� th蕐 頲 tr猲 i s� m筺g m閠 o , cu鑙 c飊g t錸 c� may m緉 .. hy v鋘g ng祔 h鱱 ta Л阯g gia b秓 vt qua nh鱪g th� n祔 phong kh鉯 甶. <enter>",1,"K誸 th骳 i tho筰 /no") 
      end
	
end

function tangying_findchildren()
	nt_setTask(1228,SetBit(GetTask(1228),1,1))  --任务启动
	Msg2Player("Л阯g 秐h cho ngi 甶 b猲 ph秈 m閠 th莕 b� trong l鑙 甶 c鴘 ra con h緉 阯g thu nghi猽.")
end

function tangying_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,0,550,1)                          --增加同伴抗性技能《百毒不侵》
		Msg2Player("Ch骳 m鮪g ngi thu 頲 ng b筺 k� n╪g ? b竎h c b蕋 x﹎ ?")
		nt_setTask(1228,20)
		Msg2Player("Ngi  ho祅 th祅h � 阯g 秐h ch� h鋍 t藀, c� th� 甶 H綾 b筩h song s竧, thu nghi猽 nc, ti謒 n琲  nh譶 m閠 ch髏 .")
	end
end

----------------------------------------------------------------机关人对话--------------------------------------------------

function pe_jiguan1()
	if ( GetBit(GetTask(1228),1) == 1 ) and ( GetBit(GetTask(1228),2) == 0 ) then 
                  Describe(DescLink_JiGuanRen..": N骾 n祔 l� ta y c� quan l穙 i khai <enter>" 
                  .." n祔 c﹜ l� ta y c� quan l穙 i t礽 <enter>" 
                  .." n誹 mu鑞 nh ta y c� quan l穙 i c竔 n祔 qu� <enter>" 
                  .." th� ph秈 cho ta y c� quan l穙 i c� hi觰 <enter>" 
                  .." mu鑞 h醝 ngi qu� qu� n gi秐 . tr� l阨 ta y c� quan l穙 i m蕐 o kh玭g hi觰 ch phng ng玭  m鬰 , kh玭g tr� l阨 頲 s� ph秈 tr鮪g ph箃 ngi !",2, 
                  "Кn gi秐, ta qua l筰 p/jiguanren_problem1", 
                  "L祄 c竔 g�, trc kh玭g  � t韎 ngi/no") 
        elseif ( GetBit(GetTask(1228),2) == 1 ) and ( GetBit(GetTask(1228),3) == 0 ) then 
                 Describe(DescLink_JiGuanRen..": Л頲 r錳 , ta 甧m ta ch� n祔 ch tng thng cho ngi . ",2,"Nh薾 l蕐 ph莕 thng /jiguan1_giveprize","Sau n祔 tr� l筰 /no") -- nh薾 l蕐 tng thng ? ? ? ? ? ? ? ? ? 
        else 
                Describe(DescLink_JiGuanRen..": Ta l� m閠 ngi m竬 , y nha y nha nga.",1,"Ngi l� g� ngi m竬 a, ngi l� m閠 ngi 甶猲 /no") 
        end
end

function pe_jiguan2()
	if ( GetBit(GetTask(1228),1) == 1 ) and ( GetBit(GetTask(1228),4) == 0 ) then 
                Describe(DescLink_JiGuanRen..":N骾 n祔 v� ta c� quan l穙 , a l穙 , a l穙 l穙 Nh� khai <enter>" 
              .."n祔 c﹜ v� ta c� quan l穙 a , l穙 a , l穙 Nh� t礽 <enter>" 
              .."n誹 mu鑞 nh ta c� quan l穙 Nh� c竔 n祔 qu� <enter>" 
              .."th� ph秈 cho ta c� quan l穙 Nh� , a hai , a hi觰 r� <enter>" 
              .."mu鑞 h醝 ngi qu� qu� n gi秐. Tr� l阨 ta c� quan l穙 Nh� m蕐 o kh玭g hi觰 ch phng ng玭  m鬰 , kh玭g tr� l阨 頲 s� ph秈 tr鮪g ph箃 ngi !",2, 
             "Кn gi秐, ta qua l筰 p /jiguanren_problem2", 
            "L祄 c竔 g�, trc kh玭g  � t韎 ngi /no") 
       elseif ( GetBit(GetTask(1228),4) == 1 ) and ( GetBit(GetTask(1228),5) == 0 ) then 
              Describe(DescLink_JiGuanRen..": Л頲 r錳 , ta 甧m ta ch� n祔 ch tng thng cho ngi.",2,"Nh薾 l蕐 ph莕 thng /jiguan2_giveprize","Sau n祔 tr� l筰 /no") -- nh薾 l蕐 tng thng ? ? ? ? ? ? ? ? ? 
       else 
              Describe(DescLink_JiGuanRen..": Ta l� m閠 ngi m竬 , y nha y nha nga . ",1,"Ngi l� g� ngi m竬 a , ngi l� m閠 ngi 甶猲 /no") 
       end
end

function pe_jiguan3()
	if ( GetBit(GetTask(1228),1) == 1 ) and ( GetBit(GetTask(1228),6) == 0 ) then 
               Describe(DescLink_JiGuanRen..": n骾 n祔 l� c� quan l穙 Tam khai <enter>" 
              .."n祔 c﹜ l� c� quan l穙 Tam lo筰 gi鋞 <enter>" 
              .."n誹 mu鑞 nh ta y c� quan l穙 Tam c竔 n祔 qu� <enter>" 
              .."th� ph秈 cho ta c� quan l穙 Tam p hi觰 <enter>" 
              .."mu鑞 h醝 ngi qu� qu� n gi秐. Tr� l阨 c� quan l穙 Tam m蕐 o kh玭g hi觰 ch phng ng玭  m鬰 , kh玭g tr� l阨 頲 s� ph秈 tr鮪g ph箃 ngi !",2, 
               "Кn gi秐, ta qua l筰 p /jiguanren_problem3", 
               "L祄 c竔 g�, trc kh玭g  � t韎 ngi /no") 
        elseif ( GetBit(GetTask(1228),6) == 1 ) and ( GetBit(GetTask(1228),7) == 0 ) then 
                Describe(DescLink_JiGuanRen..": Л頲 r錳 , ta 甧m ta ch� n祔 ch tng thng cho ngi.",2,"Nh薾 l蕐 ph莕 thng /jiguan3_giveprize","Sau n祔 tr� l筰 /no") -- nh薾 l蕐 tng thng ? ? ? ? ? ? ? ? ? 
        else 
               Describe(DescLink_JiGuanRen..": Ta l� m閠 ngi m竬 , y nha y nha nga.",1,"Ngi l� g� ngi m竬, ngi l� m閠 ngi 甶猲 /no") 
        end
end

function pe_jiguan4()
	if ( GetBit(GetTask(1228),1) == 1 ) and ( GetBit(GetTask(1228),8) == 0 ) then 
                  Describe(DescLink_JiGuanRen..": n骾 n祔 l� ta y c� quan l穙 T� khai <enter>" 
                 .."n祔 c﹜ l� ta y c� quan l穙 T� t礽 <enter>" 
                 .."n誹 mu鑞 nh ta y c� quan l穙 T� c竔 n祔 qu� <enter>" 
                 .."th� ph秈 cho ta y c� quan l穙 T� c� hi觰 <enter>" 
                 .."mu鑞 h醝 ngi qu� qu� n gi秐. Tr� l阨 ta y c� quan l穙 i m蕐 o kh玭g hi觰 ch phng ng玭  m鬰 , kh玭g tr� l阨 頲 s� ph秈 tr鮪g ph箃 ngi !",2, 
                 "Кn gi秐, ta qua l筰 p /jiguanren_problem4", 
                 "L祄 c竔 g�, trc kh玭g  � t韎 ngi /no") 
        elseif ( GetBit(GetTask(1228),8) == 1 ) and ( GetBit(GetTask(1228),9) == 0 ) then 
                  Describe(DescLink_JiGuanRen..": Л頲 r錳 , ta 甧m ta ch� n祔 ch tng thng cho ngi.",2,"Nh薾 l蕐 ph莕 thng /jiguan4_giveprize","Sau n祔 tr� l筰 /no") -- nh薾 l蕐 tng thng ? ? ? ? ? ? ? ? ? 
        else 
                  Describe(DescLink_JiGuanRen..": Ta l� m閠 ngi m竬 , y nha y nha nga . ",1,"Ngi l� g� ngi m竬 � , ngi l� m閠 ngi 甶猲 /no") 
        end
end

function jiguanren_problem1()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第2位置1。如果回答不正确，调用partner_keeponproblem[1]
	partner_edu(2,101,118,2,1228,2,1,1) 
end

function jiguanren_problem2()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第4位置1。如果回答不正确，调用partner_keeponproblem[2]
	partner_edu(2,101,118,2,1228,4,1,2)
end

function jiguanren_problem3()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第6位置1。如果回答不正确，调用partner_keeponproblem[3]
	partner_edu(2,101,118,2,1228,6,1,3) 
end

function jiguanren_problem4()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第8位置1。如果回答不正确，调用partner_keeponproblem[4]
	partner_edu(2,101,118,2,1228,8,1,4) 
end

function jiguan1_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),3,1))  --发奖完毕
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� n祔, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end

function jiguan2_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),5,1))  --发奖完毕
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� n祔, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end

function jiguan3_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),7,1))  --发奖完毕
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� n祔, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end

function jiguan4_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),9,1))  --发奖完毕
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� n祔, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end

-----------------------------------------------------------------卓非凡对话---------------------------------------------------

function pe_zhuofeifan()
	if ( nt_getTask(1228) == 511 ) then 
               Describe(DescLink_ZhuoFeiFan..": Ha ha ! m閠 ki誱 l� phong , 甶 giang h� l�. Ta tr竎 phi ph祄 n╩  c騨g l� trong ch鑞 v� l﹎ nh蕋 ng m閠 ch cao th�. C竔 g� ? ta l� ai ? ng v藋 , ta l� ai a , ta , ta l� ai ? ai nha , b蕋 k� n鱝 r錳. Ngi ph秈 c鴘 c竔  h錸g h礽 nhi ? h緉 l� Ng璾 ma vng ch con trai ,  kh玭g ph秈 ch. A ! ta nh� ra r錳, ta l� T� thi猲 i th竛h , ha ha ha , l猲 tr阨 xu鑞g t th莕 ma  nh蕋 m� h莡 vng. Uh, n誹 ngi nh蕋 nh ph秈 c鴘 h緉 , ta m� h莡 vng d� nhi猲 c蕄 cho ngi m閠 c竔 c� h閕 , t韎 t韎 t韎 , p ta <color=red> n╩ o <color> v蕁  t韎.",2, 
              "T韎 th� t韎 /zhuofeifan_problem", 
              "C竔 n祔 tr竎 phi ph祄 b謓h th藅 t鑤 n苙g , ta c遪 l� sau n祔 tr� l筰 甶 /no") 
        elseif ( GetBit(GetTask(1228),11) == 1 )then 
                Describe(DescLink_ZhuoFeiFan..": ngi t韎 t譵 c� g鋓 阯g thu nghi猽 ch a tr� ? 阯g c竔 g� nghi猽 a , ch璦 t鮪g nghe qua . ngi xem m閠 ch髏 ph輆 sau n骾 h礽 t� kia c� ph秈 hay kh玭g ngi mu鑞 t譵. C鎛 n c鎛 n.",1,"K誸 th骳 i tho筰 /no") 
        elseif ( GetBit(GetTask(1228),10) == 1 ) and ( GetBit(GetTask(1228),11) == 0 ) then 
               Describe(DescLink_ZhuoFeiFan..": h� h� , h玬 nay l遪g ta t譶h h秓 , ch� h醝 ngi v蕁  . n誹 kh玭g tuy謙 i 甧m ngi ng b筺 nh ch誸 , h綾 h綾 . <color=yellow> ngi bi誸 s� c� c竔 g� tr鮪g ph箃 ? ng b筺 s� kh玭g ch誸 nh璶g l� khi ng b筺 ch sinh m筺g tr� gi� l� 0 l骳 l� ti課 v祇 tr筺g th竔 h玭 m� , t� ng th鑙 lui ra chi課 u , ph秈 頲 qu� 5 ph髏 sau m韎 c� th� l莕 n鱝 cho g鋓 , h琻 n鱝 ng b筺 k誸 th骳 tr筺g th竔 h玭 m� sau , sinh m筺g tr� gi� kh玦 ph鬰 v� l韓 nh蕋 tr� gi� ch 100% . b﹜ gi� bi誸 甶 . <color> 頲 r錳 , ta 甧m ta ch� n祔 ch tng thng cho ngi . ",2,"Nh薾 l蕐 ph莕 thng /zhuofeifan_giveprize","Sau n祔 tr� l筰 /no") -- nh薾 l蕐 tng thng ? ? ? ? ? ? ? ? ? 
        else  
               Describe(DescLink_ZhuoFeiFan..":Ta l� T� thi猲 i th竛h , ha ha ha. Tr竎 phi ph祄 ? tr竎 phi ph祄 l� ai ? ",1,"Khi h緉 tr猲 ngi c馻 c� l� x秠 ra chuy謓 g� th辬h t譶h /no") 
        end
end

function zhuofeifan_problem()
	--调用公共问题库，回答正确数要求为2，问题为问题101~问题118随机，玩家问答峰值为2次，回答正确将1228第4位置1。如果回答不正确，调用partner_keeponproblem[2]
	partner_edu(5,101,118,5,1228,10,1,5)
end

function zhuofeifan_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		PARTNER_AddSkill(partnerindex,0,552,1)                          --增加同伴抗性技能《真火抗力》
		Msg2Player("Ch骳 m鮪g ngi thu 頲 k� n╪g b筺 ng h祅h ? ch﹏ h醓 kh竛g l鵦 ?")
		nt_setTask(1228,SetBit(GetTask(1228),11,1))  --发奖完毕
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� n祔, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end


-----------------------------------------------------------------唐秋尧--------------------------------------------------------

function pe_tangqiuyi()
	
	if ( ( GetBit(GetTask(1228),12) == 1 ) and ( GetBit(GetTask(1228),13) == 0 ) ) then 
               Describe(DescLink_TangQiuYi..": D�, cho ngi 輙 th� ch琲 甶 . ",2,"Nh薾 l蕐 ph莕 thng /tangqiuyi_giveprize","Sau n祔 tr� l筰 /no") 
        elseif ( GetBit(GetTask(1228),11) == 1 ) and ( GetBit(GetTask(1228),12) == 0 ) then 
             if ( GetSex() == 0 ) then 
                Describe(DescLink_TangQiuYi..": A , Tr竎 th骳 th骳 kh玭g b錳 thu nghi猽 ch琲 n鱝 r錳 , ng� ...... m蕋 h鴑g. Л頲 r錳 , Чi ca ca ta l莕 trc 甶. Ngi c� th� tr� v� 甶 n鉯 cho ta bi誸 ph� th﹏. <color=red> n鱝 c飊g ta i tho筰 ta a ngi m閠 輙  nga. <color>",1,"K誸 th骳 i tho筰 /tangqiuyi_finish") 
             else 
                Describe(DescLink_TangQiuYi..": A , Tr竎 th骳 th骳 kh玭g b錳 thu nghi猽 ch琲 n鱝 r錳 , ng� ...... m蕋 h鴑g. Л頲 r錳 , Чi t� t� ta l莕 trc 甶. Ngi c� th� tr� v� 甶 n鉯 cho ta bi誸 ph� th﹏. <color=red> n鱝 c飊g ta i tho筰 ta a ngi m閠 輙  nga . <color>",1,"K誸 th骳 i tho筰 /tangqiuyi_finish") 
             end 
        elseif ( GetBit(GetTask(1228),13) == 1 ) then 
             if ( GetSex() == 0 ) then 
                Describe(DescLink_TangQiuYi..": A , Tr竎 th骳 th骳 kh玭g b錳 thu nghi猽 ch琲 n鱝 r錳 , ng� ...... m蕋 h鴑g. Л頲 r錳 , Чi ca ca ta l莕 trc 甶. Ngi c� th� tr� v� 甶 n鉯 cho ta bi誸 ph� th﹏. ",1,"K誸 th骳 i tho筰 /tangqiuyi_finish") 
             else 
                Describe(DescLink_TangQiuYi..": A , Tr竎 th骳 th骳 kh玭g b錳 thu nghi猽 ch琲 n鱝 r錳 , ng� ...... m蕋 h鴑g. Л頲 r錳 , Чi t� t� ta l莕 trc 甶. Ngi c� th� tr� v� 甶 n鉯 cho ta bi誸 ph� th﹏ . ",1,"K誸 th骳 i tho筰 /tangqiuyi_finish") 
             end 
      else 
             Describe(DescLink_TangQiuYi..": Tr竎 th骳 th骳 n鉯 mang ta 甶 b莡 tr阨 th蕐 thng nga t� t� y , ngi kh玭g mu鑞 s秓 n鱝/r錳 , ta s� kh玭g c飊g ngi 甶 . ngi ph秈 n鉯 c飊g Tr竎 th骳 th骳 n鉯 甶 . ",1,"K誸 th骳 i tho筰 /no") 
       end
end

function tangqiuyi_finish()
	nt_setTask(1228,SetBit(GetTask(1228),12,1))  --唐秋尧处任务完成
end

function tangqiuyi_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,800 ,1)                   			--给当前同伴增加经验，+800
		nt_setTask(1228,SetBit(GetTask(1228),13,1))  --发奖完毕
	end
end










-----------------------------------------------------------------白煞对话------------------------------------------------------
function pe_baisha()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务堑任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋尧水任务变量
	
	if ( Uworld1226 == 10 and Uworld1227 == 20 and Uworld1228 == 20 and Uworld1229 == 20 and Uworld1230 == 20 and Uworld1231 == 20) then 
                   Describe(DescLink_BaiSha..": M蕐 ngi ch髇g ta ch gi竜 d鬰 c騨g k誸 th骳. Ngi b﹜ gi� c� th� 甶 t譵 ki誱 ho祅g   . ",1,"K誸 th骳 i tho筰 /no") 
        elseif ( partner_getpartnerlevel(6) ~= 10 ) then 
                 return 
        elseif ( Uworld1226 == 10 ) and ( Uworld1229 == 0 ) then -- b筩h s竧 ch� nhi謒 v� kh玭g c� x骳 ph竧 ? ? ? ? ? kh玭g c� 甧m nhi謒 v� tng thng n鉯 cho nh� ch琲 
            Describe(DescLink_BaiSha..": B� o ru ngon ng� quang ch衝 <enter>" 
            .." mu鑞 u鑞g t� b� thng th骳 gi鬰 <enter>" 
            .." say n籱 sa trng qu﹏ ch� ci <enter>" 
           .." x璦 nay chinh chi課 m蕐 ngi tr� v� <enter>" 
           .." l骳 c遪 tr� t鎛g th輈h n籱 m� , h鋍 c� nh﹏ u鑞g Trng giang , m閠 thanh c秐h ki誱 m閠 chi誧 nh� h� b� ch箉 甶 b綾 t綾 nh譶 i m筩 ng祔. Цng ti誧 nh鱪g th� kia giang h� ch m璦 gi� kh玭g c� ng ph秈 ta , n鱝 o m総 ngi c騨g l穙 l筩 . giang h� l� c竎 ngi ngi tu鎖 tr� ch li評 , n誹 l� ki誱 ho祅g  t�  cho ngi t韎 , ta chung quy kh玭g th� g鋓 ngi tay kh玭g tr� v�. ? n琲 n祔 <color=red> v﹏ trung tr蕁 ch nam phng <color> c� hai n琲 a phng , chia ra k猽 l� <color=red> ba o s� th竝 , T� qu� ph� b礽 phng <color> . ta c� hai b蕋 th祅h kh� ch   � n琲 n祇 萵 c� , ngi 甶 t譵 b鋘 h� , t� s� h醝 ch髏 v蕁  tr竎h kh� kh╪ ngi . n誹 ngi c� th� qu� li評 c竔 n祔 hai quan , ta ch� n祔 ch  c騨g li襫 h鋍 頲 k衜 kh玭g u li評 . <enter>" 
          .."<color=green> nhi謒 v� tng thng : ng b筺 k� n╪g ' b╪g tuy誸 s� dung '<color>",2, 
        "V藋 ch髇g ta b﹜ gi� b総 u 甶 /baisha_starttask", 
       "K誸 th骳 i tho筰 /no") 

       elseif ( Uworld1226 == 10 ) and ( GetBit(GetTask(1229),3) == 1) and ( GetBit(GetTask(1229),5) == 1 ) and ( nt_getTask(1229) ~= 20 )then -- nhi謒 v�  ho祅 th祅h 

                 Describe(DescLink_BaiSha..": 頲 r錳 , ta s� n鉯 cho ngi bi誸 m閠 輙 khi誹 m玭 :<enter>" 
               .." ng b筺 ch l蕐 h琲 th� thu閏 t輓h l� c� t� ch蕋 ch :<color=red> sinh m筺g , l鵦 lng , m謓h trung , n� tr竛h , ch箉 t鑓 , may m緉 <color>; m閠 thu閏 t輓h ch t� ch蕋 c祅g cao � ngh躠 n猲 thu閏 t輓h � th╪g c蕄 l骳 t╪g l猲 ph秈 c祅g u , b蕋 qu� c� th� t╪g l猲 u thi觰 , <color=red> c飊g t� ch蕋 <color> ngi c馻 c騨g s� c� <color=red> ch髏 輙 b蕋 ng <color> . n鉯 th� d� nh� ngi c� hai ngi ng b筺 sinh m筺g t� ch蕋 u l� 2 , kia khi h緉 c鯽 th╪g c蕄 ch th阨 甶觤 c� th� m閠 t╪g l猲 50 甶觤 sinh m筺g tr� gi� , m� m閠 ngi kh竎 ch� t╪g l猲 45 甶觤 sinh m筺g tr� gi� . nh鱪g th� n祔 c� th� t╪g l猲 tr� s� � ng b筺 <color=red>10 c蕄 ?30 c蕄 ?50 c蕄 ?90 c蕄 l骳 s� xu蕋 hi謓 m閠 輙 ba ng . <color><enter>" 
               .." t鑤 l緈 , � ch� n祔 c馻 ta ngi  h鋍 kh玭g t韎 h琻 u ch  , 甶 t譵 nh鱪g ngi kh竎 甶 . huynh  ta h綾 s竧 c騨g kh玭g ph秈 l� p ph秈 , b� ph秈 h� khi . ngi n鉯 chuy謓 v韎 h緉 th阨 甶觤 gi鋘g ng祅 v筺 ch� qu� l韓 , h緉 b﹜ gi� c遪 產ng nh� k� l穙 ch� nh﹏ t� nh� m閚g ti猲 sinh c飊g Nam Cung ti觰 th� y . ",2," nh薾 l蕐 ph莕 thng /baisha_getprize","Sau n祔 tr� l筰 /no") 
                
       elseif ( Uworld1226 == 10 ) and ( GetBit(GetTask(1229),1 ) == 1 ) then -- m韎 v鮝 nh薾 頲 b筩h s竧 ch� nhi謒 v� 
              Describe(DescLink_BaiSha..": � n琲 n祔 v﹏ trung tr蕁 ch nam phng c� hai n琲 a phng , chia ra k猽 l� ba o s� th竝 , T� qu� ph� b礽 phng . ta c� hai b蕋 th祅h kh� ch   � n琲 n祇 萵 c� , ngi 甶 t譵 b鋘 h� , t� s� h醝 ch髏 v蕁  tr竎h kh� kh╪ ngi . n誹 ngi c� th� qu� li評 c竔 n祔 hai quan , ta ch� n祔 ch  c騨g li襫 h鋍 頲 k衜 kh玭g u",1, 
             "K誸 th骳 i tho筰 /no") 
      else 
             Describe(DescLink_BaiSha..": Ngi c遪 t韎 n琲 n祔 l祄 c竔 g� ? x玭g x竜 giang h� ? t譵 ki誱 ng b筺 ? ngi l筰 bi誸 giang h� l� c竔 g� y . l穙 nh﹏ n鉯 v鮝 v祇 giang h� tu鎖 ng� th骳 gi鬰 , th骳 gi鬰 ch kh玭g ch� l� nh﹏ m筺g , c遪 ngi n鱝 l遪g c馻 a . th玦 , n鉯 c飊g ngi nghe th� c� 輈h l頸 g� ? mu鑞 x玭g ch , chung quy ph秈 m譶h x玭g qua m韎 hi觰 頲. C� ch髏 th辬h c飊g c竔 n祔 v﹏ trung ch tuy誸 m閠 lo筰 h祅g n╩ th鎖 qua. L遪g c馻 ta c騨g  c鴑g nh綾. <enter>",1,"K誸 th骳 i tho筰 /no") 
       end
   
end

function baisha_starttask()
	nt_setTask(1229,SetBit(GetTask(1229),1,1))  
	Msg2Player("B筩h s竧 cho ngi 甶 v﹏ trung tr蕁 ph輆 nam ch ba o s� th竝 c飊g T� qu� ph� b礽 phng t譵 h緉 hai v�   .")
end

function baisha_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,0,551,1)                          --增加同伴抗性技能《冰雪初融》
		Msg2Player("Ch骳 m鮪g ngi thu 頲 ng b筺 k� n╪g ? B╪g tuy誸 s� dung ?")
		nt_setTask(1229,20)
		Msg2Player("B筩h s竧 kh玭g c� g� c� th� d箉 ngi, 甶 h綾 s竧, 阯g 秐h,thu nghi猽 nc v� ch錸g, c飊g ti謒 n琲  xem m閠 ch髏 甶 . ")
	end
end

---------------------------------------------------------------男弟子门神曲万-------------------------------------------------

function pe_menshenquwan()
	if ( GetBit(GetTask(1229),1) == 1 ) and ( GetBit(GetTask(1229),2) == 0 ) then 
              Describe(DescLink_QuWan..": Ngi l� s� ph� l穙 nh﹏ gia 玭g ta gi韎 thi謚 t韎 . 頲 r錳 , ta th� trc n鉯 cho ngi bi誸 m閠 輙 y誹 甶觤 :<enter>" 
             .." <color=red> ng� h祅h thu閏 t輓h <color>:<color=yellow> bi觰 hi謓 n猲 ng b筺 ch ng� h祅h , b蕋 ng ng� h祅h ch ng b筺 c� th� c� v� c玭g c飊g tuy謙 k� b蕋 ng , ng th阨 c� m閠 b� ph薾 ch ph� th猰 k� n╪g c騨g s� c� ng� h祅h ch h筺 ch� ;<color><enter>" 
             .." <color=red> t� ch蕋 <color>:<color=yellow> quy誸 nh ng b筺 ch thu閏 t輓h � th╪g c蕄 l骳 c� th� t╪g l猲 u thi觰 ch tr� gi� . <color><enter>" 
             .." <color=red> tinh l鵦 <color>:<color=yellow> th莕 b� ti襪 ch蕋 , ng祔 sau m� ra ;<color><enter>" 
            .." <color=red> t輓h t譶h <color>:<color=yellow> n猲 ng b筺 ch t輓h t譶h , b蕋 ng t輓h t譶h ch ng b筺 phng th鴆 h祅h ng c騨g s� b蕋 ng ; hi謓 h鱱 ch t輓h t譶h  th鮝 h譶h c� :<color><enter>" 
            .." <color=red> anh m穘h h譶h <color>:<color=yellow> s� c玭g k輈h c竎h h緉 g莕 nh蕋 ch i th� , c騨g kh玭g thi ? t� th﹏ t鎛 thng , c� kh� xa ch h祅h ng ph筸 vi . <color><enter>" 
            .." <color=red> v� ch� h譶h <color>:<color=yellow> nh� ch琲 m鬰 ti猽 c玭g k輈h ho芻 b� c玭g k輈h l骳 , ng b筺 s� d� l蕐 hi謕 tr� , c騨g kh玭g thi ? t� th﹏ t鎛 thng , m閠 lo筰 產ng a nh� ph� c薾 . <color><enter>" 
            .." <color=red> l璾 manh h譶h <color>:<color=yellow> s� c玭g k輈h m竨 thi觰 ch i th� , khi t� th﹏ m竨 輙 h琻 so v韎 20% l骳 v鮝 nh v鮝 ch箉 . <color><enter>" 
           .." <color=red> h蘮 y誹 h譶h <color>:<color=yellow> s� ng蓇 nhi猲 c玭g k輈h i th� , b� c玭g k輈h l骳 s� v鮝 nh v鮝 ch箉 , sinh m筺g 輙 h琻 so v韎 20% l骳 s� h琻 u ch n� tr竛h . <color><enter>" 
           .." 頲 r錳 , bi誸 r� nh鱪g th� n祔 sau n祔 , ngi t韎 tr� l阨 ta <color=red> ba <color> v蕁  , p ng r錳 m韎 c� th� qu� ta y quan . ",2,"Tr� l阨 v蕁  /quwan_problem","Trc chu萵 b� m閠 h琲 th� 甶 /no") 
         elseif ( GetBit(GetTask(1229),1 ) == 1 ) and ( GetBit(GetTask(1229),2) == 1) and ( GetBit(GetTask(1229),3) ~= 1) then 
           Describe(DescLink_QuWan..": 頲 r錳 , ngi � y ta ch� n祔 ch h鋍 t藀  qu� quan . nh薾 l蕐 tng thng c馻 ngi 甶 . ",2,"Nh薾 l蕐 ph莕 thng /quwan_getprize","Sau n祔 tr� l筰 /no") 
            elseif ( GetBit(GetTask(1229),3) == 1) and ( GetBit(GetTask(1229),5) == 1 ) then 
       Describe(DescLink_QuWan..": Л頲 r錳 , ngi t� ta h遖 thanh m� n琲 n祔 c騨g h鋍 kh玭g t韎 h琻 u ch  . tr� v� t譵 s� ph� l穙 nh﹏ gia 玭g ta 甶. ",1,"K誸 th骳 i tho筰 /no") 
           else 
         Describe(DescLink_QuWan..": Ta d鑓 l遪g � n琲 n祔 trong th竝 t譵 ki誱 thng c� ch b秓 b鑙 qu� k輓h , h錳 l﹗ kh玭g c� tr� v� 甶 t譵 s� ph�. Ngi th蕐 l穙 nh﹏ gia 玭g ta , xin m阨 thay ta v蕁 an . c遪 c� Thanh nhi ...... n祅g , ai , t輓h  ch鋘 , ngi 甶 甶 . ",1,"K誸 th骳 i tho筰 /no") 
     end
end

function quwan_problem()
	partner_edu(3,30,66,3,1229,2,1,9)
end

function quwan_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,2100,1)                   			--给当前同伴增加经验，+2100
		nt_setTask(1229,SetBit(GetTask(1229),3,1))  
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� n祔, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end

--------------------------------------------------------------- 女弟子谢清儿--------------------------------------------------

function pe_xieqinger()
	if ( GetBit(GetTask(1229),1) == 1) and ( GetBit(GetTask(1229),4) == 0) then 
             Describe(DescLink_XieQingEr..": Ai , m� a ,  cho n� nhi h琲 th� t韎 c飊g ngi 甶 . <enter>" 
        .." ngi l� ai ? nga , l� s� ph� l穙 nh﹏ gia 玭g ta  cho ngi t韎 . 頲 r錳 , ngi th� tr� l阨 i v韎 ta ba v蕁  . <enter>",2,"Tr� l阨 v蕁  /xieqinger_problem","Trc chu萵 b� m閠 h琲 th� 甶 /no") 
        elseif ( GetBit(GetTask(1229),1 ) == 1 ) and ( GetBit(GetTask(1229),4) == 1) and ( GetBit(GetTask(1229),5) ~= 1) then 
             Describe(DescLink_XieQingEr..": Ngi � y ta ch� n祔 ch h鋍 t藀  qu� quan . nh薾 l蕐 tng thng c馻 ngi 甶 . ",2,"Nh薾 l蕐 ph莕 thng /xieqinger_getprize","Sau n祔 tr� l筰 /no") 
        elseif ( GetBit(GetTask(1229),3) == 1) and ( GetBit(GetTask(1229),5) == 1 ) then 
            Describe(DescLink_XieQingEr..": Ngi t� ta c飊g s� huynh n琲 n祔 c騨g h鋍 kh玭g t韎 h琻 u ch  . tr� v� t譵 s� ph� l穙 nh﹏ gia 玭g ta 甶 . ",1,"K誸 th骳 i tho筰 /no") 
       else 
           Describe(DescLink_XieQingEr..": ng v藋 , m� ta l� m閠 qu� ph� , c竔 n祔 ch糿g l� ch輓h l� nh鱪g nam nh﹏ kia khi d� ta l� do ? nh鱪g n╩ n祔 n誹 nh� kh玭g c� s� ph� , s� huynh , ta c騨g qu� kh玭g ng鮪g 甶 ch . ",1," K誸 th骳 i tho筰 /no") 
        end
end

function xieqinger_problem()
	partner_edu(3,30,66,3,1229,4,1,10)
end

function xieqinger_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,2100,1)                   			--给当前同伴增加经验，+2100
		nt_setTask(1229,SetBit(GetTask(1229),5,1))  
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� n祔, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end

-----------------------------------------------------------------黑煞对话-----------------------------------------------------
function pe_heisha()

	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务堑任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋尧水任务变量
	
	if ( Uworld1226 == 10 and Uworld1227 == 20 and Uworld1228 == 20 and Uworld1229 == 20 and Uworld1230 == 20 and Uworld1231 == 20) then 
            Describe(DescLink_HeiSha..": m蕐 ngi ch髇g ta ch gi竜 d鬰 c騨g k誸 th骳 . ngi b﹜ gi� c� th� 甶 t譵 ki誱 ho祅g   . ",1,"K誸 th骳 i tho筰 /no") 
            elseif ( partner_getpartnerlevel(7) ~= 10 ) then 
           return 
       elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 0 ) then -- h綾 s竧 ch� nhi謒 v� kh玭g c� x骳 ph竧 ? ? ? ? ? kh玭g c� 甧m nhi謒 v� tng thng n鉯 cho nh� ch琲 
              Describe(DescLink_HeiSha..": n誹 nh� l穙 t� sinh ra s韒 m蕐 n╩ ,  s韒 ra tr薾 甶 gi誸 quang kim ch� p n nh� nc , n琲 n祇 ? n c竎 ngi c竔 n祔 gi髉 ti觰 qu� . b﹜ gi� l穙 l筩 , ch� c� th� n芻 nu玦 t鑤 h琻 v� s� , c騨g coi l� qu鑓 gia ra m閠 ph莕 l鵦 , chu閏 chu閏 l骳 tu鎖 c遪 tr� ph筸 qu� l鏸 甶 . <enter>" 
            .." ki誱 ho祅g   ? c竔  t芻 ti觰 t� , l筰 t韎 ki誱 l穙 phu ch ti謓 nghi . ngi n誹 t韎 , c騨g kh玭g th�  cho ngi tay kh玭g tr� v� . h緉 l� mu鑞 cho ng b筺 c馻 ngi t韎 h鋍 l穙 phu ch tuy謙 k� :<color=red> nam minh ba 畂筺 k輈h <color> . mu鑞 h鋍 c� th� , l穙 phu c竔 n祔 ? v� c玭g chi猽 s� bi課 h鉧 u b璶g , m鏸 m閠 chi猽 u 萵 gi蕌 v� c飊g lo筰 bi課 h鉧 , 竚 h頿 tinh  . ngi mu鑞 h鋍 l阨 c馻 ch� c� th� 甧m ba 畂筺 k輈h ph﹏ h駓 甶 th祅h ba t莕g th� , tr鬰 t莕g d箉 cho ngi . h鋍 ph秈 kh玭g h鋍 ? <enter>" 
             .."<color=green> nhi謒 v� tng thng : ng b筺 k� n╪g ' nam minh ba 畂筺 k輈h '<color>",2, 
                "D� nhi猲 mu鑞 h鋍 /heisha_starttask", 
           "K誸 th骳 i tho筰 /no") 

      elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 10 ) then -- m韎 v鮝 nh薾 頲 h綾 s竧 ch� nhi謒 v� 
           Describe(DescLink_HeiSha..": 甶 t譵   c馻 l穙 phu c鯽 i tho筰 nha , ngi ngi b籲g a ngu xu萵 y ? ",1, 
         "K誸 th骳 i tho筰 /no") 

      elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 12 ) then -- h鋍 t藀 ba 畂筺 k輈h nhi謒 v�  ho祅 th祅h 
          Describe(DescLink_HeiSha..": d�/� , k� n╪g c騨g  quen thu閏 甶 . 頲 r錳 , ta s� n鉯 cho ngi bi誸 m閠 輙 khi誹 m玭 , ng b筺 ch k� n╪g chia l祄 h琲 th� nh鉳 m蕐 lo筰 :<enter>" 
           .." <color=yellow>a) V� c玭g k� n╪g : ng b筺 d飊g  c玭g k輈h ch nh﹏ chi猽 th鴆 , th玭g qua th╪g c蕄 t 頲 ;<enter>" 
         .." b) N╩ ph遪g k� n╪g : i v韎 ph� b╪g l玦 h醓 c n╩ lo筰 kh竛g t輓h ti課 h祅h th猰 頲 ch k� n╪g , th玭g qua l祄 gi竜 d鬰 nhi謒 v� t 頲 ;<enter>" 
         .." c) Ph� th猰 k� n╪g : c竎 lo筰 th猰 頲 c飊g ph� tr� c飊g v韎 m閠 輙 c th� k� n╪g , th玭g qua k� n╪g s竎h c飊g k辌h t譶h nhi謒 v� t 頲 ;<enter>" 
         .." d) Tuy謙 k� : th玭g qua k辌h t譶h nhi謒 v� t 頲 ;<enter>" 
         .." t鑤 l緈 , c騨g t﹏ khang ngi. B﹜ gi�  d箉 cho ngi 產ng l祄 gi竜 d鬰 nhi謒 v� ng b筺 nam minh ba 畂筺 k輈h !<color>",2,"Nh薾 l蕐 ph莕 thng /heisha_giveprize1","Sau n祔 tr� l筰 /no") 

      elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 13 ) then --  h鋍 頲 ba 畂筺 k輈h , b総 u h琲 th� c� giai 畂筺 ch gi竜 d鬰 
         Describe(DescLink_HeiSha..":Л頲 r錳, nam minh ba 畂筺 k輈h  d箉 cho ngi, nh� v藋 ngi bi誸 nh薾 h琲 th� t韎 ph秈 nh� th� n祇 s� d鬾g c竔 n祔 ph� th猰 k� n╪g trung ch c玭g k輈h k� n╪g ? ?  cho ta t韎 n鉯 cho ngi bi誸. <enter>" 
         .." nh� th� n祇 , b﹜ gi� bi誸 甶 . b﹜ gi� 甶 b猲 trong bao c竧 n琲  luy謓 t藀 m閠 h琲 th� c玭g k輈h phng ph竝 甶. Sau n祔 t韎 t譵 ta n鱝 . <color=red> nh� , ngi ph秈 t� m譶h t� m譶h 甶 nh , ng b筺 c馻 ngi 產ng gi竜 d鬰 nhi謒 v� trung , h緉 v蒼 ch璦 c� ho祅 to祅 luy謓 th祅h c玭g phu , nh bao c竧 l� kh玭g c� hi謚 qu� ch . <color><enter>",1,"K誸 th骳 i tho筰 /heisha_starttask3") 
      elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 14 ) then 
             Describe(DescLink_HeiSha..": b﹜ gi� 甶 b猲 trong bao c竧 n琲  luy謓 t藀 m閠 h琲 th� c玭g k輈h phng ph竝 甶. sau n祔 t韎 t譵 ta n鱝 . <enter>",1,"K誸 th骳 i tho筰 /no") 
             elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 15 ) then -- bao c竧   k輈h ho祅 , mu鑞 ph竧 ra tng thng 
            Describe(DescLink_HeiSha..": Ngi bao c竧 c騨g nh xong r錳. R蕋 t鑤 , b﹜ gi� tng thng cho ngi m閠 quy觧 nam minh ba 畂筺 k輈h ch c蕄 ba k� n╪g s竎h. L蕐 頲 tng thng sau s� c飊g ta i tho筰 , ta c遪 c� l阨 n鉯. ",2," Nh薾 l蕐 ph莕 thng /heisha_giveprize2","Sau n祔 tr� l筰 /no") 

     elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 16 ) then --  thu 頲 ba 畂筺 k輈h ch k� n╪g s竎h 
         Describe(DescLink_HeiSha..":<color=yellow> b﹜ gi� d箉 ngi cu鑙 c飊g m閠 ch髏  . ng b筺 ch v� c玭g k� n╪g l� d飊g  thu莕 th鬰 t韎 th╪g c蕄 ch , m� nh鱪g th� kh竎 k� n╪g to祅 b� mu鑞 th玭g qua s� d鬾g h� 鴑g ch k� n╪g s竎h nh綾 t韎 th╪g . n琲 n祔 c莕 ch� � m閠 甶觤 , n誹 nh� ph� th猰 k� n╪g c� v� c玭g k� n╪g , nh� v藋 c莕 th玭g qua s� d鬾g k� n╪g s竎h t╪g l猲 c蕄 b薱 m� kh玭g ph秈 l�  thu莕 th鬰 . k� n╪g s竎h ch t╪g l猲 quy t綾 l� : ngi ch� c� th� h鋍 t藀 so ngi mu鑞 t╪g l猲 k� n╪g trc m苩 c蕄 b薱 cao 1 c蕄 ch k� n╪g s竎h . t� nh� ; hi謓 h鱱 k� n╪g v� 6 c蕄 , ngi ch� c� th� h鋍 t藀 7 c蕄 ch n猲 k� n╪g s竎h 甧m n猲 k� n╪g t╪g l猲 t韎 7 c蕄 , kh玭g th� vt c蕄 h鋍 t藀 . <color><enter>" 
        .." 頲 r錳 , ta ch� n祔  kh玭g c� g� nh璶g d箉 cho ngi li評. Зu b秓 tr鋘g , 甶 nh鱪g ngi kh竎 n琲  nh譶 m閠 ch髏 甶 . ",1,"K誸 th骳 i tho筰 /heisha_finishtask") 
     else 
       Describe(DescLink_HeiSha..": C﹜ kh鑙, l穙 ch� nh﹏ v� ch錸g ch誸 � i m筩 n╩ 蕐 , l穙 t� li襫 d阨 n c竔 n祔 v﹏ trung tr蕁 nh� trong qu� m cho ra 甶觰 ch cu閏 s鑞g . nghe n鉯 bay V﹏ nhi b� c萿 nh藅 ch kim qu鑓 ng祔 nh蒼 t芻 m閠 chng nh h琲 th� s琻 ti觧 , l骳 蕐 kh鉩 n c竔  thng t﹎ kia . g莕 nh蕋 l筰 nghe n鉯 h緉 kh玭g c� ch誸 , c遪 tng l� li評 c竔 g� 甶觰 v� l﹎ kh竎h s筺 ch u m鬰 , ho khan , a nh� n祔 c騨g kh玭g t韎 xem m閠 ch髏 ta y , h緉 h綾 th骳 th骳 c騨g tu鎖 m閠 x蕄 d莥 n鱝 r錳 . nh� n╩  khi猲g h緉 畊鎖 lang th阨 甶觤 ci c飊g con g� con t鵤 nh� , b﹜ gi� n鱝 g竛h ch� n輓h ph秈 衟 v� ta y b� vai l筩 . <enter>",1,"K誸 th骳 i tho筰 /no") 
end
   
end

function heisha_starttask()
	Describe(DescLink_HeiSha..":Ch祇 ! L穙 gia t� ta ch輓h l� th輈h ngi s秐g kho竔. ? ta sau l璶g c竔 n祔 phi課 gi竜 v� tr祅g trong c� hai mi t猲 tinh nhu� v� s� 產ng tu h祅h , trong b鋘 h� <color=red> c� m閠 ngi <color> tr猲 ngi c馻 mang theo l穙 phu ch ba 畂筺 k輈h b� t辌h . ngi 甧m ngi kia <color=red> t譵 ra <color> , b総 頲 b� t辌h t韎 t譵 ta , ta s� d箉 cho ngi tinh kh玭g chi nam minh ba 畂筺 k輈h . ngi th蕐 kh� nghi ch li襫 c飊g h緉 i tho筰 , th竚 th輓h h� th藅 , t鎛g c� th� t譵 t韎 ch.",1,"K誸 th骳 i tho筰 /heisha_starttask2")
end

function heisha_starttask2()
	local Uworld1235 = random(10,20)
	nt_setTask(1235,Uworld1235)
	nt_setTask(1230,10)
	Msg2Player("L穙 gia t�  cho ngi t� gi竜 v� tr祅g t譵 ra mang theo h緉 b� t辌h ch   t韎 .")
end

function heisha_starttask3()
	Msg2Player("L穙 gia t�  cho ngi � trng v� tr祅g trong nh bao c竧. xem ra kh玭g nh nh蕋 nh s� l莕 l� ng kh玭g 頲 k衜 .")
	nt_setTask(1230,14)  --第2阶段打沙袋
end

function heisha_giveprize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,2,621,2)                          --增加同伴附加技能《南冥三段击》
		Msg2Player("Ch骳 m鮪g ngi thu 頲 ng b筺 k� n╪g ? nam minh ba 畂筺 k輈h ?")
		nt_setTask(1230,13)   
		Msg2Player("Ngi thu 頲 nam minh ba 畂筺 k輈h. C� th� s� c飊g l穙 gia t� i tho筰.")
	end
end

function heisha_giveprize2()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		AddItem(6,1,884,3,0,0)												--增加同伴附加技能《南冥三段击》
		Msg2Player("Ch骳 m鮪g ngi thu 頲 ng b筺 k� n╪g ? nam minh ba 畂筺 k輈h ? ch th� 3 c蕄 k� n╪g s竎h")
		PARTNER_AddExp(partnerindex,2600,1)                   			--给当前同伴增加经验，+2600
		nt_setTask(1230,16)     
		Msg2Player("Ngi thu 頲 nam minh ba 畂筺 k輈h ch 3 c蕄 k� n╪g s竎h. C� th� s� c飊g l穙 gia t� i tho筰.")
	end
end

function heisha_finishtask()
	nt_setTask(1230,20)
	Msg2Player("Ngi  ho祅 th祅h � h綾 s竧 ch� ch h鋍 t藀 , c� th� 甶 b筩h s竧 , 阯g 秐h ? thu nghi猽 nc v� ch錸g c飊g ti謒 n琲  nh譶 m閠 ch髏.")
end

-----------------------------------------------------------黑煞弟子-----------------------------------------------------

function pe_heishadizi()
	local Uworld1226 = nt_getTask(1226)
	local Uworld1230 = nt_getTask(1230)
	if ( Uworld1226 == 10 ) and ( Uworld1230 == 11 ) then 
               Describe(DescLink_HeiShaDizi..": t鑤 , cho ngi m閠 ph莕 nho nh� � t� . ",1," Ph竧 ra ph莕 thng /heishadizi_giveprize") 
         elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 10 ) then 
               Describe(DescLink_HeiShaDizi..": Ch祇 , s� ph� ta  cho ngi n t譵 b� t辌h. Ngi c� th� t譵 t韎 ta  l�  m総 ta , n誹 kh玭g n鉯 cho ngi bi誸 tr猲 ngi ta c� hay kh玭g v藋 ta c遪 coi l� cao nh﹏. Л琻g nhi猲 r錳 , ta l筰 kh玭g th� d� d祅g n鉯 cho ngi bi誸 , nh� v藋 ta c遪 coi l� cao nh﹏, cho n猲 y , ngi c莕 tr� l阨 i v韎 ta n琲 n祔 <color=red> m閠 o <color>  m鬰. Ta s� n鉯 cho ngi bi誸 ta r鑤 cu閏 <color=red> c� hay kh玭g n緈 gi� b� t辌h !<color>",2, 
            "Ngi ngi n祔 th� n祇 nh� v藋 u danh 阯g a , 頲 r錳 b総 u h醝 甶 /heishadizi_problem", 
           "Qu� t礽 tin ngi, ta kh玭g c莕 bi誸 ngi c� ph秈 hay kh玭g /no" ) 
        else 
         Describe(DescLink_HeiShaDizi..": b籲g h鱱 , m阨 甶 ra m閠 輙 . ch髇g ta � ch� n祔 luy謓 t藀 thng th鮝 v� thu藅 , coi ch鮪g ng� thng li評 ngi . ",1,"K誸 th骳 i tho筰 /no") 
   end
end

function heishadizi_problem()
	partner_edu(1,76,91,1,0,0,1,6) 
end

function heishadizi_geiyujiangli()
	nt_setTask(1230,11)
	Msg2Player("V� ngi c飊g b蕋 k� m閠 c竔 n祇 h綾 s竧  t� i tho筰 , u a l蕐 頲 m閠 ph莕 ti觰 ph莕 thng .")
end

function heishadizi_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,1500,1)                   			--给当前同伴增加经验，+1000
		nt_setTask(1230,10)
	end
end

function heishadizi_chenggong()
	nt_setTask(1230,12)
	Msg2Player("Ngi c� th� tr� v� 甶 t譵 h綾 s竧 h鋍 t藀 nam minh ba 畂筺 nh .")
end

---------------------------------------------------------校武场沙袋对话--------------------------------------------------

function pe_wuchangshadai()
	local Uworld1230 = nt_getTask(1230)
	local Uworld1247 = nt_getTask(1247)
	if ( Uworld1230 == 14 ) then
		nt_setTask(1247,Uworld1247+1)
	end
	
	if ( Uworld1247 + 1 >= 30 ) and ( nt_getTask(1230) == 14 ) then
		Msg2Player("Ngi  th祅h c玭g n緈 gi� k� n╪g phng th鴆 c玭g k輈h , c� th� tr� v� 甶 t譵 h綾 s竧 nh薾 l蕐 ph莕 thng .")
		nt_setTask(1230,15)
	end
end


----------------------------------------------------------秋尧水对话-----------------------------------------------------

function pe_qiuyishui()
	local Uworld1226 = nt_getTask(1226)                        --同伴教育任务长歌门人任务变量
	local Uworld1227 = nt_getTask(1227)                        --同伴教育任务堑任务变量
	local Uworld1228 = nt_getTask(1228)                        --同伴教育任务唐影任务变量
	local Uworld1229 = nt_getTask(1229)                        --同伴教育任务白煞任务变量
	local Uworld1230 = nt_getTask(1230)                        --同伴教育任务黑煞任务变量
	local Uworld1231 = nt_getTask(1231)                        --同伴教育任务秋尧水任务变量
	
	if ( Uworld1226 == 10 and Uworld1227 == 20 and Uworld1228 == 20 and Uworld1229 == 20 and Uworld1230 == 20 and Uworld1231 == 20) then 
             Describe(DescLink_QiuYiShui..": m蕐 ngi ch髇g ta ch gi竜 d鬰 c騨g k誸 th骳. Ngi b﹜ gi� c� th� 甶 t譵 ki誱 ho祅g  .",1,"K誸 th骳 i tho筰 /no") 
       elseif ( partner_getpartnerlevel(9) ~= 10 ) then 
                      return 
       elseif ( Uworld1226 == 10 ) and ( Uworld1231 == 0 ) then -- thu nghi猽 nc ch� nhi謒 v� kh玭g c� x骳 ph竧 ? ? ? ? ? kh玭g c� 甧m nhi謒 v� tng thng n鉯 cho nh� ch琲 
               Describe(DescLink_QiuYiShui..": � n琲 n祔 trong n骾 h� phu d箉 con , n誹 nh� kh玭g ph秈 l� h綾 s竧 c竔  l穙 ti觰 t� ng祔 ng祔 mang theo m閠 m  k猽 nh k猽 gi誸 , ch� n輓h u kh玭g nh� giang h� l� d筺g g� t� n鱝 r錳 . <enter>"
             .." ngi l� t韎 h鋍 t藀 ? n誹 t韎 , ta li襫 甧m m譶h v鑞 th辬h c騨g truy襫 th� cho ngi 甶 . ch� y誹 l� c飊g ng b筺 <color=red> tu luy謓 nhi謒 v� <color> h� quan ch . <enter>" 
             .." ng b筺 tu luy謓 nhi謒 v� c� th� th玭g qua � c竎 th祅h ph� ch trng ca m玭 nh﹏ ch� <color=red> c蕌 ? quy觧 tr鬰 <color> t 頲. Tu luy謓 nhi謒 v� v� � tr� ch琲 th� gi韎 t飝 � tr猲 b秐  l鵤 ch鋘 gi誸 u thi觰 con qu竔 v藅 . m鏸 l莕 kh雐 ng m閠 tu luy謓 nhi謒 v� , khi sau khi ho祅 th祅h kh雐 ng m閠 ngi kh竎 . m鏸 ng祔 c� th� kh雐 ng <color=red> n╩ <color> tu luy謓 nhi謒 v� , kh玭g c� t khu h筺 ch� . ngi c� th� s� d鬾g n╩ t� c飊g a 甶觤 nh tr竎h ch quy觧 tr鬰 , c騨g c� th� s� d鬾g n╩ b蕋 ng a 甶觤 gi誸 qu竔 quy觧 tr鬰 . <color=red> ngi c莕 t╪g th猰 ch� � a phng l� : m鏸 ng祔 nh薾 ch nhi謒 v� nh蕋 nh ph秈 � ng祔  ho祅 th祅h ng祔  ng , n誹 b� nh譶 l祄 th蕋 b筰 <color> . 頲 r錳 , h穣 c飊g ngi n鉯 nh� v藋 u , b﹜ gi� ngi 甶 Long vng thai t譵 m閠 g鋓 long t竚 ch nam nh﹏ , n鉯 l� ta cho ngi 甶 ch . t� h緉 n琲 n祔 c莔 n╩ 甶 Long vng thai nh c竔 c閏 g�<color=red><color><enter>" 
             .."<color=green> nhi謒 v� tng thng : ng b筺 k� n╪g ' l╪g ba vi bc '<color>",2, 
               "T鑤, ta bi誸/qiuyishui_starttask1", 
              "Sau n祔 tr� l筰 /no") 

       elseif ( Uworld1226 == 10 ) and ( Uworld1231 == 18 ) then -- nhi謒 v�  ho祅 th祅h 
            Describe(DescLink_QiuYiShui..": t鑤 l緈 , � ch� n祔 c馻 ta ngi  h鋍 kh玭g t韎 h琻 u ch  , nh譶 c遪 c� c竔 g� kh竎 ngi n琲  kh玭g c� 甶 qua 甶. Ngi nh譶 th蕐 ta trng phu 阯g 秐h , xin m阨 thay ta chuy觧 c竜 h緉 ,  cho h緉 th藅 t鑤 mang theo h礽 t� , ng c� ng祔 ch�  m譶h th秈 t礽 luy謓 thu鑓 , v� trng thng ch. Ta c竔 n祔 sng  c竚 琻 !",2,"Nh薾 l蕐 ph莕 thng /qiuyishui_prize","Sau n祔 tr� l筰 /no") 

       elseif ( Uworld1226 == 10 ) and ( Uworld1231 == 10 ) then -- m韎 v鮝 nh薾 頲 thu nghi猽 nc ch� nhi謒 v� 
            Describe(DescLink_QiuYiShui..": Kh玭g ph秈 n鉯 cho ngi 甶 Long vng thai nh c竔 c閏 g� ? ? Long vng thai 產ng � b秐  ch trung h琲 th� phng . ",1,"K誸 th骳 i tho筰 /no") 
       else 
            Describe(DescLink_QiuYiShui..": Cho ph衟 u ngi h醝 ta v� sao  th髖 kh鉯 c鯽 ch Чi s� t� kh玭g l祄 , c飊g c� a ng鑓 t韎 y trong n骾 t� gi� m蕐 th藀 ni猲 . a a , 阯g 秐h c竔 n祔 a ng鑓 l� c� ph骳 kh� nga . n╩  ng祔 h琲 th� ch c� g竔 trong , ta c騨g kh玭g ra trc ba 甶 ? nh璶g quay u l筰 suy ngh� m閠 ch髏 , th藅 m閠 ch髏 u kh玭g h鑙 h薾 . tr猲 giang h� phong tuy誸 i , nh鱪g th� kia n╩ m ? lu玭 c� ngi n 玭g ph鬾g b錳 ta 甶 , hu鑞g chi ta c遪 m閠 m鵦 th輈h h緉 , coi nh� h緉 ngu n鱝 , c騨g l� c馻 ta ph骳 kh� 甶 . u n鉯 ngi trong giang h� , th﹏ b蕋 do k� , c� th� 甶 ra ngo礽 , l穙 Thi猲 i v韎 ch髇g ta  chi誹 c� li評 . ",1,"K誸 th骳 i tho筰 /no") 
        end
end

function qiuyishui_starttask1()
	nt_setTask(1231,10)
	Msg2Player("Thu nghi猽 nc cho ngi 甶 Long vng thai t譵 m閠 g鋓 long t竚 ch nam nh﹏ .")  
end

function qiuyishui_prize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddSkill(partnerindex,2,629,1)                          --增加同伴附加技能《凌波微步》
		Msg2Player("Ch骳 m鮪g ngi thu 頲 ng b筺 k� n╪g ? l╪g ba vi b� ?")
		nt_setTask(1231,20)
	end
end

--------------------------------------------------------龙八对话--------------------------------------------

function pe_longba()
	if ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) then 
             Describe(DescLink_LongBa..": Ngi l� Thu t� gi韎 thi謚 t韎, 頲 r錳 . ta ch� n祔 l� c� ch髏 quy觧 tr鬰 nhi謒 v� , ta cho ngi c苙 k� gi秐g gi秈 m閠 h琲 th� :<enter>" 
            .."<color=yellow> ngi c� th� c蕌 ? b蕋 ng a phng ch b蕋 ng gi誸 tr竎h nhi謒 v� , c騨g c� th� c蕌 ? c飊g a phng ch gi誸 tr竎h nhi謒 v� . ngi c� th� v� h筺 c蕌 ? quy觧 tr鬰 , nh璶g m鏸 ng祔 nh蕋 u ch� c� th� kh雐 ng c騨g ho祅 th祅h 5 c竔. Quy觧 tr鬰 nhi謒 v� kinh nghi謒 tng thng l� m謙 m醝 th猰 ch , c騨g ch輓h l� n鉯 , ngi l祄 nhi謒 v� c祅g u , l蕐 頲 tng thng c騨g li襫 c祅g u . cu鑙 c飊g , ng祔  l祄 xong ch nhi謒 v� ph秈 nh� th輈h ng ng祔 ng , n誹 kh玭g v蒼 s� b� nh譶 l祄 nhi謒 v� th蕋 b筰 . <color> ch輓h l� nh� v藋 u li評 , b﹜ gi� ngi nh薾 l蕐 m閠 quy觧 tr鬰 nhi謒 v� 甶 l祄 l祄 甶 . <color=red> nh� , ngi ph秈 t� m譶h t� m譶h 甶 nh , ng b筺 c馻 ngi 產ng gi竜 d鬰 nhi謒 v� trung , h緉 v蒼 ch璦 c� ho祅 to祅 luy謓 th祅h c玭g phu , nh c竔 c閏 g� l� kh玭g c� hi謚 qu� ch . <color>",3, 
           "ng v藋 , ta mu鑞 t 頲 nh c竔 c閏 g� ch quy觧 tr鬰 nhi謒 v� /longba_starttask1", 
            "Ta quy觧 tr鬰 m蕋 , ta mu鑞 n鱝 nh薾 l蕐 m閠 /longba_starttask1", 
            "Ta c遪 l� sau n祔 tr� l筰 甶 /no") 
        elseif ( nt_getTask(1231) == 15 ) then 
               Describe(DescLink_LongBa..": T鑤 l緈 , ngi qu� th藅  l祄 xong quy觧 tr鬰 nhi謒 v� , nh薾 l蕐 tng thng c馻 ngi 甶 . s� c飊g ta i tho筰 . ",2,"Nh薾 l蕐 ph莕 thng /longba_getprize1","Sau n祔 tr� l筰 /no") 
         elseif ( nt_getTask(1231) == 16 ) then 
              Describe(DescLink_LongBa..": Ng祔 甧m h祅g i m nhi謒 v韎 t� nh﹏ , ngi tr� l筰 tr� l阨 i v韎 ta n╩ v蕁  , li襫 c� th� tr� v� t譵 thu c� ph鬰 m謓h . ",1,"K誸 th骳 i tho筰 /longba_starttask2") 
         elseif ( nt_getTask(1231) == 17 ) then 
                Describe(DescLink_LongBa..": Л頲 r錳 , ngi  ho祅 th祅h ta ch� n祔 ch i tho筰 , d蒼 ho祅 tng thng tr� v� 甶 t譵 thu c� 甶 . ",1,"K誸 th骳 i tho筰 /longba_getprize2") 
         elseif ( nt_getTask(1231) == 18 ) then 
                  Describe(DescLink_LongBa..": Ta ch� n祔 ch nhi謒 v�  ho祅 th祅h , ngi tr� v� t譵 thu c� 甶 . ",1,"K誸 th骳 i tho筰 /no") 
         else 
               Describe(DescLink_LongBa..": Long n╩ ? h緉 l� ta h錳 l﹗ trc kia m閠 huynh  . khi  huynh  ch髇g ta ch輓 ngi l藀 ch� � tr猲 giang h� x玭g ra l閚 m閠 c竔 th辬h nghi謕 , ai c� th� ngh� t韎 sau  x秠 ra nh� v藋 m閠 m鉵 th辬h t譶h y ? ",1,"K誸 th骳 i tho筰 /no") 
         end
end

function longba_starttask1()
	AddItem(6,1,829,0,0,0)
	Msg2Player("Ngi thu 頲 m閠 nh c竔 c閏 g� ch quy觧 tr鬰. xin k辮 th阨 m� ra c騨g ho祅 th祅h n�.")	
end

function longba_getprize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,4000,1)                   			--给当前同伴增加经验，+4000
		nt_setTask(1231,16)
	end
end

function longba_starttask2()
	if ( partner_edu(5,67,91,5,0) == 10 ) then
		nt_setTask(1231,17)
	end
end

function longba_getprize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
		PARTNER_AddExp(partnerindex,4500,1)                   			--给当前同伴增加经验，+4500
		nt_setTask(1231,18)
		Say("Ngi  ho祅 th祅h nhi謒 v� ch� n祔, 甶 nh鱪g ngi kh竎 甶.",0)
	end
end
--------------------------------------------------------卷轴启动-------------------------------------------

function pe_juanzhouqidong()
	if ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( nt_getTask(1243)  == 0 ) then
		nt_setTask(1243,10) --卷轴被启动
		Msg2Player("Ngi  kh雐 ng nh c竔 c閏 g� 30 l莕 quy觧 tr鬰 nhi謒 v� .")
	elseif ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( nt_getTask(1243) >= 10 and  nt_getTask(1243) < 40 ) then
		Msg2Player("Ngi  產ng l祄 nh c竔 c閏 g� nhi謒 v�, xin m阨 ti誴 t鬰 c� g緉g l猲 .")
	elseif ( nt_getTask(1231) == 15 )then
		Msg2Player("Ngi  ho祅 th祅h nh c竔 c閏 g� nhi謒 v� , xin m阨 甶 c飊g long t竚 i tho筰.")
	else
		Msg2Player("Th藅 xin l鏸, y l� c th� nhi謒 v� o c� , ngi c莔 kh玭g c� b蕋 c� t竎 d鬾g g�.")
	end
end	

------------------------------------------------------龙王台练功木桩---------------------------------------

function pe_liangongmuzhuang()
	local Uworld1243 = nt_getTask(1243)
	if   ( nt_getTask(1231) == 15 ) then
		Msg2Player("Ngi  ho祅 th祅h nh c竔 c閏 g� nhi謒 v� , xin m阨 甶 c飊g long t竚 i tho筰")
	elseif ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( Uworld1243 >= 10 and  Uworld1243 < 40 ) then
		nt_setTask(1243,Uworld1243+1)
	elseif ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( nt_getTask(1243) >= 40 ) then
		nt_setTask(1231,15)
		Msg2Player("Ngi  ho祅 th祅h nh c竔 c閏 g� nhi謒 v� , xin m阨 甶 c飊g long t竚 i tho筰")
	else
		if ( GetSex() == 0 ) then
			Msg2Player("аp trai, ta ngi kh玭g th� kh玭g o竛 , nh� l穙 nh ta ki襫 ?")
		else
			Msg2Player("M� n�, ta ngi kh玭g th� kh玭g o竛, nh� l穙 nh ta ki襫 ?")
		end
	end
end


------------------------------------------------------牛ⅩⅩ的问答题---------------------------------------
function niumanman_num1()
	niumanman_bisaijieguo(1)
end
function niumanman_num2()
	niumanman_bisaijieguo(2)
end
function niumanman_num3()
	niumanman_bisaijieguo(3)
end
function niumanman_num4()
	niumanman_bisaijieguo(4)
end
function niumanman_num5()
	niumanman_bisaijieguo(5)
end
function niumanman_num6()
	niumanman_bisaijieguo(6)
end
function niumanman_num7()
	niumanman_bisaijieguo(7)
end
function niumanman_num8()
	niumanman_bisaijieguo(8)
end
function niumanman_num9()
	niumanman_bisaijieguo(9)
end
function niumanman_num10()
	niumanman_bisaijieguo(10)
end
function niumanman_num11()
	niumanman_bisaijieguo(11)
end
function niumanman_num12()
	niumanman_bisaijieguo(12)
end

function partner_getpartnerlevel(partnerlevel)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	if ( NpcCount == 0 ) then
		Msg2Player("Ngi trc m苩 kh玭g c� b筺 ng h祅h, kh玭g th� ti誴 t鬰 nhi謒 v� gi竜 d鬰. Xin m阨 nh薾 l蕐 b筺 ng h祅h.")
		return
	elseif ( PARTNER_GetLevel(partnerindex) < partnerlevel ) then
		Msg2Player("B筺 ng h祅h c馻 ngi ko  "..partnerlevel.." c蕄, v蒼 kh玭g th� l祄 ta nhi謒 v�")
		return
	elseif ( PARTNER_GetTaskValue(partnerindex, 1) ~= 1 ) then
		Msg2Player("C竔 n祔 ng b筺 c騨g kh玭g ph秈 l� ngi mang theo  l祄 ng b筺 gi竜 d鬰 nhi謒 v� c竔  b筺 ng h祅h, xin m阨 甧m ch輓h x竎 ng b筺 cho g鋓 ra t韎 .")  
		return
	elseif ( partnerstate == 0 ) then
		Msg2Player("Ngi trc m苩 kh玭g c� cho g鋓 ra ng b筺 t韎, kh玭g th� ti誴 t鬰 gi竜 d鬰 nhi謒 v�. xin m阨 trc cho g鋓 ra l祄 gi竜 d鬰 nhi謒 v� ng b筺 .") 
		return
	else
		return 10
	end
end

function partner_checkdo()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	if ( PARTNER_GetTaskValue(partnerindex, 1) ~= 1 ) then
	Msg2Player("C竔 n祔 ng b筺 c騨g kh玭g ph秈 l� ngi mang theo  l祄 ng b筺 gi竜 d鬰 nhi謒 v� c竔  b筺 ng h祅h, xin m阨 甧m ch輓h x竎 ng b筺 cho g鋓 ra t韎 .")  
		for i=1,NpcCount do 
			if ( PARTNER_GetTaskValue(i, 1) == 1 ) then
				Msg2Player("Ngi 產ng l祄 ng b筺 gi竜 d鬰 nhi謒 v� l� th� "..i.." s� ng b筺 . ")
			end
		end
	elseif ( NpcCount == 0 ) then
		Msg2Player("Ngi trc m苩 kh玭g c� b筺 ng h祅h, kh玭g 頲 nh薾 thng. ")
	elseif ( partnerstate == 0 ) then
		Msg2Player("Ngi trc m苩 kh玭g c� cho g鋓 ra ng b筺 t韎,  kh玭g 頲 nh薾 thng.") 
	else
		return 10
	end
end

function no()
end
