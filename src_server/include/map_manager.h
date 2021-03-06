/*
** EPITECH PROJECT, 2018
** Zappy - Server
** File description:
** Map Manager
*/

#ifndef MAP_MANAGER_H_
	#define MAP_MANAGER_H_

	#include "server.h"

	#define R_LINEMATE (90)
	#define R_DERAUMERE (90)
	#define R_SIBUR (90)
	#define R_MENDIANE (94)
	#define R_PHIRAS (95)
	#define R_THYSTAME (98)
	#define R_FOOD (75)

	bool generate_map(game_t *game);
	uint get_rareness(ressource_e res);
	bool is_lucky(ressource_e res);
	void refill_map(game_t *game);
	void fill_map(game_t *game);
	tile_t *get_tile_at_dir(server_t *server, pos_t pos, dir_e dir);

#endif /* !MAP_MANAGER_H_ */
