#!/bin/bash
echo "ajout de : "
read message
git add .
git commit -m "ajout de $message dans BliblioService"
git push
