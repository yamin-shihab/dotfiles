local function notify_current_track()
    local filename = mp.get_property_native("filename/no-ext")
    if not filename then return end

    os.execute(("dunstify -r 1 -I /usr/share/icons/hicolor/scalable/apps/mpv.svg \"Now playing:\" \"%s\""):format(filename))
end

mp.register_event("file-loaded", notify_current_track)
