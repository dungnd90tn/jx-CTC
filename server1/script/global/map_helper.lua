-- map_helper.lua
-- By: Dan_Deng(2004-06-28)
-- 主维护表，各五行、等级练级迷宫
Include("\\script\\activitysys\\npcdailog.lua")

lv_str={	"<#>Kh玭g n c蕄 10 ","<#>H琻 10 c蕄 ","<#>H琻 20 c蕄 ","<#>H琻 30 c蕄 ","<#>H琻 40 c蕄 ","<#>H琻 50 c蕄 ","<#>H琻 60 c蕄 ","<#>H琻 70 c蕄 ","<#>H琻 80 c蕄 ","<#>H琻 90 c蕄 "}
map0 = {	"<#>C竎 T﹏ th� th玭 ",
			"<#>G莕 b猲 B鎛 m玭, c竎 th祅h th� n鎖 danh ",
			"<#>Ki誱 C竎 Trung Nguy猲, Ki誱 C竎 T﹜ Nam, Ki誱 C竎 T﹜ B綾, La Ti猽 s琻, V� L╪g s琻, T莕 L╪g ",
			"<#>Th鬰 Cng s琻, Mi猽 L躰h, Y課 t� ng, v� Dc Vng ng t莕g 1, Kho竔 Ho箃 L﹎ ",
			"<#>Kinh Ho祅g ng, Ph鬰 Ng璾 s琻 T﹜, 觤 Thng ng t莕g 3, Thi誹 L﹎ m藅 th蕋 ",
			"<#>Hng Th駓 ng, Thi猲 T﹎ ng, v� чng ёnh H� s琻 ng, B╪g Huy謙 M� Cung ",
			"<#>Thanh Loa o, 108 La H竛 Tr薾, v� Ho祅h s琻 ph竔, Tng Dng v� m玭 m藅 o ",
			"<#>Чi T� ng, Thanh Loa o s琻 ng, v� Linh C鑓 ng, L穙 H� ng, L﹎ Du Quan ",
			"<#>Sa m筩 мa Bi觰, Phi Thi猲 ng, Ph� Dung ng, Lng Th駓 ng, B╪g H� ng, Thanh Kh� ng, Trng B筩h s琻 Cc ",
			"<#>Sa m筩 s琻 ng t莕g 1, 2 v� Ti課 C骳 ng, Kho� Lang ng, Trng B筩h s琻 Nam L閏, Trng B筩h s琻 B綾 L閏 "}
map1 = {	"<#>C竎 T﹏ th� th玭 ",
			"<#>G莕 b猲 B鎛 m玭, c竎 th祅h th� n鎖 danh ",
			"<#>Ki誱 C竎 Trung Nguy猲, Ki誱 C竎 T﹜ Nam, Ki誱 C竎 T﹜ B綾, La Ti猽 s琻, V� L╪g s琻, T莕 L╪g ",
			"<#>V� Di s琻, T莕 L╪g t莕g 1, v� B筩h V﹏ ng, th� ph� ng ",
			"<#>Thanh Th祅h s琻, 觤 Thng s琻, v� Phong Nh穘 ng, 觤 Thng ng t莕g 1, Th莕 Ti猲 ng ",
			"<#>Hng Th駓 ng, Nghi謙 Long ng, B秓 Ng鋍 Hoa ng, v� Thi猲 T莔 Th竝 t莕g 1,2 ",
			"<#>Dng Gi竎 ng, Tr骳 T� ng t莕g 1, v� Ho祅h s琻 ph竔, Thi猲 T莔 Th竝 t莕g 3 ",
			"<#>Long Nh穘 ng, T莕 L╪g t莕g 2, v� Tr骳 T� ng t莕g 2, Trng Giang u, L﹎ Du Quan ",
			"<#>Sa m筩 мa Bi觰, V� L╪g ng, Dng Trung ng, C� Dng ng, Nh筺 Th筩h ng, Dc Vng ng t莕g 3, T莕 L╪g t莕g 3, Trng B筩h s琻 Cc ",
			"<#>Sa m筩 s琻 ng t莕g 1,2,3, v� Dc Vng ng t莕g 4, Ti課 C骳 ng, Trng B筩h s琻 Nam L閏, Trng B筩h s琻 B綾 L閏 "}
map2 = {	"<#>C竎 T﹏ th� th玭 ",
			"<#>G莕 b猲 B鎛 m玭, c竎 th祅h th� n鎖 danh ",
			"<#>Ki誱 C竎 Trung Nguy猲, Ki誱 C竎 T﹜ Nam, Ki誱 C竎 T﹜ B綾, La Ti猽 s琻, V� L╪g s琻, T莕 L╪g ",
			"<#>B筩h V﹏ ng, Th鬰 Cng s琻, th� ph� ng, v� Ph鬰 Ng璾 s琻 Йng, Kim Quang ng ",
			"<#>Phong Nh穘 ng, 觤 Thng ng t莕g 1, Th莕 Ti猲 ng, v� Ph鬰 Ng璾 s琻 T﹜, Kinh Ho祅g ng ",
			"<#>Hng Th駓 ng, Thi猲 T莔 Th竝 t莕g 1,2, v� T輓 Tng t� a o, 竎 B� a o ",
			"<#>Thi猲 T莔 Th竝 t莕g 3, 108 La H竛 Tr薾, v� C蕀 a m� cung, Ho祅h s琻 ph竔 ",
			"<#>Trng Giang Nguy猲 u, S琻 B秓 ng, v� Уo Hoa Nguy猲, Dc Vng ng t莕g 2, L﹎ Du Quan ",
			"<#>Sa m筩 мa Bi觰, Phi Thi猲 ng, Ph� Dung ng, Dng Trung ng, C� Dng ng, Dc Vng ng t莕g 3, Trng B筩h s琻 Cc ",
			"<#>Sa m筩 s琻 ng t莕g 1, 2, 3, v� Kho� Lang ng, Ti課 C骳 ng, Trng B筩h s琻 Nam L閏, Trng B筩h s琻 B綾 L閏 "}
map3 = {	"<#>C竎 T﹏ th� th玭 ",
			"<#>G莕 b猲 B鎛 m玭, c竎 th祅h th� n鎖 danh ",
			"<#>Ki誱 C竎 Trung Nguy猲, Ki誱 C竎 T﹜ Nam, Ki誱 C竎 T﹜ B綾, La Ti猽 s琻, V� L╪g s琻, T莕 L╪g ",
			"<#>Ph鬰 Ng璾 s琻 Йng, Kim Quang ng, v� T莕 L╪g t莕g 1, V� Di s琻 ",
			"<#>T醓 V﹏ ng, Long Cung ng, v� 觤 Thng ng t莕g 2, Thanh Th祅h s琻, 觤 Thng s琻 ",
			"<#>Hng Th駓 ng, Bi謓 Kinh Thi誸 Th竝 t莕g 1, 2, 3, v� Tng V﹏ ng t莕g 1, Ng� Hoa Vi猲 s琻 ng ",
			"<#>Tng V﹏ ng t莕g 2, 3, 4, v� Thi猲 Nh蒼 Th竛h ng, Dng Gi竎 ng, Tr骳 T� ng t莕g 1 ",
			"<#>Dc Vng ng t莕g 2, L穙 H� ng, Tng V﹏ ng 5 t莕g, Linh C鑓 ng, L﹎ Du Quan ",
			"<#>Sa m筩 мa Bi觰, V� L╪g ng, V� danh ng, Nh筺 Th筩h ng, T莕 L╪g t莕g 3, Trng B筩h s琻 Cc ",
			"<#>Sa m筩 s琻 ng t莕g 1, 2, 3, v� Dc Vng ng t莕g 4, C竛 Vi猲 ng, Trng B筩h s琻 Nam L閏, Trng B筩h s琻 B綾 L閏 "}
map4 = {	"<#>C竎 T﹏ th� th玭 ",
			"<#>G莕 b猲 B鎛 m玭, c竎 th祅h th� n鎖 danh ",
			"<#>Ki誱 C竎 Trung Nguy猲, Ki誱 C竎 T﹜ Nam, Ki誱 C竎 T﹜ B綾, La Ti猽 s琻, V� L╪g s琻, T莕 L╪g ",
			"<#>Mi猽 L躰h, Dc Vng ng t莕g 1, Kho竔 Ho箃 L﹎, v� Ph鬰 Ng璾 s琻 Йng, Kim Quang ng, Tuy誸 B竜 ng t莕g 1, 2 ",
			"<#>Ki課 T輓h Phong s琻 ng, K� Qu竛 ng, Ho祅g H� Nguy猲 u, v� T醓 V﹏ ng, 觤 Thng ng t莕g 2 ",
			"<#>Hng Th駓 ng, B╪g Huy謙 M� Cung, L璾 Ti猲 ng t莕g 1, v� Thi誸 Th竝 t莕g 1,2,3 ",
			"<#>Ho祅h s琻 ph竔, Tng Dng V� m玭 m藅 o, v� L璾 Ti猲 ng t莕g 2,3,4 ",
			"<#>Уo Hoa Nguy猲, L璾 Ti猲 ng t莕g 5, 6 v� T莕 L╪g t莕g 2, Long Nh穘 ng, L﹎ Du Quan ",
			"<#>Sa m筩 мa Bi觰, Lng Th駓 ng, V� danh ng, B╪g H� ng, Thanh Kh� ng, Trng B筩h s琻 Cc ",
			"<#>Sa m筩 s琻 ng t莕g 1, 2, 3, v� Dc Vng ng t莕g 4, C竛 Vi猲 ng, Trng B筩h s琻 Nam L閏, Trng B筩h s琻 B綾 L閏 "}

function map_help()
	ser = GetSeries() + 1
	lvl = floor(GetLevel()/10 + 1)
	if (lvl > 10) then lvl = 10 end
	if (ser == 1) then
		Say(npc_name.."<#>: цi v韎 h� <color=red>Kim  "..lv_str[lvl].."<#><color>цi v韎 ngi m� n鉯 , n琲 luy謓 c玭g t鑤 nh蕋 g錷 c�"..map0[lvl].."<#>. ",0)
	elseif (ser == 2) then
		Say(npc_name.."<#>: цi v韎 h� <color=red>M閏  "..lv_str[lvl].."<#><color>цi v韎 ngi m� n鉯 , n琲 luy謓 c玭g t鑤 nh蕋 g錷 c�"..map1[lvl].."<#>. ",0)
	elseif (ser == 3) then
		Say(npc_name.."<#>: цi v韎 h� <color=red>Th駓  "..lv_str[lvl].."<#><color>цi v韎 ngi m� n鉯 , n琲 luy謓 c玭g t鑤 nh蕋 g錷 c�"..map2[lvl].."<#>. ",0)
	elseif (ser == 4) then
		Say(npc_name.."<#>: цi v韎 h� <color=red>H醓  "..lv_str[lvl].."<#><color>цi v韎 ngi m� n鉯 , n琲 luy謓 c玭g t鑤 nh蕋 g錷 c�"..map3[lvl].."<#>. ",0)
	else
		Say(npc_name.."<#>: цi v韎 h� <color=red>Th�  "..lv_str[lvl].."<#><color>цi v韎 ngi m� n鉯 , n琲 luy謓 c玭g t鑤 nh蕋 g錷 c�"..map4[lvl].."<#>. ",0)
	end
end

function skill_help()
	fact_num = GetLastFactionNumber() + 1
	if (fact_num == 1) then				-- 少林
		Talk(5,"","Nh鱪g ngi theo <color=red>Thi誹 L﹎ ph竔<color>, v� ngh� ph﹏ theo 3 hng:","Hng th� nh蕋 g鋓 l�: 'Quy襫 Thi誹 L﹎', l蕐 H祅g Long B蕋 V�, Thi誹 L﹎ Quy襫 Ph竝, La H竛 Tr薾, Long Tr秓 H� Tr秓, Nh� Lai Thi猲 Di謕, Чt Ma ч Giangl祄 ch�.","Hng th� hai g鋓 l�: 'C玭 Thi誹 L﹎', l蕐 Kim Cang Ph鬰 Ma, Thi誹 L﹎ C玭 ph竝, La H竛 Tr薾, Ho祅h T秓 L鬰 H頿, Nh� Lai Thi猲 Di謕, Ho祅h T秓 Thi猲 Qu﹏ l祄 ch�.","Hng th� ba g鋓 l�: 'o Thi誹 L﹎', l蕐 Kim Cang Ph鬰 Ma, Thi誹 L﹎ o ph竝, La H竛 Tr薾, Ma Ha V� Lng, Nh� Lai Thi猲 Di謕, V� Tng Tr秏 l祄 ch�.","Ngo礽 ra c遪 c� B蕋 чng Minh Vng, S� T� H鑞g, D辌h C﹏ kinh c竎 lo筰 v� c玭g n祔 gi髉 輈h cho ngi r蕋 nhi襲 phng di謓.")
	elseif (fact_num == 2) then		-- 天王
		Talk(5,"","Nh鱪g ngi theo <color=red>Thi猲 Vng bang<color>, v� ngh� ph﹏ theo 3 hng:","Hng th� nh蕋 g鋓 l�: 'o Thi猲 Vng', l蕐 Kinh L玦 Tr秏, Thi猲 Vng  o ph竝, B竧 Phong Tr秏, V� T﹎ Tr秏, Thi猲 Vng Chi課 �, Ph� Thi猲 Tr秏 l祄 ch�.","Hng th� hai g鋓 l�: 'Thng Thi猲 Vng', l蕐 H錳 Phong L筩 Nh筺, Thi猲 Vng Thng ph竝, Dng Quan Tam 謕, Huy誸 Chi課 B竧 Phng, Thi猲 Vng Chi課 �, Truy Tinh Tr鬰 Nguy謙 l祄 ch�.","Hng th� ba g鋓 l�: 'Ch飝 Thi猲 Vng', l蕐 Tr秏 Long quy誸, Thi猲 Vng Ch飝 Ph竝, H祅g V﹏ Quy誸, Th鮝 Long Quy誸, Thi猲 Vng Chi課 �, Truy Phong Quy誸 l祄 ch�.","Ngo礽 ra c遪 c� T躰h T﹎ Quy誸, 筺 H錸 Th輈h, Kim Chung Tr竜 c竎 lo筰 v� c玭g n祔 gi髉 輈h cho ngi r蕋 nhi襲 phng di謓.")
	elseif (fact_num == 3) then		-- 唐门
		Talk(5,"","Nh鱪g ngi theo <color=red> 阯g M玭 <color> v� ngh� ph﹏ theo 4 hng:","Hng th� nh蕋 g鋓 l�: 'Phi oЛ阯g', l蕐 T輈h L辌h Кn, Л阯g M玭 竚 kh�, Truy T﹎ Ti詎, Ti觰 L� Phi o, T﹎ Nh穘, Nhi誴 H錸 Nguy謙 秐h l祄 ch�.","Hng th� hai g鋓 l�: 'T� Ti詎 Л阯g', l蕐 T輈h L辌h Кn, Л阯g M玭 竚 kh�, M筺 Thi猲 Hoa V�, Thi猲 La мa V鈔g, T﹎ Nh穘, B筼 V� L� Hoa l祄 ch�.","Hng th� ba g鋓 l�: 'Phi Ti猽Л阯g', l蕐 T輈h L辌h Кn, Л阯g M玭 竚 kh�, 箃 H錸 Ti猽, T竛 Hoa Ti猽, T﹎ Nh穘, C鰑 Cung Phi Tinh l祄 ch�.","Hng th� t� g鋓 l�: 'H穖 T躰h Л阯g', l蕐 мa Di謒 H醓, чc Th輈h C鑤, Xuy猲 T﹎ Th輈h, H祅 B╪g Th輈h, L玦 K輈h Thu藅, Lo筺 Ho祅 K輈h l祄 ch�.")
	elseif (fact_num == 4) then		-- 五毒
		Talk(5,"","Nh鱪g ngi theo <color=red>Ng� чc gi竜<color>, v� ngh� ph﹏ theo 3 hng:","Hng th� nh蕋 g鋓 l�: 'Chng чc', l蕐 чc Sa Chng, Ng� чc Chng Ph竝, U Minh Kh� L﹗, Thi猲 Cng мa S竧, Ng� чc K� Kinh,  Phong Th鵦 C鑤 l祄 ch�.","Hng th� hai g鋓 l�: 'o c', l蕐 Huy誸 o чc S竧, Ng� чc o ph竝, B竎h чc Xuy猲 T﹎, Chu C竝 Thanh Minh, Ng� чc K� Kinh, Huy襫  Tr秏 l祄 ch�.","Hng th� ba g鋓 l�: 'Ch� thu藅 c', l蕐 C鰑 Thi猲 Cu錸g L玦, X輈h Di謒 Th鵦 Thi猲, B╪g Lam Huy襫 Tinh, Xuy猲 Y Ph� Gi竝, Xuy猲 T﹎ чc Th輈h, 筺 C﹏ H� C鑤 l祄 ch�.","Ngo礽 ra c遪 c� T筽 Nan Dc Kinh, V� H譶h чc, V筺 чc Th鵦 T﹎ c竎 lo筰 v� c玭g n祔 gi髉 輈h cho ngi r蕋 nhi襲 phng di謓.")
	elseif (fact_num == 5) then		-- 峨嵋
		Talk(4,"","Nh鱪g ngi theo <color=red>Nga Mi ph竔<color>, v� ngh� ph﹏ theo 3 hng:","Hng th� nh蕋 g鋓 l�: 'Ki誱 T玭g Nga Mi', l蕐 Nh蕋 Di謕 Tri Thu, Nga Mi Ki誱 ph竝, Th玦 Song V鋘g Nguy謙, B蕋 Di謙 B蕋 Tuy謙, Ph藅 Ph竝 V� Bi猲, Tam Nga T� Tuy誸 l祄 ch�.","Hng th� hai g鋓 l�: 'Kh� T玭g Nga Mi', l蕐 Phi猽 Tuy誸 Xuy猲 V﹏, Nga Mi Chng ph竝, T� Tng уng Quy, Ph藅 Quang Ph� Chi誹, Ph藅 Ph竝 V� Bi猲, Phong Sng To竔 秐h l祄 ch�.","Hng th� ba hai g鋓 l�: 'To祅 Ph� Nga Mi', l蕐 T� H祅g Ph� ч, M閚g 謕, L璾 Th駓, Ph藅 T﹎ T� H鱱, Thanh  Ph筺 Xng, Ph� ч Ch髇g Sinh l祄 ch�.")
	elseif (fact_num == 6) then		-- 翠烟
		Talk(4,"","Nh鱪g ngi theo <color=red>Th髖 Y猲 m玭 <color>, v� ngh� ph﹏ theo 2 hng:","Hng th� nh蕋 g鋓 l�: 'Кn 產oTh髖 Y猲', l蕐 Phong Hoa Tuy誸 Nguy謙, Th髖 Y猲 o ph竝, V� Ф L� Hoa, M鬰 D� L璾 Tinh, B╪g C鑤 Tuy誸 T﹎, B╪g Tung V� 秐h l祄 ch�.","Hng th� hai g鋓 l�: 'Song 產oTh髖 Y猲', l蕐 Phong Quy觧 T祅 Tuy誸, Th髖 Y猲 Song 產o, Ph� V﹏ T竛 Tuy誸, B輈h H秈 Tri襲 Sinh, B╪g C鑤 Tuy誸 T﹎, B╪g T﹎ Ti猲 T�  l祄 ch�.","Ngo礽 ra c遪 c� B╪g T﹎ Tr竔 秐h, H� Th� H祅 B╪g, Tuy誸 秐h c竎 lo筰 v� c玭g n祔 gi髉 輈h cho ngi r蕋 nhi襲 phng di謓")
	elseif (fact_num == 7) then		-- 丐帮
		Talk(4,"","Nh鱪g ngi theo <color=red>C竔 Bang <color>, v� ngh� ph﹏ theo 2 hng:","Hng th� nh蕋 g鋓 l�: 'Chng C竔', l蕐 Ki課 Nh﹏ Th莕 Th�, C竔 Bang Chng Ph竝, Gi竛g Long Chng, Kh竛g Long H鱱 H鑙, T髖 謕 Cu錸g V�, Phi Long T筰 Thi猲 l祄 ch�.","Hng th� hai g鋓 l�: 'C玭 C竔', l蕐 Di猲 M玭 Th竎 B竧, C竔 Bang B鎛g ph竝, Ф C萿 B鎛g, B鎛g Ф 竎 C萿, T髖 謕 Cu錸g V�, Thi猲 H� V� C萿 l祄 ch�.","Ngo礽 ra c遪 c� H鉧 Hi觤 Vi Di, Ho箃 B蕋 L璾 Th�, Ti猽 Di猽 C玭g  c竎 lo筰 v� c玭g n祔 gi髉 輈h cho ngi r蕋 nhi襲 phng di謓")
	elseif (fact_num == 8) then		-- 天忍
		Talk(4,"","Nh鱪g ngi theo <color=red>Thi猲 Nh蒼 gi竜<color>, v� ngh� ph﹏ theo 3 hng:","Hng th� nh蕋 g鋓 l�: 'Chi課 Nh蒼', l蕐 T祅 Dng Nh� Huy誸, Thi猲 Nh蒼 M﹗ ph竝, Li謙 H醓 T譶h Thi猲, Th﹗ Thi猲 Ho竛 Nh藅, Thi猲 Ma Gi秈 Th�,V﹏ Long K輈h l祄 ch�.","Hng th� hai g鋓 l�: 'Ma Nh蒼', l蕐 Кn Ch� Li謙 Di謒, Thi猲 Nh蒼 o ph竝, Th玦 S琻 襫 H秈, Ma Di謒 Th蕋 S竧, Thi猲 Ma Gi秈 Th�, Thi猲 Ngo筰 L璾 Tinh l祄 ch�.","Hng th� ba g鋓 l�: 'Ch� thu藅 nh蒼', l蕐 H醓 Li猲 Ph莕 Hoa, 秓 秐h Phi H�, Phi H錸g V� T輈h, Bi T� Thanh Phong, L辌h Ma 箃 H錸, Nhi誴 H錸 Lo筺 T﹎ l祄 ch�.")
	elseif (fact_num == 9) then		-- 武当
		Talk(4,"","Nh鱪g ngi theo <color=red>V� ng ph竔<color>, v� ngh� ph﹏ theo 2 hng:","Hng th� nh蕋 g鋓 l�: 'Kh� T玭g V� ng', l蕐 N� L玦 Ch�, V� ng Quy襫 Ph竝, B竎 C蕄 Nhi Ph鬰, V� Ng� V� Ki誱, Th竔 C鵦 Th莕 C玭g, Thi猲 мa V� C鵦 l祄 ch�.","Hng th� hai g鋓 l�: 'Ki誱 T玭g V� ng', l蕐 Thng H秈 Minh Nguy謙, V� ng Ki誱 ph竝, Ki誱 Phi Kinh Thi猲, Tam Ho祅 Thao Nguy謙, Th竔 C鵦 Th莕 C玭g, Nh﹏ Ki誱 H頿 Nh蕋  l祄 ch�.","Ngo礽 ra c遪 c� Th蕋 Tinh Tr薾, Th� V﹏ Tung, T鋋 V鋘g V� Ng� c竎 lo筰 v� c玭g n祔 gi髉 輈h cho ngi r蕋 nhi襲 phng di謓")
	elseif (fact_num == 10) then		-- 昆仑
		Talk(5,"","Nh鱪g ngi theo <color=red>C玭 L玭 ph竔<color>, v� ngh� ph﹏ theo 3 hng:","Hng th� nh蕋 g鋓 l�: 'o C玭 L玭', l蕐 H� Phong Ph竝, C玭 L玭 o ph竝, Nh蕋 Kh� Tam Thanh, Cu錸g Phong S藆 謓, Sng Ng筼 C玭 L玭, Ng筼 Tuy誸 Ti猽 Phong l祄 ch�.","Hng th� hai g鋓 l�: 'Ki誱 C玭 L玭', l蕐 Cu錸g L玦 Ch蕁 мa, C玭 L玭 Ki誱 ph竝, Thi猲 T� T蕁 L玦, Ng� L玦 ch輓h Ph竝, Sng Ng筼 C玭 L玭, L玦 чng C鰑 Thi猲 l祄 ch�.","Hng th� ba g鋓 l�: 'Ch� thu藅 C玭 L玭', l蕐 Th骳 Phc Ch�, Ki B竛 ph�, B綾 Minh Цo H秈, Khi H祅 Ng筼 Tuy誸, M� Tung 秓 秐h, T髖 Ti猲 T� C鑤 l祄 ch�.","Ngo礽 ra c遪 c� Thanh Phong ph�, Thi猲 Thanh мa Tr鋍, Kh� T﹎ Ph� c竎 lo筰 v� c玭g n祔 gi髉 輈h cho ngi r蕋 nhi襲 phng di謓")
	else									-- 白名
		Say(npc_name.."<#>: ngi th薽 ch� ch璦 h� tham gia m玭 ph竔 n祇, n鉯 g� n chuy謓 luy謓 hay kh玭g luy謓 ph竝 ",0)
	end
end

GV_TSK_CD_OPEN = 35
tbDEFENCE_SIGNMAP = { 518, 519 }
tbSIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}
tbDEFENCE_RETURN = {
						[1] = { 1520,3228, "Phng Tng Ph� ", 2 },	--凤翔
						[11] = { 3018,5089, "Th祅h Й Ph� ", 1 },	--成都
						[37] = { 1632,3185, "Bi謓 Kinh Ph� ", 2 },	--汴京
						[78] = { 1439,3214, "Tng Dng Ph� ", 1 },	--襄阳
						[80] = { 1593,3197, "Dng Ch﹗ Ph� ", 1 },	--扬州
						[162] = { 1470,3269, "Чi L�", 1 },	--大理
						[176] = { 1392,3313, "L﹎ An Ph� ", 1 },	--临安
					}
CD_LEVEL_LIMIT = 80		--最低参加守城等级

function main(sel)
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
    Msg2Player(szNpcName)
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--弹出对话框
	
	tbDailog.szTitleMsg = npc_name.."<#>Tuy kh玭g ph秈 l� ngi trong giang h�, nh璶g h祅g ng祔 ta th蕐 c竎 ngi qua l筰 r蕋 nhi襲 l莕. Kh玭g ph秈 kho竎 l竎 v� ho祅 c秐h c竎 ngi ta hi觰 r蕋 r�. "
	
	local mapid = SubWorldIdx2ID( SubWorld )
	local camp = tbDEFENCE_RETURN[mapid][4]
						
	tbDailog:AddOptEntry("Tham gia Phong V﹏ Lu薾 Ki誱", CallRescrptFunc )
	tbDailog:AddOptEntry("T譵 hi觰 khu v鵦 luy謓 c玭g", map_help )
	tbDailog:AddOptEntry("T譵 hi觰 v� ngh� b鎛 m玭", skill_help )
	tbDailog:AddOptEntry("T竛 g蓇", default_talk )
	tbDailog:AddOptEntry("R阨 kh醝")
	
	if ( GetGlbValue( GV_TSK_CD_OPEN ) == camp ) then
		tbDailog:AddOptEntry("Tham gia chi課 d辌h th� th祅h", want2cd_signmap)
	end
	
	
	tbDailog:Show()
end

function want2cd_signmap()
	if ( GetLevel() < CD_LEVEL_LIMIT ) then
		Say(npc_name..": �? Ngi c騨g mu鑞 tham gia chi課 d辌h th� th祅h 礹? Ъng c蕄 ch璦  u"..CD_LEVEL_LIMIT.."C蕄, t礽 ngh� nh� ngi y gi髉 kh玭g 頲 g� u, c� th� m蕋 m筺g nh� ch琲 n鱝, th玦 � l筰 th祅h n祔 甶!", 0)
		return
	end
	Say(npc_name..": Ngi mu鑞 甶 gi� th祅h 礹? Mu鑞 l緈 礹? 骾! Ngi v� i th藅 ! Nh璶g nghe u t譶h hu鑞g c蕄 b竎h l緈 th� ph秈! Trong th祅h ch� c遪 th� 頲 2 ti課g n鱝 th玦, n誹 trong 2 ti課g kh玭g k輈h lui 頲 qu﹏ ch th� th蕋 th� r錳! C遪 mu鑞 tham gia ch� c� tng qu﹏ m韎 quy誸 nh 頲, ta c� th� d蒼 ngi qua .", 2, "Ta bi誸 r錳! Mau d蒼 ta qua  甶!/sure2cd_signmap", "в ta chu萵 b� !/no")
end

function sure2cd_signmap()
	LeaveTeam();
	local mapid = SubWorldIdx2ID( SubWorld )
	local camp = tbDEFENCE_RETURN[mapid][4]
	if ( camp == nil ) then
		Say(npc_name..": Ph輆 trc h譶h nh� kh玭g th玭g!", 0)
		return
	end
	if (camp == 1) then
		Msg2Player("V祇 khu v鵦 th� th祅h phe T鑞g")
	else
		Msg2Player("V祇 khu v鵦 th� th祅h phe Kim")
	end
	SetTask(TASKID_FIRE_ADDR, SubWorldIdx2ID(SubWorld))
	SetFightState(0)
	NewWorld(bt_getsignpos(camp))	--camp在守城卫兵处定义
end

function bt_getsignpos(camp)
	if ( camp ~= 1 and camp ~= 2 ) then
		camp = 1;
	end;
	local a = random(getn(tbSIGNMAP_POS))
	
	return tbDEFENCE_SIGNMAP[camp], tbSIGNMAP_POS[a][1], tbSIGNMAP_POS[a][2]
end

function cd_about_compose()
	Say(npc_name..": Haha! Nh譶 trang b� c馻 ngi nh� v藋 m� c騨g i 甶 c玭g th� th祅h! Th玦 n祇! Лa y ta v� l筰 h� cho!", 0)
end

function CallRescrptFunc()
	if ( GetLevel() < 40 ) then
		Talk( 1, "", npc_name..": Phong V﹏ Lu薾 Ki誱 l� n琲 r蕋 nguy hi觤, ch璦 t c蕄 40 kh玭g th� tham gia chi課 trng." );
	else
		Say ( npc_name..": Nh﹏ s� ng s� chi誱 璾 th�, tuy nhi猲 甶觤 s� nh薾 頲 s� 輙 h琻, ngi mu鑞 n n琲 b竜 danh b猲 n祇?", 3, "V祇 甶觤 b竜 danh phe T鑞g (T)/#DoRescriptFunc(1)", "V祇 甶觤 b竜 danh phe Kim (K)/#DoRescriptFunc(2)","в ta suy ngh� l筰./no" );
	end;
end;

function DoRescriptFunc(nSel)
	local tbsongjin_pos = {1608,3254};	--宋方坐标点
	local szstr = "T鑞g";
	if (nSel == 2) then
		tbsongjin_pos = {1566,3277};
		szstr = "Kim";
	end;
	if ( GetLevel() >= 40 and GetLevel() < 60 ) then
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- 不限制其使用回城符
		Msg2Player( "Х v祇 甶觤 b竜 danh" );
	elseif ( GetLevel() >= 60 and GetLevel() < 90 ) then
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- 不限制其使用回城符
		Msg2Player( "Х v祇 甶觤 b竜 danh" );
	else
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- 不限制其使用回城符
		Msg2Player( "Х v祇 甶觤 b竜 danh" );
	end
end;

function no()
end