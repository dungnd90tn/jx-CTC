
-- ====================== 文件信息 ======================

-- 剑侠情缘online 任务系统工具脚本
-- Edited by peres
-- 2005/07/29 PM 12:30

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 读入数据定义头文件
Include("\\script\\task\\system\\task_head.lua");

-- 读入 DEBUG 输出处理文件
Include("\\script\\task\\system\\task_debug.lua");

strTitle        = "<color=green>C萴 nang nhi謒 v�<color>:";
strTitle_Normal = strTitle.."B筺 mu鑞 xem nhi謒 v� n祇?<enter>"
strTitle_None   = strTitle.."B筺 hi謓 ch璦 l祄 nhi謒 v� n祇.";


function main()

Say(strTitle.."B筺 mu鑞 l祄 nhi謒 v� n祇 trong c萴 nang nhi謒 v� n祔 kh玭g?",4,
	"Xem m譶h hi謓 產ng l祄 nhi謒 v� n祇./ShowEventMain",
	"S� tr� v� tr筺g th竔 ban u/MenuSetTaskClearn",
	"S� x鉧 to祅 b� c竎 nhi謒 v� /MenuSetEventClearn",
	"сng/Task_Exit");

return 1;

end;

-- 玩家选择查看事件，在下面列出所有正在进行的事件供玩家选择
function ShowEventMain()

local i=0;
local aryEvent = EnumEventList();
local aryTalkText = {strTitle_Normal};

	if aryEvent==nil then
		Say(strTitle_None, 0);
		return
	end;
	
	for i,j in aryEvent do
		rawset(aryTalkText,
				getn(aryTalkText)+1,
				TaskEvent(i, 1, 1).."/#ShowEventDetail("..i..")");
	end;
	
	rawset(aryTalkText, getn(aryTalkText)+1, "сng/Task_Exit");
	
	SelectSay(aryTalkText);
	
	return 1;


end;


function ShowEventDetail(nEventID)

local aryTask = EnumEventTask(nEventID);
local strMain = {strTitle.."Di y l�<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>T譶h tr筺g chi ti誸:<enter><enter>"} -- 任务列表字符串

local i=0;


	for i=1, getn(aryTask) do
		strMain[1] = strMain[1]..GetTaskText(TaskName(aryTask[i]), 1, 3)..GetTaskStatusText(aryTask[i]).."<enter>";
	end;
	
	rawset(strMain, getn(strMain)+1, "X鉧 nhi謒 v� n祔/#_ClearnTaskState("..nEventID..")");
	rawset(strMain, getn(strMain)+1, "Tr� l筰 thanh menu ch輓h/main");
	rawset(strMain, getn(strMain)+1, "сng/Task_Exit");
	
	SelectSay(strMain);

end;


-- 枚举出当前正在进行的事件
function EnumEventList()

local aryTask  = EnumTaskList(); -- 取得当前正在进展的任务
local aryEvent = {}
local i=0;

	if aryTask==nil then return nil; end;
	
	for i=1, getn(aryTask) do
		rawset(aryEvent,
				GetTaskEventID(aryTask[i]),
				1);
	end;
	
	return aryEvent;

end;


-- 枚举出一事件所包含的任务，返回一个数组
function EnumEventTask(nEventID)

local aryTask = {};

local nEvent = GetEventTaskCount(nEventID);

	CDebug:MessageOut("C� 頲:"..nEventID.." s� nhi謒 v� l�:"..nEvent);

local i=0;

	if nEvent==0 then return nil; end;
	
	for i=1, nEvent do
		CDebug:MessageOut("ng nh藀 s� nhi謒 v�:"..TaskNo(GetEventTask(nEventID, i)));
		rawset(aryTask,
				getn(aryTask)+1,
				TaskNo(GetEventTask(nEventID, i))
				);
	end;
	
	return aryTask;

end;


-- 回调函数，清空一个事件所有任务的状态，包括临时变量
function _ClearnTaskState(nEventID)

local aryTask = EnumEventTask(nEventID);

if aryTask==nil then return end;

	for i=1, getn(aryTask) do
		CDebug:MessageOut("ng x鉧"..TaskName(aryTask[i]).."Tr筺g th竔 nhi謒 v� ");
		SetTaskStatus(TaskName(aryTask[i]), 0);
		CloseTask(TaskName(aryTask[i]));
	end;

	Say(strTitle.."B筺  x鉧 h誸<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>ph﹏ t輈h to祅 b� nhi謒 v� ", 0);

end;


-- 将一个任务设置成还未开始的状态
function MenuSetTaskClearn()
	AskClientForString("_SetTaskClearn", "", 1, 20, "Xin h穣 nh藀 m藅 kh萿:");
end;


function _SetTaskClearn(taskID, nIndex)

	if TaskName(taskID)==0 or TaskName(taskID)==nil then
		Say(strTitle.."M藅 kh萿 n祔 kh玭g ng!", 0);
		return
	end;

	SetTaskStatus(TaskName(taskID), 0);
	CloseTask(TaskName(taskID));
	
	Say(strTitle.."B筺 nh薾 頲<color=yellow>"..TaskName(taskID).."<color>Tr� v� tr筺g th竔 ban u", 0);

end;


-- 将一个事件里所有的任务都清空
function MenuSetEventClearn()
	AskClientForString("_SetEventClearn", "", 1, 20, "Xin h穣 nh藀 m藅 kh萿:");
end;


function _SetEventClearn(eventID, nIndex)

local nEvent = GetEventTaskCount(eventID);

	if nEvent==0 then
		Say(strTitle.."M藅 kh萿 n祔 kh玭g ng!", 0);
		return
	end;

	_ClearnTaskState(eventID);
end;


-- 用字符串表示一个任务的状态
function GetTaskStatusText(nTaskID)

local aryText = {
	[0]=" - <color=red>ch璦 b総 u<color>",
	[1]=" - <color=green>Ti課 h祅h<color>",
	[2]=" - <color=yellow>Х ho祅 th祅h<color>",
	[3]=" - <color=yellow>Х nh薾 qu� t苙g<color>",
}

	return aryText[GetTaskStatus(TaskName(nTaskID))];
	
end;