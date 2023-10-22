--DarkMoon
--head_gm.lua
--client: Lauxanhentertainment
--8/24/14 - 9:54 pm
---------------------
IncludeLib("SETTING")
IncludeLib("FILESYS")
IncludeLib("TASKSYS")
 tbHead = {}
local QUESTKEY = TabFile_Load("\\settings\\item\\004\\questkey.txt","QUESTKEY");
local MAGIC = TabFile_Load("\\settings\\item\\004\\magicscript.txt","MAGIC");
local ITEM = TabFile_Load("\\settings\\item\\004\\goldequip.txt","ITEM")

 function tbHead:LoadFile()
	if self.Item[6111] then 
		print("File da co data trong self.Item")
		return
	end
	
	if %QUESTKEY ~= 1 or %MAGIC ~= 1 or %ITEM ~= 1 then 
		print(foramt("File ko ton tai: %d %d %d",%QUESTKEY,%MAGIC,%ITEM))
		return
	end
	
	
	--QUESTKEY 
	for nRow = 2,TabFile_GetRowCount("QUESTKEY") do 
		 szName = tostring(TabFile_GetCell("QUESTKEY",nRow,"Ãû³Æ"));
		 Genre = tonumber(TabFile_GetCell("QUESTKEY",nRow,"ItemGenre"));
		 Detail = tonumber(TabFile_GetCell("QUESTKEY",nRow,"DetailType"));
		 Index = self:ReturnIndex(Genre,Detail)
		self.Item[Index] = {szName = szName,nProp = {Genre,Detail,1,1,0,0}};
	end
	
	--MAGIC
	for nRow =2,TabFile_GetRowCount("MAGIC") do 
		 szName = tostring(TabFile_GetCell("MAGIC",nRow,"Ãû³Æ"));
		 Genre = tonumber(TabFile_GetCell("MAGIC",nRow,"ItemGenre"));
		 Detail = tonumber(TabFile_GetCell("MAGIC",nRow,"DetailType"));
		 Particular = tonumber(TabFile_GetCell("MAGIC",nRow,"ParticularType"));
		 Index = self:ReturnIndex(Genre,Detail,Particular);
		print(Index);
		self.Item[Index] = {szName = szName,nProp = {Genre,Detail,Particular,1,0,0}}
	end
	
	--ITEM
	for nRow = 2,TabFile_GetRowCount("ITEM") do
		szName = tostring(TabFile_GetCell("ITEM",nRow,"Ãû³Æ"));
		 Id = nRow - 2;
		self.Item[Id] = {szName = szName,nProp = Id}
	end
	print("LOAD DONE FROM FILE")
end

function tbHead:ReturnIndex(...)
	local Count 
	print(arg[1],arg[2],arg[3])
	if getn(arg) == 2 then 
		if arg[2] == 0 then 
			Count = (arg[1]*10)
			return Count
		elseif arg[2] < 10 then 
			Count = (arg[1]*10) + arg[2]
			return Count
		elseif arg[2] >= 10 and arg[2] < 100 then 
			Count = (arg[1]*100) + arg[2]
			return Count
		elseif arg[2] >= 100 and arg[2] < 1000 then 
			Count = (arg[1]*1000) + arg[2]
			return Count
		elseif arg[2] >= 1000  and arg[2] < 10000 then 
			Count = (arg[1] *10000) + arg[2]
			return Count
		end
	else
		if (arg[2] == 0) then 
			Count = (arg[1]*100) + arg[3]
			return Count
		elseif (arg[2] == 1) then 
			if arg[3] < 10 then 
				Count = (arg[1]*100) + 10 + arg[3]
				return Count
			elseif (arg[3] >= 10 and  arg[3] < 100) then 
				Count = (arg[1]*1000) + 100 + arg[3]
				return Count
			elseif arg[3] >= 100 and arg[3] < 1000 then 
				Count = (arg[1]*10000) + 1000 + arg[3]
				return Count
			elseif arg[3] >= 1000  and arg[3] < 10000 then 
				Count = (arg[1] *100000) + 10000 + arg[3]
				return Count
			elseif arg[3] >= 10000 and arg[3] < 1000000 then 
				Count = (arg[1] *1000000) + 100000 + arg[3]
				return Count
			end
		elseif (arg[2] == 2) then 
			if arg[3] < 10 then 
				Count = (arg[1]*100) + 20 + arg[3]
				return Count
			elseif (arg[3] >= 10 and  arg[3] < 100) then 
				Count = (arg[1]*1000) + 200 + arg[3]
				return Count
			elseif arg[3] >= 100 and arg[3] < 1000 then 
				Count = (arg[1]*10000) + 2000 + arg[3]
				return Count
			elseif arg[3] >= 1000  and arg[3] < 10000 then 
				Count = (arg[1] *100000) + 20000 + arg[3]
				return Count
			end
		end
	end
end

function tbHead:_init()
	self.Item = {{}}
end

function tbHead:new()
	local tb = {}
	for k,v in self do 
		tb[k] = v
	end
	tb:_init()
	return tb
end

tbHead:_init()