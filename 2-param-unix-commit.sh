#!/bin/bash
echo "ajout de : "
read message
echo "dans : "
read message2
git add .
git commit -m "ajout de $message dans $message2"
git push
