.PHONY : all install check depends makedepends

all : FreeRTOSConfig.h

SYSROOT := $(shell ${CC} -print-sysroot)
DESTDIR ?= /

../.config :
	@echo "../.config file must be present"
	@exit 1

FreeRTOSConfig.h : ../.config
	@./generator <$^ >$@

install : FreeRTOSConfig.h
	install -dm755 ${DESTDIR}${SYSROOT}/include
	install -m644 -t ${DESTDIR}${SYSROOT}/include $^ portmacro.h

check depends makedepends checkdepends :
