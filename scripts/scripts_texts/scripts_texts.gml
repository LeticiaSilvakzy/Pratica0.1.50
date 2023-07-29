function ds_grid_add_text()
{
	///@arg Text
	///@arg Name
	///@arg Side
 
	var _grid = text_grid;
	var _y = ds_grid_add_row(_grid);
 
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
}

function add_option(_text, _answer)
{
	option[option_number] = _text;
	option_answer[option_number] = _answer;
	
	option_number++;
}

function scr_dialogs()
{
	switch npc_name
	{
		case "Npc Test":
			ds_grid_add_text("This is a dialogue test", "Npc Test", 1);
			ds_grid_add_text("Esse é um teste de diálogo em português", "Npc Test", 1);
			ds_grid_add_text("This is the end of the dialogue test", "Npc Test", 1);
		break;
		
		case "Npc Test Option":
			ds_grid_add_text("This is a dialogue test with options", "Npc Test Options", 1);
				add_option("First option", "First Answer");
				add_option("Segunda opção", "Second Answer");
				add_option("End this dialogue", "Third Answer");
		break;
			case "First Answer":
				ds_grid_add_text("You choose the first answer!", "Npc Test Options", 1);
			break;
			case "Second Answer":
				ds_grid_add_text("Você escolheu a resposta em português!", "Npc Test Options", 1);
			break;
			case "Third Answer":
				ds_grid_add_text("All options end this dialogue", "Npc Test Options", 1);
			break;
			
		  case "Save":
			ds_grid_add_text("Deseja salvar ?", "Save", 1);
			add_option("Sim","Salvar_Sim");
			add_option("Não","Salvar_Não");
			break;
			
			case "Salvar_Não":
			ds_grid_add_text("Deseja sair ?", "Save",1);
			break;
			
			
		   case "Salvar_Sim":
		    obj_menu.alarm[0] = 1;
		    ds_grid_add_text("Seu jogo foi salvo !", "Save", 1);
		    break;
			
		
			
		
	}
}


