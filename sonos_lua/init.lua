local cosock = require "cosock"
local log = require "log"
local SSDP = require "sonos_ssdp"
local st_utils = require "st.utils"

SONOS_SSDP_SEARCH_TERM = "urn:smartspeaker-audio:service:SpeakerGroup:1"

cosock.spawn(function()
  while true do
    SSDP.search(SONOS_SSDP_SEARCH_TERM, function(response)
      log.info(st_utils.stringify_table(response, "SSDP Response", true))
    end)
  end
end, "Main Loop")

cosock.run()
