DIST_NAME = TODO-PACKAGE-NAME
DEMO_PORT = 3000
DEMO_ROOT =

SCRIPT_FILES = \
	src/index.ts \
	src/demo.ts

EXTRA_SCRIPTS = \
	src/frag.glsl \
	src/vert.glsl

include ./Makefile.microproject
