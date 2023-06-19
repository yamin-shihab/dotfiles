local function extract_art()
    local path = mp.get_property_native("path")
    os.execute(
        string.format(
            'ffmpeg -loglevel quiet -y -i "%s" -an -vcodec copy /tmp/tmp_cover.png && ffmpeg -loglevel quiet -y -i /tmp/tmp_cover.png -vf "crop=min(in_w\\\\,in_h):out_w" /tmp/cover.png || cp -f /usr/share/icons/hicolor/128x128/apps/mpv.png /tmp/cover.png',
            path
        )
    )
end

local function remove_art()
    os.execute("rm -f /tmp/tmp_cover.png")
    os.execute("rm -f /tmp/cover.png")
end

mp.observe_property("filename/no-ext", "native", function(_, filename)
    if filename == nil then
        return
    end

    extract_art()
    os.execute(string.format('dunstify -r 1 -I /tmp/cover.png "Now playing:" "%s"', filename))
    remove_art()
end)

mp.observe_property("pause", "native", function(_, paused)
    local filename = mp.get_property_native("filename/no-ext")
    if filename == nil then
        return
    end

    if paused then
        paused = "Paused"
    else
        paused = "Resumed"
    end

    extract_art()
    os.execute(string.format('dunstify -r 2 -I /tmp/cover.png "%s:" "%s"', paused, filename))
    remove_art()
end)
