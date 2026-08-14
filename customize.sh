#!/system/bin/sh

AUTOMOUNT=true
SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true

MODPATH=${0%/*}

SRC="$MODPATH/system/fonts/NotoColorEmoji.ttf"
SYS_FONT="/system/fonts/NotoColorEmoji.ttf"

has_pkg() {
    pm list packages | grep -q "^package:${1}$"
}

friendly_name() {
    case "$1" in
        com.facebook.orca) echo "Messenger" ;;
        com.facebook.katana) echo "Facebook" ;;
        com.facebook.lite) echo "Facebook Lite" ;;
        com.facebook.mlite) echo "Messenger Lite" ;;
        com.google.android.inputmethod.latin) echo "Gboard" ;;
        *) echo "$1" ;;
    esac
}

do_bind() {
    [ -f "$1" ] || { echo "- Missing source: $1"; return 1; }
    [ -d "$(dirname "$2")" ] || { echo "- Missing target dir: $(dirname "$2")"; return 1; }
    mkdir -p "$(dirname "$2")"
    mount -o bind "$1" "$2" && chmod 644 "$2"
}

hook_app() {
    local pkg="$1"
    local data="$2"
    local blob="$3"
    local name="$4"
    local label=$(friendly_name "$pkg")
    
    has_pkg "$pkg" || { echo "- $label not found"; return; }
    echo "- Hooking $label"
    do_bind "$SRC" "$data/$blob/$name"
    echo "- $label patched"
}

wipe_cache() {
    local pkg="$1"
    local label=$(friendly_name "$pkg")
    
    has_pkg "$pkg" || { echo "- $label absent, skip"; return; }
    
    echo "- Purging $label cache"
    for p in /cache /code_cache /app_webview /files/GCache; do
        [ -d "/data/data/${pkg}${p}" ] && rm -rf "/data/data/${pkg}${p}"
    done
    am force-stop "$pkg" 2>/dev/null
    echo "- $label cache purged"
}

unzip -o "$ZIPFILE" 'system/*' -d "$MODPATH" >&2 || {
    echo "- Extract failed"
    exit 1
}

echo "- Deploying emoji assets"

for alias in SamsungColorEmoji.ttf LGNotoColorEmoji.ttf HTC_ColorEmoji.ttf AndroidEmoji-htc.ttf ColorUniEmoji.ttf DcmColorEmoji.ttf CombinedColorEmoji.ttf NotoColorEmojiLegacy.ttf; do
    [ -f "/system/fonts/$alias" ] && {
        cp "$SRC" "$MODPATH/system/fonts/$alias" && echo "- $alias overridden" || echo "- $alias failed"
    }
done

[ -f "$SRC" ] && {
    do_bind "$SRC" "$SYS_FONT" && echo "- System emoji bound" || echo "- System bind failed"
} || echo "- Source emoji missing, skip system bind"

hook_app "com.facebook.orca" "/data/data/com.facebook.orca" "app_ras_blobs" "FacebookEmoji.ttf"
wipe_cache "com.facebook.orca"
hook_app "com.facebook.katana" "/data/data/com.facebook.katana" "app_ras_blobs" "FacebookEmoji.ttf"
wipe_cache "com.facebook.katana"
hook_app "com.facebook.lite" "/data/data/com.facebook.lite" "files" "emoji_font.ttf"
wipe_cache "com.facebook.lite"
hook_app "com.facebook.mlite" "/data/data/com.facebook.mlite" "files" "emoji_font.ttf"
wipe_cache "com.facebook.mlite"

echo "- Gboard cache sweep"
wipe_cache "com.google.android.inputmethod.latin"

echo "- Keyboard cache sweep"
for k in \
    com.google.android.inputmethod.latin \
    com.touchtype.swiftkey \
    com.touchtype.swiftkey.beta \
    org.futo.inputmethod.latin.playstore \
    rkr.simplekeyboard.inputmethod \
    ai.mint.keyboard \
    com.sec.android.inputmethod \
    com.samsung.android.honeyboard \
    com.miui.cit.module \
    com.xiaomi.android.inputmethod \
    com.baidu.input_huawei \
    com.huawei.ime \
    com.baidu.input_oppo \
    com.iflytek.speechsuite \
    com.vivo.ai.copilot \
    com.vivo.inputmethod \
    com.honor.android.inputmethod \
    com.motorola.android.inputmethod \
    com.asus.android.inputmethod \
    com.lenovo.android.inputmethod \
    com.hmdglobal.android.inputmethod \
    com.lge.android.inputmethod \
    com.sonyericsson.android.inputmethod \
    com.transsion.inputmethod \
    com.infinix.android.inputmethod \
    com.nothing.android.inputmethod
do
    has_pkg "$k" && wipe_cache "$k"
done

[ -d "/data/fonts" ] && {
    rm -rf "/data/fonts"
    echo "- /data/fonts removed"
}

[[ -d /sbin/.core/mirror ]] && MIRRORPATH=/sbin/.core/mirror || unset MIRRORPATH
FONTS=/system/etc/fonts.xml
FONTFILES=$(sed -ne '/<family lang="und-Zsye".*>/,/<\/family>/ {s/.*<font weight="400" style="normal">\(.*\)<\/font>.*/\1/p;}' "$MIRRORPATH$FONTS")
for font in $FONTFILES; do
    ln -s /system/fonts/NotoColorEmoji.ttf "$MODPATH/system/fonts/$font"
done

echo "- Applying permissions"
set_perm_recursive "$MODPATH" 0 0 0755 0644
echo "- Install complete"
echo "- Reboot to activate"
echo "- Enjoy :)"

OVERLAY_IMAGE_EXTRA=0
OVERLAY_IMAGE_SHRINK=true

[ -f "/data/adb/modules/magisk_overlayfs/util_functions.sh" ] && \
/data/adb/modules/magisk_overlayfs/overlayfs_system --test && {
    echo "- OverlayFS detected"
    . /data/adb/modules/magisk_overlayfs/util_functions.sh
    support_overlayfs && rm -rf "$MODPATH"/system
}
