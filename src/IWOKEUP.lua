local function playIWOKEUP()
	local dfpwm = require("cc.audio.dfpwm")
	local speaker = peripheral.find("speaker")

	local decoder = dfpwm.make_decoder()
	for chunk in io.lines("IWOKEUP.dfpwm", 16 * 1024) do
		local buffer = decoder(chunk)

		while not speaker.playAudio(buffer) do
			os.pullEvent("speaker_audio_empty")
		end
	end
end

local nbBlock = 4;

while true do
	for _i = 1, nbBlock, 1 do
		turtle.forward();
		playIWOKEUP();
	end

	turtle.turnLeft();
	turtle.turnLeft();

	for _i = 1, nbBlock, 1 do
		turtle.forward();
		playIWOKEUP();
	end
end
