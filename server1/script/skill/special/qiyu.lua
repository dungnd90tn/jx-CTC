Include("\\script\\skill\\head.lua")
SKILLS={
	followplayer={ --���ɹ�׷���ӵ���
		fatallystrike_p={ --��������һ��
			[1]={{1,100},{20,100}},
		},
		frozen_action={ --��ֹ�ƶ�
			[1]={{1,1},{20,1}},
			[2]={{1,18*2},{2,18*2}},
		},
		addcoldmagic_v={ --�ڹ�ϵ�����˺�
			[1]={{1,100},{15,1500},{20,2000}},
			[3]={{1,100},{15,1500},{20,2000}},
		},
	},
	luanhuan_ji={ --���ɹ������ӵ���2
		firedamage_v={
			[1]={{1,100},{20,400}},
			[3]={{1,100},{20,400}}
		},
		poisondamage_v={
			[1]={{1,20},{20,80}},
			[2]={{1,50},{20,50}},
			[3]={{1,10},{20,10}}
		},
		physicsdamage_v={
			[1]={{1,100},{20,400}},
			[3]={{1,100},{20,400}}
		},
		colddamage_v={
			[1]={{1,100},{20,400}},
			[2]={{1,1},{20,18}},
			[3]={{1,100},{20,400}}
		},
		lightingdamage_v={
			[1]={{1,100},{20,400}},
			[3]={{1,100},{20,400}}
		},
		stun_p={{{1,1},{20,20}},{{1,1},{20,20}}},
	},
	lengbingjineng={ --�������
		fatallystrike_p={{{1,100},{20,100}}},
		frozen_action={{{1,1},{20,1}},{{1,18*2},{2,18*2}}},
		invincibility=
		{
			{{1,18*2},{20,18*2}}
		},
	},
	huoqiang_shouwei={
		firedamage_v={
			[1]={{1,2000},{20,5000}},
			[3]={{1,2000},{20,5000}}
		},
	},
	lihun_zhupo={	--BOSS�ؼ��� �������
		fastwalkrun_p={{{1,-10},{20,-10}},{{1,2*18},{20,2*18}}},	--����Ч��
	},
	lihun={			--������ǵ�2�� ���
		lifereplenish_v={{{1,500},{20,500}},{{1,5},{20,5}}}, 	--�����ָ�
	},
	zhupo={			--������ǵ�3�� ����
		firedamage_v={
			[1]={{1,100},{20,200}},
			[3]={{1,100},{20,200}}
		},
		poisondamage_v={
			[1]={{1,80},{20,80}},
			[2]={{1,50},{20,50}},
			[3]={{1,10},{20,10}}
		},
		physicsdamage_v={
			[1]={{1,200},{20,200}},
			[3]={{1,200},{20,200}}
		},
		colddamage_v={
			[1]={{1,200},{20,200}},
			[2]={{1,18},{20,18}},
			[3]={{1,200},{20,200}}
		},
		lightingdamage_v={
			[1]={{1,200},{20,200}},
			[3]={{1,200},{20,200}}
		}
	},
	linglongtaputongfuzhou=
	
	{			--��������ͨ���似������

	lifemax_yan_v                   ={{{1,1500},		{20,30000}}		,{{1,-1},		{2,-1}}},
	lifemax_yan_p                   ={{{1,10},		{20,200}}		,{{1,-1},		{2,-1}}},
	skill_enhance                   ={{{1,3},		{20,50}}		,{{1,-1},		{2,-1}}},
	allres_p                        ={{{1,8},		{20,160}}		,{{1,-1},		{2,-1}}},
	sorbdamage_yan_p                ={{{1,5},       {20,100}}		,{{1,-1},		{2,-1}}},
	anti_sorbdamage_yan_p           ={{{1,4},		{20,80}}		,{{1,-1},		{2,-1}}},
	block_rate                      ={{{1,1},		{20,20}}		,{{1,-1},		{2,-1}}},
	anti_block_rate                 ={{{1,1.5},		{20,30}}			,{{1,-1},		{2,-1}}},
	enhancehit_rate           		={{{1,1},		{20,20}}		,{{1,-1},		{2,-1}}},
	anti_enhancehit_rate            ={{{1,1},		{20,20}}			,{{1,-1},		{2,-1}}},
	lifereplenish_p                 ={{{1,1},		{20,20}}		,{{1,-1},		{2,-1}}},
	fastwalkrun_yan_p               ={{{1,1},		{20,20}}		,{{1,-1},		{2,-1}}},
	enhancehiteffect_rate               ={{{1,1},		{20,20}}		,{{1,-1},		{2,-1}}},

	},
	
	linglongtaqianglifuzhou=

	{			--������ǿ�����似������

	block_rate       		={{{1,200},        {20,200}},         {{1,5*18},           {20,5*18}}},
	meleedamagereturn_p     ={{{1,100},        {20,100}},         {{1,5*18},           {20,5*18}}},
	rangedamagereturn_p     ={{{1,100},        {20,100}},         {{1,5*18},           {20,5*18}}},
	attackspeed_yan_v       ={{{1,100},        {20,100}},         {{1,5*18},           {20,5*18}}},
	castspeed_yan_v         ={{{1,100},        {20,100}},         {{1,5*18},           {20,5*18}}},
	lifepotion_v            ={{{1,5000},       {20,5000}},        {{1,5*18},           {20,5*18}}},
	
	},
	ruyoushenzhu=

	{			--�����󸶷ѵ���

	lifemax_yan_v                   ={{{1,2000},		{20,2000}}		,{{1,-1},		{2,-1}}},
	add_five_boss_damage			={{{1,20},		{20,20}}		,{{1,-1},		{2,-1}}},
	
	},
}