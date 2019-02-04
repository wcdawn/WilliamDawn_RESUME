# Makefile
RESUME=WilliamDawn_RESUME
CV=WilliamDawn_CV

.PHONY : all resume cv

all : resume cv

resume: $(RESUME).pdf

cv : $(CV).pdf

$(RESUME).pdf : $(RESUME).tex res.cls
	pdflatex $(RESUME)

$(CV).pdf : $(CV).tex res.cls mywork.bib
	pdflatex --draftmode $(CV)
	biber $(CV)
	pdflatex --draftmode $(CV)
	pdflatex $(CV)


