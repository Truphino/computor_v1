# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile.2                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: trecomps <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/07 08:26:49 by trecomps          #+#    #+#              #
#    Updated: 2019/03/29 14:26:19 by trecomps         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC =	main.cpp\
		Mesh.class.cpp\
		Model.class.cpp\
		Shader.class.cpp

INC =

OBJ = $(SRC:.cpp=.o)

INC_DIR = include
SRC_DIR = src
OBJ_DIR = obj

SRC_FILES = $(addprefix $(SRC_DIR)/, $(SRC))
INC_FILES = $(addprefix $(INC_DIR)/, $(INC))
OBJ_FILES = $(addprefix $(OBJ_DIR)/, $(OBJ))
DEPENDS = $(OBJ_FILES:.o=.d)

NAME = 42run
FLAGS = -Wall -Wextra -Werror -MMD
STD = -std=c++11

.PHONY: all, clean, fclean, re

$(NAME) : $(OBJ_FILES)
	g++ $(STD) $(FLAGS) -o $(NAME) $(OBJ_FILES)

all: $(NAME)

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	g++ $(STD) $(FLAGS) -c -I$(INC_DIR) $< -o $@

-include $(DEPENDS)

clean:
	rm -rf $(OBJ_FILES)

fclean: clean
	rm -rf $(NAME)

re: fclean all
