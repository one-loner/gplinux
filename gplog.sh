#!/bin/bash
case $1 in

  w)
    less /var/log/gplinux.log
    ;;

  e)
    less /var/log/gplinux.error.log
    ;;

  *)
    echo "gplog w - Показать журнал штатной работы."
    echo "gplog e - Показать журнал ошибок."
   ;;
esac
