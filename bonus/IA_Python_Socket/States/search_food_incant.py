#!/usr/bin/env python3

from General_comportement.inventory import look_inventory
from General_comportement.inventory import get_food
from General_comportement.mov_to_tile import mov_to_tile
from General_comportement.ressources import IsThereItem
from General_comportement.broadcast import EmptyCacheIgnoreBroadcast


#
# @brief: Function that is called when the food level are not critical but not
# enough to level_up therefore just like our survive function this function
# will get food however there is a twist whenever there is no food on the look
# then it takes a useful rock if no rock then moves forward
#
# @param: level [in], int, the current level of the player
# @param: food [out], int, the current food of the player
# @param: socket [in], socket class variable to interact with socket class
#
# @return: None
#
def search_food_incant_mode(lvl, food, socket):
    while food < lvl + 8:
        location, item, level = IsThereItem(socket, ["food"], lvl)
        if level != lvl:
            return level
        if (location >= 0):
            mov_to_tile(location, lvl, socket)
            socket.Take(item)
            resp, level = EmptyCacheIgnoreBroadcast(socket, lvl)
            if level != lvl:
                return level
            inventory, level = look_inventory(socket, lvl)
            if level != lvl:
                return level
            food = get_food(inventory)
            print ("search food incant: food i got: " + str(food))
        else:
            for i in range(lvl):
                socket.Forward()
                resp, level = EmptyCacheIgnoreBroadcast(socket, lvl)
                if level != lvl:
                    return level
