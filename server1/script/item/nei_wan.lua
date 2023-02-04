-- 内普丸、内毒丸、内冰丸、内火丸、内电丸共有函数
-- 五种丸如果重复吃，之前吃过的丸的功效将消失，只保留最后吃的丸的功效
-- Fanghao_Wu 2004.9.13

aryWan = {	{"<#> N閕 Ph� ho祅", 453},
			{"<#> N閕 чc ho祅", 454},
			{"<#> N閕 B╪g ho祅", 455},
			{"<#> N閕 H醓 ho祅", 456},
			{"<#> N閕 謓 ho祅", 457} };
			
function EatNei_Wan( eatIndex, level, statetype, time )
	local nCount = getn( aryWan );
	for i = 1, nCount do
		if( i ~= eatIndex ) then
			local nLeftTime = AddSkillState( aryWan[i][2], 1, 1, 0 );
			if( nLeftTime > 0 ) then
				Msg2Player( aryWan[i][1].."<#> H誸 c玭g hi謚" );
			end
		end
	end
	AddSkillState( aryWan[eatIndex][2], level, statetype, time );
	Msg2Player( "<#> B筺  s� d鬾g"..aryWan[eatIndex][1] );
end