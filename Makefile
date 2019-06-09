all: build/main.pdf

Prefix = SS2019
Filename = $(addprefix $(Prefix)_, $(addsuffix .pdf,$(notdir $(CURDIR))))

texoptions = \
	     --lualatex \
	     --interaction=nonstopmode \
	     --halt-on-error \
	     --output-directory=build

build/main.pdf: FORCE | build
	latexmk $(texoptions) main.tex
	cp build/main.pdf W_Massenmessung.pdf # PDF bewegen und umbenennen

preview: FORCE | build
	latexmk $(texoptions) -pvc main.tex

FORCE:

build:
	mkdir -p build

clean:
	rm -f *log # Globales Log löschen
	rm -rf build # Build

.PHONY: all clean
