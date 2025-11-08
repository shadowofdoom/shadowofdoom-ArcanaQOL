return {
  version = 1.0,

  -- Basic Settings
  enabled = true,
  debug = true,  -- Enable for testing, can disable later

  -- Arcana Settings
  max_duplicate_count = 3,  -- Allow up to 3 cards with same cost (default: 2)
}, {
  enabled = "Enable or disable the mod completely",
  debug = "Enable detailed debug logging to console (check ReturnOfModding/LogOutput.log)",
  max_duplicate_count = "Maximum number of arcana cards with the same cost that can be equipped (default game value is 2)",
}
