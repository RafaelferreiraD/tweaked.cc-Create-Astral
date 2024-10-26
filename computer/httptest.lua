local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")


function decod(file)
    local lines = {}

    while true do
        local line = file.read(16 * 1024)

        -- If line is nil then we've reached the end of the file and should stop
        if not line then break end

        lines[#lines + 1] = line
    end
    return lines
end

function playSound(file, volume)
    local decoder = dfpwm.make_decoder()
    local lines = decod(file)

    if volume > 1 then
        volume = 1
    elseif volume < 0 then
        volume = 0
    end
    -- io.lines("playlist/" .. file, 16 * 1024)
    for o = 1, #lines do
        local buffer = decoder(lines[o])
        for i = 1, #buffer do
            buffer[i] = buffer[i] * volume
        end

        while not speaker.playAudio(buffer) do
            os.pullEvent("speaker_audio_empty")
        end
    end
end

print("Hello World")

local names = {
    "0dfcb797-68fd-4379-a619-f6097366f28c.mp3.dfpwm",
    "266f03d6-d3bc-4bdc-bb5a-6ca9c63b236e.mp3.dfpwm",
    "4160e286-7cbe-4f28-8678-a79e929a928b.mp3.dfpwm",
    "41c3dfa6-6ed6-4d17-a3b5-547e9188d2e4.mp3.dfpwm",
    "447bc0c0-b3f1-4e56-ab32-37d90fbbe1be.mp3.dfpwm",
    "46cd2b77-8ca2-4de3-b63c-58ef047ebc44.mp3.dfpwm",
    "525774dd-d64a-4951-a8d7-f8f973eaafcb.mp3.dfpwm",
    "745d77b2-f600-4467-8738-2f9661099e1c.mp3.dfpwm",
    "76906408-2134-4303-bb93-961b98fdb601.mp3.dfpwm",
    "7f61b473-17ea-44ba-ac88-d0814ac6285b.mp3.dfpwm",
    "8112d356-da82-41fe-9cfb-014175b85636.mp3.dfpwm",
    "82bb74fc-5d5a-4cc5-ba9c-90fd0701d6f9.mp3.dfpwm",
    "8879c099-c2f8-463a-bfff-db87367ef373.mp3.dfpwm",
    "8a184f6b-c277-4f84-9b24-3fa49d189753.mp3.dfpwm",
    "93144092-a384-4b26-be14-4063e49e9d1a.mp3.dfpwm",
    "9b0de3c9-2d34-439f-944f-6c92ee929d13.mp3.dfpwm",
    "9e53aa98-0bff-41fb-8063-715a85132c9b.mp3.dfpwm",
    "a04efa27-0bd4-4bdb-b227-80c4fd4431c7.mp3.dfpwm",
    "a7ffffa9-386d-45d8-8a81-2d8a61e919e3.mp3.dfpwm",
    "af4e99db-3042-436c-8813-b6be6a381305.mp3.dfpwm",
    "b09b97bd-09a7-43fd-8c77-c31682a3710b.mp3.dfpwm",
    "b2041888-e0d3-4f2b-9e61-a5ce66455925.mp3.dfpwm",
    "cdda9ed8-3b6b-48f6-a1b8-c3670490a392.mp3.dfpwm",
    "d3e28acf-c145-48ab-b6ab-0dc8bb78111a.mp3.dfpwm",
    "d82f4ff6-8eb1-44cb-8bc8-55a74d923eb8.mp3.dfpwm",
    "e1bc4f3c-53c6-45d8-812f-8e1fb3837b4b.mp3.dfpwm",
    "e20dffa7-2478-49a3-b575-f0344800f6c5.mp3.dfpwm",
    "e306ffa2-f952-4aed-9965-d8fbd3f7fdb7.mp3.dfpwm",
    "e6d1b601-4274-48bb-9c5e-a91acf84c9fe.mp3.dfpwm",
    "e81967d9-ccb9-4cea-84d1-966a64877feb.mp3.dfpwm",
    "ed04e89d-f294-4de9-84b0-7472f41d971c.mp3.dfpwm",
    "ff4211a7-1df3-4b22-8134-e91ddac2a9f2.mp3.dfpwm"
}

-- https://example.tweaked.cc

for p=1, #names do
    local request = http.get("http://0.tcp.sa.ngrok.io:18923/file/" .. names[math.random(1, #names)], nil, true)

    playSound(request, .6)
end
