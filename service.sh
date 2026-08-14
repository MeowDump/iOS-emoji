#!/system/bin/sh

MODPATH=${0%/*}

SRC="$MODPATH/system/fonts/NotoColorEmoji.ttf"

wait_boot() {
    while [ "$(getprop sys.boot_completed)" != "1" ]; do
        sleep 5
    done
    while [ ! -d /sdcard ]; do
        sleep 5
    done
}

wait_boot

[ -f "$SRC" ] || exit 1

for f in $(find /data/data /data/user/0 -iname "*emoji*.ttf" 2>/dev/null); do
    [ -w "$f" ] && cp "$SRC" "$f" && chmod 644 "$f"
done

for p in com.facebook.orca com.facebook.katana com.facebook.lite com.facebook.mlite; do
    [ -d "/data/data/$p" ] || continue
    mkdir -p "/data/data/$p/app_ras_blobs"
    [ -d "/data/data/$p/app_ras_blobs" ] || continue
    cp -f "$SRC" "/data/data/$p/app_ras_blobs/FacebookEmoji.ttf"
    [ -f "/data/data/$p/app_ras_blobs/FacebookEmoji.ttf" ] && chmod 444 "/data/data/$p/app_ras_blobs/FacebookEmoji.ttf"
    chattr +i "/data/data/$p/app_ras_blobs/FacebookEmoji.ttf" 2>/dev/null
done

for d in /data/data/com.facebook.orca/files/fonts /data/user/0/com.facebook.orca/files/fonts; do
    [ -d "$d" ] && rm -rf "$d"/*
    mkdir -p "$d"
    [ -d "$d" ] && chmod 000 "$d"
done

for p in com.facebook.orca com.facebook.katana com.facebook.lite com.facebook.mlite; do
    am force-stop "$p" 2>/dev/null
done

sleep 2

for u in /data/user/*; do
    [ -d "$u" ] || continue
    uid=${u##*/}
    pm disable --user "$uid" com.google.android.gms/com.google.android.gms.fonts.provider.FontsProvider 2>/dev/null
    pm disable --user "$uid" com.google.android.gms/com.google.android.gms.fonts.update.UpdateSchedulerService 2>/dev/null
done

[ -d /data/fonts ] && rm -rf /data/fonts
find /data -type d -path "*/com.google.android.gms/files/fonts*" 2>/dev/null | while read d; do
    [ -d "$d" ] && rm -rf "$d"
done
