#!/bin/bash

# Funkcja pomocy
usage() {
  echo "Użycie: $0 [-l URL_DO_JUTUBA] [-p URL_DO_PLAYLISTY]"
  echo "  -l URL_DO_JUTUBA     Pobierz film z podanego linku"
  echo "  -p URL_DO_PLAYLISTY  Pobierz całą playlistę z podanego linku"
  echo "  Jeśli nie podano -l ani -p, pobieranie z pliku lists.txt"
  exit 1
}

# Sprawdzanie obecności pliku cookies.txt
if [[ ! -f "/home/piotr/Pulpit/cookies.txt" ]]; then
  echo "Brak pliku cookies.txt! Upewnij się, że jest w /home/piotr/Pulpit/"
  exit 1
fi

# Parsowanie argumentów
while getopts "l:p:" opt; do
  case "$opt" in
    l) link="$OPTARG" ;;
    p) playlist="$OPTARG" ;;
    *) usage ;;
  esac
done

# Pobieranie pojedynczego linku
if [[ -n "$link" ]]; then
  echo "Pobieram: $link"
  
  yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" \
         --merge-output-format mp4 \
         --cookies "/home/piotr/Pulpit/cookies.txt" \
         "$link"
  
  echo "Pobieranie zakończone dla podanego linku"
  exit 0
fi

# Pobieranie całej playlisty
if [[ -n "$playlist" ]]; then
  echo "Pobieram playlistę: $playlist"
  
  yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" \
         --merge-output-format mp4 \
         --cookies "/home/piotr/Pulpit/cookies.txt" \
         --yes-playlist \
         "$playlist"
  
  echo "Pobieranie zakończone dla podanej playlisty"
  exit 0
fi

# Jeśli nie podano -l ani -p, pobieranie z pliku
if [[ ! -f "lists.txt" ]]; then
  echo "Brak pliku lists.txt! Umieść go w tym samym katalogu co skrypt."
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
done < "lists.txt"

echo "Wszystkie filmy zostały pobrane!"
