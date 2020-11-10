# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.21-school.ru>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/07 19:15:19 by cbach             #+#    #+#              #
#    Updated: 2020/11/10 23:58:56 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =	libasm.a

C_FLAGS = -Wall -Wextra -Werror

NASM_FLAG = -fmacho64

LIBASM_DIR = .

HEADERS =		$(wildcard $(LIBASM_DIR)/*.h)

C_SRC =			$(wildcard $(LIBASM_DIR)/*.c)

ASM_SRC =		$(wildcard $(LIBASM_DIR)/*.s)

OBJ =			$(patsubst %.s, %.o, $(ASM_SRC))
OBJ_BONUS =		$(patsubst %.s, %.o, $(ASM_SRC))

ifdef BONUS_FILES
OBJ_FILES = $(OBJ_BONUS)
else
OBJ_FILES = $(OBJ)
endif

.PHONY: all bonus clean fclean re test

all: $(NAME)

$(NAME): $(OBJ_FILES)
	ar -rcs $(NAME) $?

bonus:
	$(MAKE) BONUS_FILES=1 all

%.o: %.s $(HEADERS)
	nasm $(NASM_FLAG) $< -o $@
#	nasm $(NASM_FLAG) -M $< >> .depend

-include .depend

clean:
	rm -f $(OBJ) $(OBJ_BONUS)

fclean: clean
	rm -f $(NAME)
	rm -f a.out
	rm -f asm.txt
	rm -f orig.txt
#	rm -f .depend

re: fclean all

test: re
	touch asm.txt orig.txt
	gcc $(C_FLAGS) $(C_SRC) -L$(LIBASM_DIR) -lasm
	./a.out | cat -e