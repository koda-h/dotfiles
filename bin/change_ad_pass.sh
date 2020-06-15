#!/bin/bash

NAME=koda
DOMAIN=DIGITALGROUP

read -sp "古いパスワードを入力してください。 > " OLD_PASSWD;
echo
read -sp "新しいパスワードを入力してください。 > " NEW_PASSWD;
echo
read -sp "新しいパスワードを入力してください。(確認用) > " NEW_PASSWD_RE;
echo

if [ ${NEW_PASSWD} != ${NEW_PASSWD_RE} ]; then
    echo "### 新しいパスワードが一致しません。 ###";
    exit 1;
fi

sudo dscl /Active\ Directory/${DOMAIN}/All\ Domains/ -passwd /Users/${NAME} ${OLD_PASSWD} ${NEW_PASSWD}
RESULT=$?;
if [ ${RESULT} = 0 ]; then
    echo "### パスワードが変更されました。 ###";
elif [ ${RESULT} = 11 ]; then
    echo "### パスワードの変更に失敗しました。 ###";
    exit 11;
elif [ ${RESULT} = 185 ]; then
    echo "### ユーザが存在しません。###";
    exit 185;
else
    echo "### パスワードの変更に失敗しました。 ###";
    exit 1;
fi
