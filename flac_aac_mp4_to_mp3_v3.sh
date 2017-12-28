#/bin/bash

FLAC='flac'
MP4='mp4'
AAC='m4a'

DEFAULTDIR=$HOME

if [ -z "$1" ]; then
        echo usage: $0 directory
        exit
fi

echo "indicare il path del file per la quale si vuole eseguire la conversione"

SOURCEDIR=$1
echo $SOURCEDIR


# viene usata la directory predefinita se non ne viene specificata nessuna

if [ -z "$1" ]; then
SOURCEDIR=$DEFAULTDIR
else
SOURCEDIR=$1
fi


#controllo l'estensione del file

EXTENSION=${SOURCEDIR##*.}

if [[ $EXTENSION = "$MP4" ]]

 then

echo "Inizio la conversione da MP4 a MP3..."
 
for f in *.mp4
do
    name=`echo "$f" | sed -e "s/.mp4$//g"`
    ffmpeg -i "$f" -vn -ar 44100 -ac 2 -ab 320k -f mp3 "$name.mp3"
done

 elif
 
  [[ $EXTENSION = "$FLAC" ]]
    
  then

echo "Inizio la conversione da FLAC a MP3..."

for f in *.flac; do flac -cd "$f" | lame -b 320 - "${f%.*}".mp3; done 

elif
 
  [[ $EXTENSION = "$AAC" ]]
    
  then

echo "Inizio la conversione da AAC a MP3..."

for f in *.m4a
do
   name=`echo "$f" | sed -e "s/.mp4$//g"`
   ffmpeg -i "$f" -c:a libmp3lame -ac 2 -b:a 320k "$name.mp3"
done

fi 







