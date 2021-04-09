# Makefile

RESUME=WilliamDawn_RESUME
CV=WilliamDawn_CV
CV2=WilliamDawn_CV_two_page

INTERMEDIATES=*.aux *.log \
			  *.bcf *.blg *.bbl *.run.xml \
			  *.acn *.acr *.alg *.glg *.glo *.gls *.ist

.PHONY : all resume cv cv2 forceresume forcecv clean cleanpdf

all : resume cv cv2

resume: $(RESUME).pdf

cv : $(CV).pdf

cv2 : $(CV2).pdf

$(RESUME).pdf : $(RESUME).tex res.cls
	pdflatex $(RESUME)

$(CV).pdf : $(CV).tex res.cls mywork.bib
	pdflatex --draftmode $(CV)
	biber $(CV)
	pdflatex --draftmode $(CV)
	pdflatex $(CV)

$(CV2).pdf : $(CV2).tex res.cls mywork.bib
	pdflatex --draftmode $(CV2)
	biber $(CV2)
	pdflatex --draftmode $(CV2)
	pdflatex $(CV2)

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
