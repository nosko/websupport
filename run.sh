#!/bin/bash
USER='user'
PASSWORD='password'

# uvodna stranka s loginom
CSRF=$(curl -s -c cookies.txt -i https://admin.websupport.sk/sk/site/login | grep "Set-Cookie" | grep "YII_CSRF" | sed 's/Set-Cookie: YII_CSRF_TOKEN=//g' | cut -d ';' -f 1)
data="YII_CSRF_TOKEN="$CSRF"&LoginForm%5Busername%5D="$USER"&LoginForm%5Bpassword%5D="$PASSWORD"&submit="
# prihlasenie sa
CSRF=$(curl -c cookies.txt -b cookies.txt -i https://admin.websupport.sk/sk/site/login --data "$data" --location | grep "Set-Cookie" | grep "YII_CSRF" | sed 's/Set-Cookie: YII_CSRF_TOKEN=//g' | cut -d ';' -f 1)
# nastavenie sa na domenu eu
#CSRF=$(curl -c cookies.txt -b cookies.txt -i https://admin.websupport.sk/webadmin/?domain=noskovic.eu --location | grep "Set-Cookie" | grep "YII_CSRF" | sed 's/Set-Cookie: YII_CSRF_TOKEN=//g' | cut -d ';' -f 1)
CSRF=$(curl -c cookies.txt -b cookies.txt -i https://admin.websupport.sk/webadmin/?s=76&tab=a --referer https://admin.websupport.sk/webadmin/?domain=noskovic.eu | grep "Set-Cookie" | grep "YII_CSRF" | sed 's/Set-Cookie: YII_CSRF_TOKEN=//g' | cut -d ';' -f 1)

# zobrazenie editacnej stranky
#curl -c cookies.txt -b cookies.txt -i https://admin.websupport.sk/webadmin/?s=77&v1=1979842 -o plz.txt



#CSRF=$(curl -c cookies.txt -b cookies.txt -i https://admin.websupport.sk/webadmin/?s=77&v1=1979846 | grep "Set-Cookie" | grep "YII_CSRF" | sed 's/Set-Cookie: YII_CSRF_TOKEN=//g' | cut -d ';' -f 1)

echo $CSRF
