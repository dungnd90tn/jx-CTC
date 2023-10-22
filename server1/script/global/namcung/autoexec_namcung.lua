new_npc = { 
{1135,80,4,53,1619,3189,0,"Ch©n Nhi",0,"\\script\\global\\namcung\\namcung_say.lua"}, 
{1623,80,4,53,1620,3176,0,"CËp NhËt XÕp H¹ng",0,"\\script\\global\\namcung\\xephang\\capnhat.lua"}, 
--{715,80,4,53,1617,3202,0,"B¾c ®Èu l·o nh©n",0,"\\script\\event\\springfestival08\\allbrother\\beidoulaoren.lua"}, 
{1849,80,4,53,1622,3184,0,"Hæ trî T©n Thñ",0,"\\script\\global\\namcung\\hotro_test.lua"}, 
}




function add_npc_tinhnang()
	add_namcung(new_npc)
end

------------------------------------------------------------------------------------------------------------------------------
function add_namcung(tbnpc)
	for i = 1 , getn(tbnpc) do
		Mid = SubWorldID2Idx(tbnpc[i][4]);
		if (Mid >= 0 ) then
			TabValue5 = tbnpc[i][5] * 32;
			TabValue6 = tbnpc[i][6] * 32;
			local nNpcIdx = AddNpc(tbnpc[i][1],tbnpc[i][2],Mid,TabValue5,TabValue6,tbnpc[i][7],tbnpc[i][8]);
			SetNpcScript(nNpcIdx, tbnpc[i][10]);
		end;
	end;
end