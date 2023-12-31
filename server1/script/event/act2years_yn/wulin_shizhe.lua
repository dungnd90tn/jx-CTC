--2007年-越南情义江湖资料片
--——剑网2周年生日活动版
--从2007年06月11日至2007年07月01日
--by fmz
--武林使者,越南2007国庆活动
--modify by 小浪多多

--ACT2YEARS_YN_CELLPAPER_ID = 1436        --玻璃纸的ID
--ACT2YEARS_YN_BOWKNOT_ID = 1437          --蝴蝶结的ID
--ACT2YEARS_YN_ROSE_ID =  1438            --玫瑰花的ID
--ACT2YEARS_YN_WHITEBOX_ID =  1439        --白色礼盒
--ACT2YEARS_YN_BLUEBOX_ID =   1441        --蓝色礼盒
--ACT2YEARS_YN_YELLOWBOX_ID = 1440        --黄色礼盒
--ACT2YEARS_YN_NORMALCAKE_ID =1442        --月饼
--ACT2YEARS_YN_MIDCAKE_ID = 1443          --中型月饼
--ACT2YEARS_YN_SPECIALCAKE_ID = 1444      --特殊月饼
ACT2YEARS_YN_BEGINTIME = 070825     --活动开始日期
ACT2YEARS_YN_ENDTIME = 120909       --活动结束日期
--
--2007越南国庆活动
GUOQING_YN_TASK_DATE = 1831					--记录领取时期,1.时间(年%y),2.时间(月)，3.时间(日),4.领取次数
GUOQING_YN_TASK_COUNT = 0 				--记录领取次数
GUOQING_YN_WUJIAOXING_ID = 1494			--胜利五角星
GUOQING_YN_LiHe_ID = 1495						--国庆礼盒ID
--
function Act2Years2007_CheckInTime()
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > ACT2YEARS_YN_ENDTIME or nDate < ACT2YEARS_YN_BEGINTIME then
        return 0
    else
        return 1
    end
end
--
function main()
    --if Act2Years2007_CheckInTime() == 1 then
        --Say("热烈祝贺武林传奇两周年的生日。<enter>从2007年06月11日至2007年07月11日期间将会在江湖上出现最美丽和芬芳的玫瑰花，如果你能收集到一些，我将有厚礼相赠。",
        --5,"兑换白色礼品盒/WLSZ_ExcWhiteBox","兑换蓝色礼品盒/WLSZ_ExcBlueBox","兑换黄色礼品盒/WLSZ_ExcYellowBox",
        --"详细说明/WLSZ_ExcDetail","结束对话/WLSZ_End")
    if Act2Years2007_CheckInTime() == 1 then
    		Describe("S� gi� v� l﹎: Nhi謙 li謙 ch骳 m鮪g ng祔 Qu鑓 Kh竛h. Trong kho秐g th阨 gian t� <color=red>25-08-2007<color> n <color=red>09-09-2007<color>, ngi ch琲 c� th� 甧m 10 <color=yellow>Ng玦 sao chi課 th緉g<color> v� <color=yellow>15 v筺 lng<color>  i l蕐  <color=yellow>H閜 qu� Qu鑓 Kh竛h<color>.<color=yellow>B猲 trong h閜 qu� Qu鑓 Kh竛h<color> c� ch鴄 Huy chng Qu鑓 Kh竛h v� c竎 m秐h b秐 . N誹 thu th藀  12 m秐h b秐  kh竎 nhau s� c� c� h閕 <color=yellow>m� r閚g rng th� 3<color>.",3,
    				"Ta mu鑞 i h閜 qu� Qu鑓 Kh竛h/GuoQing_Give",
    				"C竎h i h閜 qu� Qu鑓 Kh竛h/guoQing_About",
    				"Bi誸 r錳/no"
    			)
    else		
        Say("Ta ch輓h l� s� gi� v� l﹎.",0)
    end
end
--
function WLSZ_End()    
end
--
function WLSZ_ExcWhiteBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    if nRoseNumber < 10 then
        return Say("C莕 10 hoa h錸g ",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_WHITEBOX_ID,1,0,0 )
    Msg2Player("фi 10 hoa h錸g  l蕐 h閜 qu� tr緉g")
    Say("B筺 nh﹏ 頲 1 <color=red>H閜 qu� tr緉g<color>, b猲 trong c� nh鱪g m鉵 qu� b蕋 ng�.",2,"Tr� l筰/main","K誸 th骳 i tho筰/WLSZ_End")
end
--
function WLSZ_ExcBlueBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nBOWKNOTNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_BOWKNOT_ID, -1 )
    if nRoseNumber < 10 or nBOWKNOTNumber < 1 then
        return Say("C莕 10 hoa h錸g  v� 1 n� .",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_BOWKNOT_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_BLUEBOX_ID,1,0,0 )
    Msg2Player("фi 10 hoa h錸g  v� 1 n�  l蕐 h閜 qu� xanh.")
    Say("B筺 nh﹏ 頲 1 <color=red>H閜 qu� xanh<color>, b猲 trong c� nh鱪g m鉵 qu� b蕋 ng�.",2,"Tr� l筰/main","K誸 th骳 i tho筰/WLSZ_End")
end
--
function WLSZ_ExcYellowBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nCellPaperNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_CELLPAPER_ID, -1 )
    if nRoseNumber < 10 or nCellPaperNumber < 1 then
        return Say("C莕 10 hoa h錸g  v� 1 gi蕐 g鉯 hoa.",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_CELLPAPER_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_YELLOWBOX_ID,1,0,0 )
    Msg2Player("фi 10 hoa h錸g  v� 1 gi蕐 g鉯 hoa l蕐 H閜 qu� v祅g.")
    Say("B筺 nh﹏ 頲 1 <color=red>H閜 qu� v祅g<color>, b猲 trong c� nh鱪g m鉵 qu� b蕋 ng�.",2,"Tr� l筰/main","K誸 th骳 i tho筰/WLSZ_End")
end
--
function WLSZ_ExcDetail()
    Say("Nguy猲 t綾 i h閜 qu�: <enter>H閜 qu� tr緉g: 10 hoa h錸g  <enter>H閜 qu� xanh: 10 hoa h錸g  v� 1 n�  <enter> H閜 qu� v祅g: 10 hoa h錸g  v� 1 gi蕐 g鉯 hoa.",2,"Tr� l筰/main","K誸 th骳 i tho筰/WLSZ_End")
end

--2007越南国庆活动..
function guoQing_About()
	Describe("S� gi� v� l﹎: Trong kho秐g th阨 gian t� <color=red>25-08-2007<color> n <color=red>09-09-2007<color>, ngi ch琲 c� th� 甧m 10 <color=yellow>Ng玦 sao chi課 th緉g<color> v� <color=yellow>15 v筺 lng<color>  i l蕐 1 <color=yellow>H閜 qu� Qu鑓 Kh竛h<color>. <color=yellow>Ng玦 sao chi課 th緉g<color> s� r琲 ra � c竎 khu v鵦 c蕄 t� 50 tr� l猲. <color=yellow>B猲 trong h閜 qu� Qu鑓 Kh竛h<color> c� ch鴄 Huy chng Qu鑓 Kh竛h v� c竎 m秐h b秐 . N誹 thu th藀  c竎 m秐h b秐  nh s� t� 1 n 12  s� c� c� h閕 <color=yellow>m� r閚g rng th� 3<color>.",1,"K誸 th骳 i tho筰/WLSZ_End")
end

function GuoQing_Give()
	local nGuoqingLiHe = CalcEquiproomItemCount( 6,1,GUOQING_YN_WUJIAOXING_ID, -1 )

	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(GUOQING_YN_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetByte(nLibao,4);
	

	if ( nOlddate == nDate and nCount >= 50) then
			Say("S� gi� v� l﹎: Th藅 ng ti誧, m鏸 nh﹏ v藅 m鏸 ng祔 ch� c� th� i 頲 t鑙 產 50 <color=yellow>h閜 qu� Qu鑓 Kh竛h<color>, ng祔 mai h穣 n i nh�.",0)
			return 1;
	end
	
	if nGuoqingLiHe < 10 then
		Say("S� gi� v� l﹎: Th藅 ng ti誧, kh玭g  10 Ng玦 sao chi課 th緉g, kh玭g th� i h閜 qu� Qu鑓 Kh竛h.",0)
		return 
	end
	
	if GetCash() < 150000 then
		Say("S� gi� v� l﹎: Th藅 ng ti誧, kh玭g mang  15 v筺 lng, kh玭g th� i h閜 qu� Qu鑓 Kh竛h.",0)
		return
	end
	if ( CalcFreeItemCellCount() < 2 ) then
		Say("Kh玭g  ch� tr鑞g, h穣 s緋 x誴 l筰 h祅h trang.",0);
		return
	end
	if ( nOlddate ~= nDate ) then
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,0));
	end
	Pay(150000)
	nCount = GetByte(GetTask(GUOQING_YN_TASK_DATE),4);
	SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,nCount+1))
	ConsumeEquiproomItem( 10,6,1,GUOQING_YN_WUJIAOXING_ID,-1 )
 	local nidx = AddItem(6,1,GUOQING_YN_LiHe_ID,1,0,0 )
	Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 <color=yellow>H閜 qu� Qu鑓 Kh竛h<color>.")
	WriteLog(format("[WuLinShiZhe]Date:%s\t Account:%s\t Name:%s\t Effect:GetItem %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)))
end
