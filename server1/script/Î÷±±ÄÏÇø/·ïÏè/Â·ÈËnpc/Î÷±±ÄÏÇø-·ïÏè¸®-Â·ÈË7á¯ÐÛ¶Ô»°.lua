--西北南区 凤翔府 路人7岑雄对话

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_cenxiong()
	else
		Say("Ch髇g ta sinh � Phng Tng, l韓 l猲 c騨g � Phng Tng, kh玭g bi誸 n th� gi韎 b猲 ngo礽 ra sao, c� d辮 s� 甶 ra ngo礽 th� xem!",0)
	end
end;