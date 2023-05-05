#!/bin/bash
# scripts by adi1090x

## Get data
CONTROL="MPD"
[ -n "$(pgrep spotify)" ] && CONTROL="spotify"
# [ -n "$(pgrep rhythmbox)" ] && CONTROL="rhythmbox"
# [ -n "$(pgrep audacious)" ] && CONTROL="audacious"
# [ -n "$(pgrep clementine)" ] && CONTROL="clementine"
# [ -n "$(pgrep strawberry)" ] && CONTROL="strawberry"

COVER=~/.cache/cover.png
BKP_COVER=~/.config/eww/images/fallback.png


# get_status() {
#     if [[ $STATUS == *"[Playing]"* ]]; then
#         echo ""
#     else
#         echo "奈"
#     fi
# }

## Get song
get_song() {
    song=`playerctl --player=$CONTROL metadata title `
    if [[ -z "$song" ]]; then
        echo "Offline"
    else
        echo "$song"
    fi
}

## Get artist
get_artist() {
    artist=`playerctl --player=$CONTROL metadata artist`
    if [[ -z "$artist" ]]; then
        echo ""
    else
        echo "$artist"
    fi
}

get_album() {
    album=`playerctl --player=$CONTROL metadata album`
    [ -z "$album" ] && album="Album"
    echo "$album"
}

get_ctime() {
    time=$(playerctl --player=$CONTROL position --format "{{ duration(position) }}")
    [ -z "$time" ] && time="0:00"
    echo "$time"
}
get_length() {
    length=$(playerctl --player=$CONTROL metadata --format "{{ duration(mpris:length) }}")
    [ -z "$length" ] && length="0:00"
    echo "$length"
}

get_playlist() {
    playlist=$(playerctl --player=$CONTROL metadata xesam:trackNumber)
    [ -z "$playlist" ] && playlist="0"
    echo "$playlist"
}

get_cover() {
    albumart="$(playerctl --player=$CONTROL metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')"
    [ $(playerctl --player=$CONTROL metadata mpris:artUrl) ] && curl -s "$albumart" --output $COVER || cp $BKPCOVER $COVER
    echo "$COVER"
}

get_status() {
    icon=""
    [ $(playerctl --player=$CONTROL status) = "Playing" ] && icon=""
    [ $(playerctl --player=$CONTROL status) = "Paused" ] && icon=""
    echo "$icon"
}

get_lyrics() {
    Title=$(playerctl --player=$CONTROL metadata --format {{title}})
    Artist=$(playerctl --player=$CONTROL metadata --format {{artist}})
    URL="https://api.lyrics.ovh/v1/$Artist/$Title"
    lyrics=$(curl -s "$( echo "$URL" | sed s/" "/%20/g | sed s/"&"/%26/g | sed s/,/%2C/g | sed s/-/%2D/g)" | jq '.lyrics' )
    [ "$lyrics" = "null" ] && lyrics=$( curl -s --get "https://makeitpersonal.co/lyrics" --data-urlencode "artist=$Artist" --data-urlencode "title=$Title")
    printf "$lyrics" | less
}

## Execute accordingly

if [[ "$1" == "--status" ]]; then
    get_status
elif [[ "$1" == "--song" ]]; then
    get_song
elif [[ "$1" == "--artist" ]]; then
    get_artist
elif [[ "$1" == "--album" ]]; then
    get_album
elif [[ "$1" == "--ctime" ]]; then
    get_ctime
elif [[ "$1" == "--length" ]]; then
    get_length
elif [[ "$1" == "--playlist" ]]; then
    get_playlist
elif [[ "$1" == "--cover" ]]; then
    get_cover
elif [[ "$1" == "--status" ]]; then
    get_statusicon
elif [[ "$1" == "--lyrics" ]]; then
    get_lyrics
elif [[ "$1" == "--toggle" ]]; then
    playerctl --player=$CONTROL play-pause
elif [[ "$1" == "--next" ]]; then
    playerctl --player=$CONTROL next
    # { mpc -q next; get_cover; }
elif [[ "$1" == "--prev" ]]; then
    playerctl --player=$CONTROL previous
fi
