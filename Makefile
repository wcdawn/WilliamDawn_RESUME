# Makefile

RESUME=WilliamDawn_RESUME
CV=WilliamDawn_CV

INTERMEDIATES=*.aux *.log \
			  *.bcf *.blg *.bbl *.run.xml \
			  *.acn *.acr *.alg *.glg *.glo *.gls *.ist

.PHONY : all resume cv forceresume forcecv clean cleanpdf

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

forceresume :
	touch $(RESUME).tex
	$(MAKE) resume

forcecv : 
	touch $(CV).tex
	$(MAKE) cv

clean :
	rm -f $(AUX) $(INTERMEDIATES)

cleanpdf : 
	rm -f $(RESUME).pdf $(CV).pdf
