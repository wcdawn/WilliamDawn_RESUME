# Makefile
NAME=WilliamDawn_RESUME

.PHONY : all resume

all : resume

resume: $(NAME).pdf

$(NAME).pdf : $(NAME).tex res.cls
	pdflatex $(NAME)
