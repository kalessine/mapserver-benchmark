docker stop benchmark_benchmark
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=300
WIDTH=40

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "Benchmark" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 9 \
    "1" "Benchmark Nginx Fastcgi" \
    "2" "Benchmark Nginx PHP7.2" \
    "3" "Benchmark Apache2 Fastcgi" \
    "4" "Benchmark Apache2 PHP7.2" \
    "5" "Benchmark Nginx Fastcgi(qix)" \
    "6" "Benchmark Nginx PHP7.2(qix)" \
    "7" "Benchmark Apache2 Fastcgi(qix)" \
    "8" "Benchmark Apache2 PHP7.2(qix)" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      cp ../nginx-fcgiwrap/fastcgi_requests.log ./log.log
      docker run --rm -it -u root --name benchmark_benchmark --mount type=bind,source="$(pwd)",target=/data/siege mapserver-benchmark:benchmark /usr/local/bin/start.sh "Nginx_FastCgi"
      cat results.log
      ;;
    2 )
      cp ../nginx-fcgiwrap/mapserv_php_requests.log ./log.log
      docker run --rm -it -u root --name benchmark_benchmark --mount type=bind,source="$(pwd)",target=/data/siege mapserver-benchmark:benchmark /usr/local/bin/start.sh "Nginx_PHP7.2"
      cat results.log
      ;;
    3 )
      cp ../nginx-fcgiwrap/fastcgi_requests.log ./log.log
      docker run --rm -it -u root --name benchmark_benchmark --mount type=bind,source="$(pwd)",target=/data/siege mapserver-benchmark:benchmark /usr/local/bin/start.sh "Apache2_FastCgi"
      cat results.log
      ;;
    4 )
      cp ../nginx-fcgiwrap/mapserv_php_requests.log ./log.log
      docker run --rm -it -u root --name benchmark_benchmark --mount type=bind,source="$(pwd)",target=/data/siege mapserver-benchmark:benchmark /usr/local/bin/start.sh "Apache2_PHP7.2"
      cat results.log
      ;;
    5 )
      cp ../nginx-fcgiwrap/fastcgi_requests.log ./log.log
      docker run --rm -it -u root --name benchmark_benchmark --mount type=bind,source="$(pwd)",target=/data/siege mapserver-benchmark:benchmark /usr/local/bin/start.sh "Nginx_FastCgi(qix)"
      cat results.log
      ;;
    6 )
      cp ../nginx-fcgiwrap/mapserv_php_requests.log ./log.log
      docker run --rm -it -u root --name benchmark_benchmark --mount type=bind,source="$(pwd)",target=/data/siege mapserver-benchmark:benchmark /usr/local/bin/start.sh "Nginx_PHP7.2(qix)"
      cat results.log
      ;;
    7 )
      cp ../nginx-fcgiwrap/fastcgi_requests.log ./log.log
      docker run --rm -it -u root --name benchmark_benchmark --mount type=bind,source="$(pwd)",target=/data/siege mapserver-benchmark:benchmark /usr/local/bin/start.sh "Apache2_FastCgi(qix)"
      cat results.log
      ;;
    8 )
      cp ../nginx-fcgiwrap/mapserv_php_requests.log ./log.log
      docker run --rm -it -u root --name benchmark_benchmark --mount type=bind,source="$(pwd)",target=/data/siege mapserver-benchmark:benchmark /usr/local/bin/start.sh "Apache2_PHP7.2(qix)"
      cat results.log
      ;;

  esac
done
