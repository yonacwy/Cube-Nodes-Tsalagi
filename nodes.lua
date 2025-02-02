--NODES--

cube_nodes_tsalagi.symbols = {
	"a",
	"e",
	"i",
	"o",
	"u",
	"v",
	"ga",
	"ka",
	"ge",
	"gi",
	"go",
	"gu",
	"gv",
	"ha",
	"he",
	"hi",
	"ho",
	"hu",
	"hv",
	"la",
	"le",
	"li",
	"lo",
	"lu",
	"lv",
	"ma",
	"me",
	"mi",
	"mo",
	"mu",
	"mv",
	"na",
	"hna",
	"nah",
	"ne",
	"ni",
	"no",
	"nu",
	"nv",
	"qua",
	"que",
	"qui",
	"quo",
	"quu",
	"quv",
	"s",
	"sa",
	"se",
	"si",
	"so",
	"su",
	"sv",
	"da",
	"ta",
	"de",
	"te",
	"di",
	"di",
	"do",
	"du",
	"dv",
	"dla",
	"tla",
	"tle",
	"tli",
	"tlo",
	"tlu",
	"tlv",
	"tsa",
	"tse",
	"tsi",
	"tso",
	"tsu",
	"tsv",
	"wa",
	"we",
	"wi",
	"wo",
	"wu",
	"wv",
	"ya",
	"ye",
	"yi",
	"yo",
	"yu",
	"yv",
	"ampersand",
	"asterisk",
	"bracket_left",
	"bracket_right",
	"comma",
	"corner_bracket_left",
	"corner_bracket_right",
	"dash",
	"division_mark",
	"dollar",
	"dot",
	"email",
	"empty",
	"equality_mark",
	"evil",
	"exclamation_mark",
	"figure_bracket_left",
	"figure_bracket_right",
	"grid",
	"minus",
	"multiplication_mark",
	"normal",
	"plus",
	"procent",
	"question_mark",
	"round_bracket_left",
	"round_bracket_right",
	"sad",
	"slash_left",
	"slash_right",
	"smile",
	"tilde",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"0"
}

cube_nodes_tsalagi.fonts = {
	"normal",
	"italic"
}

cube_nodes_tsalagi.colors = {
	"black",
	"blue",
	"brown",
	"cyan",
	"darkgreen",
	"darkgrey",
	"green",
	"grey",
	"magenta",
	"orange",
	"pink",
	"red",
	"violet",
	"yellow"
}

cube_nodes_tsalagi.skip_nodes_count = 13
cube_nodes_tsalagi.skip_nodes = {
	italic = {
		asterisk=true,
		corner_bracket_left=true,
		corner_bracket_right=true,
		dash=true,
		empty=true,
		equality_mark=true,
		evil=true,
		minus=true,
		normal=true,
		plus=true,
		procent=true,
		sad=true,
		slash_left=true,
		slash_right=true,
		smile=true,
		tilde=true
	}
}


cube_nodes_tsalagi.nodes_count = #cube_nodes_tsalagi.symbols

function cube_nodes_tsalagi.name_to_desc(name)
	local words = name:split("_")

	local str = ""

	for _, w in ipairs(words) do
		str = str .. w:sub(1, 1):upper() .. w:sub(2) .. " "
	end

	return str
end


for _, font in ipairs(cube_nodes_tsalagi.fonts) do
	for _, symbol in ipairs(cube_nodes_tsalagi.symbols) do
		if not (cube_nodes_tsalagi.skip_nodes[font] and cube_nodes_tsalagi.skip_nodes[font][symbol]) then
			for _, color in ipairs(cube_nodes_tsalagi.colors) do
				local nodename = ("node_%s%s"):format(font == "normal" and "" or font .. "_", symbol)

				minetest.register_node("cube_nodes_tsalagi:" .. nodename .. "_" .. color, {
					description = cube_nodes_tsalagi.name_to_desc(nodename),
					tiles = {
						"blank.png^(" .. nodename .. ".png^[colorize:" .. color .. ":255)",
					},
					paramtype = "light",
					sunlight_propagates = true,
					use_texture_alpha = "blend",
					light_source = 10,
					groups = {
						cracky=1,
						oddly_breakable_by_hand=1,
						not_in_creative_inventory=symbol == "empty" and color == "black" and 0 or 1
					},
					sounds = default.node_sound_wood_defaults()
				})
			end
		end
	end
end

minetest.register_craft({
	type = "shapeless",
	output = "cube_nodes_tsalagi:node_empty_black",
	recipe = {"default:steelblock", "dye:black"}
})
