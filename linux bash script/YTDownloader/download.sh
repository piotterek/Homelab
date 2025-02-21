#!/bin/bash

if [[ ! -f "lista_linkow.txt" ]]; then
  echo "Brak pliku lista_linkow.txt! Umieść go w tym samym katalogu co skrypt."
  exit 1
fi

if [[ ! -f "/home/piotr/Pulpit/cookies.txt" ]]; then
  echo "Brak pliku cookies.txt! Upewnij się, że jest w /home/piotr/Pulpit/"
  exit 1
fi

meter=0

while IFS= read -r link; do
  meter=$((meter + 1))
  echo "Pobieram link #$meter: $link"
  
  yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" \
         --merge-output-format mp4 \
         --cookies "/home/piotr/Pulpit/cookies.txt" \
         "$link"
  
  echo "Pobieranie zakończone dla linku #$meter"
done < "lista_linkow.txt"

echo "Wszystkie filmy zostały pobrane!"
