##
## EPITECH PROJECT, 2018
## PSU_zappy_2017
## File description:
## Makefile
##

CC	= gcc

RM	= rm -f

DOC_NAME	= zappy.html

NAME_SERVER	= "zappy_server"

NAME_UT	= units

SRCS_UT_SERV	=	./tests/server/arguments/test_argument_handling.c \
			./tests/server/list/test_list_create.c \
			./tests/server/list/test_list_next_prev.c \
			./tests/server/commands/tests_command_queue.c \
			./tests/server/mocking/mock_malloc.c \
			./src_server/argument_handling/argument_handling.c \
			./src_server/argument_handling/help.c \
			./src_server/circular_buffer/circular_buffer.c \
			./src_server/commands/command_queue.c \
			./src_server/list/list.c \
			./src_server/logs/logs.c \
		./tests/server/circular_buffer/test_circular_buffer_read.c

SRCS_UT_CLIENT  =

SERV_SRCS	=	./src_server/argument_handling/argument_handling.c \
			./src_server/argument_handling/check_arguments.c \
			./src_server/argument_handling/help.c \
			./src_server/list/list.c \
			./src_server/logs/logs.c \
			./src_server/socket_manager/init_epoll.c \
			./src_server/socket_manager/end_sockets.c \
			./src_server/socket_manager/init_server.c \
			./src_server/socket_manager/close_and_msg.c \
			./src_server/socket_manager/call_worker.c \
			./src_server/socket_manager/socket_manager.c \
			./src_server/client_manager/create_user.c \
			./src_server/client_manager/disconnect_client.c \
			./src_server/client_manager/join_team.c \
			./src_server/client_manager/disconnect.c \
			./src_server/commands/command_queue.c \
			./src_server/commands/explode.c \
			./src_server/commands/command.c \
			./src_server/ia_protocole/movements.c \
			./src_server/ia_protocole/inventory.c \
			./src_server/ia_protocole/get_info.c \
			./src_server/ia_protocole/look_dir.c \
			./src_server/ia_protocole/tile_info.c \
			./src_server/ia_protocole/eject.c \
			./src_server/ia_protocole/take_set_objects.c \
			./src_server/ia_protocole/incantation_command.c \
			./src_server/ia_protocole/incantation.c \
			./src_server/sounds/sound.c \
			./src_server/sounds/get_absolute_direction_of_sound.c \
			./src_server/sounds/sound_command.c \
			./src_server/food/food_loop.c \
			./src_server/eggs/command.c \
			./src_server/eggs/eggs_loop.c \
			./src_server/circular_buffer/circular_buffer.c \
			./src_server/circular_buffer/circular_buffer_init.c \
			./src_server/client_manager/exec_client_actions.c \
			./src_server/client_manager/send_message.c \
			./src_server/gfx_protocole/map_info.c \
			./src_server/gfx_protocole/players_info.c \
			./src_server/gfx_protocole/get_gfx_client.c \
			./src_server/map_manager/generate_map.c \
			./src_server/map_manager/fill_refill.c \
			./src_server/map_manager/get_rareness.c \
			./src_server/map_manager/get_tile.c \
			./src_server/main.c

SERV_OBJS = $(SERV_SRCS:.c=.o)

CLIENT_OBJS = $(CLIENT_SRCS:.c=.o)

CFLAGS = -I ./src_server/include/

CFLAGS += -W -Wall -Wextra -lm

TUFLAGS = -lcriterion -lgcov --coverage -DSTESTS -I ./tests/server/include

all: server zappy_ia

server: $(NAME_SERVER)

$(NAME_SERVER): $(SERV_OBJS)
	$(CC) $(SERV_OBJS) -o $(NAME_SERVER) $(CFLAGS) $(LDFLAGS)

client: $(NAME_CLIENT)

$(NAME_CLIENT): $(CLIENT_OBJS) $(IRC_OBJS)
	$(CC) $(IRC_OBJS) $(CLIENT_OBJS) -o $(NAME_CLIENT) $(CFLAGS) $(LDFLAGS)

clean:
	$(RM) $(SERV_OBJS) $(CLIENT_OBJS) $(IRC_OBJS)
	$(RM) *.g*

fclean: clean
	$(RM) $(NAME_SERVER) $(NAME_CLIENT)
	$(RM) $(NAME_UT)

tests_run: $(NAME_UT)

zappy_ia:
	make -C src_client_ia

$(NAME_UT):
	gcc -o $(NAME_UT) $(SRCS_UT_IRC) $(SRCS_UT_CLIENT) $(SRCS_UT_SERV) \
		$(CFLAGS) $(TUFLAGS)
	./units
	gcov *.gcda

doc: $(DOC_NAME)

$(DOC_NAME):
	doxygen

re: fclean all

.PHONY: server client tests_run doc all clean fclean re