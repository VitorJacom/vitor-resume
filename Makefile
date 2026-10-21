.PHONY: all english both clean

all:
	@./build.sh main.tex

english:
	@./build.sh english

both:
	@./build.sh all

clean:
	@./build.sh clean
