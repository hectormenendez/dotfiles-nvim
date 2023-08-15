local utils = require("etor.utils")
local maps_le = require("etor.remaps.leader-explore")

return {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = utils.table_merge(maps_le.undo)
}
