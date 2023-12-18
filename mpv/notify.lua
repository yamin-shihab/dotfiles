mp.observe_property("filename/no-ext", "native", function(_, filename)
    if filename == nil then
        return
    end
    os.execute(string.format("notify-send 'Now playing:' '%s'", filename))
end)

mp.observe_property("pause", "native", function(_, paused)
    local filename = mp.get_property_native("filename/no-ext")
    if filename == nil or paused == true then
        return
    end
    local percent_pos = mp.get_property_native("percent-pos")
    os.execute(string.format("notify-send 'Unpaused (%d%%):' '%s'", percent_pos, filename))
end)
