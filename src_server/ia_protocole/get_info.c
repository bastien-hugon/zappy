/*
** EPITECH PROJECT, 2018
** Zappy - Server
** File description:
** Get Info
*/

#include "server.h"

/**
*@brief Send the free slot on the client's team
*
*@param srv [in] The main server_t struct
*@param client [in] The client
*@return true sent
*@return false Not sent
*/
bool client_nb_connect(server_t *srv, client_t *client)
{
	(void)srv;
	return (send_message(client->socket.fd, "%d\n", \
	client->team->free_slots));
}

/**
*@brief Send look informations
*
*@param srv [in] Main server_t struct
*@param client [in] The client
*@return true If message is sent
*@return false If message isn't sent
*/
bool client_look(server_t *srv, client_t *client)
{
	WARN("LOOK");
	switch (client->dir) {
		case NORTH:
			return (look_north(srv, client));
		case EAST:
			return (look_east(srv, client));
		case SOUTH:
			return (look_south(srv, client));
		case WEST:
			return (look_west(srv, client));
	}
	send_message(client->socket.fd, "ko\n");
	return (false);
}