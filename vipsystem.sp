#include <sourcemod>
#include <sdktools>

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//*
//*                 VIP by BatrakovScripts
//*                 Status: 1.0 Version.
//*					Автор релиза Alexander_Mirny(BatrakovScripts)
//*
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#define CMD:%0(%1) public Action: %0(%1)	
public OnPluginStart()
{
	RegAdminCmd("sm_vip", vip, ADMFLAG_CUSTOM1, "");
	RegAdminCmd("sm_guns", guns, ADMFLAG_CUSTOM1, "");
	RegAdminCmd("sm_medik", medik, ADMFLAG_CUSTOM1, "");
	RegAdminCmd("sm_bomb", bomb, ADMFLAG_CUSTOM1, "");
}
/* ==============[cmd:vip]=============== */
CMD:vip(client, args)
{
	new Handle:menu = CreateMenu(VipMenu);
	SetMenuTitle(menu, "•°•°•°VIP•°•°•°");
	AddMenuItem(menu, "option1", "Оружие");
	AddMenuItem(menu, "option2", "Медикаменты");
	AddMenuItem(menu, "option3", "Снаряжение");
	AddMenuItem(menu, "option4", "Спавн");
	AddMenuItem(menu, "option5", "Парашут");
	SetMenuExitButton(menu, true);
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
	return Plugin_Handled;
}
public VipMenu(Handle:menu, MenuAction:action, client, itemNum)
{
	if (action == MenuAction_Select) 
	{  
		switch (itemNum)
		{
			case 0: ClientCommand(client, "sm_guns");
			case 1: ClientCommand(client, "sm_medik");
			case 2: ClientCommand(client, "sm_bomb");
			case 3: ClientCommand(client, "sm_spawn");
			case 4: ClientCommand(client, "sm_parachut");
		}
	}
	return 0;
}
/* ==============[cmd:guns]=============== */
CMD:guns(client, args)
{
	new Handle:menu = CreateMenu(GunBuy);
	SetMenuTitle(menu, "•°•°•°Оружие•°•°•°");
	AddMenuItem(menu, "option1", "Shotgun");
	AddMenuItem(menu, "option2", "SMG");
	AddMenuItem(menu, "option3", "Rifle");
	AddMenuItem(menu, "option4", "Hunting Rifle");
	AddMenuItem(menu, "option5", "Auto Shotgun");
	SetMenuExitButton(menu, true);
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
	return Plugin_Handled;
}
public GunBuy(Handle:menu, MenuAction:action, client, itemNum)
{
	if (action == MenuAction_Select) 
	{  
		switch (itemNum)
		{
			case 0: GivePlayerItem(client, "weapon_pumpshotgun");
			case 1: GivePlayerItem(client, "weapon_smg");
			case 2: GivePlayerItem(client, "weapon_rifle");
			case 3: GivePlayerItem(client, "weapon_hunting_rifle");
			case 4: GivePlayerItem(client, "weapon_autoshotgun");
		}
	}
	return 0;
}
/* ==============[cmd:medik]=============== */
CMD:medik(client, args)
{
	new Handle:menu = CreateMenu(MedikMenu);
	SetMenuTitle(menu, "•°•°•°Медикаменты•°•°•°");
	AddMenuItem(menu, "option1", "Аптечка");
	AddMenuItem(menu, "option2", "Таблетки");
	SetMenuExitButton(menu, true);
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
	return Plugin_Handled;
}
public MedikMenu(Handle:menu, MenuAction:action, client, itemNum)
{
	if (action == MenuAction_Select) 
	{  
		switch (itemNum)
		{
			case 0: GivePlayerItem(client, "weapon_first_aid_kit");
			case 1: GivePlayerItem(client, "weapon_pain_pills");
		}
	}
	return 0;
}
/* ==============[cmd:bomb]=============== */
CMD:bomb(client, args)
{
	new Handle:menu = CreateMenu(BombMenu);
	SetMenuTitle(menu, "•°•°•°Снаряжение•°•°•°");
	AddMenuItem(menu, "option1", "Молотов");
	AddMenuItem(menu, "option2", "Бомба");
	SetMenuExitButton(menu, true);
	DisplayMenu(menu, client, MENU_TIME_FOREVER);
	return Plugin_Handled;
}
public BombMenu(Handle:menu, MenuAction:action, client, itemNum)
{
	if (action == MenuAction_Select) 
	{  
		switch (itemNum)
		{
			case 0: GivePlayerItem(client, "weapon_molotov");
			case 1: GivePlayerItem(client, "weapon_pipe_bomb");
		}
	}
	return 0;
}

	