screen -S cf -d -m cloudflared tunnel --url localhost:8080 --logfile tunnel.log

regex="^.+\.((mp4)|(wmv))$"

for vid in *; do
    if [[ "$vid" =~ $regex ]]; then
        vlc "$vid" --sout '#transcode{scodec=none}:http{mux=ffmpeg{mux=flv},dst=:8080/}' vlc://quit
    fi
done

screen -S cf -X quit
rm tunnel.log
