ifdef HOME_DISPLAY_EXTERNALS

app_external_src = $(addprefix apps/external/,\
	extapp_api.cpp \
	archive.cpp \
)

$(eval $(call depends_on_image,apps/home/controller.cpp,apps/external/external_icon.png))

else

apps += External::App
app_headers += apps/external/app.h

app_external_src = $(addprefix apps/external/,\
	app.cpp \
	extapp_api.cpp \
	archive.cpp \
	main_controller.cpp \
	pointer_text_table_cell.cpp \
)

$(eval $(call depends_on_image,apps/external/app.cpp,apps/external/external_icon.png))

endif

SFLAGS += -Iapps/external/

EXTAPP_PATH ?= apps/external/app/
ifeq ($(PLATFORM),device)
	SFLAGS += -DDEVICE
else
	include $(EXTAPP_PATH)/sources.mak
endif

ifdef EXTERNAL_BUILTIN
SFLAGS += -DEXTERNAL_BUILTIN
endif

apps_src += $(app_external_src)

i18n_files += $(addprefix apps/external/,\
  base.de.i18n\
  base.en.i18n\
  base.es.i18n\
  base.fr.i18n\
  base.pt.i18n\
  base.it.i18n\
  base.nl.i18n\
  base.universal.i18n\
)

