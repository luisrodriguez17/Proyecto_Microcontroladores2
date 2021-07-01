#!/usr/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area
#-------------------------------------------

# /usr/lib/qflow/scripts/synthesize.sh /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area/source/Modelo_area_junto.v || exit 1
# /usr/lib/qflow/scripts/placement.sh -d /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/opensta.sh  /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
/usr/lib/qflow/scripts/vesta.sh -a /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/router.sh /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/opensta.sh  -d /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/vesta.sh -a -d /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/migrate.sh /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/drc.sh /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/lvs.sh /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/gdsii.sh /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/cleanup.sh /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
# /usr/lib/qflow/scripts/display.sh /home/erick/Documentos/UCR/UCR_2021/I-2021/Microelectronica/Proyecto_2/repositorio/qflow_area modulo_area || exit 1
