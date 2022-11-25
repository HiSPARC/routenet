EN_TEX_DIRECTORIES=$(sort $(dir $(wildcard English/*/*/*.tex)))
NL_TEX_DIRECTORIES=$(sort $(dir $(wildcard Dutch/*/*.tex)))
ROOT_DIR:=$(shell dirname '$(realpath $(lastword $(MAKEFILE_LIST)))')

# '-recursive' rules are based on a Makefile by Santiago Gonzalez Gancedo
# which was a modified version of a Makefile by Johannes Ranke,
# which was based on Makesfiles by Tadeusz Pietraszek

.PHONY: all
all: latexmk-recursive

.PHONY: distclean
distclean: distclean-recursive

.PHONY: clean
clean: clean-recursive

.PHONY: latexmk-recursive
latexmk-recursive:
	@for dir in $(NL_TEX_DIRECTORIES) $(EN_TEX_DIRECTORIES); do \
		echo '******** starting latexmk ********'; \
		cd $$dir; \
		echo Compiling TeX in $$dir; \
		latexmk -shell-escape -quiet -g -pdf *.tex || exit 1; \
		echo '******** finished latexmk ********'; \
		cd '$(ROOT_DIR)'; \
	done

.PHONY: distclean-recursive
distclean-recursive:
	@for dir in $(NL_TEX_DIRECTORIES) $(EN_TEX_DIRECTORIES); do \
		cd $$dir; \
		echo Distcleaning $$dir; \
		latexmk -quiet -C *.tex; \
		cd '$(ROOT_DIR)'; \
	done

.PHONY: clean-recursive
clean-recursive:
	@for dir in $(NL_TEX_DIRECTORIES) $(EN_TEX_DIRECTORIES); do \
		cd $$dir; \
		echo Cleaning $$dir; \
		latexmk -quiet -c *.tex; \
		cd '$(ROOT_DIR)'; \
	done
