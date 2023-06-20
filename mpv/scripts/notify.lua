local function extract_art()
    local path = mp.get_property_native("path")
    os.execute(
        string.format(
            'ffmpeg -loglevel quiet -y -i "%s" -an -vcodec copy /tmp/tmp-cover.png && ffmpeg -loglevel quiet -y -i /tmp/tmp-cover.png -vf "crop=min(in_w\\\\,in_h):out_w" /tmp/cover.png || cp -f /usr/share/icons/hicolor/64x64/apps/mpv.png /tmp/cover.png',
            path
        )
    )
end

local function remove_art()
    os.execute("rm -f /tmp/tmp-cover.png; rm -f /tmp/cover.png")
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

    local percent_pos = mp.get_property_native("percent-pos")

    if paused then
        paused = "Paused"
    else
        paused = "Resumed"
    end

    extract_art()
    os.execute(string.format('dunstify -r 2 -I /tmp/cover.png -h int:value:%d "%s:" "%s"', percent_pos, paused, filename))
    remove_art()
end)
