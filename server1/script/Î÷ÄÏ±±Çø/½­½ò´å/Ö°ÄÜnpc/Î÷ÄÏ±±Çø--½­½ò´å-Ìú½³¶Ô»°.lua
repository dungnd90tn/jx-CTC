--西南北区江津村铁匠
--江津村新手任务：虎子的弹弓
--suyu
-- Update: Dan_Deng(2003-08-11)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Gian h祅g c馻 ta binh kh� tinh x秓 m� gi� c� l筰 v鮝 ph秈, i hi謕 h祅h t萿 giang h� m� kh玭g c� m閠 m鉵 binh kh� cho v鮝 tay sao? Mua m閠 m鉵 甶 n祇?"

function main(sel)
--	UTask_world18 = GetTask(46);
	UTask_world45 = GetTask(45)
	Uworld1000 = nt_getTask(1000)	
	if(UTask_world45 == 10) then
		Talk(1,"","Ngi n h醝 chi誧 n� cho ti觰 H� T� �? Ta ch璦 ng tay t韎! у c莕 thi誸 ta c遪 ch璦 甶 t譵.Ta l筰 kh玭g th� r阨 ti謒. Th� n祔 nh�! Ngi gi髉 ta 甶 t譵 ch筩 c﹜ v� da tr﹗.C�  r錳 ta s� l藀 t鴆 l祄 ngay!")
		SetTask(45, 20)
		AddNote("Th� r蘮 c莕 nguy猲 li謚 m韎 c� th� b総 u l祄 gi祅 n�! B筺 gi髉 anh ta t譵 m閠 ch筩 v﹜ v� m閠 mi課g da tr﹗.")
		Msg2Player("Th� r蘮 c莕 nguy猲 li謚 m韎 c� th� b総 u l祄 gi祅 n�! B筺 gi髉 anh ta t譵 m閠 ch筩 v﹜ v� m閠 mi課g da tr﹗.")
	elseif(UTask_world45 == 20) then
		if((HaveItem(177) ==1 ) and (HaveItem(178) == 1)) then	--判断是否有道具
			Talk(2,"","Sao nhanh th�? Лa ch筩 c﹜ v� da tr﹗ a cho ta! Ta l祄 ngay!","Х l祄 xong. Thay ta a c﹜ n� cho Ti觰 H� T�!")
			DelItem(177)		--删掉树杈
			DelItem(178)		--删掉牛皮
			AddEventItem(176)		--给玩家弹弓
			Msg2Player("Л頲 m閠 gi祅 n�.")
			AddNote("Th� r蘮  l祄 xong gi祅 n� nh� b筺 甧m 甶 cho H� T�.")
			Msg2Player("Th� r蘮  l祄 xong gi祅 n� nh� b筺 甧m 甶 cho H� T�.")
--			SetTask(46, 3)
		else
			tiejiang_village("<dec><npc>Ch� c莕 mang ch筩 v� da tr﹗ n cho ta th� s� c� ngay c﹜ n� cho Ti觰 H�, ch� c莕 i m閠 l骳 l� xong. Ngi mu鑞 lo筰 v� kh� n祇 kh竎 kh玭g?")
		end
	else
		tiejiang_village();
	end
end;

function yes()
	Sale(22);  				--弹出交易框
end;
