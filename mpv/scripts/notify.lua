mp.observe_property("filename/no-ext", "native", function(_, filename)
    if filename == nil then
        return
    end

    os.execute(
        string.format('dunstify -r 1 -I /usr/share/icons/hicolor/scalable/apps/mpv.svg "Now playing:" "%s"', filename)
    )
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

    os.execute(
        string.format('dunstify -r 2 -I /usr/share/icons/hicolor/scalable/apps/mpv.svg "%s:" "%s"', paused, filename)
    )
end)
