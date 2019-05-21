function set_osd_title()
	local name = mp.get_property_osd("media-title")
	local percent_pos = ""
	local chapter = ""
	local edition_name = ""
	local edition_number = ""
	local frames_dropped = ""

	--[[ why is this so goddamn difficult to compare ?!
	if tonumber(mp.get_property("edition-list/count")) > 1 then
		edition_number = mp.get_property_number("edition")
	end


	if mp.get_property_osd("edition-list/%d/title", edition_number) ~= "" then
		edition_name = " • " .. mp.get_property_osd("edition-list/%d/title", edition_number)
	else
		edition_name = " • E:" .. edition_number
	end


	if mp.get_property_osd("percent-pos") ~= "" then
		percent_pos = " • " .. mp.get_property_osd("percent-pos") .. "%"
	end
--]]

	if mp.get_property_osd("chapter") ~= "" then
		chapter = " • " .. mp.get_property_osd("chapter-metadata/title")
	end


	mp.set_property("force-media-title", name .. percent_pos .. chapter .. frames_dropped)
end

mp.observe_property("chapter", "string", set_osd_title)
mp.observe_property("edition", "number", set_osd_title)
