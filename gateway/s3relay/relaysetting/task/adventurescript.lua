CAdventure={}

for i=1,17 do    --初始化内存空间
	CAdventure[i]={}
	CAdventure[i].names={}
	CAdventure[i].mapseg={}
end
--43：剑阁中原：S琻 L閏 Trung
CAdventure[1].names[1]="S琻 L閏 Trung"
CAdventure[1].names[2]="S琻 L閏 Trung"
CAdventure[1].mapseg["begin"]=1
CAdventure[1].mapseg["end"]=50
--195：雁荡山：T﹏ th� th玭 ph� c薾；S琻 L閏 Trung
CAdventure[2].names[1]="T﹏ th� th玭 ph� c薾 "
CAdventure[2].names[2]="S琻 L閏 Trung"
CAdventure[2].mapseg["begin"]=51
CAdventure[2].mapseg["end"]=126
--140：药王谷：T﹏ th� th玭 ph� c薾
CAdventure[3].names[1]="T﹏ th� th玭 ph� c薾 "
CAdventure[3].names[2]="T﹏ th� th玭 ph� c薾 "
CAdventure[3].mapseg["begin"]=127
CAdventure[3].mapseg["end"]=179
--167：点苍山：Th祅h th� ph� c薾；S琻 L閏 Trung
CAdventure[4].names[1]="Th祅h th� ph� c薾"
CAdventure[4].names[2]="S琻 L閏 Trung"
CAdventure[4].mapseg["begin"]=180
CAdventure[4].mapseg["end"]=248
--2：华山：T﹏ th� th玭 ph� c薾；S琻 L閏 Trung
CAdventure[5].names[1]="T﹏ th� th玭 ph� c薾 "
CAdventure[5].names[2]="S琻 L閏 Trung"
CAdventure[5].mapseg["begin"]=249
CAdventure[5].mapseg["end"]=324
--179：⑥霄山：Th祅h th� ph� c薾；S琻 L閏 Trung
CAdventure[6].names[1]="Th祅h th� ph� c薾"
CAdventure[6].names[2]="S琻 L閏 Trung"
CAdventure[6].mapseg["begin"]=325
CAdventure[6].mapseg["end"]=383
-- 7：秦陵：Th祅h th� ph� c薾；S琻 L閏 Trung
CAdventure[7].names[1]="Th祅h th� ph� c薾"
CAdventure[7].names[2]="S琻 L閏 Trung"
CAdventure[7].mapseg["begin"]=384
CAdventure[7].mapseg["end"]=432
--92：蜀岗山：Th祅h th� ph� c薾
CAdventure[8].names[1]="Th祅h th� ph� c薾"
CAdventure[8].names[2]="Th祅h th� ph� c薾"
CAdventure[8].mapseg["begin"]=443
CAdventure[8].mapseg["end"]=501
--70：武陵山：T﹏ th� th玭 ph� c薾；S琻 L閏 Trung
CAdventure[9].names[1]="S琻 L閏 Trung"
CAdventure[9].names[2]="S琻 L閏 Trung"
CAdventure[9].mapseg["begin"]=502
CAdventure[9].mapseg["end"]=560
--90：伏牛山东：Th祅h th� ph� c薾；
CAdventure[10].names[1]="Th祅h th� ph� c薾"
CAdventure[10].names[2]="Th祅h th� ph� c薾"
CAdventure[10].mapseg["begin"]=561
CAdventure[10].mapseg["end"]=619
--74：苗岭：T﹏ th� th玭 ph� c薾
CAdventure[11].names[1]="T﹏ th� th玭 ph� c薾 "
CAdventure[11].names[2]="T﹏ th� th玭 ph� c薾 "
CAdventure[11].mapseg["begin"]=620
CAdventure[11].mapseg["end"]=678
--9：长江源头：Th祅h th� ph� c薾
CAdventure[12].names[1]="Th祅h th� ph� c薾 "
CAdventure[12].names[2]="Th祅h th� ph� c薾"
CAdventure[12].mapseg["begin"]=679
CAdventure[12].mapseg["end"]=737
--21：堑城山：Th祅h th� ph� c薾；
CAdventure[13].names[1]="Th祅h th� ph� c薾"
CAdventure[13].names[2]="Th祅h th� ph� c薾"
CAdventure[13].mapseg["begin"]=738
CAdventure[13].mapseg["end"]=797
--3：剑阁西北：Th祅h th� ph� c薾
CAdventure[14].names[1]="Th祅h th� ph� c薾"
CAdventure[14].names[2]="Th祅h th� ph� c薾"
CAdventure[14].mapseg["begin"]=798
CAdventure[14].mapseg["end"]=857
--122：黄河源头：T﹏ th� th玭 ph� c薾
CAdventure[15].names[1]="T﹏ th� th玭 ph� c薾 "
CAdventure[15].names[2]="T﹏ th� th玭 ph� c薾 "
CAdventure[15].mapseg["begin"]=858
CAdventure[15].mapseg["end"]=917
-- 19：剑阁西南：S琻 L閏 Trung
CAdventure[16].names[1]="S琻 L閏 Trung"
CAdventure[16].names[2]="S琻 L閏 Trung"
CAdventure[16].mapseg["begin"]=918
CAdventure[16].mapseg["end"]=977
--41：伏牛山西：S琻 L閏 Trung
CAdventure[17].names[1]="S琻 L閏 Trung"
CAdventure[17].names[2]="S琻 L閏 Trung"
CAdventure[17].mapseg["begin"]=978
CAdventure[17].mapseg["end"]=1037
CAdventure.msg="C� ngi th蕐 %s M秐h S琻 H� X� T綾"
--随机选点
function CAdventure:Random()
	mapid = 1+Random(17)
	str = format(self.msg,self[mapid].names[1+Random(2)])
	return self[mapid].mapseg["begin"]+Random(self[mapid].mapseg["end"]-self[mapid].mapseg["begin"]+1),str,mapid
end
--产生一个山河宝物
function CAdventure:NewCimelia()
	aid,str,mapid = CAdventure:Random()
	Date = GetCurrentTime()
	success = SaveCustomDataToSDBOw("Adventure",Date, 0, "iis", aid, 353,  "\\script\\item\\shanhesheji.lua");
	NotifySDBRecordChanged("Adventure", Date ,0 ,1);
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	OutputMsg("Tai "..aid.." ID Map ["..mapid.."]: xuat hien mot bao vat!");
end

function TaskShedule()
	TaskName("寻找宝物")
	TaskInterval(30)
	TaskCountLimit(0)
end

function TaskContent()
	CAdventure:NewCimelia()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
